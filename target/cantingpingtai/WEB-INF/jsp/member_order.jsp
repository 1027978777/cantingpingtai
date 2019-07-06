<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tld" uri="/WEB-INF/tld/rei.tld" %>
<!DOCTYPE html>

<html>
<head>

    <link rel="stylesheet" href="/static/web/css/common.css?v=2015-5-20"/>

    <link rel="stylesheet" href="/static/web/css/user_center.css"/>
    <link rel="stylesheet" href="//res.layui.com/layui/dist/css/layui.css"  media="all">

    <title>个人中心 - 订单管理</title>
</head>
<body class="day " ng-controller="bodyCtrl" day-or-night>
<section class="common-back" id="wrapBackground">

    <%@include file="/WEB-INF/include/head.jsp" %>


    <section>
        <div class="user-center-main-box common-width clearfix">
            <aside class="fl">
                <ul>
                    <li>
                        <a href="#" rel="nofollow">订单管理</a>
                    </li>
                    <li class="active">
                        <a href="#" rel="nofollow">我的订单</a>
                    </li>
                    <%--<li class="">--%>
                        <%--<a href="#" rel="nofollow">我的订单</a>--%>
                    <%--</li>--%>
                    <%--<li class="">--%>
                        <%--<a href="#" rel="nofollow">我的订单</a>--%>
                    <%--</li>--%>
                    <%--<li class="">--%>
                        <%--<a href="#" rel="nofollow">我的订单</a>--%>
                    <%--</li>--%>
                </ul>
            </aside>
            <article class="fl user-center-main">
                <header>历史订单</header>

                <section class="user-center-body order" id="orderBody" style="margin-bottom: 150px">

                   <c:forEach items="${list}" var="orders" varStatus="index">
                       <div class="order-list ">
                           <div class="order-hd">
                               <span><i>订单编号：</i>${orders.no}</span><i>创建时间：</i><fmt:formatDate value="${orders.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                               &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                               <i>预定就餐时间：</i></i><fmt:formatDate value="${orders.time}" pattern="yyyy-MM-dd HH:mm:ss"/>
                           </div>
                           <div class="order-bd clearfix">
                               <div class="fl restaurant-msg">
                                   <div>
                                       <img src="${tld:getProductName(orders.bid).image}" alt="" width="43"
                                            height="43" class="fl"/>
                                       <i class="fl">${tld:getProductName(orders.bid).name}</i>
                                   </div>
                                   <p class="clearfix">
                                       <i class="fl"></i>
                                       <span class="fl">餐厅电话：${tld:getProductName(orders.bid).tel}</span>
                                   </p>
                               </div>
                               <div class="fl order-type padding-margin">
                                   <p>订单类型：餐到付款</p>
                                   <%--<p>订单状态：等待确认</p>--%>
                               </div>
                               <div class="fl order-total padding-margin">
                                   <p>订单金额</p>
                                   <p><i>￥${orders.total}</i></p>
                               </div>
                               <div class="order-operate fl padding-margin " style="text-align: left">
                                   <p>
                                       备注：
                                       <br/>
                                       <br/>
                                       <span>${orders.remark}</span>
                                   </p>
                               </div>

                           </div>

                               <c:if test="${orders.evaluate == null}">
                                   <div>
                                   <button style="background: #00a000;border-radius: 3px;color: white;padding: 8px 15px;margin: 10px;cursor: pointer" onclick="showPingjia(${index.index})">我要评价订单</button>
                                   </div>
                           <div>
                               <button style="background: #00a000;border-radius: 3px;color: white;padding: 8px 15px;margin: 10px;cursor: pointer"  onclick="member_del(${orders.id});location.reload()">取消订单</button>

                           </div>
                               </c:if>

                               <c:if test="${orders.evaluate != null}">

                           <div class="order-hd" style="height: 80px;background: rgba(113,212,216,0.42)">
                                  评论时间： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${orders.evaluate.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                   <br/>
                               评论内容： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 15px;color: #de6cff">${orders.evaluate.content}</span>
                           </div>
                               </c:if>

                           <div hidden id="div_${index.index}">
                             <form action="/web/evaluate/save" method="post">
                                 <input type="hidden" name="uid" value="${user.id}"/>
                                 <input type="hidden" name="uname" value="${user.realname}"/>
                                 <input type="hidden" name="oid" value="${orders.id}"/>
                                 <input type="hidden" name="bid" value="${orders.bid}"/>
                                 <textarea style="width: 90%;margin-top: 10px" name="content"></textarea>
                                 <br/>
                                 <button style="margin: 10px" type="submit">评价</button>
                             </form>
                           </div>

                       </div>
                   </c:forEach>

                </section>


            </article>
        </div>
    </section>

    </div>
</section>

<%@include file="/WEB-INF/include/foot.jsp" %>
<%@include file="/WEB-INF/include/loginreg.jsp" %>

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

<script type="text/javascript">
    var token = 'u8wA1RHnkO8OfIWaX5Uxg3u5Og9X718nFVOQTFXg:WsqxKsgpRoNjeOqH4m8Uo80w3TM=:eyJtaW1lTGltaXQiOiJpbWFnZS9qcGVnO2ltYWdlL3BuZyIsInNjb3BlIjoiZGhjLXJlZnVuZCIsImRlYWRsaW5lIjoxNDMwNjIwMDM3LCJmc2l6ZUxpbWl0Ijo1MjQyODgwfQ==';
    var orderRefund = "/account/order/0/refund/create/";
    var static = "/static/";
</script>
<script src="/static/web/js/jquery-1.8.1.js"></script>
<script src="/static/web/js/jquery.uploadify.min.js"></script>

<script type="text/javascript" src="/static/web/js/angular.min.js"></script>
<script src="/static/web/js/common.js"></script>


<script src="/static/web/js/service.js"></script>

<script>var feedbackUrl = '/ajax/feedback/';
var app = angular.module("app", ["dh.dialog", "dh.form", 'dh.service', 'dh.other']);</script>
<!--[if lt IE 9]>
<script src="/static/web/js/fix.js"></script><![endif]-->


<script>
    var reviewUrl = "/mobile/ajax/order_review/", favoriteUrl = "/ajax/restaurant/0/favorite/";

    function showPingjia(id) {
        $("#div_" + id).show();
    }
</script>
<script src="/static/web/js/user_center.js"></script>


<script>angular.bootstrap(document, ["app"]);</script>
<
<script>
    function member_del(id){

            $.post("/web/orders/delete",{id:id});


    }
</script>>

<!-- Baidu Analytics -->

</body>
</html>
