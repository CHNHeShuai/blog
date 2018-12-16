<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
            <li class="active">首页管理</li>
            <li class="active">新增首页分享</li>
        </ol>
        <div class="ad_content">
            <form action="/addIndexshare" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label >标题:</label>
                    <input type="text" name="title"/>
                </div>
                <div class="form-group">
                    <label >类别:</label>
                    <select name="cid">
                        <option value="0">----请选择----</option>
                        <option value="1">程序员</option>
                        <option value="2">老师</option>
                        <option value="3">学生</option>
                        <option value="4">产品经理</option>
                        <option value="5">产品总监</option>
                        <option value="6">总经理</option>
                    </select>
                </div>
                <div class="form-group">
                    <label >上传图片:</label>
                    <input type="file" name="imageFile"/>
                </div>
                <div>
                    <label >简述:</label>
                    <input type="text" name="des">
                </div>
                <div class="form-group">
                    <p><span class="tnr">文章内容:</span>
                        <textarea test="content" style="width:690px;height:200px;visibility:hidden;" name="article"></textarea>
                    </p>
                </div>
                <button type="submit" class="btn btn-primary" >确定</button>
            </form>
        </div>
    </div>
</section>
</body>
</html>
