<%--
  Created by IntelliJ IDEA.
  User: 12817
  Date: 2021/8/27
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>新闻发布</title>
    <script type="text/javascript" src="../../js/jquery.min.js"></script>
    <script type="text/javascript" src="../../js/layui/layui.js"></script>
    <script type="text/javascript" src="../../js/layer/layer.js"></script>
    <script type="text/javascript" charset="utf-8" src="../../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../../ueditor/ueditor.all.min.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="../../ueditor/lang/zh-cn/zh-cn.js"></script>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link type="text/css" href="../../css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" href="../../css/style.css" rel="stylesheet">
    <link type="text/css" href="../../js/layui/css/layui.css" rel="stylesheet">


</head>
<body>
<header>
    <% int role = 0;%>
    <security:authorize access="hasAnyRole('ADMIN','CITIZEN','COMPANY')">
        <% role++; %>
    </security:authorize>

    <div class="row" style="background-color: #2aabd2;height: 30px;text-align: center">

        <div class="col-md-1" style="width: 50px;">
            <a style="color: white" href="<c:url value="/"/>">主页</a>
        </div>
        <div style="display: inline;color: white">
            |
        </div>

        <div class="col-md-1" style="width: 50px">
            <a style="color:white;" href="<c:url value="/user/shownewstitles?pageId=1"/>"> 新闻</a>
        </div>
        <div style="display: inline;color: white">
            |
        </div>

        <div class="col-md-1" style="width: 50px">
            <a style="color:white;" href="<c:url value="/user/showRecruitment?pageId=1"/>"> 招聘信息</a>
        </div>
        <div style="display: inline;color: white">
            |
        </div>

        <div class="col-md-1" style="width: 50px">

        </div>

        <div class="col-md-1" style="width: 50px">

        </div>

        <div class="col-md-1" style="display: block;">

        </div>
        <div class="col-md-1" style="display: block;">

        </div>
        <div class="col-md-1" style="display: block;">

        </div>
        <div style="width: 6.4%;display: block">

        </div>


        <div style="display: inline;color: white">
            |
        </div>
        <div class="col-md-1" style="float: right">
            <a style="color:white;" href="<c:url value="/user/toregister"/>"> 注册</a>
        </div>
        <div style="display: inline;color: white">
            |
        </div>

        <% if (role == 0) {%>

        <div class="col-md-1" style="float: right;margin-right: 0">
            <a style="color:white;" href="<c:url value="/user/tologin"/>"> 登录</a>
        </div>

        <%} else { %>

        <security:authorize access="hasRole('ADMIN')">
            <div class="col-md-1" style="float: right;margin-right: 0">
                <a style="color: white" href="<c:url value="/logout"/>">注销</a>
            </div>

            <div  style="float: right;margin-right: 0;text-align: left;color: white;display: inline">
                <security:authentication property="principal.username"/>
            </div>
        </security:authorize>

        <security:authorize access="hasRole('CITIZEN')">
            <div class="col-md-1" style="float: right;margin-right: 0">
                <a style="color: white" href="<c:url value="/logout"/>">注销</a>
            </div>

            <div  style="float: right;margin-right: 0;text-align: left;color: white;display: inline">
                <a href="<c:url value="/citizen/showPersonalPage"/>" style="color: white">
                    <security:authentication property="principal.username"/>
                </a>
            </div>
        </security:authorize>

        <security:authorize access="hasRole('COMPANY')">
            <div class="col-md-1" style="float: right;margin-right: 0">
                <a style="color: white" href="<c:url value="/logout"/>">注销</a>
            </div>

            <div  style="float: right;margin-right: 0;text-align: left;color: white;display: inline">
                <a href="<c:url value="/company/showPersonalPage"/>" style="color: white">
                    <security:authentication property="principal.username"/>
                </a>
            </div>
        </security:authorize>

        <%}%>


    </div>
    <img alt="Bootstrap Image Preview" src="../../img/header.jpg" width="100%">
</header>

<div class="container-fluid" style="margin-bottom: 20px">
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-1">

                </div>
                <div class="col-md-10">
                    <p align="center" style="font-size: 34px">新闻发布</p>
                </div>
                <div class="col-md-1">

                </div>
            </div>
            <div class="row" style="margin-bottom: 20px;padding-bottom: 20px">
                <div class="col-md-1">
                </div>
                <div class="col-md-10">
                    <form id="form1" action="<c:url value="/admin/postnews"/>" method="post">

                        <div class="row" style="padding-left: 20%;padding-right: 20%;">

                            <div class="col-md-12">


                                <div class="form-group">
                                    <label for="newTitle">
                                        标题
                                    </label>
                                    <br>
                                    <input name="title" type="text" class="form-control" id="newTitle">
                                    <p id="p1" style="color: red"></p>
                                </div>

                                <div class="form-group">
                                    <label for="subtitle">
                                        副标题（选填）
                                    </label>
                                    <br>
                                    <input name="subtitle" type="text" class="form-control" id="subtitle">
                                    <p id="p2" style="color: red"></p>
                                </div>

                                <div class="form-group">
                                    新闻板块：
                                    &nbsp;&nbsp;<label for="country">国家新闻</label><input type="radio" id="country"
                                                                                        name="regionalPlate"
                                                                                        value="1">
                                    &nbsp;&nbsp;<label for="city">自贡新闻</label><input type="radio" id="city"
                                                                                     name="regionalPlate"
                                                                                     value="2">
                                    <p id="p3" style="color: red"></p>
                                </div>
                            </div>
                        </div>

                        <div class="row" style="padding-left: 10%;padding-right: 10%;">
                            <div class="form-group">
                                <p>正文</p>
                                <script id="editor" type="text/plain" style="width:100%;height:500px;"></script>
                            </div>
                        </div>

                        <div class="row" style="padding-left: 10%;padding-right: 10%;">
                            <input type="button" class="btn btn-primary" style="display: block;margin: 0 auto"
                                   onclick="finallyCheck()" value="确认发布">
                        </div>
                    </form>

                </div>
                <div class="col-md-1">
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    // 实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    const ue = UE.getEditor('editor');

    UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
    UE.Editor.prototype.getActionUrl = function (action) {
        if (action === 'uploadimage' || action === 'uploadscrawl' || action === 'uploadimage') {
            return '<c:url value="/uploadImage"/>';
        } else {
            return this._bkGetActionUrl.call(this, action);
        }
    }

</script>

<script type="javascript" src="../../js/bootstrap.min.js"></script>
<script type="javascript" src="../../js/scripts.js"></script>

<script>

    function finallyCheck() {

        if (emptyCheck(document.getElementById("newTitle").value, "p1", "标题不能为空")) {
            if (labelCheck()) {
                tips();
                //document.getElementById("form1").submit();
            } else {
                layui.use(['layer'], function () {
                    const layer = layui.layer;  //layer初始化
                    layer.msg("请检查输入格式", {time: 1600, shift: 6}, function () {
                    })
                });
            }
        } else {
            layui.use(['layer'], function () {
                const layer = layui.layer;  //layer初始化
                layer.msg("请检查输入格式", {time: 1600, shift: 6}, function () {
                })
            });
        }

    }

    function labelCheck() {
        if (!document.getElementById("city").checked && !document.getElementById("country").checked) {
            document.getElementById("p3").innerHTML = "请选定一个选项";
            return false;
        } else {
            return true;
        }
    }

    function emptyCheck(value, id, string) {
        if (value.length === 0) {
            document.getElementById(id).innerHTML = string;
            return false;
        } else {
            return true;
        }
    }

</script>

<script>

    function tips() {
        layui.use(['layer'], function () {
            const layer = layui.layer;  //layer初始化
            layer.open({
                area: ['450px', '300px'],
                offset: '200px',
                content: '<h3>发布前请确认新闻内容</h3>  '
                    + '<br/><h5>确认无误请点击下方【发布】</h5>'
                    + '<br/><h5>成功发布后将会跳转主页</h5>',
                btn: ['发布'],
                yes: function (index, layero) {
                    //按钮【按钮一】的回调
                    /*提交成功 ！页面刷新*/
                    document.getElementById("form1").submit();
                },
                cancel: function () {
                    //右上角关闭回调
                    //return false; //开启该代码可禁止点击该按钮关闭
                }
            });
        });
    }

</script>
</body>
</html>
