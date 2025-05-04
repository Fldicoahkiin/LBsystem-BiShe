<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>借阅历史 - ${readerName}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui-v2.5.5/css/layui.css" media="all">
    <style>
        body { padding: 20px; }
    </style>
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend>借阅历史 - ${readerName} (ID: ${readerId})</legend>
        </fieldset>

        <table class="layui-table" lay-skin="line">
            <colgroup>
                <col>
                <col>
                <col>
                <col>
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>图书名称</th>
                <th>作者</th>
                <th>ISBN</th>
                <th>借阅时间</th>
                <th>归还时间</th>
                <th>归还状态</th>
                <th>备注</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${not empty historyList}">
                    <c:forEach items="${historyList}" var="item">
                        <tr>
                            <td>${item.bookInfo.name}</td>
                             <td>${item.bookInfo.author}</td> <%-- 注意：这里假设queryLookBookList也返回了作者和ISBN --%>
                             <td>${item.bookInfo.isbn}</td>  <%-- 需要确认LendListMapper.xml中的queryLookBookList查询 --%>
                            <td><fmt:formatDate value="${item.lendDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td>
                                <c:if test="${not empty item.backDate}">
                                    <fmt:formatDate value="${item.backDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                </c:if>
                                <c:if test="${empty item.backDate}">
                                    -
                                </c:if>
                            </td>
                            <td>
                                <c:choose>
                                     <c:when test="${empty item.backDate}">
                                         <span class="layui-badge layui-bg-red">在借中</span>
                                     </c:when>
                                     <c:when test="${item.backType == 0}">
                                         <span class="layui-badge layui-bg-green">正常还书</span>
                                     </c:when>
                                      <c:when test="${item.backType == 1}">
                                         <span class="layui-badge layui-bg-gray">延迟还书</span>
                                     </c:when>
                                     <c:when test="${item.backType == 2}">
                                         <span class="layui-badge layui-bg-orange">破损还书</span> <%-- 修正为 破损还书 --%>
                                     </c:when>
                                      <c:when test="${item.backType == 3}">
                                          <span class="layui-badge layui-bg-orange">丢失图书</span> <%-- 修正为 丢失图书 --%>
                                      </c:when>
                                     <c:otherwise>
                                          <span class="layui-badge">未知</span> <%-- 添加未知状态 --%>
                                     </c:otherwise>
                                </c:choose>
                            </td>
                             <td>${item.exceptRemarks}</td> <%-- 确保使用 exceptRemarks --%>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="7" style="text-align: center;">该读者暂无借阅记录。</td>
                    </tr>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </div>
</div>
</body>
</html> 