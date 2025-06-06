package com.yx.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yx.dao.BookInfoMapper;
import com.yx.dao.LendListMapper;
import com.yx.po.BookInfo;
import com.yx.service.BookInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("bookInfoService")
public class BookInfoServiceImpl implements BookInfoService {

    @Autowired
    private BookInfoMapper bookInfoMapper;
    @Autowired
    private LendListMapper lendListMapper;

    @Override
    public PageInfo<BookInfo> queryBookInfoAll(BookInfo bookInfo, Integer page, Integer limit) {
        PageHelper.startPage(page, limit);
        List<BookInfo> bookInfoList = bookInfoMapper.queryBookInfoAll(bookInfo);
        return new PageInfo<>(bookInfoList);
    }

    @Override
    public void addBookSubmit(BookInfo bookInfo) {
        bookInfo.setStatus(0);
        bookInfoMapper.insert(bookInfo);
    }

    @Override
    public BookInfo queryBookInfoById(Integer id) {
        return bookInfoMapper.selectByPrimaryKey(id);
    }

    @Override
    public void updateBookSubmit(BookInfo info) {
        bookInfoMapper.updateByPrimaryKeySelective(info);
    }

    @Override
    public void deleteBookByIds(List<String> ids) {
        for (String id : ids) {
            bookInfoMapper.deleteByPrimaryKey(Integer.parseInt(id));
        }
    }

    @Override
    public List<BookInfo> getBookCountByType() {
        return bookInfoMapper.getBookCountByType();
    }

    @Override
    public List<BookInfo> queryHotBooks(int limit) {
        return lendListMapper.queryHotBooks(limit);
    }
}
