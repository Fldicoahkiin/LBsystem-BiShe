<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>问题反馈</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css" media="all">
    <style>
        body { background-color: #ffffff; }
        .layui-form-item .layui-input-company { width: auto; padding-right: 10px; line-height: 38px; }
    </style>
</head>
<body>
<div class="layui-form layuimini-form" style="margin: 20px;">
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label required">反馈内容</label>
        <div class="layui-input-block">
            <textarea name="content" lay-verify="required" lay-reqtext="反馈内容不能为空" placeholder="请输入您的宝贵意见或遇到的问题..." class="layui-textarea"></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认提交</button>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'layer'], function () {
        var form = layui.form,
            layer = layui.layer,
            $ = layui.$;

        //监听提交
        form.on('submit(saveBtn)', function (data) {
            $.ajax({
                url: "${pageContext.request.contextPath}/submitReaderFeedback", // 提交到现有接口
                type: "POST",
                contentType: "application/json; charset=utf-8", // 发送JSON
                data: JSON.stringify({content: data.field.content}), // 只发送 content
                dataType: "json",
                success: function (result) {
                    if (result.code == 0) {
                        layer.msg("感谢您的反馈!", {icon: 1, time: 1500}, function (){
                             // 可以选择关闭窗口或清空文本域
                             $('textarea[name="content"]').val('');
                        });
                    } else {
                        layer.msg(result.msg || "提交失败!", {icon: 5});
                    }
                },
                error: function(){
                    layer.msg("请求失败，请重试", {icon: 5});
                }
            });
            return false;
        });

    });
</script>
</body>
</html> 