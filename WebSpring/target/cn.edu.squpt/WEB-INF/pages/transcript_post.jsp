<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 12817
  Date: 2021/8/23
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>成绩录入</title>
    <script type="text/javascript" src="../../js/layui/layui.js"></script>
    <script type="text/javascript" src="../../js/layer/layer.js"></script>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

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

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-1">

                </div>
                <div class="col-md-10">
                    <p align="center" style="font-size: 34px">成绩录入</p>
                </div>
                <div class="col-md-1">

                </div>
                <div class="col-md-1">
                </div>
            </div>
            <div class="row">
                <div class="col-md-1">
                </div>
                <div class="col-md-10">

                    <div class="row" style="padding-left: 20%;padding-right: 20%;">

                        <div class="col-md-12" style="margin-bottom: 30px;margin-top: 30px">
                            <h5 style="font-size: 26px;margin-top: 10px">
                                <b>您好</b>
                            </h5>
                            <h5 style="font-size:20px; margin-top: 10px">
                                在这里提交成绩表（仅支持Excel格式）：
                            </h5>
                            <p id="p1" style="color: red;margin-top: 10px;margin-bottom: 10px"></p>
                        </div>

                        <div class="col-md-12">
                            <form action="<c:url value="/admin/posttranscript"/>" method="post" id="form1" enctype="multipart/form-data">
                                <label for="file"><b>选择文件:</b></label>
                                <input type="file" name="file" width="120px" class="form-control" id="file" style="margin-bottom: 30px">
                                <input type="button" value="上传" class="btn btn-primary" style="display: block;margin: 0 auto" onclick="finallyCheck()">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-1">
                </div>
            </div>
        </div>
    </div>
</div>
<script type="">

    function finallyCheck() {
        const reg = /(.*\/)*([^.]+).xls/;

        if (document.getElementById("file").value === ""){
            layui.use(['layer'], function () {
                const layer = layui.layer;  //layer初始化
                layer.msg("请选择上传的文件", {time: 1600, shift: 6}, function () {
                })
            });
        } else {
            if(!reg.test(document.getElementById("file").value)){
                layui.use(['layer'], function () {
                    const layer = layui.layer;  //layer初始化
                    layer.msg("文件格式不正确，请重新选择", {time: 1600, shift: 6}, function () {
                    })
                });
            } else {
                tips();
            }
        }
    }

    function tips() {
        document.getElementById("form1").submit();
        layer.msg('成绩录入成功', {icon: 1});
        /*layer.alert('成绩录入成功！', {
            time: 5*1000
            ,success: function(layero, index){
                var timeNum = this.time/1000, setText = function(start){
                    layer.title((start ? timeNum : --timeNum) + ' 秒后跳转主页', index);
                };
                setText(!0);
                this.timer = setInterval(setText, 1000);
                if(timeNum <= 0) {
                    clearInterval(this.timer);
                }
            }
            ,end: function(){
                clearInterval(this.timer);
            }
        });*/
    }

</script>
</body>

</html>
