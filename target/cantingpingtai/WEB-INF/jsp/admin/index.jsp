<%@ page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/include/admin-head.jsp" %>
<body>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo"><a href="/layui/index.jsp">韩盛</a></div>
    <div class="left_open">
        <i title="展开左侧栏" class="iconfont">&#xe699;</i>
    </div>

    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">

                ${sessionScope.user.name}
                    ${sessionScope.staff.name}


            </a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a href="/logout">退出</a></dd>
            </dl>
        </li>
    </ul>

</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">


            <c:choose>
                <c:when test="${user != null}">
                    <c:if test="${user.type eq 1}">
                        <li>
                            <a href="javascript:;">
                                <i class="iconfont">&#xe6cb;</i>
                                <cite>用户管理</cite>
                                <i class="iconfont nav_right">&#xe697;</i>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a _href="/admin/user/list">
                                        <i class="iconfont">&#xe6a7;</i>
                                        <cite>会员列表</cite>
                                    </a>
                                </li>

                                <li>
                                    <a _href="/admin/business/list?type=0">
                                        <i class="iconfont">&#xe6a7;</i>
                                        <cite>商家列表</cite>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li>
                            <a href="javascript:;">
                                <i class="iconfont">&#xe6cb;</i>
                                <cite>订单管理</cite>
                                <i class="iconfont nav_right">&#xe697;</i>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a _href="/admin/orders/list1">
                                        <i class="iconfont">&#xe6a7;</i>
                                        <cite>所有餐厅订单</cite>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li>
                            <a href="javascript:;">
                                <i class="iconfont">&#xe6cb;</i>
                                <cite>评论管理</cite>
                                <i class="iconfont nav_right">&#xe697;</i>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a _href="/admin/evaluate/list1">
                                        <i class="iconfont">&#xe6a7;</i>
                                        <cite>所有评价</cite>
                                    </a>
                                </li>
                            </ul>
                        </li>


                    </c:if>
                    <c:if test="${user.type eq 0}">
                        <li>
                            <a href="javascript:;">
                                <i class="iconfont">&#xe6cb;</i>
                                <cite>订单管理</cite>
                                <i class="iconfont nav_right">&#xe697;</i>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a _href="/admin/orders/list?bid=${sessionScope.user.id}">
                                        <i class="iconfont">&#xe6a7;</i>
                                        <cite>订单列表</cite>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <i class="iconfont">&#xe6cb;</i>
                                <cite>员工管理</cite>
                                <i class="iconfont nav_right">&#xe697;</i>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a _href="/admin/staff/list?bid=${sessionScope.user.id}">
                                        <i class="iconfont">&#xe6a7;</i>
                                        <cite>员工列表</cite>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <i class="iconfont">&#xe6cb;</i>
                                <cite>菜品管理</cite>
                                <i class="iconfont nav_right">&#xe697;</i>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a _href="/admin/cai/list?bid=${user.id}">
                                        <i class="iconfont">&#xe6a7;</i>
                                        <cite>菜品列表</cite>
                                    </a>
                                </li>

                            </ul>
                        </li>

                        <li>
                            <a href="javascript:;">
                                <i class="iconfont">&#xe6cb;</i>
                                <cite>餐桌管理</cite>
                                <i class="iconfont nav_right">&#xe697;</i>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a _href="/admin/tables/list?bid=${user.id}">
                                        <i class="iconfont">&#xe6a7;</i>
                                        <cite>餐桌列表</cite>
                                    </a>
                                </li>

                            </ul>
                        </li>

                        <li>
                            <a href="javascript:;">
                                <i class="iconfont">&#xe6cb;</i>
                                <cite>评价管理</cite>
                                <i class="iconfont nav_right">&#xe697;</i>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a _href="/admin/evaluate/list?bid=${user.id}">
                                        <i class="iconfont">&#xe6a7;</i>
                                        <cite>评价列表</cite>
                                    </a>
                                </li>

                            </ul>
                        </li>

                    </c:if>
                </c:when>
                <c:otherwise>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont">&#xe6cb;</i>
                            <cite>订单管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a _href="/admin/orders/list2?bid=${sessionScope.staff.bid}">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>订单列表</cite>
                                </a>
                            </li>
                        </ul>
                    </li>
                </c:otherwise>
            </c:choose>



        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='/welcome' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
        </div>
    </div>
</div>
<div class="page-content-bg"></div>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<!-- 底部开始 -->
<div class="footer">
    <div class="copyright">Copyright ©2017 x-admin v2.3 All Rights Reserved</div>
</div>
<!-- 底部结束 -->

</body>
</html>