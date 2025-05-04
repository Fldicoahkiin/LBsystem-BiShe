package com.yx.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yx.dao.FeedbackMapper;
import com.yx.po.Feedback;
import com.yx.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("feedbackService")
public class FeedbackServiceImpl implements FeedbackService {

    @Autowired
    private FeedbackMapper feedbackMapper;

    @Override
    public void addFeedback(Feedback feedback) {
        feedbackMapper.insertFeedback(feedback);
    }

    @Override
    public PageInfo<Feedback> queryFeedbackList(Feedback feedback, int pageNum, int limit) {
        int offset = (pageNum - 1) * limit;
        List<Feedback> list = feedbackMapper.queryFeedbackList(feedback, offset, limit);
        int totalCount = feedbackMapper.queryFeedbackCount(feedback);

        PageInfo<Feedback> pageInfo = new PageInfo<>();
        pageInfo.setList(list);
        pageInfo.setTotal(totalCount);
        pageInfo.setPageNum(pageNum);
        pageInfo.setPageSize(limit);
        pageInfo.setPages((totalCount + limit - 1) / limit);
        pageInfo.setHasPreviousPage(pageNum > 1);
        pageInfo.setHasNextPage(pageNum < pageInfo.getPages());
        pageInfo.setIsFirstPage(pageNum == 1);
        pageInfo.setIsLastPage(pageNum == pageInfo.getPages());

        return pageInfo;
    }

    @Override
    public Feedback queryFeedbackById(Integer id) {
        return feedbackMapper.queryFeedbackById(id);
    }

    @Override
    @Transactional
    public void deleteFeedbacksByIds(List<Integer> ids) {
        if (ids != null && !ids.isEmpty()) {
            feedbackMapper.deleteFeedbackByIds(ids);
        }
    }
}