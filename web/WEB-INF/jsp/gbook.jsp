<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/2
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>
<head>
    <meta charset="gb2312">
    <title>留言</title>
    <meta name="keywords" content="留言" />
    <meta name="description" content="	留言" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/skin/html/css/base.css" rel="stylesheet">
    <link href="/skin/html/css/index.css" rel="stylesheet">
    <link href="/skin/html/css/m.css" rel="stylesheet">
    <link href="/css/layer.css" rel="stylesheet">
    <script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
    <script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
    <script type="text/javascript" src="/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="/js/layer.js"></script>
    <script type="text/javascript" src="/js/layui.js"></script>
    <style>
        img{
            display:inline;
        }
    </style>
</head>
<body>
<header>
    <div id="mnav">
        <div class="logo"><a href="/">${user.netname}个人博客</a></div>
        <h2 id="mnavh"><span class="navicon"></span></h2>
        <ul id="starlist">
            <li><a href="/">网站首页</a></li>
            <li class=""><a href="/about">关于我</a></li>
            <li class=""><a href="/share">笑话分享</a></li>
            <li class=""><a href="/list">学无止境</a></li>
            <li class=""><a href="/gbook">留言</a></li>
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
        <script type="text/javascript">
            var editor;
            KindEditor.ready(function(K) {
                editor = K.create('textarea[test="content"]', {
                    allowFileManager : true
                });
            });
        </script>
</header>
<div class="line46"></div>
<div class="blank"></div>
<article>
    <div class="leftbox">
        <div class="infos">
            <div class="newsview">
                <h2 class="intitle">您现在的位置是：<a href='/'>首页</a>&nbsp;>&nbsp;留言</h2>
                <div class="gbook">

                    <c:forEach items="${pageInfo.list}" var="customergbook">
                        <div class="fb">
                            <ul>
                                <span class="tximg"><img style="height: 50px" width="50px" src="${pageContext.request.contextPath}/${customergbook.customer.image}"></span>
                                <p class="fbtime" style="color: #fc7c67;"><span style="color: #ec78f8;width: auto">${customergbook.createtime}</span>${customergbook.customer.username}</p>
                                <div id="article" class="fbinfo" >${customergbook.article}</div>
                            </ul>
                        </div>
                    </c:forEach>
                    <div class="pagelist">
                        <a title="Total record">${pageInfo.total}&nbsp;条留言&nbsp;&nbsp;<b>${pageInfo.pages}&nbsp;页</b> </a>&nbsp;&nbsp;
                        <a href="/gbook?currentPage=${pageInfo.firstPage}">首页</a>&nbsp;
                        <a href="/gbook?currentPage=${pageInfo.prePage}">上一页</a>&nbsp;
                        <c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
                            <a href="/gbook?currentPage=${pageNum}">${pageNum}</a>&nbsp;
                        </c:forEach>
                        <a href="/gbook?currentPage=${pageInfo.nextPage}">下一页</a>&nbsp;
                        <a href="/gbook?currentPage=${pageInfo.lastPage}">尾页</a></div>
                    </div>
                    <div class="gbox">
                        <form action="/writeGbook?custId=${customer.id}" method="post" name="form1" id="form1">
                            <p> <strong>来说点儿什么吧...</strong></p>

                            <p><span class="tnr">留言内容:</span>
                                <textarea test="content" style="width:690px;height:200px;visibility:hidden;" name="article"></textarea>
                            </p>
                            <p>
                                <c:if test="${customer!=null}">
                                    <input type="submit" name="Submit3" value="提交" />
                                </c:if>
                                <c:if test="${customer==null}">
                                    <input type="button" value="提交"  id="gbook" onclick="submit_gbook()">
                                </c:if>
                                <input name="enews" type="hidden" id="enews" value="AddGbook" />
                            </p>
                        </form>
                    </div>
                </div>
                <script>
                    $("#gbook").css({
                        "display": "block",
                        "background": "#040404",
                        "color": "#fff",
                        "border": "0",
                        "line-height": "30px",
                        "padding": "0 20px",
                        "border-radius": "5px",
                        "float": "right",
                    })
                    function submit_gbook() {
                        layer.msg('你还没有登录,是否跳转到登录界面?', {
                            time: 0 //不自动关闭
                            ,btn: ['登录', '取消']
                            ,yes: function(){
                                window.location.href="/customerLogin";
                            }
                        });

                    }
                    function myFun(sId) {
                        var oImg = document.getElementsByTagName('img');
                        for (var i = 0; i < oImg.length; i++) {
                            if (oImg[i].id == sId) {
                                oImg[i].previousSibling.previousSibling.checked = true;
                                oImg[i].style.opacity = '1';
                            } else {
                                oImg[i].style.opacity = '.8';
                            }
                        }
                    }
                </script>
            </div>
        </div>
    </div>
    <div class="rightbox">
        <div class="aboutme">
            <h2 class="ab_title">关于我</h2>
            <div class="avatar"><img src="${pageContext.request.contextPath}/${user.image}" /></div>
            <div class="ab_con">
                <p>网名：${user.netname}</p>
                <p>职业：${user.job}</p>
                <p>籍贯：${user.address}</p>
                <p>邮箱：${user.email}</p>
            </div>
        </div>
        <div class="weixin">
            <h2 class="ab_title">官方微信</h2>
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



