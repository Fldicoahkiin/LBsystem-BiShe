<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <title>借书</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css" media="all">
    <style>
        body {
            background-color: #ffffff;
        }
    </style>
</head>
<body>
<div class="layui-form layuimini-form">
    <!---高级查询图书-->
    <div class="layui-form-item">
        <label class="layui-form-label required">图书名称</label>
        <div class="layui-input-block">
            <input class="layui-input" name="name" id="name" autocomplete="off" data-type="reload">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">图书列表</label>
        <div class="layui-input-block">
           <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">借书卡号</label>
        <div class="layui-input-block">
            <input type="text" name="readerNumber" lay-verify="required" lay-reqtext="借书卡不能为空" placeholder="请输入借书卡" value="" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认借书</button>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'table'], function(){
        // var table = layui.table;
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;
        //方法级渲染
        table.render({
            elem: '#currentTableId'
            ,url: '${pageContext.request.contextPath}/queryBookInfoAll'
            ,cols: [[
                {type: "checkbox", width: 50},
                //{field: 'id', width: 100, title: 'ID', sort: true},
                {field: 'isbn', width: 150, title: '图书编号'},
                //获取对象中的属性 对象
                {templet:'<div>{{d.typeInfo.name}}</div>', width: 80, title: '图书类型'},
                {field: 'name', width: 80, title: '图书名称'},
                {field: 'author', width: 80, title: '作者'},
                {field: 'price', width: 80, title: '价格'},
                {field: 'language', width: 80, title: '语言'},
            ]]
            ,id: 'testReload'
            ,height: 310,
             page:true
        });
        var $ = layui.$, active = {
            reload: function(){
                var name = $('#name').val()
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        name:name
                    }
                }, 'data');
            }
        };

        $('input[name=name]').change(function() {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });


        /**
         * 获取选中记录的id信息
         */
        function getCheackId(data){
            var arr=new Array();
            for(var i=0;i<data.length;i++){
                arr.push(data[i].id);
            }
            //拼接id
            return arr.join(",");
        };

        /**
         * form添加操作
         */
        //监听提交
        form.on('submit(saveBtn)', function (data) {
            var datas=data.field;//form单中的数据信息
            var selectData = layui.table.checkStatus('testReload').data;
            var ids=getCheackId(selectData);
            var readerNumber=datas.readerNumber;
            var  value={readerNumber:readerNumber,ids:ids};
            lendBook(value);
        });


        /**
         * 提交删除功能
         */
        function lendBook(datas){
            //向后台发送请求
            $.ajax({
                url: "${pageContext.request.contextPath}/addLend",
                type: "POST",
                data: datas,
                success: function (result) {
                    if (result.code == 0) {//如果成功
                        layer.msg('借书成功',{
                            icon:6,
                            time:500
                        },function(){
                            parent.window.location.reload();
                            var iframeIndex = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(iframeIndex);
                        })
                    } else {
                        layer.msg(result.msg);
                    }
                }
            })
        };


    });
</script>
</body>
</html>
