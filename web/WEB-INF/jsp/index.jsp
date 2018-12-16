<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="gb2312">
    <title>首页_${user.netname}个人博客 - 一个开发web后端的个人博客网站</title>
    <meta name="keywords" content="个人博客,${user.netname}个人博客,个人博客模板,${user.netname}" />
    <meta name="description" content="${user.netname}个人博客。" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../../css/base.css" rel="stylesheet">
    <link href="../../css/index.css" rel="stylesheet">
    <link href="../../css/m.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="../../js/modernizr.js"></script>
    <script src="jquery-2.1.1.min.js"></script>
    <!--心知天气插件-->
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
                <li><a href="/customerCenter" target="_blank" style="color: #fc5a36">${customer.username}</a>&nbsp;&nbsp;
                    <a href="/logout">退出</a></li>
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
<article>
    <div class="pics">
        <ul>
            <c:forEach items="${indexshareList}" var="indexshare">
                <li><i><a href="/indexShareInfo?indexShareId=${indexshare.id}"><img style="width: 360px;height: 160px;" src="${pageContext.request.contextPath}/${indexshare.image}"></a></i><span >${indexshare.title}</span></li>
            </c:forEach>
        </ul>
    </div>
    <div class="blank"></div>
    <div class="leftbox">
        <div class="tuijian">
            <h2 class="hometitle"><span><a href="/">笑话分享</a><a href="/">学无止境</a><a href="/">热门标签</a></span>特别推荐</h2>
            <ul>
                <c:forEach items="${indextuijianList}" var="indextuijian">
                    <li>
                        <div class="tpic"><img style="width: 220px;height: 110px;" src="${pageContext.request.contextPath}/${indextuijian.image}"></div>
                        <b>${indextuijian.title}</b><span style="color: #9c7496;">${indextuijian.des}</span><a href="/indextuijianInfo?indextuijianId=${indextuijian.id}" class="readmore">阅读原文</a></li>

                </c:forEach>
            </ul>
        </div>
        <div class="newblogs">
            <h2 class="hometitle">最新文章</h2>
            <ul>
                <c:forEach items="${indexnewsList}" var="indexnews">
                    <li>
                        <h3 class="blogtitle"><a href="/" target="_blank" >${indexnews.title}</a></h3>
                        <div class="bloginfo"><span class="blogpic"><a href="/indexnewsInfo?indexnewsId=${indexnews.id}" title=""><img style="width: 225px;height: 105px;" src="${pageContext.request.contextPath}/${indexnews.image}"  /></a></span>
                            <p style="color: #9c7496;">${indexnews.des}</p>
                        </div>
                        <div class="autor"><span class="lm f_l"><a href="#">${user.netname}</a></span><span class="dtime f_l">${indexnews.createtime}</span><span class="viewnum f_l">浏览（<a href="/">${indexnews.pageview}</a>）</span><span class="pingl f_l">喜欢（<a href="/">${indexnews.click}</a>）</span><span class="f_r"><a href="/indexnewsInfo?indexnewsId=${indexnews.id}" class="more">阅读原文</a></span></div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="rightbox">
        <div class="aboutme">
            <h2 class="ab_title">关于我</h2>
            <div class="avatar"><img src="${pageContext.request.contextPath}/${user.image}" /></div>
            <div class="ab_con">
                <p>网名：${user.netname}</p>
                <p>职业：${user.job} </p>
                <p>籍贯：${user.address}</p>
                <p>邮箱：${user.email}</p>
            </div>
        </div>
        <div class="blank"></div>
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
                <c:forEach items="${studyByOrder}" var="study">
                    <li><b><a >${study.title}</a></b>
                        <p><i><a href="/studyInfo?studyId=${study.id}">
                            <img src="${pageContext.request.contextPath}/${study.image}">
                        </a></i>${study.des}</p>
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
    <p>Design by <a href="/">贺帅个人博客</a> <a href="/">蜀ICP备11111111号-1</a></p>
</footer>
</body>
</html>
