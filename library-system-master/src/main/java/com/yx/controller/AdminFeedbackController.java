package com.yx.controller;

import com.github.pagehelper.PageInfo;
import com.yx.po.Feedback;
import com.yx.service.FeedbackService;
import com.yx.utils.DataInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class AdminFeedbackController {

    @Autowired
    private FeedbackService feedbackService;

    /**
     * 跳转到管理员反馈管理页面
     */
    @GetMapping("/feedbackList")
    public String feedbackList() {
        return "admin/feedbackList";
    }

    /**
     * 查询反馈列表
     */
    @RequestMapping("/queryFeedbackList")
    @ResponseBody
    public DataInfo queryFeedbackList(@RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "15") int limit,
            Feedback feedback) {
        // Call service method with matching parameter order
        PageInfo<Feedback> pageInfo = feedbackService.queryFeedbackList(feedback, page, limit);
        return DataInfo.ok("成功", pageInfo.getTotal(), pageInfo.getList());
    }

    /**
     * 根据 ID 列表批量删除反馈
     */
    @PostMapping("/deleteFeedbacks")
    @ResponseBody
    public DataInfo deleteFeedbacks(@RequestParam("ids") List<Integer> ids) {
        try {
            feedbackService.deleteFeedbacksByIds(ids);
            return DataInfo.ok("批量删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return DataInfo.fail("批量删除失败");
        }
    }

}