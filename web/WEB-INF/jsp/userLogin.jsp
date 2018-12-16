<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/7
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Flat Login On Myblog</title>
    <link href="../../css/style1.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- Custom Theme files -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script src="../../js/jquery.min.js"></script>
    <script>$(document).ready(function(c) {
        $('.close').on('click', function(c){
            $('.mail-section').fadeOut('slow', function(c){
                $('.mail-section').remove();
            });
        });
    });
    </script>
</head>
<body>
<div class="header">
    <h1>Login On Myblog</h1>
</div>
<div class="main">
    <div class="mail-section">
        <div class="close"> </div>
        <div class="mail-image">
            <img src="../../images/message.png" alt="" />
            <h3>welcome to</h3>
            <h2>Myblog</h2>
        </div>
        <div class="mail-form">
            <form action="/toWebIndex" method="post" target="_blank">
                <input type="hidden" name="id" value="1">
                <input type="text" name="username" placeholder="Enter your name...." required="用户名不能为空"/>
                <span style="color: red;">${usernameCheck}</span>
                <input type="password" name="password" class="pass" placeholder="Password" required="密码不能为空"/>
                <span style="color: red;">${passwordCheck}</span>
                <input type="submit" value="submit">
            </form>
            <a href="#"><p>lost your password?</p></a>
        </div>
        <div class="clear"> </div>
    </div>
</div>
<div class="footer">
    <p>&copy 2018 Flat Login On Myblog</p>
</div>

</body>
</html>

