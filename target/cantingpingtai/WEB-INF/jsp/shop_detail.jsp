<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>


    <link rel="stylesheet" href="/static/web/css/common.css?v=2015-5-20"/>

    <link rel="stylesheet" href="/static/web/css/menuPage.css?v=2015-5-20"/>
    <link rel="stylesheet" href="/static/layui/lib/layui/css/layui.css" media="all">

    <title>店铺商品</title>
</head>
<body class="day " ng-controller="bodyCtrl" day-or-night>
<section class="common-back" id="wrapBackground">


    <div id="main-box">

        <%@include file="/WEB-INF/include/head.jsp" %>
        <div ng-controller="colorAction">
            <div class="dayColor_two"></div>
            <div class="dayColor_one"></div>
            <div class="dayColor_three" ng-class="{dayColor_threeActive:threeActive}"></div>
        </div>


        <section class="menupage-main common-width">

            <header class="nav clearfix">
                <div class="fl clearfix nav-des">
                    <img src="${model.image}" class="fl"/>
                    <div class="fl nav-des-text">
                        <h3 class="ellipsis">${model.name}</h3>
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
                <%--<li class="no-line "><a href="#">餐厅介绍</a></li>--%>
                <li class="active"><a href="#">菜单</a></li>
                <li><a href="/web/evaluate/list?bid=${model.id}">评论</a></li>

            </ul>

            <section class="main-box clearfix" lazy-img-load>
                <div class="main fl">
                    <div class="inner-main">

                        <nav class="list-order-nav clearfix" id="list-order-nav">
                            <ul class="fl">
                                <li>菜单排序：</li>
                                <li><a href="javascript:void(0);" class="sort-default active">默认排序</a></li>
                                <li class="split-line">|</li>
                                <%--<li><a href="javascript:void(0);" class="sort-sale descend">销量<i class="order-icon"></i></a>--%>
                                <%--</li>--%>
                                <li class="split-line">|</li>
                                <li><a href="javascript:void(0);" class="sort-price">价格</a>
                                </li>
                                <li class="split-line">|</li>
                            </ul>
                        </nav>
                        <div id="menu-main" class="menu-main">

                            <article class="collapse section-39215">
                                <header >
                                    <h3 class="ellipsis">店主推荐 </h3>
                                    <%--<span ng-if="sectionCount['39215']" ng-class="{disinbl:sectionCount['39215']}"--%>
                                          <%--class="badge disnone" ng-bind="sectionCount['39215']"></span>--%>
                                    <%--<i class="icon shrink-icon position"></i>--%>
                                </header>
                                <section>

                                    <ul class="clearfix menu-group menu-group-img menu-first-load">


                                        <c:forEach items="${caiList}" var="cai">
                                            <li title="${cai.name}" class="menu-item hasImg"
                                                accessorykey="${model.id}-${cai.id}"
                                                data-sale="99" data-price="${cai.price}">
                                                <div class="menu-item-img">
                                                    <img data-src="${cai.image}"
                                                         src="${cai.image}" width="202" height="202"/>
                                                </div>
                                                <div class="meun-item-name"><span class="ellipsis">${cai.name}</span>
                                                </div>
                                                <p class="ellipsis meun-item-des"></p>
                                                <div class="meun-item-sale clearfix">
                                                    <span class="last"></span>
                                                    <span class="price">￥${cai.price}</span>
                                                    <%--<span ng-if=""--%>
                                                          <%--ng-class="{disinbl:menuItemCount['39215-2048898']}"--%>
                                                          <%--class="badge disnone"--%>
                                                          <%--ng-bind="menuItemCount['39215-2048898']"></span>--%>
                                                    <span class="fr">在售</span>

                                                </div>

                                            </li>

                                        </c:forEach>


                                    </ul>

                                </section>
                            </article>


                        </div>
                    </div>
                </div>
                <aside class="fl">
                    <article class="cart" scroll-position-static="160" top="42">
                        <div class="menu-cart">
                            <header>
                                <h5>
                                    购物车
                                    <i class="icon trash-can-icon fr " ng-click="clearCart()"></i>
                                </h5>
                            </header>
                            <section>
                                <div class="inner-cart empty" ng-class="{empty:isEmpty}">
                                    <div class="cart-thead clearfix">
                                        <div class="goods-name fs16">商品名</div>
                                        <div class="goods-count fs16">份数</div>
                                        <div class="goods-price fs16">单价</div>
                                        <div class="goods-subtotal fs16">小计</div>
                                    </div>
                                    <div class="cart-item-list select-none">
                                        <div class="disnone" ng-class="{disnone:isEmpty}">

                                            <div class="cart-item cart-data clearfix" ng-repeat="obj in cartDatas">
                                                <div class="goods-name ellipsis" ng-bind="obj.name"></div>
                                                <div class="goods-count clearfix ellipsis">
                                                    <span class="goods-sub icon sub-icon fl"
                                                          sub-goods="[[$index]]"></span>
                                                    <span class="goods-nums fl" ng-bind="obj.quantity"></span>
                                                    <span class="goods-add icon add-icon fl"
                                                          ng-click="addGoodsNum($index)"></span>
                                                </div>
                                                <div class="goods-price">￥<span ng-bind="obj.price"></span>
                                                </div>
                                                <div class="goods-subtotal">￥<span
                                                        ng-bind="(obj.quantity * obj.price)"></span></div>

                                                <%--<div class="accessory-item" ng-class="{firstitem:$first}"--%>
                                                     <%--ng-repeat="item in obj.options">--%>
                                                    <%--<div class="cart-item clearfix">--%>
                                                        <%--<div class="goods-name ellipsis" ng-bind="item.name"></div>--%>
                                                        <%--<div class="goods-count fs20">--%>
                                                            <%--<span class="goods-sub fl"></span>--%>
                                                            <%--<span class="goods-nums fl" ng-bind="item.quantity"></span>--%>
                                                        <%--</div>--%>
                                                        <%--<div class="goods-price">￥<span--%>
                                                                <%--ng-bind="item.price|number:2"></span></div>--%>
                                                        <%--<div class="goods-subtotal">￥<span--%>
                                                                <%--ng-bind="(item.price * item.quantity)|number:2"></span>--%>
                                                        <%--</div>--%>
                                                    <%--</div>--%>
                                                <%--</div>--%>
                                            </div>

                                        </div>
                                        <div class="cart-item-empty">暂无商品，请在左边的菜单上点单</div>
                                    </div>
                                    <div id="cart-item-list"></div>
                                    <div class="total clearfix disnone" ng-class="{disnone:isEmpty}">
                                        <div class="fr">合计：￥<span ng-bind="total|number:2"></span></div>
                                    </div>
                                    <div style="padding: 10px 10px">
                                        <div class="layui-inline"> <!-- 注意：这一层元素并不是必须的 -->
                                            <label class="">时间：</label>
                                            <input type="text" class="layui-input" id="time" name="time" placeholder="预定时间" style="width: 250px">
                                        </div>
                                    </div>
                                    <div style="padding: 10px 10px">
                                        <label for="remark">备注：</label>
                                        <br/>
                                        <textarea id="remark" name="remark" placeholder="请填写备注"
                                                  style="vertical-align: top;width: 250px;height: 60px"></textarea>
                                    </div>
                                    <div class="checkout">
                                        <button class="checkout btn" ng-disabled="isPlaceOrder" ng-click="createOrder()"
                                                ng-bind="createOrderBtnName">立即下单
                                        </button>
                                    </div>
                                </div>
                            </section>
                        </div>

                        <article class="restaurant-notice">
                            <header>
                                餐厅活动
                            </header>
                            <section>
                                <ul>


                                    <%--<li><i class="status-icon"></i><span>餐厅支持在线支付</span></li>--%>
                                    <%--<li><i class="status-icon"></i><span>餐厅支持在线支付</span></li>--%>
                                    <%--<li><i class="status-icon"></i><span>餐厅支持在线支付</span></li>--%>
                                    <li><span>餐厅菜品打折</span></li>


                                </ul>
                            </section>
                        </article>

                    </article>
                </aside>
            </section>
            <span id="element" style="position:absolute;display:none" class="badge">1</span>
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
        <a target="_blank" class="foot-logo-1 base-logo" href="index.jsp"></a>
        <div class="tc fs14 light-gray mb10">

        </div>
    </div>
</footer>


<script type="text/javascript" src="/static/web/js/angular.min.js"></script>
<script src="/static/web/js/common.js"></script>


<script src="/static/web/js/service.js"></script>

<script>var feedbackUrl = '/ajax/feedback/';
var app = angular.module("app", ["dh.dialog", "dh.form", 'dh.service', 'dh.other']);</script>
<!--[if lt IE 9]>
<script src="/static/web/js/fix.js"></script><![endif]-->


<script>
    var sections = [{
//        "description": "\u6b64\u533a\u57df\u70b9\u9910\uff0c\u6bcf\u4efd\u7acb\u51cf6\u5143",
//        "image": null,
//        "recommended": false,
        "id": ${model.id},
        "menu_items": [

            <c:forEach items="${caiList}" var="cai">
            {
//                "qiniu_url": "http://dhcmenuitem.dhero.cn/141351044817949330244050361216",
//                "additions": [],
                "name": "${cai.name}",
                "optionsets": [],
//                "ordercount": 9,
//                "position": 4,
                "price": ${cai.price},
                "id": ${cai.id},
//                "description": ""
            },
            </c:forEach>
        ],
//        "name": "\u5e97\u4e3b\u63a8\u8350"
    }],
        accessoryObj = {}, orderObj = [], other_order = {};
    if (sections) {
        for (var i = 0, len = sections.length; i < len; i++) {
            var sectionObj = sections[i], key = '';
            for (var j = 0, itemLen = sectionObj.menu_items.length; j < itemLen; j++) {
                var menuItemObj = sectionObj.menu_items[j];
                key = sectionObj.id + '-' + menuItemObj.id;
                menuItemObj.key = key;
                menuItemObj.sectionId = sectionObj.id;
                accessoryObj[key] = menuItemObj;
            }
        }
    }

//    if (other_order && other_order.items) {
//        //order data
//        for (var j = 0; j < other_order.items.length; j++) {
//            if (other_order.items[j].status == true) {
//                orderObj.push(other_order.items[j]);
//            }
//        }
//    }
    var restaurantId = '${model.id}';//餐厅id
    var tid = '${tid}';//餐桌id
//    var restaurantInRange = true;
    var grid_locationId = 1;
    var inRange = true;
    var can_process_order = true;
    var create_order_url = "/web/orders/save";
//    var checkout_url = "/checkout/0/";
//    var restaurant_list_url = "/restaurants/0/";
//    var favoriteUrl = "/ajax/restaurant/0/favorite/";
    var delivery = {minimum_order_quantity: '0', free_delivery_treshold: '0', delivery_fee: '0'};


</script>
<script src="/static/web/js/menupage.js"></script>


<script>angular.bootstrap(document, ["app"]);</script>

<script src="/static/layui/lib/layui/layui.js"></script>
<script>
    layui.use('laydate', function () {
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#time' //指定元素
            , type: 'datetime'
        });
    });
</script>

</body>
</html>
