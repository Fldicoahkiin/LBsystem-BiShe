package com.yx.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yx.dao.BookInfoMapper;
import com.yx.dao.LendListMapper;
import com.yx.po.BookInfo;
import com.yx.po.LendList;
import com.yx.service.LendListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service("lendListService")
public class LendListServiceImpl implements LendListService {

    @Autowired
    private LendListMapper lendListMapper;
    @Autowired
    private BookInfoMapper bookInfoMapper;

    @Override
    public PageInfo<LendList> queryLendListAll(LendList lendList, int page, int limit) {
        PageHelper.startPage(page, limit);
        List<LendList> list = lendListMapper.queryLendListAll(lendList);

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
            bookInfo.setStatus(0);// 该为未借出
            bookInfoMapper.updateByPrimaryKey(bookInfo);
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
            bookInfo.setStatus(0);// 该为未借出
            bookInfoMapper.updateByPrimaryKey(bookInfo);
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
            bookInfo.setStatus(0);// 该为未借出
            bookInfoMapper.updateByPrimaryKey(bookInfo);
        }

    }

    @Override
    public List<LendList> queryLookBookList(Integer rid, Integer bid) {
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
        // backDate, backType, exceptRemarks 默认为 null
        // int insertCount = lendListMapper.insertSelective(lendRecord);
        // if (insertCount <= 0) {
        // throw new RuntimeException("创建借阅记录失败！");
        // }
        lendListMapper.insertSelective(lendRecord); // 直接调用，不检查返回值

        // 3. 更新图书状态为已借出 (status = 1)
        BookInfo bookToUpdate = new BookInfo();
        bookToUpdate.setId(bookId);
        bookToUpdate.setStatus(1);
        // int updateCount = bookInfoMapper.updateByPrimaryKeySelective(bookToUpdate);
        // if (updateCount <= 0) {
        // // 如果更新失败，事务会回滚之前的插入操作
        // throw new RuntimeException("更新图书状态失败！");
        // }
        bookInfoMapper.updateByPrimaryKeySelective(bookToUpdate); // 直接调用，不检查返回值
    }

}
