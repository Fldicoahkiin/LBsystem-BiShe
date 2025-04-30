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
        /* 增加一些内边距 */
        .layuimini-main {
            padding: 20px;
        }
        /* 调整标签宽度 */
        .layui-form-label {
            width: 100px;
        }
        /* 调整输入框块的左边距 */
        .layui-input-block {
            margin-left: 130px; /* label宽度 + 间距 */
            min-height: 36px;
        }
        /* 让文本域高度适应内容 */
        .layui-textarea {
            min-height: 150px;
        }
        /* 按钮区域 */
        .button-area {
            /* 使按钮区域与输入框左侧对齐 */
            margin-left: 130px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
        <%-- 移除 layui-card 布局，直接使用 form --%>
        <form class="layui-form" action="" lay-filter="feedbackForm">
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">反馈内容</label>
                <div class="layui-input-block">
                    <textarea name="content" placeholder="请输入您的反馈意见或建议 (至少10个字符)" class="layui-textarea" lay-verify="required|minlength" lay-reqtext="反馈内容不能为空" minlength="10"></textarea>
                </div>
            </div>
            <%-- 使用标准的 layui-input-block 包裹按钮 --%>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="${pageContext.request.contextPath}/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'layer'], function () {
        var form = layui.form,
            layer = layui.layer,
            $ = layui.$;

        // 添加自定义表单校验规则
        form.verify({
            minlength: function(value, item){ // value：表单的值、item：表单的DOM对象
                var min = item.getAttribute('minlength');
                if(value.length < min){
                    return '反馈内容至少需要 ' + min + ' 个字符';
                }
            }
        });

        //监听提交
        form.on('submit(saveBtn)', function (data) {
            var feedbackData = data.field; // 获取表单字段
            var submitBtn = $(this); // 获取提交按钮

            // 禁用按钮防止重复提交
            submitBtn.addClass('layui-btn-disabled').attr('disabled', 'disabled');

            layer.load(1); // 显示加载图标

            $.ajax({
                url: '${pageContext.request.contextPath}/submitReaderFeedback',
                type: 'POST',
                contentType: 'application/json;charset=UTF-8',
                data: JSON.stringify(feedbackData),
                dataType: 'json',
                success: function(res){
                    layer.closeAll('loading'); // 关闭加载图标
                    // 调试：显示后端返回的完整响应
                    alert("后端响应: " + JSON.stringify(res));

                    if(res && res.code === 0){ // 确保 res 对象存在且 code 为 0
                        layer.msg('提交成功！感谢您的反馈。', {icon: 1, time: 2000}, function(){
                            // 提交成功后清空表单
                            $('textarea[name="content"]').val('');
                            form.render(); // 可能需要重新渲染表单以更新状态
                        });
                    } else {
                        layer.alert((res && res.msg) || '提交失败，未知错误。', {icon: 2, title: '操作失败'});
                    }
                },
                error: function(xhr, status, error){
                    layer.closeAll('loading'); // 关闭加载图标
                    // 调试：显示错误状态和响应文本
                    alert("请求错误状态: " + xhr.status + "\n响应文本: " + xhr.responseText);
                    layer.alert('请求出错: ' + error + '<br>状态码: ' + xhr.status + '<br>请检查网络连接或后台服务是否正常。', {icon: 2, title: '请求错误'});
                },
                complete: function() {
                    // 请求完成后，无论成功失败，都恢复按钮
                    submitBtn.removeClass('layui-btn-disabled').removeAttr('disabled');
                }
            });

            return false; // 阻止表单跳转。
        });

    });
</script>
</body>
</html> 