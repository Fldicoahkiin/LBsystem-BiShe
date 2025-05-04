package com.yx.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yx.dao.TypeInfoMapper;
import com.yx.po.TypeInfo;
import com.yx.service.TypeInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

@Service("typeInfoService")
public class TypeInfoServiceImpl implements TypeInfoService {

    @Autowired
    private TypeInfoMapper typeInfoMapper;

    @Override
    public PageInfo<TypeInfo> queryTypeInfoAll(String name, Integer pageNum, Integer limit) {
        // PageHelper.startPage(pageNum,limit);
        // List<TypeInfo> list = typeInfoMapper.queryTypeInfoAll(name);
        // PageInfo<TypeInfo> pageInfo = new PageInfo<>(list);
        // return pageInfo;

        // 手动分页实现
        int offset = (pageNum - 1) * limit;
        List<TypeInfo> list = typeInfoMapper.queryTypeInfoAll(name, offset, limit);
        int totalCount = typeInfoMapper.countTypeInfoAll(name);

        PageInfo<TypeInfo> pageInfo = new PageInfo<>();
        pageInfo.setList(list);
        pageInfo.setTotal(totalCount); // 设置总记录数
        pageInfo.setPageNum(pageNum);
        pageInfo.setPageSize(limit);
        pageInfo.setPages((totalCount + limit - 1) / limit); // 计算总页数
        pageInfo.setHasPreviousPage(pageNum > 1);
        pageInfo.setHasNextPage(pageNum < pageInfo.getPages());
        pageInfo.setIsFirstPage(pageNum == 1);
        pageInfo.setIsLastPage(pageNum == pageInfo.getPages());

        return pageInfo;
    }

    @Override
    public void addTypeSubmit(TypeInfo info) {
        typeInfoMapper.addTypeSubmit(info);
    }

    @Override
    public TypeInfo queryTypeInfoById(Integer id) {
        return typeInfoMapper.queryTypeInfoById(id);
    }

    @Override
    public void updateTypeSubmit(TypeInfo info) {
        typeInfoMapper.updateTypeSubmit(info);
    }

    @Override
    public void deleteTypeByIds(List<String> id) {
        List<Integer> list = new ArrayList<>();
        for (String cid : id) {
            int id2 = Integer.valueOf(cid);
            list.add(id2);
        }
        typeInfoMapper.deleteTypeByIds(list);
    }

}