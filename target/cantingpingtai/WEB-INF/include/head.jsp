<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" %>
<c:if test="${user == null}">
    <section class="member-wrap" id="member-wrap">
        <div class="common-width posr">

            <div class="member-box fs12" login-box info="loginInfo">
                <a href="javascript:void(0)" ng-click="logoinDialogShow()">登录</a>
                <span>/</span>
                <a href="javascript:void(0)" ng-click="registerDialogShow()">注册</a>
            </div>

        </div>
    </section>
</c:if>

<c:if test="${user != null}">
    <header id="header">
        <div class="common-width clearfix">
            <h1 class="fl">
                <a href="/">韩盛</a>
            </h1>

            <ul class="member logging" ng-init="loginInfo=true">
                <li><a href="/" class="index">首页</a></li>
                <li class="userName">
                    <a href="#" rel="nofollow" draw-user>${user.realname}<em></em></a>
                </li>
                <li class=""><a href="/web/orders/list?uid=${user.id}" class="order-center" rel="nofollow">我的订单</a></li>
                <li class=""><a href="/web/logout" class="order-center" rel="nofollow">退出</a></li>
            </ul>

        </div>
    </header>
</c:if>