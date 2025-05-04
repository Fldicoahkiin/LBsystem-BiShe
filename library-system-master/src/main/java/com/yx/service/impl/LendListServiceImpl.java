package com.yx.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yx.dao.BookInfoMapper;
import com.yx.dao.LendListMapper;
import com.yx.dao.ReaderInfoMapper;
import com.yx.dao.TypeInfoMapper;
import com.yx.po.BookInfo;
import com.yx.po.LendList;
import com.yx.po.ReaderInfo;
import com.yx.po.TypeInfo;
import com.yx.service.BookInfoService;
import com.yx.service.LendListService;
import com.yx.service.ReaderInfoService;
import com.yx.service.TypeInfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service("lendListService")
public class LendListServiceImpl implements LendListService {

    private static final Logger log = LoggerFactory.getLogger(LendListServiceImpl.class);

    @Autowired
    private LendListMapper lendListMapper;
    @Autowired
    private BookInfoMapper bookInfoMapper;
    @Autowired
    private ReaderInfoMapper readerInfoMapper;
    @Autowired
    private TypeInfoMapper typeInfoMapper;

    @Override
    public PageInfo<LendList> queryLendListAll(LendList lendList, int page, int limit) {
        String filterDesc = (lendList == null) ? "null"
                : String.format("readerNumber=%s, bookName=%s, backType=%d, status=%d",
                        lendList.getReaderInfo() != null ? lendList.getReaderInfo().getReaderNumber() : "null",
                        lendList.getBookInfo() != null ? lendList.getBookInfo().getName() : "null",
                        lendList.getBackType(),
                        lendList.getBookInfo() != null ? lendList.getBookInfo().getStatus() : null);
        log.info("Querying LendList: page=" + page + ", limit=" + limit + ", filter=(" + filterDesc + ")");
        PageHelper.startPage(page, limit);
        List<LendList> list = lendListMapper.queryLendListAllBase(lendList);
        log.debug("Found {} base LendList records.", list == null ? 0 : list.size());

        if (list != null && !list.isEmpty()) {
            // 2. 提取所有需要的 bookId 和 readerId
            List<Integer> bookIds = list.stream().map(LendList::getBookId).filter(id -> id != null).distinct()
                    .collect(Collectors.toList());
            List<Integer> readerIds = list.stream().map(LendList::getReaderId).filter(id -> id != null).distinct()
                    .collect(Collectors.toList());
            log.debug("Distinct book IDs: {}, Distinct reader IDs: {}", bookIds.size(), readerIds.size());

            // 3. 批量查询关联的 BookInfo 和 ReaderInfo
            Map<Integer, BookInfo> bookInfoMap = bookIds.isEmpty() ? Collections.emptyMap()
                    : bookInfoMapper.queryBookInfoByIds(bookIds)
                            .stream().collect(Collectors.toMap(BookInfo::getId, b -> b));
            Map<Integer, ReaderInfo> readerInfoMap = readerIds.isEmpty() ? Collections.emptyMap()
                    : readerInfoMapper.queryReaderInfoByIds(readerIds)
                            .stream().collect(Collectors.toMap(ReaderInfo::getId, r -> r));
            log.debug("Fetched BookInfo map size: {}, ReaderInfo map size: {}", bookInfoMap.size(),
                    readerInfoMap.size());

            // 4. 批量查询 BookInfo 关联的 TypeInfo
            List<Integer> typeIds = bookInfoMap.values().stream()
                    .map(BookInfo::getTypeId)
                    .filter(tid -> tid != null)
                    .distinct()
                    .collect(Collectors.toList());
            Map<Integer, TypeInfo> typeInfoMap = typeIds.isEmpty() ? Collections.emptyMap()
                    : typeInfoMapper.queryTypeInfoByIds(typeIds)
                            .stream().collect(Collectors.toMap(TypeInfo::getId, t -> t));
            log.debug("Distinct type IDs: {}, Fetched TypeInfo map size: {}", typeIds.size(), typeInfoMap.size());

            // 5. 遍历 LendList，手动设置关联对象 (修正 Fallback 逻辑)
            log.info("Starting manual association mapping for {} records...", list.size());
            int count = 0;
            for (LendList item : list) {
                count++;
                Integer currentBookId = item.getBookId();
                Integer currentReaderId = item.getReaderId();
                log.debug("Processing record " + count + "/" + list.size() + ": LendID=" + item.getId() +
                        ", BookID=" + currentBookId + ", ReaderID=" + currentReaderId);

                BookInfo book = bookInfoMap.get(currentBookId);
                if (book != null) {
                    log.debug("  Found BookInfo for ID {}: {}", currentBookId, book.getName());
                    // 设置 BookInfo 的 TypeInfo
                    if (book.getTypeId() != null) {
                        TypeInfo typeInfo = typeInfoMap.get(book.getTypeId());
                        if (typeInfo != null) {
                            log.debug("    Found TypeInfo for TypeID {}: {}", book.getTypeId(), typeInfo.getName());
                            book.setTypeInfo(typeInfo);
                        } else {
                            log.warn(
                                    "    TypeInfo not found for TypeID {} (associated with BookID {}). Setting TypeInfo to null.",
                                    book.getTypeId(), currentBookId);
                            book.setTypeInfo(null); // Ensure it's null if not found
                        }
                    }
                    item.setBookInfo(book);
                } else {
                    log.warn("  BookInfo not found for ID {}. Setting BookInfo to null.", currentBookId);
                    item.setBookInfo(null); // Corrected: Set to null if not found
                }

                ReaderInfo reader = readerInfoMap.get(currentReaderId);
                if (reader != null) {
                    log.debug("  Found ReaderInfo for ID {}: {}", currentReaderId, reader.getRealName());
                    item.setReaderInfo(reader);
                } else {
                    log.warn("  ReaderInfo not found for ID {}. Setting ReaderInfo to null.", currentReaderId);
                    item.setReaderInfo(null); // Corrected: Set to null if not found
                }
                log.debug("  Final state: item.getBookInfo() is {}, item.getReaderInfo() is {}",
                        item.getBookInfo() == null ? "null" : "not null",
                        item.getReaderInfo() == null ? "null" : "not null");
            }
            log.info("Finished manual association mapping.");
        }

        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @Override
    public void addLendListSubmit(LendList lendList) {
        lendListMapper.insert(lendList);
    }

    @Override
    public void deleteLendListById(List<String> ids, List<String> bookIds) {

        // 删除借阅记录
        for (String id : ids) {
            lendListMapper.deleteByPrimaryKey(Integer.parseInt(id));
        }
        // 更改图书标识，更新状态为未借出
        for (String bid : bookIds) {
            // 根据id查询图书记录信息
            BookInfo bookInfo = bookInfoMapper.selectByPrimaryKey(Integer.parseInt(bid));
            // Add null check for bookInfo
            if (bookInfo != null) {
                bookInfo.setStatus(0);// 该为未借出
                bookInfoMapper.updateByPrimaryKey(bookInfo);
            }
        }
    }

    @Override
    public void updateLendListSubmit(List<String> ids, List<String> bookIds) {
        for (String id : ids) {
            // 根据id查询借阅记录信息
            LendList lendList = new LendList();
            lendList.setId(Integer.parseInt(id));
            lendList.setBackDate(new Date());
            lendList.setBackType(0);// 正常还书
            lendListMapper.updateLendListSubmit(lendList);// 如果用updatePrimarykey会默认很多赋值为空
        }
        // 修改书的状态
        // 更改图书标识，更新状态为未借出
        for (String bid : bookIds) {
            // 根据id查询图书记录信息
            BookInfo bookInfo = bookInfoMapper.selectByPrimaryKey(Integer.parseInt(bid));
            // Add null check for bookInfo
            if (bookInfo != null) {
                bookInfo.setStatus(0);// 该为未借出
                bookInfoMapper.updateByPrimaryKey(bookInfo);
            }
        }
    }

    @Override
    public void backBook(LendList lendList) {
        LendList lend = new LendList();
        lend.setId(lendList.getId());
        lend.setBackType(lendList.getBackType());
        lend.setBackDate(new Date());
        lend.setExceptRemarks(lendList.getExceptRemarks());
        lend.setBookId(lendList.getBookId());
        lendListMapper.updateLendListSubmit(lend);
        // 判断异常还书 如果是延期或者正常还书，需要更改书的状态
        if (lend.getBackType() == 0 || lend.getBackType() == 1) {
            BookInfo bookInfo = bookInfoMapper.selectByPrimaryKey(lend.getBookId());
            // Add null check for bookInfo
            if (bookInfo != null) {
                bookInfo.setStatus(0);// 该为未借出
                bookInfoMapper.updateByPrimaryKey(bookInfo);
            }
        }

    }

    @Override
    public List<LendList> queryLookBookList(Integer rid, Integer bid) {
        // This method likely needs similar manual mapping logic if it's supposed
        // to return fully populated LendList objects. Currently it relies on
        // LendListMapper.queryLookBookList which might have its own mapping issues.
        // For now, let's leave it as is, but keep in mind it might need fixing too.
        return lendListMapper.queryLookBookList(rid, bid);
    }

    /**
     * 读者借书实现
     * 使用 @Transactional 注解保证事务一致性
     */
    @Override
    @Transactional // 重点：添加事务注解
    public void borrowBook(Integer bookId, Integer readerId) {
        // 1. 检查图书是否存在且可借
        BookInfo book = bookInfoMapper.selectByPrimaryKey(bookId);
        if (book == null) {
            throw new RuntimeException("图书不存在！");
        }
        if (book.getStatus() != 0) {
            throw new RuntimeException("该图书已被借出或状态异常！");
        }

        // 2. 创建借阅记录
        LendList lendRecord = new LendList();
        lendRecord.setBookId(bookId);
        lendRecord.setReaderId(readerId);
        lendRecord.setLendDate(new Date()); // 设置当前时间为借阅时间
        lendListMapper.insertSelective(lendRecord); // 直接调用，不检查返回值

        // 3. 更新图书状态为已借出 (status = 1)
        BookInfo bookToUpdate = new BookInfo();
        bookToUpdate.setId(bookId);
        bookToUpdate.setStatus(1);
        bookInfoMapper.updateByPrimaryKeySelective(bookToUpdate); // 直接调用，不检查返回值
    }

}
