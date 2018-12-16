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
<body>
<!--侧边栏-->
<aside class="ad_aside">
    <div>
        <c:import url="base.jsp"></c:import>
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
            <li class="active">博主信息管理</li>
            <li class="active">修改密码</li>
        </ol>
        <div class="ad_content">
            <form action="/updatePassword" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${user.id}">
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
