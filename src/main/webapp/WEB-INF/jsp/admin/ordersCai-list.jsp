<%@ page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/include/admin-head.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body class="layui-anim layui-anim-up">

    <div class="x-body">

   <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <%--<button class="layui-btn" onclick="x_admin_show('添加','/admin/ordersCai/add?no=${model.no}')"><i class="layui-icon"></i>添加</button>--%>
  
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
             <th>编号</th>
             <th>菜品编号</th>
             <th>图片</th>
             <th>菜名</th>
             <th>数量</th>
             <th>状态</th>
            <th>操作</th></tr>
        </thead>
        <tbody>

          <c:forEach items="${list}" var="model">  
          
         <tr>
                <td>
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='${model.id}'><i class="layui-icon">&#xe605;</i></div>
              </td>
    
            <td>
                 ${model.id}
            </td>
    
            <td>
                 ${model.cid}
            </td>
    
            <td>
                <img src="${model.image}">
            </td>
    
            <td>
                 ${model.cname}
            </td>
    
            <td>
                 ${model.num}
            </td>
    



             <c:if test="${model.state eq 0}"><td style="color: red">未开始</td></c:if>
             <c:if test="${model.state eq 1}"><td style="color:orange;">烹饪中</td></c:if>
             <c:if test="${model.state eq 2}"><td style="color:green;">已完成</td></c:if>

           <td class="td-manage">

        
                 <button class="layui-btn layui-btn layui-btn-xs layui-bg-orange"
                        onclick="x_admin_show('编辑','/admin/ordersCai/edit?id=${model.id}')"><i
                         class="layui-icon">&#x1005;</i>修改
                 </button>
             
             
                  <button class="layui-btn layui-btn layui-btn-xs layui-bg-green"
                          onclick="member_del(this,'${model.id}')"><i
                          class="layui-icon">&#x1005;</i>删除
                  </button>
             

    
              </td>
           </tr>
          </c:forEach>

        </tbody>
      </table>


    </div>
    <script>
      layui.use('laydate', function(){
        var laydate = layui.laydate;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
      });


   
      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？删除后无法恢复',function(index){
              //发异步删除数据
              $.post("/admin/ordersCai/delete",{id:id},function(result){
                  if (result.code == 200){
                      $(obj).parents("tr").remove();
                      layer.msg('已删除!',{icon:1,time:1000});
                  } else {
                      $(obj).parents("tr").remove();
                      layer.msg('删除失败!',{icon:2,time:1000});
                  }
              })

          });
      }
        function delAll (argument) {

        var data = tableCheck.getData();
        data = data.toString();
        layer.confirm('确认要删除吗？',function(index){
            //捉到所有被选中的，发异步进行删除
             var ids = data.split(",")
            for (i =0;i<ids.length; i++){
                 $.post("/admin/ordersCai/delete",{id:ids[i]},function(result){
                  
              })

             }
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
      }

    </script>

  </body>

</html>