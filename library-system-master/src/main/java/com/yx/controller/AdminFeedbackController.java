package com.yx.controller;

import com.github.pagehelper.PageInfo;
import com.yx.po.Feedback;
import com.yx.service.FeedbackService;
import com.yx.utils.DataInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin") // 添加 Controller 级别的路径映射
public class AdminFeedbackController {

    @Autowired
    private FeedbackService feedbackService;

    /**
     * 跳转到管理员反馈管理页面
     */
    @GetMapping("/feedbackListIndex")
    public String feedbackListIndex() {
        // 返回位于 /WEB-INF/pages/admin/feedbackList.jsp 的视图
        return "admin/feedbackList";
    }

    /**
     * 查询反馈列表 (供 Layui table 使用)
     */
    @GetMapping("/queryFeedbackList")
    @ResponseBody
    public DataInfo queryFeedbackList(Feedback feedback,
            @RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "15") Integer limit) {
        // 为了接收 Layui table 的分页参数，这里参数名用 page 和 limit
        // feedback 对象中只保留 readerName 作为查询条件
        Feedback queryParam = new Feedback();
        queryParam.setReaderName(feedback.getReaderName());

        PageInfo<Feedback> pageInfo = feedbackService.queryFeedbackList(page, limit, queryParam);
        // 返回 Layui table 需要的格式
        return DataInfo.ok("成功", pageInfo.getTotal(), pageInfo.getList());
    }

}