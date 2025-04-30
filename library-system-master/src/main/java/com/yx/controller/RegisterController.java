package com.yx.controller;

import com.yx.po.ReaderInfo;
import com.yx.service.ReaderInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

@Controller
public class RegisterController {

    @Autowired
    private ReaderInfoService readerInfoService;

    /**
     * 跳转到注册页面
     * 
     * @return
     */
    @GetMapping("/register")
    public String toRegisterPage() {
        return "register"; // 新的，会被解析为 /WEB-INF/pages/register.jsp
    }

    /**
     * 处理用户注册请求
     * 
     * @param readerInfo 封装表单提交的读者信息
     * @param model
     * @return
     */
    @PostMapping("/registerSubmit")
    public String registerSubmit(ReaderInfo readerInfo, Model model) {
        // 1. 检查用户名是否已存在 (需要在 Service 实现)
        boolean exists = readerInfoService.checkUsernameExists(readerInfo.getUsername());
        if (exists) {
            model.addAttribute("msg", "用户名已存在！");
            return "register"; // 新
        }

        // 2. 对密码进行加密处理 (稍后添加)
        // String encodedPassword = encodePassword(readerInfo.getPassword());
        // readerInfo.setPassword(encodedPassword);

        // 3. 设置其他默认值或必要信息
        readerInfo.setRegisterDate(new Date());
        // 可以生成一个默认的读者编号 readerNumber, 或由数据库生成
        // readerInfo.setReaderNumber(...);

        // 4. 调用 Service 层保存用户信息
        try {
            readerInfoService.registerReader(readerInfo);
            // 注册成功，重定向到登录页面或其他成功页面
            // 可以添加一个成功消息
            // model.addAttribute("successMsg", "注册成功，请登录！");
            return "redirect:/login?register=success"; // 重定向到登录页，并带上参数
        } catch (Exception e) {
            // 处理异常，例如数据库错误
            model.addAttribute("msg", "注册失败，请稍后再试！");
            e.printStackTrace(); // 记录错误日志
            return "register"; // 新
        }
    }

    // TODO: 实现密码加密逻辑
    // private String encodePassword(String rawPassword) {
    // // 使用 BCrypt, SCrypt 或其他安全哈希算法
    // return rawPassword; // 临时返回原密码
    // }

}