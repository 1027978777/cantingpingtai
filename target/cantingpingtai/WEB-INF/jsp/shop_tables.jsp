<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>

    <link rel="stylesheet" href="/static/web/css/common.css?v=2015-5-20"/>

    <link rel="stylesheet" href="/static/web/css/restaurant.css"/>
    <style>
        .mark {
            top: 0;
        }
    </style>


    <title>韩盛</title>
</head>

<body class="day " ng-controller="bodyCtrl" ng-controller="restaurantCtrl" day-or-night>

<section class="common-back" id="wrapBackground">



    <div id="main-box">


        <%@include file="/WEB-INF/include/head.jsp"%>

        <section class="common-width">
            <header class="header clearfix back-tan fs14">
                <div class="common-width">
                    <a href="javascript:;" class="fl landing-header">${model.name}</a>
                </div>
            </header>

            <div class="landing-banner">
                <img src="/static/web/images/xianyuxian.jpg"/>
            </div>

            <section class="restaurant-main common-width" lazy-img-load>
                <nav class="mark clearfix">

                    <ul ng-init="tabsAction2 = true">


                        <li ng-class="{cur:tabsAction2}" ng-click="tabsAction(2)">可预订</li>
                        <li ng-class="{cur:tabsAction3}" ng-click="tabsAction(3)">已使用</li>
                    </ul>
                </nav>


                <div class="restaurant-list pre-order" ng-class="{hide:!tabsAction2}">
                    <div class="mark fs16" style="display:none;">可预订</div>
                    <ul class="clearfix">

                        <c:forEach items="${tablesList}" var="table">
                            <c:if test="${table.state eq 0}">
                                <li class="restaurant-item fl">
                                    <div class="img-box fl">
                                        <a href="/web/business/detail?id=${model.id}&tid=${table.id}">
                                            <img src="/static/web/images/tables.png" width="82px" height="82px">
                                        </a>
                                    </div>
                                    <article class="restaurant-introduce fl">
                                        <h3 class="ellipsis"><a href="/">编号：${table.no}</a></h3>
                                        <dl class="clearfix">

                                            <dd class="">
                                                <div>
                                                    座位数：${table.num}
                                                </div>
                                            </dd>
                                        </dl>
                                        <dl class="clearfix">
                                            <p style="padding:  10px 0">可预订</p>
                                        </dl>
                                    </article>
                                </li>
                            </c:if>
                        </c:forEach>


                    </ul>

                </div>


                <div class="restaurant-list rest" ng-class="{hide:!tabsAction3}">
                    <div class="mark fs16" style="display:none;">已使用</div>
                    <ul class="clearfix">

                        <c:forEach items="${tablesList}" var="table">
                            <c:if test="${table.state eq 1}">
                                <li class="restaurant-item fl">
                                    <div class="img-box fl">
                                        <a href="javascript:;">
                                            <img src="/static/web/images/tables.png" width="82px" height="82px">
                                        </a>
                                    </div>
                                    <article class="restaurant-introduce fl">
                                        <h3 class="ellipsis"><a href="/">编号：${table.no}</a></h3>
                                        <dl class="clearfix">

                                            <dd class="">
                                                <div>
                                                    座位数：${table.num}
                                                </div>
                                            </dd>
                                        </dl>
                                        <dl class="clearfix">
                                            <p style="padding:  10px 0">已使用</p>
                                        </dl>
                                    </article>
                                </li>
                            </c:if>
                        </c:forEach>


                    </ul>
                </div>


            </section>
        </section>

    </div>
</section>
<%@include file="/WEB-INF/include/foot.jsp"%>
<%@include file="/WEB-INF/include/loginreg.jsp"%>

<script type="text/javascript" src="/static/web/js/angular.min.js"></script>
<script src="/static/web/js/common.js"></script>


<script src="/static/web/js/service.js"></script>

<script>var feedbackUrl = '/ajax/feedback/';
var app = angular.module("app", ["dh.dialog", "dh.form", 'dh.service', 'dh.other']);</script>
<!--[if lt IE 9]>
<script src="/static/web/js/fix.js"></script><![endif]-->


<script src="/static/web/js/landing.js"></script>


<script>angular.bootstrap(document, ["app"]);</script>




</body>
</html>
