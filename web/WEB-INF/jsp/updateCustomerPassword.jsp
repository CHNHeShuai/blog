<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/8
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <link rel="stylesheet" href="../../assets/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../../assets/bootstrap-validator/css/bootstrapValidator.min.css"/>
    <link rel="stylesheet" href="../../assets/nprogress/nprogress.css"/>
    <link rel="stylesheet" href="../../css/admin.css"/>
    <script type="text/javascript" src="../../js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="../../js/layer.js"></script>
    <script type="text/javascript" src="../../js/layui.js"></script>
    <script src="../../assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="../../assets/bootstrap-validator/js/bootstrapValidator.min.js"></script>
    <script src="../../assets/nprogress/nprogress.js"></script>
    <script src="../../assets/echarts/echarts.min.js"></script>
    <script src="../../js/admin.js"></script>
    <script src="../../js/index.js"></script>
</head>
<body>
<!--侧边栏-->
<!--侧边栏-->
<aside class="ad_aside">
    <!--商标-->
    <div class="brand"><a href="#">用户个人中心</a></div>
    <!--用户-->
    <div class="user">
        <img src="${pageContext.request.contextPath}/${customer.image}" alt=""/>
        <span>用户管理</span>
    </div>
    <div class="menu">
        <ul>
            <li>
                <a href="javascript:;" ><span class="glyphicon glyphicon-user"></span>用户信息管理</a>
                <div class="child" >
                    <a href="/customerCenter" >用户信息查询</a>
                    <a href="/toupdateCustomerPassword">修改密码</a>
                </div>
            </li>
        </ul>
    </div>

</aside>
<!--内容-->
<section class="ad_section">
    <!--顶部导航-->
    <nav class="ad_nav">
        <a data-menu href="javascript:;"><span class="glyphicon glyphicon-align-justify"></span></a>
        <a data-logout href="javascript:;"><span class="glyphicon glyphicon-log-out"></span></a>
    </nav>
    <div class="container-fluid">
        <!--路径导航-->
        <ol class="breadcrumb">
            <li><a href="#">管理系统</a></li>
            <li class="active">个人信息管理</li>
            <li class="active">修改密码</li>
        </ol>
        <div class="ad_content">
            <form action="/updateCustomerPassword" method="post">
                <input type="hidden" name="id" value="${customer.id}">
                <div class="form-group">
                    <label >密   码：</label>
                    <input type="password" name="password" />
                </div>
                <button type="submit" class="btn btn-primary" >确定</button>
            </form>
        </div>
    </div>
</section>
</body>
</html>
