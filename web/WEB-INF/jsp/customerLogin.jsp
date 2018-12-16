<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/2
  Time: 9:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="gb2312">
    <title>首页_贺帅个人博客 - 个人博客网站</title>
    <meta name="keywords" content="个人博客,贺帅个人博客,个人博客模板,贺帅" />
    <meta name="description" content="贺帅个人博客。" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../../css/base.css" rel="stylesheet">
    <link href="../../css/index.css" rel="stylesheet">
    <link href="../../css/m.css" rel="stylesheet">
    <script src="../../js/jquery.min.js" type="text/javascript"></script>

    <!--[if lt IE 9]>
    <script src="../../js/modernizr.js"></script>
    <![endif]-->

    <link rel="stylesheet" media="screen" href="../../css/style.css">
    <link rel="stylesheet" type="text/css" href="../../css/reset.css"/>
</head>
<body>
<div id="particles-js">
    <div class="login">
        <form action="/login" method="post">
            <div >
                <div class="login-top" style="position: relative">
                    登录
                </div>
                <div style="position: absolute;height: 20px;top: 135px;left: 7px" >
                    <span style="display: block;margin-left: 180px;margin-bottom: 15px;font-size: 16px;">还未注册?<a style="color: red;size:30px " href="/customerRegister">请注册</a></span>
                </div>
            </div>

            <div class="login-center clearfix">
                <div class="login-center-img"><img src="../../images/name.png"/></div>
                <div class="login-center-input">
                    <input type="text" name="username" value="" placeholder="请输入您的用户名" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的用户名'"/>
                    <div class="login-center-input-text">用户名</div>
                    <span style="color: red;">${usernameCheck}</span>
                </div>
            </div>
            <div class="login-center clearfix">
                <div class="login-center-img"><img src="../../images/password.png"/></div>
                <div class="login-center-input">
                    <input type="password" name="password" value="" placeholder="请输入您的密码" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的密码'"/>
                    <div class="login-center-input-text">密码</div>
                    <span style="color: red;">${passwordCheck}</span>
                </div>
            </div>
            <div class="login-button">
                <input style="border: 0px ;color: #fff;background-color: dodgerblue;margin-top: 10px" type="submit" value="登录">
            </div>
        </form>
    </div>

    <div class="sk-rotating-plane"></div>
</div>

<!-- scripts -->
<script src="../../js/particles.min.js"></script>
<script src="../../js/app.js"></script>

</body>
</html>

