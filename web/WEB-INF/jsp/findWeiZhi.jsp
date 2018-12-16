<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
            <li class="active">查询首页新闻</li>
        </ol>
        <div class="ad_content">
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th width="40%">微信</th>
                    <th width="40%">支付宝</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><img style="width: 330px;height: 330px;" src="${pageContext.request.contextPath}/${weizhi.weixin}"></td>
                        <td><img style="width: 330px;height: 330px;" src="${pageContext.request.contextPath}/${weizhi.zhifubao}"></td>
                        <td>
                            <button type="button" onclick="findWeizhi(1)" style="width: 330px;height: 330px; font-size: 75px" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#edit">
                                修改
                            </button>
                        </td>
                    </tr>

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
                function findWeizhi(id) {
                    $.post(
                        "/findWeizhiById",
                        {id:id},
                        function (data) {
                            $("#weixinimage").attr("src",getPath()+"/"+data.weixin);
                            $("#zhifubaoimage").attr("src",getPath()+"/"+data.zhifubao);
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
                            <h4 class="modal-title" id="myModalLabel">修改微信支付宝图片</h4>
                        </div>
                        <div class="modal-body">
                            <form method="post" enctype="multipart/form-data" action="/updateWeizhi">
                                <input  type="hidden" name="id" value="1">
                                <div class="form-group">
                                    <label >上传微信收款码:</label>
                                    <img id="weixinimage" style="width: 50px;height: 50px;" src="">
                                    <input type="file" name="weixinimage"/>
                                </div>
                                <div class="form-group">
                                    <label >上传支付宝收款码:</label>
                                    <img id="zhifubaoimage" style="width: 50px;height: 50px;" src="">
                                    <input type="file" name="zhifubaoimage"/>
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
