<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
            <li class="active">查询首页分享</li>
        </ol>
        <div class="ad_content">
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th width="10%">序号</th>
                    <th width="20%">标题</th>
                    <th width="10%">图片</th>
                    <th width="10%">时间</th>
                    <th width="20%">描述</th>
                    <th width="10%">访问量</th>
                    <th width="10%">点赞量</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${indexshareList}" var="indexshare" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>${indexshare.title}</td>
                        <td><img style="width: 50px;height: 50px;" src="${pageContext.request.contextPath}/${indexshare.image}"></td>
                        <td>${indexshare.createtime}</td>
                        <td>${indexshare.des}</td>
                        <td>${indexshare.pageview}</td>
                        <td>${indexshare.click}</td>
                        <td>

                            <%--<a style="background-color: #419c13" href="javascript:;" class="btn btn-sm btn-danger">修改</a>--%>
                            <button onclick="findIndexshare(${indexshare.id})" type="button" style="padding: 6px 12px;font-size: 12px" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#edit">
                                修改
                            </button>
                            <a onclick="deleteIndexshare(${indexshare.id})" href="javascript:;" class="btn btn-sm btn-danger">删除</a>
                        </td>
                        <script>
                            function deleteIndexshare(id) {
                                layer.msg('确定删除该首页分享?', {
                                    time: 0 //不自动关闭
                                    ,btn: ['确定', '取消']
                                    ,yes: function(){
                                        window.location.href="/deleteIndexshare?id="+id;
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
            <script>
                function  getPath(){
                    var pathName = document.location.pathname;
                    var index = pathName.substr(1).indexOf("/");
                    var result = pathName.substr(0,index+1);
                    return result;
                }
                function findIndexshare(id) {
                    $.post(
                        "/findIndexshareById",
                        {id:id},
                        function (data) {
                            $("#title").val(data.title);
                            $("#cid").val(data.cid);
                            $("#image").attr("src",getPath()+"/"+data.image);
                            $("#des").val(data.des);
                            editor.html(data.article);
                            $("#id").val(data.id);
                        },
                        "json"
                    );
                }
            </script>

            <!-- Modal -->
            <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">修改首页分享</h4>
                        </div>
                        <div class="modal-body">
                            <form method="post" enctype="multipart/form-data" action="/editIndexshare">
                                <input id="id" type="hidden" name="id">
                                <div class="form-group">
                                    <label >标题:</label>
                                    <input id="title" type="text" value="" name="title"/>
                                </div>
                                <div class="form-group">
                                    <label >类别:</label>
                                    <select id="cid" name="cid" >
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
                                    <img id="image" style="width: 50px;height: 50px;" src="" alt="未添加图片">
                                    <input type="file" name="imageFile"/>
                                </div>
                                <div>
                                    <label >简述:</label>
                                    <input id="des" type="text" value="" name="des">
                                </div>
                                <div class="form-group">
                                    <p><span class="tnr">文章内容:</span>
                                        <textarea  test="content" style="width: 100%;height:100%;visibility:hidden;" name="article"></textarea>
                                    </p>
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


        </div>
    </div>
</section>
</body>
</html>
