<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/include/admin-head.jsp" %>

<body>
<div class="x-body">
    <form class="layui-form" method="post">

                         
                    <input name="id" value="${model.id}" type="hidden" />
                
            
             
  	          <div class="layui-form-item">
                    <label for="uid" class="layui-form-label">
                        <span class="x-red">*</span>评价人编号
                    </label>
                    <div class="layui-input-block">
                        <input type="number" id="uid" name="uid" disabled="true"
                        required="" lay-verify="required" value="${model.uid}"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
               
            
             
  	          <div class="layui-form-item">
                    <label for="uname" class="layui-form-label">
                        <span class="x-red">*</span>姓名
                    </label>
                    <div class="layui-input-block">
                        <input type=" text " id="uname" name="uname"  disabled="true"
                        required="" lay-verify="required" value="${model.uname}"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
               
            
             
  	          <div class="layui-form-item">
                    <label for="content" class="layui-form-label">
                        <span class="x-red">*</span>评价内容
                    </label>
                    <div class="layui-input-block">
                        <input type=" text " id="content" name="content" disabled="true"
                        required="" lay-verify="required" value="${model.content}"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
               
            
             
  	          <div class="layui-form-item">
                    <label for="reply" class="layui-form-label">
                        <span class="x-red">*</span>回复
                    </label>
                    <div class="layui-input-block">
                        <input type=" text " id="reply" name="reply" 
                        required="" lay-verify="required" value="${model.reply}"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
               
            
             
  	          <div class="layui-form-item">
                    <label for="oid" class="layui-form-label">
                        <span class="x-red">*</span>订单id
                    </label>
                    <div class="layui-input-block">
                        <input type="number" id="oid" name="oid" disabled="true"
                        required="" lay-verify="required" value="${model.oid}"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
               
            
             
  	          <div class="layui-form-item">
                    <label for="bid" class="layui-form-label">
                        <span class="x-red">*</span>商家id
                    </label>
                    <div class="layui-input-block">
                        <input type="number" id="bid" name="bid" disabled="true"
                        required="" lay-verify="required" value="${model.bid}"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
               
            
             
                 <div class="layui-form-item">
                <label for="time" class="layui-form-label">
                    <span class="x-red">*</span>评价时间
                </label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" disabled="true" id="time7" value="<fmt:formatDate value="${model.createtime}" pattern="yyyy-MM-dd HH:mm:ss" />" name="createtime"  placeholder="yyyy-MM-dd HH:mm:ss">
                </div>
            </div>
            

        

             <div class="layui-form-item">
            <label for="submit" class="layui-form-label">
            </label>
            <button class="layui-btn" lay-filter="add" lay-submit="" id="submit">
                保存
            </button>
        </div>
    </form>
</div>
<script>
    layui.use(['form', 'layer'], function () {
        $ = layui.jquery;
        var form = layui.form
            , layer = layui.layer;

        //自定义验证规则
        form.verify({
            nikename: function (value) {
                if (value.length < 5) {
                    return '昵称至少得5个字符啊';
                }
            }
            , pass: [/(.+){6,12}$/, '密码必须6到12位']
            , repass: function (value) {
                if ($('#L_pass').val() != $('#L_repass').val()) {
                    return '两次密码不一致';
                }
            }
        });

        //监听提交
        form.on('submit(add)', function (data) {
            console.log(data);
            //发异步，把数据提交给php
            $.post("/admin/evaluate/save", data.field, function (result) {
                if (result.code == 200) {
                    layer.alert("成功", {icon: 6}, function () {
                        // 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
                        window.parent.location.reload();//刷新父页面
                    });
                } else {
                    layer.alert("失败", {icon: 5});
                }
            })
            return false;

        });


    });
    //上传
    layui.use('upload', function () {
        var upload = layui.upload;
        //执行实例
        var uploadInst = upload.render({
            elem: '#image' //绑定元素
             ,accept: 'file'
            , url: '/upload' //上传接口
            , done: function (res) {
                //上传完毕回调
                $("img[name=image]").attr("src", res.data);
                $("input[name=image]").val(res.data);
            }
            , error: function () {
                //请求异常回调
                layer.alert("上传失败", {icon: 5});
            }
        });
    });
    
    
    layui.use('laydate', function() {
        var laydate = layui.laydate;
        
        
    
            
    
            
    
            
    
            
    
            
    
            
    
            
    
                laydate.render({
                    elem: '#time7'
                    , type: 'datetime'
                 });
            
        
        
       
        //自定义格式
       
    })


 
   
</script>

</body>

</html>