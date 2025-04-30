<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>反馈管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">读者姓名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="readerName" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <button type="submit" class="layui-btn layui-btn-primary" lay-submit lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</button>
                            <button type="reset" class="layui-btn layui-btn-primary" lay-filter="data-reset-btn"><i class="layui-icon layui-icon-refresh"></i> 重 置</button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="delete"> 批量删除 </button>
                <%-- 可以添加其他按钮 --%>
            </div>
        </script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-xs layui-btn-normal data-count-view" lay-event="view">查看详情</a>
        </script>

    </div>
</div>
<script src="${pageContext.request.contextPath}/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'table','layer'], function () {
        var $ = layui.$;
        var form = layui.form;
        var table = layui.table;
        var layer = layui.layer;

        table.render({
            elem: '#currentTableId',
            url: '${pageContext.request.contextPath}/admin/queryFeedbackList', // 后端数据接口
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print'],
            cols: [[
                {type: "checkbox", width: 50, fixed: "left"},
                {field: 'id', width: 80, title: 'ID', sort: true},
                {field: 'readerName', width: 120, title: '读者姓名'},
                {field: 'content', minWidth: 300, title: '反馈内容'},
                {field: 'submissionTime', width: 170, title: '提交时间', sort: true, templet: '<div>{{ layui.util.toDateString(d.submissionTime, "yyyy-MM-dd HH:mm:ss") }}</div>'},
                {title: '操作', minWidth: 100, toolbar: '#currentTableBar', align: "center", fixed: "right"}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: true
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            var result = data.field;
            //执行搜索重载
            table.reload('currentTableId', {
                page: {
                    curr: 1
                }
                , where: {
                    readerName: result.readerName
                }
            }, 'data');

            return false;
        });

        // 监听重置操作
        form.on('submit(data-reset-btn)', function(data){
             // 这里重置按钮的 type="reset" 已经清空了表单，我们只需要重载表格
             table.reload('currentTableId', {
                 page: {
                     curr: 1
                 }
                 , where: {} // 清空 where 条件
             }, 'data');
             return false;
        });

        /**
         * toolbar监听事件
         */
        table.on('toolbar(currentTableFilter)', function (obj) {
            if (obj.event === 'delete') {  // 监听删除按钮
                var checkStatus = table.checkStatus('currentTableId')
                    , data = checkStatus.data;
                if (data.length === 0) {
                    layer.msg('请选择要删除的反馈');
                } else {
                    // 获取选中记录的ID
                    var ids = data.map(function(item){ return item.id; });
                    
                    layer.confirm('确定删除选中的 ' + data.length + ' 条反馈吗？', function (index) {
                        layer.close(index);
                        // TODO: 向服务端发送删除请求
                        // $.ajax({
                        //     url: '${pageContext.request.contextPath}/admin/deleteFeedbacks',
                        //     type: 'POST',
                        //     contentType: 'application/json',
                        //     data: JSON.stringify(ids),
                        //     success: function(res){
                        //         if(res.code == 0){
                        //             layer.msg('删除成功');
                        //             table.reload('currentTableId');
                        //         } else {
                        //             layer.msg(res.msg || '删除失败');
                        //         }
                        //     },
                        //     error: function(){
                        //         layer.msg('请求失败');
                        //     }
                        // });
                        layer.msg('批量删除功能暂未实现 (需要后端支持)');
                    });
                }
            }
            // if (obj.event === 'add') { // 监听添加操作
            //     var index = layer.open({
            //         title: '添加反馈',
            //         type: 2,
            //         shade: 0.2,
            //         maxmin:true,
            //         shadeClose: true,
            //         area: ['100%', '100%'],
            //         content: '../page/table/add.html',
            //     });
            //     $(window).on("resize", function () {
            //         layer.full(index);
            //     });
            // }
        });

        //监听表格复选框选择
        table.on('checkbox(currentTableFilter)', function (obj) {
            // console.log(obj)
        });

        table.on('tool(currentTableFilter)', function (obj) {
            var data = obj.data;
            if (obj.event === 'view') {
                 // 查看详情，简单弹层显示内容
                 layer.open({
                    title: '查看反馈详情 - ID: ' + data.id,
                    area: ['600px', '400px'], // 调整弹窗大小
                    content: '<div style="padding: 20px; white-space: pre-wrap; word-wrap: break-word;">' + data.content + '</div>', // 直接显示内容
                    shadeClose: true
                });
            }
        });

    });
</script>

</body>
</html> 