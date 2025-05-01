                    type: "post",
                    data: data.field,
                    success: function (data) {
                        // //提示信息
                        // layer.msg(data.msg, {icon: 1});
                        // //获取窗口索引
                        // var index = parent.layer.getFrameIndex(window.name);
                        // //关闭窗口
                        // parent.layer.close(index);
                        // //重载表格 （父窗口）
                        // parent.location.reload();

                        // alert(JSON.stringify(data)); // Remove this test alert
                        if(data.code == 0){
                           layer.msg("感谢您的反馈!", {icon: 1, time: 1500}, function(){
                               // Optionally close the window or redirect
                               // var index = parent.layer.getFrameIndex(window.name);
                               // parent.layer.close(index);
                           });
                        } else {
                           layer.msg(data.msg || "提交失败!", {icon: 5});
                        }

                    }
                });
                return false;
            });

        });
    </script>

</body>
</html> 