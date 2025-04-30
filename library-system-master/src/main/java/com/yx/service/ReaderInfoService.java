package com.yx.service;

import com.github.pagehelper.PageInfo;
import com.yx.po.ReaderInfo;

import java.util.List;

public interface ReaderInfoService {

    /**
     * 查询所有记录
     */
    PageInfo<ReaderInfo> queryAllReaderInfo(ReaderInfo readerInfo, Integer pageNum, Integer limit);

    /**
     * 添加
     */
    void addReaderInfoSubmit(ReaderInfo readerInfo);

    /**
     * 查询（修改前先查询）
     */
    ReaderInfo queryReaderInfoById(Integer id);

    /**
     * 修改提交
     */
    void updateReaderInfoSubmit(ReaderInfo readerInfo);

    /**
     * 删除
     */
    void deleteReaderInfoByIds(List<String> ids);

    /**
     * 根据用户名和密码查询用户信息
     */
    ReaderInfo queryUserInfoByNameAndPassword(String username, String password);

    /**
     * 检查用户名是否存在
     * 
     * @param username 用户名
     * @return 如果存在返回 true，否则返回 false
     */
    boolean checkUsernameExists(String username);

    /**
     * 注册新读者
     * 
     * @param readerInfo 读者信息
     */
    void registerReader(ReaderInfo readerInfo);
}
