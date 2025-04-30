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
     * 生成读者卡号 (示例：年份+月份+时间戳后几位+随机数)
     */
    private String generateReaderNumber() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
        String prefix = sdf.format(new Date());
        String timestampSuffix = String.valueOf(System.currentTimeMillis() % 10000); // 时间戳后4位
        Random random = new Random();
        String randomSuffix = String.format("%02d", random.nextInt(100)); // 2位随机数
        // 组合，例如：202504 1234 56
        return prefix + timestampSuffix + randomSuffix;
    }
}
