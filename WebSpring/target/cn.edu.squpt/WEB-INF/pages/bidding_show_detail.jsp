<%@ page import="cn.edu.cqupt.domain.Bidding" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 12817
  Date: 2021/8/20
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>招标信息</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/style.css" rel="stylesheet">

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

                    <div class="col-md-1">
                    </div>

                    <%
                        Bidding bidding = (Bidding) request.getAttribute("bidding");
                    %>

                    <div class="row">
                        <h1 style="margin-bottom: 40px;margin-top: 50px;text-align: center;width: 100%">
                            <%=bidding.getTitle()%>
                        </h1>
                        <h2 style="margin-bottom: 5px;margin-top: 5px;text-align: center;width: 100%">
                            发布时间： <%=bidding.getDateTime()%>
                        </h2>
                        <br>
                        <h2 style="margin-bottom: 5px;margin-top: 5px;text-align: center;width: 100%">
                            招标城市： <%=bidding.getCity()%>
                        </h2>
                        <h4 style="margin-bottom: 5px;margin-top: 5px;text-align: center;width: 100%">
                            咨询电话：<%=bidding.getFunctionaryTel()%>&nbsp;&nbsp;&nbsp;<%=bidding.getFunctionaryName()%>
                        </h4>
                        <p style="margin-bottom: 20px;margin-top: 20px;">
                            <%=bidding.getDetail()%>
                        </p>
                    </div>

                    <div class="col-md-1">
                    </div>

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

        if (!emptyCheck(document.getElementById("job_title").value, "p1", "职业名称不能为空")) {
            point -= 1;
        }

        if (!emptyCheck(document.getElementById("edu_background").value, "p2", "请选择一项学历要求")) {
            point -= 1;
        }

        if (!emptyCheck(document.getElementById("address").value, "p3", "工作地址不能为空")) {
            point -= 1;
        }

        if (!numCheck(document.getElementById("numOfPeople").value, "p4")) {
            point -= 1;
        }

        if (!labelCheck()) {
            point -= 1;
        }

        if (!numCheck(document.getElementById("high_salary").value, "p6")) {
            point -= 1;
        }

        if (!numCheck(document.getElementById("low_salary").value, "p7")) {
            point -= 1;
        }

        if (!telCheck(document.getElementById("tel").value, "p8")) {
            point -= 1;
        }

        if (point < 0) {
            alert("请检查输入格式");
        } else {
            document.getElementById("form1").submit();
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

    function labelCheck() {
        if (!document.getElementById("fullTime").checked && !document.getElementById("partTime").checked) {
            document.getElementById("p5").innerHTML = "请选定一个选项";
            return false;
        } else {
            return true;
        }
    }

    function telCheck(value, idP) {
        const length = value.length;

        if (numCheck(value, idP)) {
            if (length !== 8 && length !== 11) {
                document.getElementById("p8").innerHTML = "填写的电话为" + length + "位，请检查填写的正确性"
                return false;
            } else {
                return true;
            }
        } else {
            return false;
        }
    }

    function numCheck(value, idP) {

        const valueToNum = parseFloat(value);
        const orgP = document.getElementById(idP);

        if (value === "") {
            orgP.innerHTML = "内容不能为空";
            return false;
        } else if (isNaN(valueToNum)) {
            orgP.innerHTML = "内容必须为数字";
            return false;
        } else if (value !== valueToNum.toString()) {
            orgP.innerHTML = "请检查格式是否正确";
            return false;
        } else if (valueToNum % 1 !== 0 || valueToNum <= 0) {
            orgP.innerHTML = "数字必须为正整数";
            return false;
        } else {
            return true;
        }
    }

</script>

<script type="javascript" src="../../js/jquery.min.js"></script>
<script type="javascript" src="../../js/bootstrap.min.js"></script>
<script type="javascript" src="../../js/scripts.js"></script>
</body>
</html>