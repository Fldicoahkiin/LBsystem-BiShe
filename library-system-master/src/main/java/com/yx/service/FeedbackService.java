package com.yx.service;

import com.github.pagehelper.PageInfo;
import com.yx.po.Feedback;

public interface FeedbackService {

    /**
     * 新增反馈
     */
    void addFeedback(Feedback feedback);

    /**
     * 查询反馈列表（分页）
     */
    PageInfo<Feedback> queryFeedbackList(int page, int limit, Feedback feedback);

    /**
     * 根据ID查询反馈详情
     */
    Feedback queryFeedbackById(Integer id);

}