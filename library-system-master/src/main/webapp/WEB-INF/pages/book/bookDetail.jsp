<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>图书详情 - ${bookInfo.name}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui-v2.5.5/css/layui.css" media="all">
    <style>
        body { padding: 20px; }
        .detail-item { margin-bottom: 15px; }
        .detail-label { font-weight: bold; width: 100px; display: inline-block; }
    </style>
</head>
<body>
<div class="layui-container">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>图书详情</legend>
    </fieldset>

    <c:if test="${not empty errorMessage}">
        <div class="layui-alert layui-alert-error">${errorMessage}</div>
    </c:if>

    <c:if test="${empty errorMessage and not empty bookInfo}">
        <div class="detail-item">
            <span class="detail-label">图书名称:</span>
            <span>${bookInfo.name}</span>
        </div>
        <div class="detail-item">
            <span class="detail-label">作者:</span>
            <span>${bookInfo.author}</span>
        </div>
        <div class="detail-item">
            <span class="detail-label">出版社:</span>
            <span>${bookInfo.publish}</span>
        </div>
        <div class="detail-item">
            <span class="detail-label">ISBN:</span>
            <span>${bookInfo.isbn}</span>
        </div>
         <div class="detail-item">
            <span class="detail-label">语言:</span>
            <span>${bookInfo.language}</span>
        </div>
         <div class="detail-item">
            <span class="detail-label">价格:</span>
            <span><fmt:formatNumber value="${bookInfo.price}" type="currency" currencySymbol="¥"/></span>
        </div>
         <div class="detail-item">
            <span class="detail-label">出版日期:</span>
            <span><fmt:formatDate value="${bookInfo.publishDate}" pattern="yyyy-MM-dd"/></span>
        </div>
         <div class="detail-item">
            <span class="detail-label">类型:</span>
            <span>${bookInfo.typeInfo.name}</span> <%-- 假设 BookInfo 中有关联的 TypeInfo --%>
        </div>
        <div class="detail-item">
            <span class="detail-label">状态:</span>
            <span>${bookInfo.status == 0 ? '未借出' : '已借出'}</span>
        </div>
        <div class="detail-item">
            <span class="detail-label">简介:</span>
            <div style="margin-top: 5px;">${bookInfo.introduction}</div>
        </div>
    </c:if>
</div>
</body>
</html> 