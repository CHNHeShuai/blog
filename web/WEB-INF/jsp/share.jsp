<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/2
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="gb2312">
    <title>首页_${user.netname}个人博客 - 个人博客网站</title>
    <meta name="keywords" content="个人博客,${user.netname}个人博客,个人博客模板,${user.netname}" />
    <meta name="description" content="${user.netname}个人博客。" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../../css/base.css" rel="stylesheet">
    <link href="../../css/index.css" rel="stylesheet">
    <link href="../../css/m.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="../../js/modernizr.js"></script>
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
        <div class="tuijian">
            <h2 class="hometitle"><span><a href="/">笑话分享</a><a href="/">学无止境</a></span>笑话分享</h2>
            <ul>

                <c:forEach items="${pageInfo.list}" var="share">
                    <li>
                        <div class="tpic"><img style="width: 210px;height: 105px;" src="${pageContext.request.contextPath}/${share.image}"></div>
                        <b>${share.title}</b><span style="color: #9c7496;">${share.des}</span><a href="/shareInfo?shareId=${share.id}" class="readmore">阅读原文</a></li>
                </c:forEach>
            </ul>
            <div class="pagelist"><a title="Total record">总记录数:${pageInfo.total}&nbsp;&nbsp;<b>总页数:${pageInfo.pages}</b></a>&nbsp;&nbsp;
                <a href="/share?currentPage=${pageInfo.firstPage}">首页</a>&nbsp;
                <a href="/share?currentPage=${pageInfo.prePage}">上一页</a>&nbsp;
                <c:forEach items="${pageInfo.navigatepageNums}" var="pagenum">
                    <a href="/share?currentPage=${pagenum}">${pagenum}</a>&nbsp;
                </c:forEach>
                <a href="/share?currentPage=${pageInfo.nextPage}">下一页</a>&nbsp;
                <a href="/share?currentPage=${pageInfo.lastPage}">尾页</a>
            </div>
        </div>

    </div>
    <div class="rightbox">
        <%--天气插件--%>
        <div id="tp-weather-widget"></div>
        <script>(function(T,h,i,n,k,P,a,g,e){g=function(){P=h.createElement(i);a=h.getElementsByTagName(i)[0];P.src=k;P.charset="utf-8";P.async=1;a.parentNode.insertBefore(P,a)};T["ThinkPageWeatherWidgetObject"]=n;T[n]||(T[n]=function(){(T[n].q=T[n].q||[]).push(arguments)});T[n].l=+new Date();if(T.attachEvent){T.attachEvent("onload",g)}else{T.addEventListener("load",g,false)}}(window,document,"script","tpwidget","//widget.seniverse.com/widget/chameleon.js"))</script>
        <script>tpwidget("init", {
            "flavor": "slim",
            "location": "WTEGF0W764FN",
            "geolocation": "enabled",
            "language": "zh-chs",
            "unit": "c",
            "theme": "chameleon",
            "container": "tp-weather-widget",
            "bubble": "enabled",
            "alarmType": "badge",
            "uid": "U73B33750B",
            "hash": "f2ce72a4514ea011568f01153fe7dd6a"
        });
        tpwidget("show");</script>


        <div class="paihang">
            <h2 class="ab_title"><a href="/">点击排行</a></h2>
            <ul>
                <c:forEach items="${shareByOrderList}" var="shareByOrder">
                    <li><b><a href="#">${shareByOrder.title}</a></b>
                        <p><i><a href="/shareInfo?shareId=${shareByOrder.id}">
                            <img src="${pageContext.request.contextPath}/${shareByOrder.image}">
                        </a></i>${shareByOrder.des}</p>
                    </li>
                </c:forEach>

            </ul>
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

