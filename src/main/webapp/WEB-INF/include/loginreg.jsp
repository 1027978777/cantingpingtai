<%@ page contentType="text/html; charset=utf-8" %>
<dh-dialog class="disnone" type='login' height="500" header="登录" show="loginShow">
    <form class="login-form" novalidate name="loginForm" ng-controller="loginCtrl">
        <div class="form-group">
            <label for="">手机号码</label>
            <div>
                <input type="text" ng-model="user.username" ng-class="{error:user.usernameMessage}"
                       ng-focus="user.usernameMessage=''" maxlength="11" placeholder="请输入你的手机号码"/>
                <span class="vaildate-error" ng-if="user.usernameMessage">
                    <span ng-bind="user.usernameMessage"></span>
                </span>
                <span class="vaildate-error" ng-if="user.isLogined">
                    该手机号码尚未注册！<a href="javascript:;" ng-click="locationRegister()" class="link">立即注册</a>
                </span>
            </div>
        </div>
        <div class="form-group mb10">
            <label for="">登录密码</label>
            <div>
                <input type="password" onpaste="return false" ng-model="user.password"
                       ng-focus="user.passwordMessage=''" ng-class="{error:user.passwordMessage}" maxlength="10"
                       placeholder="请输入登录密码"/>
                <span class="vaildate-error" ng-if="user.passwordMessage">
                    <span ng-bind="user.passwordMessage"></span>
                </span>
            </div>
        </div>
        <div ng-init="showCaptcha=0" ng-if="showCaptcha" class="form-group inline clearfix mb10">
            <div class="fl w50p">
                <input type="text" ng-model="user.captcha" ng-focus="user.captchaMessage=''"
                       ng-class="{error:user.captchaMessage}" placeholder="请输入验证码">
                <span class="vaildate-error" ng-if="user.captchaMessage">
                    <span ng-bind="user.captchaMessage"></span>
                </span>
            </div>
            <label class="fr">
                <dh-captcha change="captchaChange" src="/static/web/images/yzm.gif"></dh-captcha>
            </label>
        </div>

        <button class="big-btn btn-green btn mb10" ng-click="loginVaildate()" ng-disabled="loginBtnDisabled"
                ng-bind="loginBtn"></button>
        <div class="clearfix">
            <span class="fr fs12">
                没有账号?
                <a href="javascript:void(0)" ng-click="locationRegister()" class="link">立即注册</a>
            </span>
        </div>
    </form>
</dh-dialog>


<%--注册--%>
<dh-dialog class="disnone" type='register' height="500" header="注册" show="registerShow">
    <form ng-controller="registerCtrl" class="register-form" name="registerForm">
        <div class="form-group mb10">
            <label for="">手机号码</label>
            <div>
                <input type="text" ng-class="{error:user.usernameMessage}" maxlength="11" placeholder="请输入您的手机号码"
                       ng-model="user.username"/>
                <span class="vaildate-error" ng-if="user.usernameMessage">
                    <span ng-bind="user.usernameMessage"></span>
                </span>
               <%-- <span class="vaildate-error" ng-if="user.isRegistered">
                    该手机号码已经注册！<a href="javascript:;" ng-click="locationLogin()" class="link">立即登录</a>
                </span>--%>
            </div>
        </div>


        <div class="form-group mb10">
            <label for="">登录密码</label>
            <div><input type="password" ng-class="{error:user.passwordMessage}" ng-focus="user.passwordMessage=''"
                        maxlength="10" onpaste="return false" placeholder="输入登录密码 6-10个字符" ng-model="user.password"/>
                <span class="vaildate-error" ng-if="user.passwordMessage">
                    <span ng-bind="user.passwordMessage"></span>
                </span>
            </div>
        </div>
        <div class="form-group mb10">
            <label for="">再次输入密码</label>
            <div><input type="password" ng-class="{error:user.password2Message}" ng-focus="user.password2Message=''"
                        maxlength="10" onpaste="return false" placeholder="输入登录密码 6-10个字符" ng-model="user.password2"/>
                <span class="vaildate-error" ng-if="user.password2Message">
                    <span ng-bind="user.password2Message"></span>
                </span>
            </div>
        </div>

        <div class="form-group mb10">
            <label for="">姓名</label>
            <div><input type="text" ng-class="{error:user.realname}" ng-focus="user.realname=''"
                        maxlength="10" onpaste="return false" placeholder="输入登录密码 6-10个字符" ng-model="user.realname"/>
                <span class="vaildate-error" ng-if="user.realname">
                    <span ng-bind="user.password2Message"></span>
                </span>
            </div>
        </div>
        <div class="clearfix mb10">
            <dh-checkbox model="user.remember" title="我同意韩盛" class="fl"></dh-checkbox>
            <a href="/terms-and-conditions/" target="_blank" class="fs12 fl link"> " 注册条款 "</a>
        </div>
        <button ng-disabled="!user.remember || registerBtnDisabled" ng-click="registerVaildate()"
                class="big-btn btn-green btn mb10" ng-bind="registerBtn"></button>
    </form>
</dh-dialog>