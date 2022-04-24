<%--
  Created by IntelliJ IDEA.
  User: 12817
  Date: 2021/8/24
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>发布招标</title>
    <script type="text/javascript" src="../../js/layui/layui.js"></script>
    <script type="text/javascript" src="../../js/layer/layer.js"></script>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/style.css" rel="stylesheet">
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

<div class="container-fluid">
    <div class="row">
        <div class="col-md-1">
        </div>
        <div class="col-md-10">
            <div class="row">
                <div class="col-md-1">

                </div>
                <div class="col-md-10">
                    <p align="center" style="font-size: 34px">
                        政府招标
                    </p>
                </div>
                <div class="col-md-1">

                </div>
            </div>

            <div class="row" style="padding-left: 20%;padding-right: 20%;padding-bottom: 12%">
                <div class="col-md-12">
                    <form role="form" method="post" action="<c:url value="/admin/postbidding"/>" id="form1">

                        <div class="form-group">
                            <label for="job_title">
                                招标标题
                            </label>
                            <input name="title" type="text" class="form-control" id="job_title" maxlength="30">
                            <p id="p1" style="color: red"></p>
                        </div>

                        <div class="form-group">
                            <label for="address">
                                招标城市
                            </label>
                            <input name="city" type="text" class="form-control" id="address" maxlength="20">
                            <p id="p3" style="color: red"></p>
                        </div>

                        <div class="form-group">
                            <label for="funcTel">
                                主要咨询电话
                            </label>
                            <input name="functionaryTel" type="text" class="form-control" id="funcTel" maxlength="12">
                            <p id="p4" style="color: red"></p>
                        </div>

                        <div class="form-group">
                            <label for="funcName">
                                主要咨询人称呼
                            </label>
                            <input name="functionaryName" type="text" class="form-control" id="funcName" maxlength="10">
                            <p id="p5" style="color: red"></p>
                        </div>

                        <div class="form-group">
                            <p>招标详细内容</p>
                            <p id="p6" style="color: red"></p>
                            <label style="width:100%;height:130px;">
                                <textarea name="detail" id="detail" class="field_required" placeholder="内容不能超过1000个字..." maxlength="1100"
                                          style="width:100%;height:100%;"></textarea>
                            </label>
                        </div>


                        <input type="button" class="btn btn-primary" onclick="finallyCheck()" value="确定提交">

                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-1">
        </div>
    </div>
</div>

<script>
    function finallyCheck() {

        let point = 0;

        if (!emptyCheck(document.getElementById("job_title").value,"p1","招标标题不能为空")) {
            point -= 1;
        }

        if (!emptyCheck(document.getElementById("address").value,"p3","招标城市不能为空")) {
            point -= 1;
        }

        if (!telCheck(document.getElementById("funcTel").value,"p4")) {
            point -= 1;
        }

        if (!emptyCheck(document.getElementById("funcName").value,"p5","称呼不能为空")) {
            point -= 1;
        }

        if (!emptyCheck(document.getElementById("detail").value,"p6","招标详情不能为空")) {
            point -= 1;
        }

        if (point<0) {
            layui.use(['layer'], function () {
                const layer = layui.layer;  //layer初始化
                layer.msg("请检查输入格式", {time: 1600, shift: 6}, function () {
                })
            });
        } else {
            tips();
        }

    }

    function emptyCheck(value,id,string) {
        if (value.length === 0) {
            document.getElementById(id).innerHTML=string;
            return false;
        } else {
            return true;
        }
    }

    function telCheck(value, idP) {
        const var_text1 = value;
        const var_text2 = parseFloat(var_text1);
        const orgP = document.getElementById(idP);

        if (var_text1 === "") {
            orgP.innerHTML = "不能为空！";
            return false;
        } else if (isNaN(var_text2)) {
            orgP.innerHTML = "不是数字！";
            return false;
        } else if (var_text2 % 1 !== 0 || var_text2 < 0) {
            orgP.innerHTML = "请输入正整数！";
            return false;
        } else if (var_text1.length !== 11) {
            orgP.innerHTML = "当前填写电话号码为：" + var_text1.length + "位，请检查正确性";
            return false;
        } else if (var_text1.length !== ("" + var_text2).length) {
            orgP.innerHTML = "格式不正确！请检查输入是否为纯数字";
            return false;
        } else {
            return true;
        }
    }

</script>

<script type="javascript" src="../../js/jquery.min.js"></script>
<script type="javascript" src="../../js/bootstrap.min.js"></script>
<script type="javascript" src="../../js/scripts.js"></script>
<script>
    function tips() {
        layui.use(['layer'], function () {
            const layer = layui.layer;  //layer初始化
            /*layer.open({
                area: ['450px', '300px'],
                offset: ['150px', '35%'],
                content: '<h3>发布前请确认新闻内容</h3>  '
                    + '<br/><h5>确认无误请点击下方【发布】</h5>'
                    + '<br/><h5>成功发布后将会跳转主页</h5>',
                btn: ['发布'],
                yes: function (index, layero) {
                    //按钮【按钮一】的回调
                    /!*提交成功 ！页面刷新*!/
                    document.getElementById("form1").submit();
                },
                cancel: function () {
                    //右上角关闭回调
                    //return false; //开启该代码可禁止点击该按钮关闭
                }
            });*/
            layer.confirm('确认发布招标信息吗？', {
                btn: ['确认','更改'] //按钮
            }, function(){
                layer.msg('发布成功', {icon: 1});
                document.getElementById("form1").submit();
            }, function(){

            });
        });
    }
</script>
</body>
</html>
