<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 12817
  Date: 2021/8/20
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <link rel="Bookmark" type="image/x-icon" href="../../img/favicon.ico" />
    <link rel="icon" type="image/x-icon" href="../../img/favicon.ico" />
    <link rel="shortcut icon" type="image/x-icon" href="../../img/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>用户登录</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>login</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link type="text/css" href="../../css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" href="../../css/style.css" rel="stylesheet">

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

        <security:authorize access="hasAnyRole('ADMIN','CITIZEN','COMPANY')">
            <div class="col-md-1" style="float: right;margin-right: 0">
                <a style="color: white" href="<c:url value="/logout"/>">注销</a>
            </div>

            <div  style="float: right;margin-right: 0;text-align: left;color: white;display: inline">
                <security:authentication property="principal.username"/>
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
                </div>
                <div class="col-md-1">

                </div>

            </div>
            <div class="row">
                <div class="col-md-12">
                    <h2 align="center" style="font-size: 38px;color: #c9302c">修改密码</h2>
                </div>

            </div>
            <br/>
            <br/>
            <div class="row">
                <div class="col-md-4" align="center">

                </div>
                <div class="col-md-4" align="center">
                    <h3 style="font-size: 20px">
                        修改密码
                    </h3>
                </div>
                <div class="col-md-4" align="center">

                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <form role="form">

                    </form>
                </div>
                <div class="col-md-4">
                    <form role="form" id="form1" action="<c:url value="/user/resetpasswordsecond"/>" method="post">


                        <div class="form-group">

                        </div>
                        <div class="checkbox">

                        </div>
                        <button type="button" class="btn btn-primary" style="display: block;margin: 0 auto" onclick="finallyCheck()">
                            确认
                        </button>
                    </form>
                </div>
                <div class="col-md-4">
                    <form role="form">


                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-1">
        </div>
    </div>
</div>

<script>
    function emptyCheck(value,id,string) {
        if (value.length === 0) {
            document.getElementById(id).innerHTML=string+"不能为空";
            return false;
        } else {
            return true;
        }
    }
    function nameAndPassCheck(value,id,string) {
        if (emptyCheck(value,id,string)) {
            if (value.length < 3 || value.length > 12) {
                document.getElementById(id).innerHTML="请检查"+string+"长度是否正确";
                return false;
            }  else {
                return true;
            }
        } else {
            return true;
        }
    }
    function finallyCheck() {

        let point = 0;

        if (!nameAndPassCheck(document.getElementById("exampleInputEmail2").value,"p1","密码")) {
            point -= 1;
        }

        if (!nameAndPassCheck(document.getElementById("exampleInputPassword2").value,"p2","密码确认")) {
            point -= 1;
        }

        if (document.getElementById("exampleInputPassword1").value !== document.getElementById("exampleInputEmail1").value) {
            point -= 1;
            document.getElementById("p2").innerHTML = "两次密码不一致，请重新确认";
        }

        if (point<0) {
            layui.use(['layer'], function () {
                const layer = layui.layer;  //layer初始化
                layer.msg("请检查输入格式", {time: 1600, shift: 6}, function () {
                })
            });
        } else {
            document.getElementById("form1").submit();
        }
    }
</script>

<script type="javascript" src="../../js/jquery.min.js"></script>
<script type="javascript" src="../../js/bootstrap.min.js"></script>
<script type="javascript" src="../../js/scripts.js"></script>
</body>
</html>
