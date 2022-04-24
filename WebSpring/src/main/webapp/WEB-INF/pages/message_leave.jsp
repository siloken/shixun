<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 12817
  Date: 2021/8/20
  Time: 9:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>意见留言</title>
    <script type="text/javascript" src="../../js/layui/layui.js"></script>
    <script type="text/javascript" src="../../js/layer/layer.js"></script>

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
<%
    String username = "";
    String roleName = "";

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if (c.getName().equals("username")) {
                username = c.getValue();
            }
            if (c.getName().equals("roleName")) {
                roleName = c.getValue();
            }
        }
    } else {
        username = "cookie null";
    }
%>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-1">


                </div>
                <div class="col-md-10">
                    <p align="center" style="font-size: 34px">反馈页面</p>
                </div>
                <div class="col-md-1">

                </div>

            </div>
            <div class="row">
                <div class="col-md-1">
                </div>
                <div class="col-md-10">

                    <div class="row" style="padding-left: 20%;padding-right: 20%;">
                        <div class="col-md-12" style="margin-top: 25px">
                            <h4 style="font-size: 25px">
                                <b>欢迎留言</b>
                            </h4>

                        </div>

                        <div class="col-md-12" style="margin-top: 25px">
                            <p>
                                您好<%=roleName%>&nbsp;:&nbsp;<%=username%>
                            </p>
                        </div>

                        <div class="col-md-12" style="margin-top: 25px;margin-bottom: 25px">
                            <p>
                                在这里留下您的意见：
                            </p>

                            <form id="form1" action="<c:url value="/citizen/leavemessage"/>" method="post">
                                <p id="p1" style="color: red"></p>
                                <label style="width: 100%;height: 300px"><!--class="field_required" style="width:100%;height:100%;"-->
                                    <textarea id="message" name="message" placeholder="反馈内容不能超过1000个字..." maxlength="1000"
                                              style="width: 100%;height:100%;"></textarea>
                                </label>
                                <input type="button" class="btn btn-primary" style="display: block;margin: 0 auto" onclick="finallyCheck()" value="确认">
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

<script>

    function finallyCheck() {

        if (emptyCheck(document.getElementById("message").value,"p1","内容不能为空")) {
            tips();
        } else {
            layui.use(['layer'], function () {
                const layer = layui.layer;  //layer初始化
                layer.msg("请检查输入格式", {time: 1600, shift: 6}, function () {
                })
            });
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

</script>

<script type="javascript" src="../../js/jquery.min.js"></script>
<script type="javascript" src="../../js/bootstrap.min.js"></script>
<script type="javascript" src="../../js/scripts.js"></script>
<script>
    function tips() {
        layui.use(['layer'], function () {
            const layer = layui.layer;  //layer初始化
            layer.confirm('确认提交意见吗？', {
                btn: ['确认','更改'] //按钮
            }, function(){
                layer.msg('提交成功', {icon: 1});
                document.getElementById("form1").submit();
            }, function(){

            });
        });
    }
</script>
</body>
</html>
