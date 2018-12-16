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
<head lang="en">
    <script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
    <script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
    <script type="text/javascript">
        var editor;
        KindEditor.ready(function(K) {
            editor = K.create('textarea[test="content"]', {
                allowFileManager : true
            });
        });
    </script>
</head>
<body>
<!--侧边栏-->
<aside class="ad_aside">
    <!--商标-->
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
            <li class="active">修改博主信息</li>
        </ol>
        <div class="ad_content">
            <form action="/updateUser" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${user.id}">
                <div class="form-group">
                    <label >网  名：</label>
                    <input type="text" name="netname" value="${user.netname}" />
                </div>
                <div class="form-group">
                    <label >用户名：</label>
                    <input type="text" name="username" value="${user.username}" />
                </div>
                <div class="form-group">
                    <label >职  业：</label>
                    <input type="text" name="job" value="${user.job}" />
                </div>
                <%--<div class="form-group">
                    <label >密  码：</label>
                    <input type="password" name="password" value="${user.password}" />
                </div>--%>
                <div class="form-group">
                    <label >电  话：</label>
                    <input type="text" name="telephone" value="${user.telephone}" />
                </div>
                <div class="form-group">
                    <label >籍  贯：</label>
                    <input type="text" name="address" value="${user.address}" />
                </div>
                <div class="form-group">
                    <label >邮  箱：</label>
                    <input type="email" name="email" value="${user.email}" />
                </div>
                <div class="form-group">
                    <label >上传图片：</label>
                    <img style="width: 50px;height: 50px" src="${pageContext.request.contextPath}/${user.image}"  alt="图片未添加">
                    <input type="file" name="imageFile"/>
                </div>
                <div class="form-group">
                    <label >上传微信图片：</label>
                    <img style="width: 50px;height: 50px" src="${pageContext.request.contextPath}/${user.weixin}"  alt="图片未添加">
                    <input type="file" name="weixinFile"  />
                </div>
                <span style="color: red;">${fileCheck}</span>
                <div class="form-group">
                    <p><span class="tnr">自我描述:</span>
                        <textarea test="content" style="width:690px;height:200px;visibility:hidden;" name="des">${user.des}</textarea>
                    </p>
                </div>
                <button type="submit" class="btn btn-primary" >确定</button>
            </form>
        </div>
    </div>
</section>
</body>
</html>
