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
    <link rel="stylesheet" href="../../assets/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../../assets/bootstrap-validator/css/bootstrapValidator.min.css"/>
    <script src="../../js/jquery.min.js" type="text/javascript"></script>
    <script src="../../assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="../../js/jquery.validate.js"></script>
    <script src="../../js/messages_zh.js"></script>
    <script src="../../assets/bootstrap-validator/js/bootstrapValidator.min.js"></script>
    <!--[if lt IE 9]>
    <script src="../../js/modernizr.js"></script>
    <![endif]-->

    <link rel="stylesheet" media="screen" href="../../css/style.css">
    <link rel="stylesheet" type="text/css" href="../../css/reset.css"/>
    <style>
        .user{
            float:left;
            height:30px;
            line-height:30px;
            font-size:16px;
        }
        .login-center-input{
            float:right;
        }
        .error{
            color:red;
        }
    </style>
</head>
<body>
<div id="particles-js">
    <div class="login" style="height: 600px; width: 400px;">
        <form action="/register" id="commentForm" method="post"  enctype="multipart/form-data">
            <div class="login-top">
                注册
            </div>
            <div class="login-center clearfix">
                <div class="user" >用户名:</div>
                <div class="login-center-input">
                    <input class="inputClass" minlength="2" required="true" type="text" id="username" name="username"  placeholder="请输入您的用户名" />
                </div>
            </div>
            <div class="login-center clearfix">
                <div class="user">密码:</div>
                <div class="login-center-input">
                    <input type="password" id="password" minlength="5" required="true" name="password" placeholder="请输入您的密码" />
                </div>
            </div>
            <div class="login-center clearfix">
                <div class="user">确认密码:</div>
                <div class="login-center-input">
                    <input type="password" id="repassword" 	equalTo:"#password" name="repassword" required="true" placeholder="请再次输入您的密码" />
                </div>
            </div>
            <div class="login-center clearfix">
                <div class="user">上传图片:</div>
                <div class="login-center-input">
                    <input type="file" name="fileName"  />
                </div>
            </div>
            <div class="login-center clearfix">
                <div class="user">手机号:</div>
                <div class="login-center-input">
                    <input type="text" required="true" rangelength:[11,11] name="telephone" id="telephone" placeholder="请输入手机号" />
                </div>
            </div>
            <div class="login-button">
                <input  style="border: 0px ;color: #fff;background-color: dodgerblue;margin-top:0px" type="submit" value="注册">
            </div>
        </form>
    </div>
    <div class="sk-rotating-plane"></div>
</div>

<!-- scripts -->
<script src="../../js/particles.min.js"></script>
</body>
</html>

