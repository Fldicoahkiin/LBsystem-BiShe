package com.yx.dao;

import com.yx.po.Feedback;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FeedbackMapper {

    /**
     * 新增反馈
     */
    int insertFeedback(Feedback feedback);

    /**
     * 查询反馈列表（带分页和查询条件）
     * 连接查询读者姓名
     */
    List<Feedback> queryFeedbackList(Feedback feedback);

    /**
     * 根据ID查询反馈详情
     * 连接查询读者姓名
     */
    Feedback queryFeedbackById(Integer id);

    /**
     * 更新反馈回复
     */
    int updateFeedbackReply(Feedback feedback);

    /**
     * 查询总数（用于分页）
     */
    int queryFeedbackCount(Feedback feedback);

}