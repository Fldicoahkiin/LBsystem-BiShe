package com.yx.dao;

import com.yx.po.TypeInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TypeInfoMapper {
    /**
     * 查询所有的记录信息
     */
    List<TypeInfo> queryTypeInfoAll(@Param("name") String name, @Param("offset") Integer offset, @Param("limit") Integer limit);

    /**
     * 添加图书类型
     */
    void addTypeSubmit(TypeInfo info);

    /**
     * 修改 根据id查询记录信息，查询弹出修改界，然后修改进行确认提交
     */
    TypeInfo queryTypeInfoById(Integer id);

    /**
     * 修改提交
     */
    void updateTypeSubmit(TypeInfo info);

    /**
     * 根据ids删除记录信息
     */
    void deleteTypeByIds(List<Integer> id);

    // List<TypeInfo> queryTypeName();

    /**
     * 根据 ID 列表批量查询类型信息
     */
    List<TypeInfo> queryTypeInfoByIds(@Param("ids") List<Integer> ids);

    /**
     * 新增：查询总记录数
     */
    int countTypeInfoAll(@Param("name") String name);
}