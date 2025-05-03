package com.yx.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yx.dao.ReaderInfoMapper;
import com.yx.po.ReaderInfo;
import com.yx.service.ReaderInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Service("readerInfoService")
public class ReaderInfoServiceImpl implements ReaderInfoService {

    @Autowired
    private ReaderInfoMapper readerInfoMapper;

    @Override
    public PageInfo<ReaderInfo> queryAllReaderInfo(ReaderInfo readerInfo, Integer pageNum, Integer limit) {
        PageHelper.startPage(pageNum, limit);
        List<ReaderInfo> readerInfoList = readerInfoMapper.queryAllReaderInfo(readerInfo);
        return new PageInfo<>(readerInfoList);
    }

    @Override
    public void addReaderInfoSubmit(ReaderInfo readerInfo) {
        readerInfoMapper.insert(readerInfo);
    }

    @Override
    public ReaderInfo queryReaderInfoById(Integer id) {
        return readerInfoMapper.selectByPrimaryKey(id);
    }

    @Override
    public void updateReaderInfoSubmit(ReaderInfo readerInfo) {
        readerInfoMapper.updateByPrimaryKey(readerInfo);
    }

    @Override
    public void deleteReaderInfoByIds(List<String> ids) {
        for (String id : ids) {
            readerInfoMapper.deleteByPrimaryKey(Integer.parseInt(id));
        }
    }

    @Override
    public ReaderInfo queryUserInfoByNameAndPassword(String username, String password) {
        return readerInfoMapper.queryUserInfoByNameAndPassword(username, password);
    }

    @Override
    public boolean checkUsernameExists(String username) {
        ReaderInfo readerInfo = readerInfoMapper.queryByUsername(username);
        return readerInfo != null;
    }

    @Override
    public void registerReader(ReaderInfo readerInfo) {
        if (readerInfo.getRegisterDate() == null) {
            readerInfo.setRegisterDate(new Date());
        }
        readerInfo.setReaderNumber(generateReaderNumber());

        readerInfoMapper.insertSelective(readerInfo);
    }

    /**
     * 生成读者卡号 (格式: RD + 年份 + 4位顺序号, 例如 RD20250001)
     */
    private synchronized String generateReaderNumber() {
        SimpleDateFormat sdfYear = new SimpleDateFormat("yyyy");
        String currentYear = sdfYear.format(new Date());
        String prefix = "RD" + currentYear; // 例如 "RD2025"

        // 查询当年已存在的最大卡号
        String maxNumber = readerInfoMapper.findMaxReaderNumberByYearPrefix(prefix);

        int nextSequence = 1;
        if (maxNumber != null && maxNumber.startsWith(prefix) && maxNumber.length() == prefix.length() + 4) {
            try {
                // 提取序号部分并加1
                String sequenceStr = maxNumber.substring(prefix.length());
                nextSequence = Integer.parseInt(sequenceStr) + 1;
            } catch (NumberFormatException e) {
                // 如果最大卡号格式不正确（理论上不应发生），则从1开始
                System.err.println("警告: 数据库中读者卡号格式错误: " + maxNumber + "，将从 1 开始生成。");
                nextSequence = 1;
            }
        }

        // 格式化为4位序号，不足补零
        String newSequenceStr = String.format("%04d", nextSequence);

        return prefix + newSequenceStr; // 例如 "RD20250001"
    }
}
