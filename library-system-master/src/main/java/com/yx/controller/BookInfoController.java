package com.yx.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.yx.po.BookInfo;
import com.yx.po.TypeInfo;
import com.yx.service.BookInfoService;
import com.yx.service.TypeInfoService;
import com.yx.utils.DataInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

@Controller
public class BookInfoController {

    @Autowired
    private BookInfoService bookInfoService;

    @Autowired
    private TypeInfoService typeInfoService;

    /**
     * 图书管理首页
     * 
     * @return
     */
    @GetMapping("/bookIndex")
    public String bookIndex() {
        return "book/bookIndex";
    }

    /**
     * 获取book信息，封装成json
     * 
     * @param bookInfo
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("/queryBookInfoAll")
    @ResponseBody // @ResponseBody将java对象转为json格式的数据，表示该方法的返回结果直接写入 HTTP response body
                  // 中，一般在异步ajax获取数据时使用
    public DataInfo bookAll(BookInfo bookInfo, @RequestParam(defaultValue = "1") Integer page,
            @RequestParam(defaultValue = "15") Integer limit) {
        PageInfo<BookInfo> pageInfo = bookInfoService.queryBookInfoAll(bookInfo, page, limit);
        return DataInfo.ok("成功", pageInfo.getTotal(), pageInfo.getList());// 总条数getTotal，数据封装成list,以便加载分页显示,由于加了ResponseBody,就会返回一个字符串
    }

    /**
     * 添加页面的跳转
     */
    @GetMapping("/bookAdd")
    public String bookAdd() {
        return "book/bookAdd";
    }

    /**
     * 类型添加提交
     */
    @RequestMapping("/addBookSubmit")
    @ResponseBody
    public DataInfo addBookSubmit(BookInfo info) {
        bookInfoService.addBookSubmit(info);
        return DataInfo.ok();
    }

    /**
     * 类型根据id查询(修改)
     */
    @GetMapping("/queryBookInfoById")
    public String queryTypeInfoById(Integer id, Model model) {
        BookInfo bookInfo = bookInfoService.queryBookInfoById(id);
        model.addAttribute("info", bookInfo);
        return "book/updateBook";
    }

    /**
     * 修改提交功能
     */

    @RequestMapping("/updateBookSubmit")
    @ResponseBody
    public DataInfo updateBookSubmit(@RequestBody BookInfo info) {
        bookInfoService.updateBookSubmit(info);
        return DataInfo.ok();
    }

    /**
     * 类型删除
     */

    @RequestMapping("/deleteBook")
    @ResponseBody
    public DataInfo deleteBook(String ids) {
        List<String> list = Arrays.asList(ids.split(","));
        bookInfoService.deleteBookByIds(list);
        return DataInfo.ok();
    }

    @RequestMapping("/findAllList")
    @ResponseBody
    public List<TypeInfo> findAll() {
        PageInfo<TypeInfo> pageInfo = typeInfoService.queryTypeInfoAll(null, 1, 100);
        List<TypeInfo> lists = pageInfo.getList();
        return lists;
    }

    /**
     * 跳转读者查询图书页面
     * 同时查询所有图书类型用于下拉列表或名称映射
     */
    @GetMapping("/readerBookIndex")
    public String readerBookPage(Model model) {
        // 查询所有图书类型
        PageInfo<TypeInfo> typePageInfo = typeInfoService.queryTypeInfoAll(null, 1, 100); // 获取所有类型
        List<TypeInfo> typeList = typePageInfo.getList();
        // 将列表转换为 JSON 字符串传递给前端
        String typeListJson = JSON.toJSONString(typeList);
        model.addAttribute("typeListJson", typeListJson);
        return "book/readerBookIndex";
    }

    /**
     * 跳转到图书详情页面
     */
    @GetMapping("/bookDetail")
    public String bookDetail(@RequestParam("id") Integer id, Model model) {
        BookInfo bookInfo = bookInfoService.queryBookInfoById(id);
        if (bookInfo == null) {
            // 可以添加错误处理，例如重定向或显示错误消息
            model.addAttribute("errorMessage", "未找到ID为 " + id + " 的图书。");
            // 返回一个通用的错误页面或列表页
            return "error/generalError"; // 假设有一个通用错误页面
        }
        model.addAttribute("bookInfo", bookInfo);
        return "book/bookDetail"; // 指向 /WEB-INF/pages/book/bookDetail.jsp
    }
}
