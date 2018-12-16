<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="gb2312">
    <title>首页_${user.netname}个人博客 - 个人博客网站</title>
    <meta name="keywords" content="个人博客,贺帅个人博客,个人博客模板,${user.netname}" />
    <meta name="description" content="贺帅个人博客。" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../../css/base.css" rel="stylesheet">
    <link href="../../css/index.css" rel="stylesheet">
    <link href="../../css/m.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="../../js/modernizr.js"></script>
    <style>
        img{
            display:inline;
        }
    </style>
    <![endif]-->
</head>
<body>
<header>
    <div id="mnav">
        <div class="logo"><a href="/">${user.netname}个人博客</a></div>
        <h2 id="mnavh"><span class="navicon"></span></h2>
        <ul id="starlist">
            <li><a href="/">网站首页</a></li>
            <li><a href="/about">关于我</a></li>
            <li><a href="/share">笑话分享</a></li>
            <li><a href="/list">学无止境</a></li>
            <li><a href="/gbook">留言</a></li>
            <li><a href="/userLogin">博主登录</a></li>
            <c:if test="${customer!=null}">
                <li><a href="/customerCenter" target="_blank" style="color: #fc5a36">${customer.username}</a>&nbsp;&nbsp;<a href="/logout">退出</a></li>
            </c:if>
            <c:if test="${customer==null}">
                <li><a href="/customerLogin">登录</a></li>
                <li><a href="/customerRegister">注册</a></li>
            </c:if>

        </ul>
    </div>
    <script>
        window.onload = function ()
        {
            var oH2 = document.getElementById("mnavh");
            var oUl = document.getElementById("starlist");
            oH2.onclick = function ()
            {
                var style = oUl.style;
                style.display = style.display == "block" ? "none" : "block";
                oH2.className = style.display == "block" ? "open" : ""
            }
        }
    </script>
</header>
<div class="line46"></div>
<div class="blank"></div>
<article>
    <div class="leftbox">
        <div class="infos">
            <div class="newsview">
                <h2 class="intitle">您现在的位置是：<a href="/">网站首页</a>&nbsp;&gt;&nbsp;<a href="/">关于我</a></h2>
                <div class="news_infos">
                    <div id="article" class="fbinfo" >
                        ${user.des}
                    </div>
                </div>
            </div>
        </div>
        <div class="news_pl">
            <h2><a href="/gbook">我要留言</a></h2>
            <ul>
            </ul>
        </div>
    </div>
    <div class="rightbox">
        <div class="aboutme">
            <h2 class="ab_title">关于我</h2>
            <div class="avatar"> <img src="${pageContext.request.contextPath}/${user.image}"> </div>
            <div class="ab_con">
                <p>网名：${user.netname}</p>
                <p>职业：${user.job} </p>
                <p>籍贯：${user.address}</p>
                <p>邮箱：${user.email}</p>
            </div>
        </div>
        <div class="weixin">
            <h2 class="ab_title">微信关注</h2>
            <ul>
                <img src="${pageContext.request.contextPath}/${user.weixin}">
            </ul>
        </div>
    </div>
</article>
<footer>
    <p>Design by <a href="#">贺帅个人博客</a> <a href="/">蜀ICP备11111111号-1</a></p>
</footer>
</body>
</html>
