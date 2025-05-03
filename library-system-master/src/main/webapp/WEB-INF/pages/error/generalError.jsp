<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>错误</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui-v2.5.5/css/layui.css" media="all">
    <style>
        body { padding: 20px; }
    </style>
</head>
<body>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md8 layui-col-md-offset2">
            <div class="layui-card" style="margin-top: 50px;">
                <div class="layui-card-header">发生错误</div>
                <div class="layui-card-body">
                    <p style="color: red;">
                        <c:choose>
                            <c:when test="${not empty errorMessage}">
                                ${errorMessage}
                            </c:when>
                            <c:otherwise>
                                抱歉，处理您的请求时发生了一个错误。
                            </c:otherwise>
                        </c:choose>
                    </p>
                    <hr>
                    <p>
                        <a href="javascript:history.back()" class="layui-btn layui-btn-primary">返回上一页</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html> 