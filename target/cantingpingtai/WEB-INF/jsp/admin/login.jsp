<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/WEB-INF/include/admin-head.jsp"%>
<body class="login-bg">
    
    <div class="login layui-anim layui-anim-up">
        <div class="message">后台登录</div>
        <div id="darkbannerwrap"></div>
        
        <form method="post" class="layui-form" action="/login">
            <input name="username" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input">


            <hr class="hr15">
            <select name="type" lay-verify="required">
                <option value="1">管理员</option>
                <option value="0">商户</option>
                <option value="2">员工</option>
            </select>
            <%--<hr class="hr15">--%>

            <%--<p style="text-align: right"><a href="/reg/user" style="color: #f51116;">注册</a><hr class="hr15"></p>--%>
            <%--<hr class="hr15">--%>
            <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
            <hr class="hr20" >

        </form>
    </div>

    <script>
        $(function  () {
            layui.use('form', function(){
              var form = layui.form;

              form.on('submit(login)', function(data){
                  form.submit();
                return false;
              });
            });
        })

        
    </script>


</body>
</html>