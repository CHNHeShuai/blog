<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/8
  Time: 17:21
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
            <li class="active">博主信息查询</li>
        </ol>
        <div class="ad_content">
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th width="10%">序号</th>
                    <th width="10%">姓名</th>
                    <th width="10%">网名</th>
                    <th width="10%">图片</th>
                    <th width="10%">电话</th>
                    <th width="20%">邮箱</th>
                    <th width="20%">职业</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td>${user.netname}</td>
                    <td><img style="height: 50px ;width: 50px" src="${pageContext.request.contextPath}/${user.image}"></td>
                    <td>${user.telephone}</td>
                    <td>${user.email}</td>
                    <td>${user.job}</td>
                    <td>
                        <a data-id="" data-name="" href="/toUpdateUser" class="btn btn-sm btn-danger">更新</a>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="page">
                <ul class="pagination"></ul>
            </div>
        </div>
    </div>
</section>
</body>
</html>
