package com.yx.dao;

import com.yx.po.ReaderInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReaderInfoMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table reader_info
     *
     * @mbggenerated Tue Mar 30 16:30:04 CST 2021
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table reader_info
     *
     * @mbggenerated Tue Mar 30 16:30:04 CST 2021
     */
    int insert(ReaderInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table reader_info
     *
     * @mbggenerated Tue Mar 30 16:30:04 CST 2021
     */
    int insertSelective(ReaderInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table reader_info
     *
     * @mbggenerated Tue Mar 30 16:30:04 CST 2021
     */
    ReaderInfo selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table reader_info
     *
     * @mbggenerated Tue Mar 30 16:30:04 CST 2021
     */
    int updateByPrimaryKeySelective(ReaderInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table reader_info
     *
     * @mbggenerated Tue Mar 30 16:30:04 CST 2021
     */
    int updateByPrimaryKey(ReaderInfo record);

    /**
     * 查询所有记录信息
     */
    List<ReaderInfo> queryAllReaderInfo(@Param("readerInfo") ReaderInfo readerInfo, @Param("offset") Integer offset, @Param("limit") Integer limit);

    /**
     * 新增：查询总记录数 (支持条件查询)
     */
    int countAllReaderInfo(@Param("readerInfo") ReaderInfo readerInfo);

    /**
     * 根据用户名和密码查询用户信息
     */
    ReaderInfo queryUserInfoByNameAndPassword(@Param("username") String username, @Param("password") String password);

    /**
     * 根据用户名查询用户信息
     * 
     * @param username 用户名
     * @return 读者信息，如果不存在则返回 null
     */
    ReaderInfo queryByUsername(@Param("username") String username);

    /**
     * 根据年份前缀查询当年最大的读者卡号
     * 
     * @param prefix 例如 "RD2025"
     * @return 当年最大的读者卡号，如 "RD20250006"，如果当年没有则返回 null
     */
    String findMaxReaderNumberByYearPrefix(@Param("prefix") String prefix);

    /**
     * 根据 ID 列表批量查询读者信息
     */
    List<ReaderInfo> queryReaderInfoByIds(@Param("ids") List<Integer> ids);
}