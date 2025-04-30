package com.yx.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yx.dao.FeedbackMapper;
import com.yx.po.Feedback;
import com.yx.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public PageInfo<Feedback> queryFeedbackList(int page, int limit, Feedback feedback) {
        PageHelper.startPage(page, limit);
        List<Feedback> list = feedbackMapper.queryFeedbackList(feedback);
        return new PageInfo<>(list);
    }

    @Override
    public Feedback queryFeedbackById(Integer id) {
        return feedbackMapper.queryFeedbackById(id);
    }
}