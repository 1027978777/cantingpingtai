<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%--<%@ page contentType="text/html; charset=utf-8" %>--%>
<%--<%@ taglib prefix="tld" uri="/WEB-INF/tld/rei.tld" %>--%>
<%--<%@include file="/WEB-INF/include/head.jsp" %>--%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@include file="/WEB-INF/include/admin-head.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tld" uri="/WEB-INF/tld/rei.tld" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>

    <script type="text/javascript">

        (function (document, screen) {
            if (screen.width < 760) {
                document.location.href = "/mobile/";
            }
        }(document, screen));
    </script>

    <link rel="stylesheet" href="/static/web/css/common.css?v=2015-5-20"/>

    <link rel="stylesheet" href="/static/web/css/menuPage.css"/>

    <!--[if lte IE 7]>
    <script>window.onload = function () {
        location.href = "/ie6warning/"
    }</script><![endif]-->
    <!--[if lt IE 9]>
    <script src="/static/web/js/respond.js"></script>
    <script>
        var e = "abbr, article, aside, audio, canvas, datalist, details, dialog, eventsource, figure, footer, header, hgroup, mark, menu, meter, nav, output, progress, section, time, video, dh-dialog, dh-checkbox".split(', ');
        var i = e.length;
        while (i--) {
            document.createElement(e[i])
        }
    </script>
    <![endif]-->
    <title>店铺评论</title>
</head>
<body class="day " ng-controller="bodyCtrl" day-or-night>
<section class="common-back" id="wrapBackground">

    <header id="header">
        <div class="common-width clearfix">
            <h1 class="fl">
                <a href="/">韩盛</a>
            </h1>


        </div>
    </header>

    <div id="main-box">


        <section class="menupage-main common-width">

            <header class="nav clearfix">
                <div class="fl clearfix nav-des">
                    <div class="fl nav-des-text">
                        <h2 class="ellipsis" title="">${model.name}</h2>
                        <%--<div class="clearfix">--%>
                            <%--<div class="fl nav-review">--%>
                                <%--<div style="width:65.00px;"></div>--%>
                            <%--</div>--%>
                            <%--<p class="nav-review-x">5星</p>--%>
                        <%--</div>--%>
                    </div>
                </div>

            </header>

            <ul class="clearfix menu-nav-list" scroll-position-static="160">
                <li class="active">评论</li>

            </ul>
            <section class="main-box">
                <section class="review-messages">
                    <header class="review-header-box clearfix">
                        全部评论（共${count}条评论）

                    </header>


                  <c:forEach items="${list}" var="evaluate">
                      <article class="review-item">

                          <span>${evaluate.uname}</span>
                          <span><fmt:formatDate value="${evaluate.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/> </span>
                          <%--<span class="small-star">--%>
                                    <%--<span style="width:65.00px;"></span>--%>
                                <%--</span>--%>
                          <div class="review-content">
                              ${evaluate.content}
                          </div>
                          <span>${tld:getProductName(evaluate.bid).name}</span>
                          <div class="review-content">
                                  ${evaluate.reply}
                          </div>

                      </article>

                  </c:forEach>

                  <%--  <page total="18" show="5"></page>--%>

                </section>
            </section>
        </section>

    </div>
</section>


<footer id="footer">
    <div class="footer-first gray">
        <div class="company-info clearfix fs14 gray">
            <a href="about.html" target="_blank" rel="nofollow">关于我们</a>
            <a href="help.html" target="_blank" rel="nofollow">帮助中心</a>
            <a href="javascript:;" target="_blank" rel="nofollow">法律声明</a>
            <a href="jobs.html" target="_blank" rel="nofollow">人才招聘</a>
            <a href="contact.html" target="_blank" rel="nofollow">联系我们</a>
            <a href="javascript:;" user-feedback ng-click="userFeedback=true" class="last" rel="nofollow">意见反馈</a>

        </div>
    </div>
    <div class="footer-last">
        <a target="_blank" class="foot-logo-1 base-logo" ></a>
        <div class="tc fs14 light-gray mb10">
        </div>
    </div>
</footer>
</body>
</html>
