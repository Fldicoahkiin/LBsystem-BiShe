package com.yx.service;

import com.github.pagehelper.PageInfo;
import com.yx.po.Feedback;
import java.util.List;

public interface FeedbackService {

    /**
     * 新增反馈
     */
    void addFeedback(Feedback feedback);

    /**
     * 查询反馈列表（分页）
     */
    PageInfo<Feedback> queryFeedbackList(Feedback feedback, int page, int limit);

    /**
     * 根据ID查询反馈详情
     */
    Feedback queryFeedbackById(Integer id);

    /**
     * 根据 ID 列表批量删除反馈
     * 
     * @param ids ID 列表
     */
    void deleteFeedbacksByIds(List<Integer> ids);

}