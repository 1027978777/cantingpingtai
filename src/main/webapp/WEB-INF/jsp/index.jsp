<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1"/>
    <meta name="description" content="首页"/>
    <meta name="viewport" content="user-scalable=no">




    <link rel="stylesheet" href="/static/web/css/common.css?v=2015-5-20"/>

    <link rel="stylesheet" href="/static/web/css/frontPage.css"/>



    <title>首页</title>
</head>
<body class="day " ng-controller="bodyCtrl" day-or-night>
<section class="common-back" id="wrapBackground">

    <div id="main-box">

        <%@include file="/WEB-INF/include/head.jsp"%>

        <section class="common-width">

            <section class="search-box-wrap">
                <div class="search-box-inner">
                    <h2 class="search-title">
                        <strong class="fs24">输入餐厅名，地址，餐厅类型，</strong>
                        <strong class="fs20">查找附近餐厅</strong>
                    </h2>
                    <div class="search-box-left search-box-border">
                        <div class="search-box-right search-box-border" >
                            <form action="/web/business/search" method="post" id="form">
                            <div class="search-box search-box-border">
                                <div class="clearfix">
                                    <div class="search-input-box">
                                        <div class="search-input-inner">
                                            <input type="text" ng-model="keyword" autocomplete placeholder="查找餐厅？"
                                                   class="search-input" ng-initial value="${key}" name="name" id="key"/>
                                        </div>
                                    </div>
                                    <button class="btn btn-success fs18 fl"
                                            ng-disabled="searchBtnDisabled" ng-bind="searchBtnName" onclick="search()">查找餐厅
                                    </button>

                                </div>
                                <%--<div class="hot-area clearfix fs12">--%>

                                    <%--<h3 class="fl">热门区域:</h3>--%>
                                    <%--<ul class="fl clearfix">--%>

                                        <%--<li><a href="shop_list.html">某某某</a></li>--%>

                                        <%--<li><a href="shop_list.html">某某某</a></li>--%>

                                        <%--<li><a href="shop_list.html">某某某</a></li>--%>

                                        <%--<li><a href="shop_list.html">某某某</a></li>--%>

                                        <%--<li><a href="shop_list.html">某某某</a></li>--%>

                                    <%--</ul>--%>

                                <%--</div>--%>
                            <%--</div>--%>

                            </form>

                        </div>
                    </div>
                </div>

            </section>

        </section>

        <section class="brand-restaurant-box ">
            <div class="ceiling-img brand-restaurant-img"></div>
            <div class="brand-restaurant common-width">

                <span class="qr_code trans disnone"></span>
                <div class="clearfix brand-restaurant-body">
                    <div class="brand-restaurant-log fl"></div>
                    <div class="restaurant-list fl">
                        <ul class="clearfix">

                        <c:forEach items="${list}" var="business">
                            <li>
                                <a href="/web/business/tables?id=${business.id}" target="_blank">
                                    <img src="${business.image}" alt="${business.name}">
                                </a>
                                <a href="/web/business/tables?id=${business.id}" target="_blank" class="restaurant-name fs14">${business.name}</a>
                            </li>
                        </c:forEach>


                    </ul>
                    </div>
                </div>
                <div class="brand-restaurant-border"></div>
            </div>
        </section>

    </div>
</section>

<%@include file="/WEB-INF/include/foot.jsp"%>


<%@include file="/WEB-INF/include/loginreg.jsp"%>
<%--<dh-dialog class="disnone" height="500" type="merchants" header="商户入驻申请" show="merchantsShow">--%>
    <%--<div class="inline" ng-controller="merchantCtrl">--%>
        <%--<div class="form-group row mb10">--%>
            <%--<label class="col-3">商户名称：</label>--%>
            <%--<div class="col-8">--%>
                <%--<input type="text" ng-class="{error:merchants.nameMessage}" maxlength="11" placeholder="输入店铺的名称，例：美美小厨"--%>
                       <%--ng-model="merchants.name"/>--%>
            <%--</div>--%>
            <%--<span class="vaildate-error col-8 col-offset-3" ng-if="merchants.nameMessage">--%>
                    <%--<span ng-bind="merchants.nameMessage"></span>--%>
                <%--</span>--%>
        <%--</div>--%>
        <%--<div class="form-group row mb10">--%>
            <%--<label class="col-3">所属城市：</label>--%>
            <%--<div class="col-8">--%>
                <%--<select model="city" area-model="area" ng-class="{error:merchants.cityMessage}"--%>
                        <%--class="city-change"></select>--%>
            <%--</div>--%>
            <%--<span class="vaildate-error col-8 col-offset-3" ng-if="merchants.cityMessage">--%>
                    <%--<span ng-bind="merchants.cityMessage"></span>--%>
                <%--</span>--%>
        <%--</div>--%>
        <%--<div class="form-group row mb10">--%>
            <%--<label class="col-3">行政分区：</label>--%>
            <%--<span class="col-8">--%>
                    <%--<select id="areaSelect"></select>--%>
                <%--</span>--%>
        <%--</div>--%>
        <%--<div class="form-group row mb10">--%>
            <%--<label class="col-3">店主姓名：</label>--%>
            <%--<div class="col-8">--%>
                <%--<input type="text" ng-class="{error:merchants.usernameMessage}" placeholder="请输入联系人姓名"--%>
                       <%--ng-model="merchants.username"/>--%>
            <%--</div>--%>
            <%--<span class="vaildate-error col-8 col-offset-3" ng-if="merchants.usernameMessage">--%>
                    <%--<span ng-bind="merchants.usernameMessage"></span>--%>
                <%--</span>--%>
        <%--</div>--%>
        <%--<div class="form-group row mb20">--%>
            <%--<label class="col-3">联系电话：</label>--%>
            <%--<div class="col-8">--%>
                <%--<input type="text" ng-class="{error:merchants.phoneMessage}" maxlength="11" placeholder="建议输入11位手机号码"--%>
                       <%--ng-model="merchants.phone"/>--%>
            <%--</div>--%>
            <%--<span class="vaildate-error col-8 col-offset-3" ng-if="merchants.phoneMessage">--%>
                    <%--<span ng-bind="merchants.phoneMessage"></span>--%>
                <%--</span>--%>
        <%--</div>--%>
        <%--<div class="form-group row agreement mb20">--%>
            <%--<input type="checkbox" ng-model="merchants.checkbox" id="male"/><label for="male">我同意韩盛</label><a--%>
                <%--href="/agreement" target="_blank">"餐厅入驻协议"</a>--%>
        <%--</div>--%>
        <%--<div class="tc merchants-btn">--%>
            <%--<button class="btn normal-btn btn-success" ng-click="merchantSubmit()" ng-disabled="!merchants.checkbox">--%>
                <%--确认--%>
            <%--</button>--%>
            <%--<button class="btn normal-btn btn-cancel" ng-click="merchantCancel()">取消</button>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</dh-dialog>--%>

<%--<dh-dialog class="disnone" type="alert" index="1001" header="" show="requestSuccess">--%>
    <%--<div class="alert-box fs14">--%>
        <%--<p>您的入驻申请已经提交成功！<br>请保持手机畅通，超人客服将尽快<br>联系您~</p>--%>
    <%--</div>--%>
<%--</dh-dialog>--%>
<%--<dh-dialog class="disnone" type="alert" index="1001" header="" show="requestError">--%>
    <%--<div class="alert-box error fs14">--%>
        <%--<p>抱歉由于系统原因，暂时无法提交。<br>请稍后重试。</p>--%>
    <%--</div>--%>
<%--</dh-dialog>--%>


<%--<ul class="site-fixed">--%>
    <%--<li class="scroll-top"><img src="/static/web/images/scroll_top1.png" alt=""/></li>--%>
    <%--<li class="scorll-feekback" ng-click="userFeedback=true">--%>
        <%--<img src="/static/web/images/scorll_feekback.png" alt=""/>--%>
        <%--<div>意见反馈</div>--%>
    <%--</li>--%>
    <%--<li class="scroll-wx">--%>
        <%--<img src="/static/web/images/scroll_wx.png" alt=""/>--%>
        <%--<div><img src="/static/web/images/wx.png" alt=""/></div>--%>
    <%--</li>--%>
<%--</ul>--%>
<script src="/static/web/js/jquery-1.8.1.js"></script>
<script type="text/javascript" src="/static/web/js/angular.min.js"></script>
<script src="/static/web/js/common.js"></script>


<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=5cd6dcb00bc675bf26c9b4ab2af0759a"></script>
<script src="/static/web/js/service.js"></script>

<script>var feedbackUrl = '/ajax/feedback/';
var app = angular.module("app", ["dh.dialog", "dh.form", 'dh.service', 'dh.other']);</script>
<!--[if lt IE 9]>
<script src="/static/web/js/fix.js"></script><![endif]-->


<script>var manually_locations = '';</script>
<script src="/static/web/js/frontPage.js"></script>


<script>angular.bootstrap(document, ["app"]);</script>

<script>
    function search() {
       var key = document.getElementById("key").value;
       document.getElementById("form").submit();
    }
</script>
</body>
</html>
