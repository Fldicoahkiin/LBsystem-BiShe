<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="utf-8">
                    <title>借阅管理</title>
                    <meta name="renderer" content="webkit">
                    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
                    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui-v2.5.5/css/layui.css"
                        media="all">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css" media="all">
                </head>

                <body>
                    <div class="layuimini-container">
                        <div class="layuimini-main">

                            <div class="layuimini-main">
                                <div class="demoTable">
                                    <div class="layui-form-item layui-form ">
                                        借书卡
                                        <div class="layui-inline">
                                            <input class="layui-input" name="readerNumber" id="readerNumber"
                                                autocomplete="off">
                                        </div>
                                        图书名称
                                        <div class="layui-inline">
                                            <input class="layui-input" name="name" id="name" autocomplete="off">
                                        </div>
                                        归还类型
                                        <div class="layui-inline">
                                            <select class="layui-input" name="type" id="type">
                                                <option value=""></option>
                                                <option value="0">正常还书</option>
                                                <option value="1">延迟还书</option>
                                                <option value="2">破损还书</option>
                                                <option value="3">丢失</option>
                                            </select>
                                        </div>
                                        图书类型
                                        <div class="layui-inline">
                                            <select class="layui-input" name="status" id="status">
                                                <option value=""></option>
                                                <option value="0">未借出</option>
                                                <option value="1">在借中</option>
                                            </select>
                                        </div>
                                        <button class="layui-btn" data-type="reload">搜索</button>
                                    </div>
                                </div>
                            </div>
                            <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"> 借书 </button>
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="back"> 还书 </button>
                <button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="delete"> 删除 </button>
            </div>
        </script>

                            <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

                            <script type="text/html" id="currentTableBar">
            {{# if(d.backDate==null){ }}
                <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">异常还书</a>
                <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
            {{# }else{ }}
               <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
            {{# } }}
        </script>

                        </div>
                    </div>
                    <script src="${pageContext.request.contextPath}/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
                    <script>
                        layui.use(['form', 'table'], function () {
                            var $ = layui.jquery,
                                form = layui.form,
                                table = layui.table;

                            table.render({
                                elem: '#currentTableId',
                                url: '${pageContext.request.contextPath}/lendListAll',//查询借阅图书记录
                                toolbar: '#toolbarDemo',
                                defaultToolbar: ['filter', 'exports', 'print', {
                                    title: '提示',
                                    layEvent: 'LAYTABLE_TIPS',
                                    icon: 'layui-icon-tips'
                                }],
                                cols: [[
                                    { type: "checkbox", width: 50 },
                                    //{field: 'id', width: 100, title: 'ID', sort: true},
                                    {
                                        templet: '<div><a href="javascript:void(0)" style="color:#00b7ee" lay-event="bookInfoEvent">{{ d.bookInfo ? d.bookInfo.name : "图书信息丢失" }}</a></div>',
                                        width: 100, title: '图书名称'
                                    },
                                    { templet: '<div>{{ d.readerInfo ? d.readerInfo.readerNumber : "读者卡号丢失" }}</div>', width: 120, title: '借书卡' },
                                    {
                                        templet: '<div><a href="javascript:void(0)" style="color:#00b7ee" lay-event="readerInfoEvent">{{ d.readerInfo ? d.readerInfo.realName : "未知读者" }}</a></div>',
                                        width: 100, title: '借阅人'
                                    },
                                    // {templet: '<div>{{d.reader.name}}</div>', width: 80, title: '借阅人'},
                                    { templet: "<div>{{layui.util.toDateString(d.lendDate,'yyyy-MM-dd HH:mm:ss')}}</div>", width: 160, title: '借阅时间' },
                                    { field: 'backDate', width: 160, title: '还书时间' },
                                    {
                                        title: "还书类型", minWidth: 120, templet: function (res) {
                                            if (res.backDate == null){
                                                return '<span class="layui-badge layui-bg-red">在借中</span>';
                                            } else if (res.backType == '0') {
                                                return '<span class="layui-badge layui-bg-green">正常还书</span>';
                                            } else if (res.backType == '1') {
                                                return '<span class="layui-badge layui-bg-gray">延迟还书</span>';
                                            } else if (res.backType == '2') {
                                                return '<span class="layui-badge layui-bg-orange">破损还书</span>';
                                            } else if (res.backType == '3') {
                                                return '<span class="layui-badge layui-bg-orange">丢失图书</span>';
                                            } else {
                                                return '<span class="layui-badge">未知</span>';
                                            }
                                        }
                                    },
                                    { field: 'exceptRemarks', width: 150, title: '异常备注' },
                                    { title: '操作', minWidth: 150, toolbar: '#currentTableBar', align: "center" }
                                ]],
                                limits: [10, 15, 20, 25, 50, 100],
                                limit: 15,
                                page: true,
                                skin: 'line',
                                id: 'testReload'
                            });


                            var $ = layui.$, active = {
                                reload: function () {
                                    var name = $('#name').val();
                                    var readerNumber = $('#readerNumber').val();
                                    var backType = $('#backType').val();
                                    var status = $('#status').val();
                                    //执行重载
                                    table.reload('testReload', {
                                        page: {
                                            curr: 1 //重新从第 1 页开始
                                        }
                                        , where: {
                                            name: name,
                                            readerNumber: readerNumber,
                                            backType: backType,
                                            status: status
                                        }
                                    }, 'data');
                                }
                            };


                            $('.demoTable .layui-btn').on('click', function () {
                                var type = $(this).data('type');
                                active[type] ? active[type].call(this) : '';
                            });

                            /**
                             * tool操作栏监听事件
                             */
                            table.on('tool(currentTableFilter)', function (obj) {
                                var data = obj.data;
                                if (obj.event === 'edit') {  // 监听添加操作
                                    var index = layer.open({
                                        title: '异常还书',
                                        type: 2,
                                        shade: 0.2,
                                        maxmin: true,
                                        shadeClose: true,
                                        area: ['100%', '100%'],
                                        content: '${pageContext.request.contextPath}/excBackBook?id=' + data.id + "&bookId=" + data.bookId,
                                    });
                                    $(window).on("resize", function () {
                                        layer.full(index);
                                    });
                                } else if (obj.event === 'delete') {  // 监听删除操作
                                    layer.confirm('确定是否删除', function (index) {
                                        //调用删除功能
                                        //获取记录信息的id集合
                                        deleteInfoByIds(data.id, data.bookId, index);
                                        layer.close(index);
                                    });
                                } else if (obj.event === 'bookInfoEvent') {// 修改：跳转到图书详情
                                    var bookId = data.bookId;
                                    var bookName = data.bookInfo ? data.bookInfo.name : '未知图书'; // 获取图书名称用于标题
                                    if (!bookId) {
                                        layer.msg('无法获取图书ID');
                                        return;
                                    }
                                    var detailIndex = layer.open({
                                        title: '图书详情 - ' + bookName,
                                        type: 2,
                                        shade: 0.2,
                                        maxmin: true,
                                        shadeClose: true,
                                        area: ['80%', '80%'],
                                        content: '${pageContext.request.contextPath}/bookDetail?id=' + bookId,
                                    });
                                    $(window).on("resize", function () { layer.full(detailIndex); });

                                } else if (obj.event === 'readerInfoEvent') { // 修改：跳转到读者借阅历史
                                    var readerId = data.readerId;
                                    var readerName = data.readerInfo ? data.readerInfo.realName : '未知读者'; // 获取读者姓名用于标题
                                    if (!readerId) {
                                        layer.msg('无法获取读者ID');
                                        return;
                                    }
                                    var historyIndex = layer.open({
                                        title: '借阅历史 - ' + readerName,
                                        type: 2,
                                        shade: 0.2,
                                        maxmin: true,
                                        shadeClose: true,
                                        area: ['80%', '80%'],
                                        content: '${pageContext.request.contextPath}/lendHistoryByReader?readerId=' + readerId,
                                    });
                                    $(window).on("resize", function () { layer.full(historyIndex); });
                                }
                            });

                            /**
                             * 借阅线打开内容 (此函数不再被 bookInfoEvent 和 readerInfoEvent 调用, 可考虑删除或保留用于其他目的)
                             */
                            /*
                            function queryLookBookList(flag,id){
                                var index = layer.open({
                                    title: '借阅时间线',
                                    type: 2,
                                    shade: 0.2,
                                    maxmin:true,
                                    shadeClose: true,
                                    area: ['60%', '60%'],
                                    content: '${pageContext.request.contextPath}/queryLookBookList?id='+id+"&flag="+flag,
                                });
                                $(window).on("resize", function () {
                                    layer.full(index);
                                });
                            }
                            */




                            //监听表格复选框选择
                            table.on('checkbox(currentTableFilter)', function (obj) {
                                console.log(obj)
                            });

                            /**
                             * 获取选中记录的id信息
                             */
                            function getCheackId(data) {
                                var arr = new Array();
                                for (var i = 0; i < data.length; i++) {
                                    arr.push(data[i].id);
                                }
                                //拼接id
                                return arr.join(",");
                            };


                            /**
                             * 获取选中记录的中图书id集合*/
                            function getCheackBookId(data) {
                                var arr = new Array();
                                for (var i = 0; i < data.length; i++) {
                                    arr.push(data[i].bookId);
                                }
                                //拼接id
                                return arr.join(",");
                            };

                            /**
                             * 提交删除功能
                             */
                            function deleteInfoByIds(ids, bookIds, index) {
                                //向后台发送请求
                                $.ajax({
                                    url: "deleteLendListByIds",
                                    type: "POST",
                                    data: { ids: ids, bookIds: bookIds },
                                    success: function (result) {
                                        if (result.code == 0) {//如果成功
                                            layer.msg('删除成功', {
                                                icon: 6,
                                                time: 500
                                            }, function () {
                                                parent.window.location.reload();
                                                var iframeIndex = parent.layer.getFrameIndex(window.name);
                                                parent.layer.close(iframeIndex);
                                            });
                                        } else {
                                            layer.msg("删除失败");
                                        }
                                    }
                                })
                            };

                            /**
                             * 提交还书功能
                             */
                            function backBooksByIds(ids, bookIds, index) {
                                //向后台发送请求
                                $.ajax({
                                    url: "backLendListByIds",
                                    type: "POST",
                                    data: { ids: ids, bookIds: bookIds },
                                    success: function (result) {
                                        if (result.code == 0) {//如果成功
                                            layer.msg('还书成功', {
                                                icon: 6,
                                                time: 500
                                            }, function () {
                                                parent.window.location.reload();
                                                var iframeIndex = parent.layer.getFrameIndex(window.name);
                                                parent.layer.close(iframeIndex);
                                            });
                                        } else {
                                            layer.msg("还书失败");
                                        }
                                    }
                                })
                            };
                            /**
                             * toolbar监听事件
                             */
                            table.on('toolbar(currentTableFilter)', function (obj) {
                                if (obj.event === 'add') {  // 监听添加操作
                                    var index = layer.open({
                                        title: '借书管理',
                                        type: 2,
                                        shade: 0.2,
                                        maxmin: true,
                                        shadeClose: true,
                                        area: ['100%', '100%'],
                                        content: '${pageContext.request.contextPath}/addLendList',
                                    });
                                    $(window).on("resize", function () {
                                        layer.full(index);
                                    });
                                } else if (obj.event === 'back') {//还书操作
                                    //获取选中的记录信息
                                    //获取选中的记录信息
                                    var checkStatus = table.checkStatus(obj.config.id);
                                    //debugger;
                                    var data = checkStatus.data;

                                    if (data.length == 0) {//如果没有选中信息
                                        layer.msg("请选择要借阅还书的记录信息");
                                    } else {
                                        //获取记录信息的id集合
                                        var ids = getCheackId(data);//借阅记录的id集合
                                        var bookIds = getCheackBookId(data);//图书的id集合
                                        layer.confirm('确定还书么', function (index) {
                                            //调用还书功能
                                            backBooksByIds(ids, bookIds, index);
                                            layer.close(index);
                                        });
                                    }
                                } else if (obj.event === 'delete') {
                                    /*
                                      1、提示内容，必须删除大于0条
                                      2、获取要删除记录的id信息
                                      3、提交删除功能 ajax
                                    */
                                    //获取选中的记录信息
                                    var checkStatus = table.checkStatus(obj.config.id);
                                    var data = checkStatus.data;
                                    if (data.length == 0) {//如果没有选中信息
                                        layer.msg("请选择要删除的记录信息");
                                    } else {
                                        //获取记录信息的id集合
                                        var ids = getCheackId(data);//借阅记录的id集合
                                        var bookIds = getCheackBookId(data);//图书的id集合
                                        layer.confirm('确定是否删除', function (index) {
                                            //调用删除功能
                                            deleteInfoByIds(ids, bookIds, index);
                                            layer.close(index);
                                        });
                                    }
                                }
                            });

                        });
                    </script>

                </body>

                </html>