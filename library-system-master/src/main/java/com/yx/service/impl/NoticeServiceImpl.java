package com.yx.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yx.dao.NoticeMapper;
import com.yx.po.Notice;
import com.yx.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public PageInfo<Notice> queryAllNotice(Notice notice, Integer pageNum, Integer limit) {
        // 手动分页实现
        int offset = (pageNum - 1) * limit;
        String topic = (notice != null) ? notice.getTopic() : null;
        List<Notice> list = noticeMapper.queryNoticeAll(topic, offset, limit);
        int totalCount = noticeMapper.countNoticeAll(topic);

        PageInfo<Notice> pageInfo = new PageInfo<>();
        pageInfo.setTotal(totalCount);
        pageInfo.setList(list);
        pageInfo.setPageNum(pageNum);
        pageInfo.setPageSize(limit);

        return pageInfo;
    }

    @Override
    public void addNotice(Notice notice) {
        noticeMapper.insert(notice);
    }

    @Override
    public Notice queryNoticeById(Integer id) {
        return noticeMapper.selectByPrimaryKey(id);
    }

    @Override
    public void deleteNoticeByIds(List<String> ids) {
        for (String id : ids) {
            noticeMapper.deleteByPrimaryKey(Integer.parseInt(id));
        }
    }
}
