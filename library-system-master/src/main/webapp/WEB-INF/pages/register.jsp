<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>用户注册</title>
    <%-- 引入必要的 CSS --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" media="all">
    <style>
        /* 添加一些基本的样式 */
        .register-container {
            width: 400px;
            margin: 100px auto;
            padding: 30px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .register-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .layui-form-item {
            margin-bottom: 20px;
        }
        .layui-input {
             width: calc(100% - 22px); /* 减去 padding */
             padding: 10px;
             border: 1px solid #ccc;
             border-radius: 3px;
        }
        .layui-btn {
            width: 100%;
            padding: 10px;
        }
        .error-msg {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }
        .login-link {
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>
<body>
<div class="register-container">
    <h2>图书馆用户注册</h2>
    <form class="layui-form" action="${pageContext.request.contextPath}/registerSubmit" method="post" onsubmit="return validateForm();">
        <div class="error-msg">${msg}</div> <%-- 用于显示错误消息 --%>
        <div class="layui-form-item">
            <input type="text" name="username" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-item">
            <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-item">
            <input type="password" name="confirmPassword" required lay-verify="required" placeholder="请确认密码" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-item">
            <input type="email" name="email" required lay-verify="email" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
        </div>
         <div class="layui-form-item">
            <input type="text" name="realName" placeholder="真实姓名(选填)" autocomplete="off" class="layui-input">
        </div>
         <div class="layui-form-item">
            <input type="text" name="tel" placeholder="电话(选填)" autocomplete="off" class="layui-input">
        </div>
        <%-- 可以添加更多字段，如真实姓名、电话等 --%>
        <div class="layui-form-item">
            <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="register">立即注册</button>
        </div>
         <div class="login-link">
             已有账号？ <a href="${pageContext.request.contextPath}/login">立即登录</a>
         </div>
    </form>
</div>

<script>
    function validateForm() {
        var password = document.forms[0]["password"].value;
        var confirmPassword = document.forms[0]["confirmPassword"].value;
        if (password !== confirmPassword) {
            alert("两次输入的密码不一致！");
            return false; // 阻止表单提交
        }
        return true; // 允许表单提交
    }
</script>

</body>
</html> 