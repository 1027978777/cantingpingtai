<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/include/admin-head.jsp" %>

<body>
<div class="x-body">
    <form class="layui-form" method="post">

        <input type="hidden" name="id" value="${model.id}"/>

        <div class="layui-form-item">
            <label for="name" class="layui-form-label">

            </label>
            <div class="layui-input-block" style="text-align: center">
                <img src="${model.image}" style="width: 180px" name="image" />
            </div>
        </div>
               <input name="image" value="${model.image}" type="hidden" lay-verify="required"/>
                  <div class="layui-form-item text-center">
                    <div style="margin:0 auto;width: 140px;">
                        <button type="button" class="layui-btn" id="image" name="file">
                            <i class="layui-icon">&#xe67c;</i>上传图片
                        </button>
                    </div>
                  </div>                        
            
             
  	          <div class="layui-form-item">
                    <label for="name" class="layui-form-label">
                        <span class="x-red">*</span>商家名
                    </label>
                    <div class="layui-input-block">
                        <input type=" text " id="name" name="name" 
                        required="" lay-verify="required" value="${model.name}"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
               
            
             
  	          <div class="layui-form-item">
                    <label for="address" class="layui-form-label">
                        <span class="x-red">*</span>地址
                    </label>
                    <div class="layui-input-block">
                        <input type=" text " id="address" name="address" 
                        required="" lay-verify="required" value="${model.address}"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
               
            
             
  	          <div class="layui-form-item">
                    <label for="tel" class="layui-form-label">
                        <span class="x-red">*</span>电话
                    </label>
                    <div class="layui-input-block">
                        <input type=" text " id="tel" name="tel" 
                        required="" lay-verify="required" value="${model.tel}"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
               
            
             
  	          <div class="layui-form-item">
                    <label for="opentime" class="layui-form-label">
                        <span class="x-red">*</span>营业时间
                    </label>
                    <div class="layui-input-block">
                        <input type=" text " id="opentime" name="opentime" 
                        required="" lay-verify="required" value="${model.opentime}"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
               
            
             
  	          <div class="layui-form-item">
                    <label for="shopType" class="layui-form-label">
                        <span class="x-red">*</span>店铺类型
                    </label>
                    <div class="layui-input-block">
                        <input type=" text " id="shopType" name="shopType" 
                        required="" lay-verify="required" value="${model.shopType}"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
               
            
             
  	          <div class="layui-form-item">
                    <label for="username" class="layui-form-label">
                        <span class="x-red">*</span>登陆账号
                    </label>
                    <div class="layui-input-block">
                        <input type=" text " id="username" name="username" 
                        required="" lay-verify="required" value="${model.username}"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
               
            
             
  	          <div class="layui-form-item">
                    <label for="password" class="layui-form-label">
                        <span class="x-red">*</span>登陆密码
                    </label>
                    <div class="layui-input-block">
                        <input type=" text " id="password" name="password" 
                        required="" lay-verify="required" value="${model.password}"
                               autocomplete="off" class="layui-input">
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
            $.post("/admin/business/save", data.field, function (result) {
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
        
        
    
            
    
            
    
            
    
            
    
            
    
            
    
            
    
            
    
            
    
            
        
        
       
        //自定义格式
       
    })


 
   
</script>

</body>

</html>