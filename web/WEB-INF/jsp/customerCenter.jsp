<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/8
  Time: 16:35
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
            <li class="active">个人博主信息管理</li>
            <li class="active">个人信息查询</li>
        </ol>
        <div class="ad_content">
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th width="30%">姓名</th>
                    <th width="30%">图片</th>
                    <th width="30%">电话</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>${customer.username}</td>
                    <td><img style="height: 50px ;width: 50px" src="${pageContext.request.contextPath}/${customer.image}"></td>
                    <td>${customer.telephone}</td>
                    <td><button type="button"  style="padding: 6px 12px;font-size: 12px" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#edit">
                        修改
                    </button></td>
                </tr>
                </tbody>
            </table>

            <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">修改首页分享</h4>
                        </div>
                        <div class="modal-body">
                            <form method="post" enctype="multipart/form-data" action="/updateCustomer">
                                <input id="id" type="hidden" name="id" value="${customer.id}">
                                <div class="form-group">
                                    <label >用户名:</label>
                                    <input value="${customer.username}" type="text" name="username"/>
                                </div>
                                <div class="form-group">
                                    <label >上传图片:</label>
                                    <img  style="width: 50px;height: 50px;" src="${pageContext.request.contextPath}/${customer.image}">
                                    <input  type="file" name="imageFile"/>
                                </div>
                                <div>
                                    <label >电话:</label>
                                    <input value="${customer.telephone}" type="text" name="telephone">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <button type="submit" class="btn btn-primary">提交</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
            <div class="page">
                <ul class="pagination"></ul>
            </div>
        </div>
    </div>
</section>

</body>
</html>
