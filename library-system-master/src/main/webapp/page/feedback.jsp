<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>问题反馈</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css" media="all">
    <style>
        .feedback-container {
            padding: 20px;
            max-width: 800px;
            margin: 20px auto;
        }
        .layui-form-label {
            width: 100px; /* 调整标签宽度 */
        }
        .layui-input-block {
            margin-left: 130px; /* 调整输入框块的左边距 */
        }
        .msg-success {
             color: green;
             margin-bottom: 15px;
             padding: 10px;
             border: 1px solid green;
             background-color: #e6f7e6;
             border-radius: 3px;
             text-align: center;
        }
         .msg-error {
             color: red;
             margin-bottom: 15px;
             padding: 10px;
             border: 1px solid red;
             background-color: #fdecea;
             border-radius: 3px;
             text-align: center;
         }
    </style>
</head>
<body>
<div class="feedback-container">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>问题反馈</legend>
    </fieldset>

    <%-- 显示成功或错误消息 --%>
    <c:if test="${not empty successMsg}">
        <div class="msg-success">${successMsg}</div>
    </c:if>
    <c:if test="${not empty errorMsg}">
        <div class="msg-error">${errorMsg}</div>
    </c:if>

    <form class="layui-form" action="${pageContext.request.contextPath}/submitFeedback" method="post">
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">反馈内容 <span style="color:red;">*</span></label>
            <div class="layui-input-block">
                <textarea name="content" placeholder="请输入您遇到的问题或建议" class="layui-textarea" required lay-verify="required"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">联系方式</label>
            <div class="layui-input-block">
                <input type="text" name="contact" placeholder="(选填) 请输入您的邮箱或电话，方便我们与您联系" autocomplete="off" class="layui-input">
            </div>
        </div>

        <%-- 可以在这里显示当前登录的用户名，如果已登录的话 --%>
        <%-- HttpSession userSession = request.getSession(); --%>
        <%-- Object user = userSession.getAttribute("user"); --%>
        <%-- String userType = (String) userSession.getAttribute("type"); --%>
        <%-- if (user != null && "reader".equals(userType)) { --%>
            <%-- com.yx.po.ReaderInfo reader = (com.yx.po.ReaderInfo) user; --%>
            <%-- <div class="layui-form-item"> --%>
                <%-- <label class="layui-form-label">当前用户</label> --%>
                <%-- <div class="layui-input-block"> --%>
                    <%-- <div style="padding-top: 9px;"> ${reader.getUsername()} </div> --%>
                <%-- </div> --%>
            <%-- </div> --%>
        <%-- } --%>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="feedbackSubmit">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<script src="${pageContext.request.contextPath}/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'layer'], function(){
        var form = layui.form
            ,layer = layui.layer;

        // 监听提交
        // form.on('submit(feedbackSubmit)', function(data){
        //     // layer.msg(JSON.stringify(data.field));
        //     // 这里可以添加额外的 Ajax 提交逻辑，如果需要的话
        //     return true; // 返回 true 才会提交表单
        // });
    });
</script>
</body>
</html> 