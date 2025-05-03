<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>图书借阅</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <fieldset class="layui-elem-field layuimini-search">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">图书名称</label>
                            <div class="layui-input-inline">
                                <input type="text" name="name" id="name" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">作者</label>
                            <div class="layui-input-inline">
                                <input type="text" name="author" id="author" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">ISBN</label>
                            <div class="layui-input-inline">
                                <input type="text" name="isbn" id="isbn" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <a class="layui-btn" lay-submit="" lay-filter="data-search-btn"> 搜索 </a>
                            <button type="reset" class="layui-btn layui-btn-primary"> 重置 </button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <script type="text/html" id="currentTableBar">
            {{# if(d.status == 0){ }} 
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="borrow">借阅</a>
            {{# } else { }}
            <a class="layui-btn layui-btn-disabled layui-btn-xs">已借出</a>
            {{# } }}
        </script>

    </div>
</div>
<script src="${pageContext.request.contextPath}/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
    // 解析后端传递的 typeListJson
    var typeList = JSON.parse('${typeListJson}'); // 注意需要引号包裹JSON字符串
    var typeMap = {};
    if (typeList) {
        typeList.forEach(function(type) {
            typeMap[type.id] = type.name;
        });
    }

    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            url: '${pageContext.request.contextPath}/queryBookInfoAll', // 移除 /book 前缀
            //toolbar: '#toolbarDemo', // No toolbar needed for readers
            defaultToolbar: ['filter', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50, fixed: "left"}, // Keep checkbox for potential future use
                //{field: 'id', width: 80, title: 'ID', sort: true},
                {field: 'name', width: 150, title: '图书名称'},
                {field: 'author', width: 120, title: '作者'},
                {field: 'publish', width: 150, title: '出版社'},
                {field: 'isbn', width: 150, title: 'ISBN'},
                {field: 'price', width: 80, title: '价格', sort: true},
                {field: 'language', width: 80, title: '语言'},
                {field: 'typeInfo.name', width: 100, title: '类型',
                   templet:function(d){
                       // 检查 typeInfo 是否存在，以防万一
                       return d.typeInfo ? d.typeInfo.name : '未知';
                   }
                },
                {field: 'publishDate', width: 120, title: '出版日期', sort: true},
                {field: 'introduction', title: '简介', minWidth: 200},
                {field: 'status', width: 100, title: '状态', templet: function(d){
                    return d.status == 0 ? '<span class="layui-badge layui-bg-green">未借出</span>' : '<span class="layui-badge layui-bg-red">已借出</span>';
                }},
                {title: '操作', minWidth: 80, toolbar: '#currentTableBar', align: "center", fixed: "right"}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: true,
            skin: 'line'
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            var result = data.field; //获取数据

            //执行搜索重载
            table.reload('currentTableId', {
                page: {
                    curr: 1
                }
                , where: {
                    name: result.name,
                    author:result.author,
                    isbn:result.isbn
                }
            }, 'data');

            return false;
        });


        //监听表格复选框选择 - Not used for borrow, but keep for consistency
        table.on('checkbox(currentTableFilter)', function (obj) {
            console.log(obj)
        });

        //监听工具条
        table.on('tool(currentTableFilter)', function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（borrow）

            if (layEvent === 'borrow') {
                 if(data.status != 0) {
                    layer.msg('该图书已被借出!', {icon: 5});
                    return;
                 }
                 layer.confirm('确定要借阅《' + data.name + '》吗？', function(index){
                     $.ajax({
                        url: "${pageContext.request.contextPath}/borrowBook", // 移除 /lend 前缀
                        type: "POST",
                        data: {bookId: data.id},
                        success: function (result) {
                            if (result.code == 0) {
                                layer.msg('借阅成功!', {icon: 1});
                                table.reload('currentTableId'); // Refresh table
                            } else {
                                layer.msg(result.msg || '借阅失败!', {icon: 5});
                            }
                        },
                        error: function(){
                            layer.msg('请求失败，请重试!', {icon: 5});
                        }
                    });
                    layer.close(index);
                });
            }
        });

    });
</script>

</body>
</html> 