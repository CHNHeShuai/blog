<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/9
  Time: 11:06
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
            <li class="active">客户管理</li>
        </ol>
        <div class="ad_content">
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th width="20%">序号</th>
                    <th width="20%">姓名</th>
                    <th width="20%">图片</th>
                    <th width="20%">电话</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${customerList}" var="customer" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>${customer.username}</td>
                        <td><img style="width: 50px;height: 50px;" src="${pageContext.request.contextPath}/${customer.image}"></td>
                        <td>${customer.telephone}</td>
                        <td>
                            <a data-id="" onclick="deleteCustomer()" href="javascript:;" class="btn btn-sm btn-danger">删除</a>
                        </td>
                        <script>
                            function deleteCustomer() {
                                layer.msg('确定删除该用户?', {
                                    time: 0 //不自动关闭
                                    ,btn: ['确定', '取消']
                                    ,yes: function(){
                                        window.location.href="/deleteCustomer?id=${customer.id}";
                                    }
                                });

                            }
                        </script>
                    </tr>
                </c:forEach>

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
