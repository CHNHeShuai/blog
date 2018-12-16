<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/9
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理系统-首页</title>
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
<!--商标-->
<div class="brand"><a href="#">博客后台管理系统</a></div>
<!--用户-->
<div class="user">
    <img src="${pageContext.request.contextPath}/${user.image}" alt=""/>
    <span>超级管理员</span>
</div>
<!--菜单-->


<div class="menu">
    <ul>
        <li>
            <a href="javascript:;" ><span class="glyphicon glyphicon-user"></span>博主信息管理</a>
            <div class="child" >
                <a href="/toIndex" >博主信息查询</a>
                <a href="/toUpdateUser">修改博主信息</a>
                <a href="/toUpdatePassword">修改密码</a>
            </div>
        </li>
        <li>
            <a href="javascript:;" ><span class="glyphicon glyphicon-user"></span>微信支付宝管理</a>
            <div class="child" >
                <a href="/findWeiZhi" >微信支付宝查询</a>
            </div>
        </li>
        <li>
            <a href="javascript:;"><span class="glyphicon glyphicon-list"></span>首页管理</a>
            <div class="child" >
                <a href="/toAddIndexshare">新增首页分享</a>
                <a href="/findIndexshare">查询首页分享</a>
                <a href="/toAddIndextuijian">新增首页推荐</a>
                <a href="/findIndextuijian">查询首页推荐</a>
                <a href="/toAddIndexnews">新增首页新闻</a>
                <a href="/findIndexnews">查询首页新闻</a>
            </div>
        </li>
        <li>
            <a href="javascript:;"><span class="glyphicon glyphicon-list"></span>笑话分享管理</a>
            <div class="child" >
                <a href="/toAddShare">添加笑话</a>
                <a href="/findShare">查询笑话</a>
            </div>
        </li>
        <li>
            <a href="javascript:;"><span class="glyphicon glyphicon-list"></span>学无止境管理</a>
            <div class="child" >
                <a href="/toAddStudy">添加学无止境</a>
                <a href="/findStudy">查询学无止境</a>
            </div>
        </li>
        <li>
            <a href="javascript:;"><span class="glyphicon glyphicon-list"></span>留言管理</a>
            <div class="child" >
                <a href="/findGbook">查询留言</a>
            </div>
        </li>
        <li>
            <a href="javascript:;"><span class="glyphicon glyphicon-list"></span>客户管理</a>
            <div class="child" >
                <a href="/findCustomers">查询客户</a>

            </div>
        </li>
    </ul>
</div>
<script>
        var lis = $('.menu ul li >div>a');
        console.log(lis);
        for (var i=0;i<lis.length;i++){
            lis[i].index = i;
                lis[i].onmouseover = function () {

                    for(var j=0;j<lis.length;j++){
                        lis[j].className = '';
                                        }
                this.className = 'now';
            }
    }
</script>
</body>
</html>

