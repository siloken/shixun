<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: 12817
  Date: 2021/9/3
  Time: 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="utf-8" content="">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>个人主页</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link type="text/css" href="../../css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" href="../../css/style.css" rel="stylesheet">

    <script src="../../js/jquery.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/scripts.js"></script>
    <script src="../../js/layer/layer.js"></script>


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

        <div style="display: inline;color: white">

        </div>

        <div class="col-md-1" style="width: 50px">

        </div>

        <div style="display: inline;color: white">

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

            <div style="float: right;margin-right: 0;text-align: left;color: white;display: inline">
                <security:authentication property="principal.username"/>
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
                    <p align="center" style="font-size: 34px">个人主页</p>
                </div>
                <div class="col-md-1">

                </div>
                <div class="col-md-1">
                </div>
            </div>

            <div class="row">
                <div class="col-md-1">
                </div>

                <div class="col-md-5">
                    <div class="row">
                        <div class="col-md-12"
                             style="background-color: #2aabd2;height: 30px;text-align: center;color: white">
                            账号信息
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12" style="color: white;min-height: 60px">
                            <div class="row">
                                <div class="col-md-1"></div>
                                <div class="col-md-10" style="color: #464a4c;font-size: 20px">
                                    <div class="row" style="margin-top: 10px">
                                        <div class="col-md-1"></div>
                                        <div class="col-md-3">
                                            账号：
                                        </div>
                                        <div class="col-md-5">
                                            ${info.registerName}
                                        </div>
                                        <div class="col-md-3">
                                            <button onclick="window.location.href='<c:url value="/user/toresetpassword"/>'" style="font-size: 12px;display: block;height: 100%">
                                                修改密码
                                            </button>
                                        </div>
                                    </div>

                                    <div class="row" style="margin-top: 10px">
                                        <div class="col-md-1"></div>
                                        <div class="col-md-3">
                                            账号类型：
                                        </div>
                                        <div class="col-md-5">
                                            ${info.roleName}账号
                                        </div>
                                        <div class="col-md-3">

                                        </div>
                                    </div>

                                    <div class="row" style="margin-top: 10px">
                                        <div class="col-md-1"></div>
                                        <div class="col-md-3">
                                            真实姓名：
                                        </div>
                                        <div class="col-md-5">
                                            ${info.citizenName}
                                        </div>
                                        <div class="col-md-3">

                                        </div>
                                    </div>

                                    <div class="row" style="margin-top: 10px">
                                        <div class="col-md-1"></div>
                                        <div class="col-md-3">
                                            性别：
                                        </div>
                                        <div class="col-md-5">
                                            ${info.sex}
                                        </div>
                                        <div class="col-md-3">

                                        </div>
                                    </div>


                                    <div class="row" style="margin-top: 10px">
                                        <div class="col-md-1"></div>
                                        <div class="col-md-3">
                                            年龄：
                                        </div>
                                        <div class="col-md-5">
                                            ${info.age}
                                        </div>
                                        <div class="col-md-3">

                                        </div>
                                    </div>

                                    <div class="row" style="margin-top: 10px">
                                        <div class="col-md-1"></div>
                                        <div class="col-md-3">
                                            婚姻状况：
                                        </div>
                                        <div class="col-md-5">
                                            ${info.isMarried}
                                        </div>
                                        <div class="col-md-3">

                                        </div>
                                    </div>

                                    <div class="row" style="margin-top: 10px">
                                        <div class="col-md-1"></div>
                                        <div class="col-md-3">
                                            身份证号：
                                        </div>
                                        <div class="col-md-5">
                                            ${info.idCard}
                                        </div>
                                        <div class="col-md-3">

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-1"></div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-md-5">
                    <div class="col-md-12"
                         style="background-color: #2aabd2;height: 30px;text-align: center;color: white">
                        业务办理
                    </div>
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-5">
                                <div class="box" style="background-color: rgb(255, 255, 255);width: 100%"><img alt=""
                                                                                                               height="40"
                                                                                                               src="../../img/advice.JPG">
                                    <a href="<c:url value="/citizen/toleavemessage" />">提出意见</a>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="box" style="background-color: rgb(255, 255, 255);width: 100%"><img alt=""
                                                                                                               height="40"
                                                                                                               src="../../img/marry.JPG">
                                    <a href="<c:url value="/citizen/toMarriageAppointment" />">结婚预约</a>
                                </div>
                            </div>
                            <div class="col-md-2"></div>
                        </div>
                        <div class="row">
                            <div class="col-md-5">
                                <div class="box" style="background-color: rgb(255, 255, 255);width: 100%"><img alt=""
                                                                                                               height="40"
                                                                                                               src="../../img/divide.JPG">
                                    <a href="<c:url value="/citizen/toDivorceAppointment" />">离婚预约</a>
                                </div>
                            </div>
                            <div class="col-md-5">

                            </div>
                            <div class="col-md-2"></div>
                        </div>
                    </div>
                </div>

                <div class="col-md-1">
                </div>
            </div>

            <div class="col-md-1">
            </div>
        </div>

        <div class="col-md-12">
            <div class="row" style="margin-top: 12px">
                <div class="col-md-1">
                </div>

                <div class="col-md-10">
                    <div class="col-md-12"
                         style="background-color: #2aabd2;height: 30px;text-align: center;color: white">
                        部分业务记录
                    </div>
                    <div class="col-md-12">

                        <div class="col-md-11" style="margin: 10px auto 10px">
                            <div class="col-md-12"
                                 style="background-color: #2aabd2;height: 30px;text-align: center;color: white;margin-top: 10px">
                                留言记录
                            </div>
                            <div class="col-md-12">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th style="min-width:8% !important;">
                                            提出者
                                        </th>
                                        <th style="min-width:29% !important;">
                                            意见信息
                                        </th>
                                        <th style="min-width:8% !important;">
                                            发送日期
                                        </th>
                                        <th style="min-width:10% !important;">
                                            反馈跟踪
                                        </th>
                                        <th style="min-width:8% !important;">
                                            反馈者
                                        </th>
                                        <th style="min-width:29% !important;">
                                            反馈信息
                                        </th>
                                        <th style="min-width:8% !important;">
                                            反馈日期
                                        </th>

                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:choose>
                                        <c:when test="${null != message}">

                                            <%
                                                String[] sty = {"table-active", "table-success", "table-warning", "table-danger"};
                                                int num = 0;
                                            %>
                                            <c:set var="style" scope="page" value="<%=sty%>"/>
                                            <c:forEach items="${message}" var="message">
                                                <tr class=<c:out value="<%=sty[num%4]%>"/>>
                                                    <%num += 1;%>
                                                    <td>
                                                            ${message.citizen.citizenName}
                                                    </td>
                                                    <td>
                                                            ${message.message}
                                                    </td>
                                                    <td>
                                                            ${message.dateTimeInsert}
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${message.messageId == 0}">
                                                                待反馈
                                                            </c:when>
                                                            <c:when test="${message.messageId == 1}">
                                                                已反馈
                                                            </c:when>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${message.messageId == 0}">
                                                                -
                                                            </c:when>
                                                            <c:when test="${message.messageId == 1}">
                                                                政府工作人员
                                                            </c:when>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${message.respond == null}">
                                                                -
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${message.respond}
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${message.dateTimeApproved == null}">
                                                                -
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${message.dateTimeApproved}
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <p>暂时没有留言记录哦</p>
                                        </c:otherwise>
                                    </c:choose>
                                    <!--table-success,table-warning,table-danger-->
                                    </tbody>
                                </table>
                            </div>

                            <div class="col-md-12"
                                 style="background-color: #2aabd2;height: 30px;text-align: center;color: white;margin-top: 10px">
                                结婚预约记录
                            </div>
                            <div class="col-md-12">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th >
                                            男方姓名
                                        </th>
                                        <th >
                                            男方身份证
                                        </th>
                                        <th >
                                            女方姓名
                                        </th>
                                        <th>
                                            女方身份证
                                        </th>
                                        <th >
                                            预约日期
                                        </th>
                                        <th >
                                            预约地点
                                        </th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${null != marriage}">
                                            <%
                                                String[] sty = {"table-active", "table-success", "table-warning", "table-danger"};
                                                int num = 0;
                                            %>
                                            <c:set var="style" scope="page" value="<%=sty%>"/>
                                            <c:forEach items="${marriage}" var="appointment">
                                                <tr class=<c:out value="<%=sty[num%4]%>"/>>

                                                    <td>
                                                            ${appointment.manName}
                                                    </td>
                                                    <td>
                                                            ${appointment.manId}
                                                    </td>
                                                    <td>
                                                            ${appointment.womanName}
                                                    </td>
                                                    <td>
                                                            ${appointment.womanId}
                                                    </td>
                                                    <td>
                                                            ${appointment.date}
                                                    </td>
                                                    <td>
                                                            ${appointment.address}
                                                    </td>
                                                </tr>
                                                <tr class=<c:out value="<%=sty[num%4]%>"/>>
                                                    <%num++;%>
                                                    <td></td>
                                                    <td style="" > <b>联系电话1</b></td>
                                                    <td >${appointment.tel1}</td>
                                                    <td style="" ><b>联系电话2</b></td>
                                                    <td > ${appointment.tel2}</td>
                                                    <td colspan="2"></td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <p>无记录</p>
                                        </c:otherwise>
                                    </c:choose>
                                    <!--table-success,table-warning,table-danger-->
                                    </tbody>
                                </table>
                            </div>

                            <div class="col-md-12"
                                 style="background-color: #2aabd2;height: 30px;text-align: center;color: white;margin-top: 10px">
                                离婚预约记录
                            </div>
                            <div class="col-md-12">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th >
                                            男方姓名
                                        </th>
                                        <th >
                                            男方身份证
                                        </th>
                                        <th >
                                            女方姓名
                                        </th>
                                        <th>
                                            女方身份证
                                        </th>
                                        <th >
                                            预约日期
                                        </th>
                                        <th >
                                            预约地点
                                        </th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${null != divorce}">
                                            <%
                                                String[] sty = {"table-active", "table-success", "table-warning", "table-danger"};
                                                int num = 0;
                                            %>
                                            <c:set var="style" scope="page" value="<%=sty%>"/>
                                            <c:forEach items="${divorce}" var="appointment">
                                                <tr class=<c:out value="<%=sty[num%4]%>"/>>

                                                    <td>
                                                            ${appointment.manName}
                                                    </td>
                                                    <td>
                                                            ${appointment.manId}
                                                    </td>
                                                    <td>
                                                            ${appointment.womanName}
                                                    </td>
                                                    <td>
                                                            ${appointment.womanId}
                                                    </td>
                                                    <td>
                                                            ${appointment.date}
                                                    </td>
                                                    <td>
                                                            ${appointment.address}
                                                    </td>
                                                </tr>
                                                <tr class=<c:out value="<%=sty[num%4]%>"/>>
                                                    <%num++;%>
                                                    <td></td>
                                                    <td style="" ><b>联系电话1</b></td>
                                                    <td > ${appointment.tel1}</td>
                                                    <td style="" ><b>联系电话2</b></td>
                                                    <td > ${appointment.tel2}</td>
                                                    <td colspan="2"></td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <p>无记录</p>
                                        </c:otherwise>
                                    </c:choose>
                                    <!--table-success,table-warning,table-danger-->
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-md-1">
                </div>
            </div>
        </div>
    </div>
</div>


</body>

</html>

