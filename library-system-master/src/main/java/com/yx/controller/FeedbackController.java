package com.yx.controller;

import com.yx.po.Feedback;
import com.yx.po.ReaderInfo;
import com.yx.service.FeedbackService;
import com.yx.utils.DataInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class FeedbackController {

    @Autowired
    private FeedbackService feedbackService;

    /**
     * 跳转到读者反馈页面
     */
    @GetMapping("/readerFeedback")
    public String readerFeedbackPage() {
        // 返回位于 /WEB-INF/pages/reader/feedbackAdd.jsp 的视图
        return "reader/feedbackAdd";
    }

    /**
     * 读者提交反馈
     */
    @PostMapping("/submitReaderFeedback")
    @ResponseBody
    public DataInfo submitFeedback(@RequestBody Feedback feedback, HttpSession session) {
        // 从Session获取当前登录的读者信息 (使用 "user" 作为 key)
        Object userObject = session.getAttribute("user");

        // 检查是否是 ReaderInfo 类型
        if (!(userObject instanceof ReaderInfo)) {
            // 可以根据需要返回错误或重定向到登录页
            // 检查 session 中 type 是否为 reader
            String userType = (String) session.getAttribute("type");
            if (!"reader".equals(userType)) {
                return DataInfo.fail("只有读者可以提交反馈");
            }
            // 如果 type 是 reader 但 user 对象不是 ReaderInfo，可能存在问题
            return DataInfo.fail("用户会话异常，请重新登录");
        }

        ReaderInfo readerInfo = (ReaderInfo) userObject;

        // 设置反馈的读者ID
        feedback.setReaderId(readerInfo.getId());

        try {
            feedbackService.addFeedback(feedback);
            return DataInfo.ok();
        } catch (Exception e) {
            e.printStackTrace();
            return DataInfo.fail("提交失败，请稍后再试");
        }
    }
}
