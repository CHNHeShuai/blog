<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/2
  Time: 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="gb2312">
    <title>首页_${user.netname}个人博客 </title>
    <meta name="keywords" content="个人博客,${user.netname}个人博客,个人博客模板,${user.netname}" />
    <meta name="description" content="${user.netname}个人博客" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/base.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
    <link href="css/m.css" rel="stylesheet">
    <script src="js/jquery.min.js" type="text/javascript"></script>

    <!--[if lt IE 9]>
    <script src="js/modernizr.js"></script>
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
                <h2 class="intitle">您现在的位置是：<a href="#">具体内容</a></h2>
                <h3 class="news_title">${message.title}</h3>
                <div class="news_author"><span class="au01" style="color: #f858b8;">${user.netname}</span><span class="au02">${message.createtime}</span><span style="color: #5695fc;" class="au03">共<b>${message.pageview}</b>人围观</span></div>
                <div class="tags">
                    <c:if test="${message.cid==1}">
                        <a href="/">程序员</a>
                    </c:if>
                    <c:if test="${message.cid==2}">
                        <a href="/">老师</a>
                    </c:if>
                    <c:if test="${message.cid==3}">
                        <a href="/">学生</a>
                    </c:if>
                    <c:if test="${message.cid==4}">
                        <a href="/">产品经理</a>
                    </c:if>
                    <c:if test="${message.cid==5}">
                        <a href="/">产品总监</a>
                    </c:if>
                    <c:if test="${message.cid==6}">
                        <a href="/">总经理</a>
                    </c:if>
                </div>
                <div class="news_about" style="color: #5aaff8;"><strong>简介</strong>${message.des}</div>
                <div class="news_infos">
                    <p><img src="${message.image}"></p>
                    <p>${message.article}</p>
                </div>
            </div>
            <div class="share">
                <c:if test="${message.tab=='indexshare'}">
                    <p class="diggit"><a onclick="indexshare(${message.id})"  href="javascript:;"> 很赞哦！ </a>
                        (<b id="indexshareClick" ><script type="text/javascript" src="/e/public/ViewClick/?classid=2&amp;id=20&amp;down=5"></script>${message.click}</b>)
                    </p>
                    <script>
                        function indexshare(id) {
                            $.post(
                                "/addIndexshareClick",
                                {id:id},
                                function (data) {
                                    $("#indexshareClick").text(data.click);
                                },
                                "json"
                            );
                        }
                    </script>
                </c:if>
                <c:if test="${message.tab=='indextuijian'}">
                    <p class="diggit"><a onclick="indextuijian(${message.id})" href="javascript:;"> 很赞哦！ </a>
                        (<b id="indextuijianClick"><script type="text/javascript" src="/e/public/ViewClick/?classid=2&amp;id=20&amp;down=5"></script>${message.click}</b>)
                    </p>
                    <script>
                        function indextuijian(id) {
                            $.post(
                                "/addIndextuijianClick",
                                {id:id},
                                function (data) {
                                    $("#indextuijianClick").text(data.click);
                                },
                                "json"
                            );
                        }
                    </script>
                </c:if>
                <c:if test="${message.tab=='indexnews'}">
                    <p class="diggit"><a onclick="indexnews(${message.id})" href="javascript:;"> 很赞哦！ </a>
                        (<b id="indexnewsClick"><script type="text/javascript" src="/e/public/ViewClick/?classid=2&amp;id=20&amp;down=5"></script>${message.click}</b>)
                    </p>
                    <script>
                        function indexnews(id) {
                            $.post(
                                "/addIndexnewsClick",
                                {id:id},
                                function (data) {
                                    $("#indexnewsClick").text(data.click);
                                },
                                "json"
                            );
                        }
                    </script>
                </c:if>
                <c:if test="${message.tab=='share'}">
                    <p class="diggit"><a onclick="share(${message.id})" href="javascript:;"> 很赞哦！ </a>
                        (<b id="shareClick"><script type="text/javascript" src="/e/public/ViewClick/?classid=2&amp;id=20&amp;down=5"></script>${message.click}</b>)
                    </p>
                    <script>
                        function share(id) {
                            $.post(
                                "/addShareClick",
                                {id:id},
                                function (data) {
                                    $("#shareClick").text(data.click);
                                },
                                "json"
                            );
                        }
                    </script>
                </c:if>
                <c:if test="${message.tab=='study'}">
                    <p class="diggit"><a onclick="study(${message.id})" href="javascript:;"> 很赞哦！ </a>
                        (<b id="studyClick" ><script type="text/javascript" src="/e/public/ViewClick/?classid=2&amp;id=20&amp;down=5"></script>${message.click}</b>)
                    </p>
                    <script>
                        function study(id) {
                            $.post(
                                "/addStudyClick",
                                {id:id},
                                function (data) {
                                    $("#studyClick").text(data.click);
                                },
                                "json"
                            );
                        }
                    </script>
                </c:if>

                <p class="dasbox"><a href="javascript:void(0)" onclick="dashangToggle()" class="dashang" title="打赏，支持一下">打赏本站</a></p>
                <div class="hide_box" style="display: none;"></div>
                <div class="shang_box" style="display: none;"> <a class="shang_close" href="javascript:void(0)" onclick="dashangToggle()" title="关闭">关闭</a>
                    <div class="shang_tit">
                        <p>感谢您的支持，我会继续努力的!</p>
                    </div>
                    <div class="shang_payimg"> <img style="width: 140px ;height: 140px;" src="${pageContext.request.contextPath}/${weizhi.zhifubao}" alt="扫码支持" title="扫一扫"> </div>
                    <div class="pay_explain">扫码打赏，你说多少就多少</div>
                    <div class="shang_payselect">
                        <div class="pay_item checked" data-id="${weizhi.zhifubao}"> <span class="radiobox"></span> <span class="pay_logo"><img src="../../images/alipay.jpg" alt="支付宝"></span> </div>
                        <div class="pay_item" data-id="${weizhi.weixin}"> <span class="radiobox"></span> <span class="pay_logo"><img src="../../images/wechat.jpg" alt="微信"></span> </div>
                    </div>
                    <script type="text/javascript">
                        function  getPath(){
                            var pathName = document.location.pathname;
                            var index = pathName.substr(1).indexOf("/");
                            var result = pathName.substr(0,index+1);
                            return result;
                        }
                        $(function(){
                            $(".pay_item").click(function(){
                                $(this).addClass('checked').siblings('.pay_item').removeClass('checked');
                                var dataid=$(this).attr('data-id');
                                $(".shang_payimg img").attr("src",getPath()+"/"+dataid);
                                $("#shang_pay_txt").text(dataid=="alipay"?"支付宝":"微信");
                            });
                        });
                        function dashangToggle(){
                            $(".hide_box").fadeToggle();
                            $(".shang_box").fadeToggle();
                        }
                    </script>
                </div>
            </div>
            <!--share end-->
            <div class="zsm"><p>打赏本站，你说多少就多少</p><img src="${pageContext.request.contextPath}/${weizhi.zhifubao}"></div>
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

