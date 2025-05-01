package com.yx.controller;

import com.github.pagehelper.PageInfo;
import com.github.pagehelper.PageHelper;
import com.yx.po.BookInfo;
import com.yx.po.LendList;
import com.yx.po.ReaderInfo;
import com.yx.service.BookInfoService;
import com.yx.service.LendListService;
import com.yx.service.ReaderInfoService;
import com.yx.utils.DataInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;

@Controller
public class LendListController {
    @Autowired
    private LendListService lendListService;
    @Autowired
    private ReaderInfoService readerService;

    @Autowired
    private BookInfoService bookInfoService;

    @GetMapping("/lendListIndex")
    public String lendListIndex() {
        return "lend/lendListIndex";
    }

    /**
     * 查询所有的列表
     * 1 request获取
     * 2、参数绑定
     * 3、对象绑定
     */
    @ResponseBody
    @RequestMapping("/lendListAll")
    public DataInfo lendListAll(Integer type, String readerNumber, String name, Integer status,
            @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "15") Integer limit) {

        LendList info = new LendList();
        info.setBackType(type);

        // 创建读者对象
        ReaderInfo reader = new ReaderInfo();
        reader.setReaderNumber(readerNumber);
        // 把以上对象交给info
        info.setReaderInfo(reader);

        // 图书对象
        BookInfo book = new BookInfo();
        book.setName(name);
        book.setStatus(status);
        info.setBookInfo(book);

        // 分页查询所有的记录信息
        PageInfo pageInfo = lendListService.queryLendListAll(info, page, limit);
        return DataInfo.ok("ok", pageInfo.getTotal(), pageInfo.getList());
    }

    /**
     * 添加跳转
     */
    @GetMapping("/addLendList")
    public String addLendList() {
        return "addLendList";
    }

    /**
     * 借书信息提交
     * 1判断借阅号码是否存在
     * 2、可借的数据是否大于等于当前的借书量
     * 3、添加借书记录，同时改变书的状态信息
     * cardnumber:借书号码
     * ids：字符串 书id的集合
     */
    @ResponseBody
    @RequestMapping("/addLend")
    public DataInfo addLend(String readerNumber, String ids) {
        // 获取图书id的集合
        List<String> list = Arrays.asList(ids.split(","));
        // 判断卡号是否存在
        ReaderInfo reader = new ReaderInfo();
        reader.setReaderNumber(readerNumber);
        PageInfo<ReaderInfo> pageInfo = readerService.queryAllReaderInfo(reader, 1, 1);
        if (pageInfo.getList().size() == 0) {
            return DataInfo.fail("卡号信息不存在");
        } else {
            ReaderInfo readerCard2 = pageInfo.getList().get(0);
            // 可借书
            for (String bid : list) {
                LendList lendList = new LendList();
                lendList.setReaderId(readerCard2.getId());// 读者id
                lendList.setBookId(Integer.valueOf(bid));// 书的id
                lendList.setLendDate(new Date());
                lendListService.addLendListSubmit(lendList);
                // 更变书的状态
                BookInfo info = bookInfoService.queryBookInfoById(Integer.valueOf(bid));
                // 设置书的状态
                info.setStatus(1);
                bookInfoService.updateBookSubmit(info);
            }

        }

        return DataInfo.ok();
    }

    /**
     * 删除借阅记录
     */
    @ResponseBody
    @RequestMapping("/deleteLendListByIds")
    public DataInfo deleteLendListByIds(String ids, String bookIds) {
        List list = Arrays.asList(ids.split(","));// 借阅记录的id
        List blist = Arrays.asList(bookIds.split(","));// 图书信息的id

        lendListService.deleteLendListById(list, blist);
        return DataInfo.ok();
    }

    /**
     * 还书功能
     */
    @ResponseBody
    @RequestMapping("/backLendListByIds")
    public DataInfo backLendListByIds(String ids, String bookIds) {
        List list = Arrays.asList(ids.split(","));// 借阅记录的id
        List blist = Arrays.asList(bookIds.split(","));// 图书信息的id
        lendListService.updateLendListSubmit(list, blist);
        return DataInfo.ok();
    }

    /**
     * 页面跳转 异常还书
     */
    @GetMapping("/excBackBook")
    public String excBackBook(HttpServletRequest request, Model model) {
        // 获取借阅记录id
        String id = request.getParameter("id");
        String bId = request.getParameter("bookId");
        model.addAttribute("id", id);
        model.addAttribute("bid", bId);
        return "lend/excBackBook";
    }

    /**
     * 异常还书
     */
    @ResponseBody
    @RequestMapping("/updateLendInfoSubmit")
    public DataInfo updateLendInfoSubmit(LendList lendList) {
        lendListService.backBook(lendList);
        return DataInfo.ok();
    }

    /**
     * 查询当前登录读者的借阅记录 (分页)
     */
    @GetMapping("/queryReaderLendList")
    @ResponseBody
    public DataInfo queryReaderLendList(HttpSession session,
            @RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "15") Integer limit) {
        // 1. 获取当前登录用户类型和信息
        String userType = (String) session.getAttribute("type");
        Object userObject = session.getAttribute("user");

        if (!userType.equals("reader") || !(userObject instanceof ReaderInfo)) {
            return DataInfo.fail("用户未登录或非读者用户");
        }
        ReaderInfo reader = (ReaderInfo) userObject;

        // 2. 设置分页
        PageHelper.startPage(page, limit);
        // 3. 查询该读者的借阅信息
        List<LendList> list = lendListService.queryLookBookList(reader.getId(), null);
        // 4. 封装 PageInfo
        PageInfo<LendList> pageInfo = new PageInfo<>(list);
        // 5. 返回 DataInfo
        return DataInfo.ok("成功", pageInfo.getTotal(), pageInfo.getList());
    }

    @GetMapping("/queryLookBookList2")
    public String queryLookBookList2() {
        return "lend/queryLookBookList2";
    }

    /**
     * 读者借书请求处理
     */
    @PostMapping("/borrowBook")
    @ResponseBody
    public DataInfo borrowBook(@RequestParam("bookId") Integer bookId, HttpSession session) {
        // 1. 获取当前登录用户类型和信息
        String userType = (String) session.getAttribute("type");
        Object userObject = session.getAttribute("user");

        if (!userType.equals("reader") || !(userObject instanceof ReaderInfo)) {
            return DataInfo.fail("用户未登录或非读者用户");
        }
        ReaderInfo reader = (ReaderInfo) userObject;
        Integer readerId = reader.getId();

        try {
            // 2. 调用Service层处理借书逻辑 (Service层应包含事务处理)
            lendListService.borrowBook(bookId, readerId);
            return DataInfo.ok("借阅成功");
        } catch (RuntimeException e) {
            // 捕获Service层可能抛出的自定义异常或通用异常
            return DataInfo.fail(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace(); // 打印未知错误堆栈
            return DataInfo.fail("借阅失败，发生未知错误");
        }
    }

    /**
     * 跳转到读者借阅信息页面
     */
    @GetMapping("/lookBookList")
    public String readerLendListPage(HttpSession session, Model model) {
        // 1. 获取当前登录用户类型和信息
        String userType = (String) session.getAttribute("type");
        Object userObject = session.getAttribute("user");

        if (userType == null || !userType.equals("reader") || !(userObject instanceof ReaderInfo)) {
            // 如果用户未登录或不是读者，可以添加错误消息或重定向到登录页
            model.addAttribute("errorMessage", "请先以读者身份登录。");
            // 或者 return "redirect:/login"; // 重定向到登录页
            // 这里暂时只在模型中添加一个空列表，避免JSP报错
            model.addAttribute("info", new java.util.ArrayList<LendList>());
        } else {
            ReaderInfo reader = (ReaderInfo) userObject;
            Integer readerId = reader.getId();

            // 2. 查询该读者的借阅信息
            List<LendList> lendList = lendListService.queryLookBookList(readerId, null);

            // 3. 将查询结果添加到 Model
            model.addAttribute("info", lendList);
        }

        return "lend/lookBookList";
    }

}
