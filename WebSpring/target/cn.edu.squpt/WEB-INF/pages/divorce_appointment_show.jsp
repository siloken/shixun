<%@ page isELIgnored ="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 12817
  Date: 2021/8/20
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>预约记录</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link type="text/css" href="../../css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" href="../../css/style.css" rel="stylesheet">

</head>
<style>
    table td {
        border-right: 1px solid white;
    }

</style>
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
                    <p align="center" style="font-size: 34px">
                        预约查看
                    </p>
                </div>
                <div class="col-md-1">

                </div>
            </div>

            <div class="row">
                <div class="col-md-1">
                </div>

                <div class="col-md-10">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>
                                序号
                            </th>
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
                        <tr>
                            <td>

                            </td>
                            <td>

                            </td>
                            <td>

                            </td>
                            <td>

                            </td>
                            <td>

                            </td>
                            <td>

                            </td>
                        </tr>
                        <c:choose>
                            <c:when test="${null != appointment}">
                                <%
                                    String[] sty = {"table-active", "table-success", "table-warning", "table-danger"};
                                    int num = 0;
                                %>
                                <c:set var="style" scope="page" value="<%=sty%>"/>
                                <c:forEach items="${appointment}" var="appointment">
                                    <tr class=<c:out value="<%=sty[num%4]%>"/>>
                                        <td>
                                            <b><%=num+1%></b>
                                        </td>
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
                                        <td style="" >联系电话1</td>
                                        <td > ${appointment.tel1}</td>
                                        <td style="" >联系电话2</td>
                                        <td > ${appointment.tel2}</td>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                        <td>

                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <p>null</p>
                            </c:otherwise>
                        </c:choose>
                        <!--table-success,table-warning,table-danger-->
                        </tbody>
                    </table>
                </div>

                <div class="col-md-1">
                </div>
            </div>

            <div class="row" style="margin-top: 20px">
                <div class="col-md-4"></div>

                <c:set value="${pageId}" var="pageId"/>
                <c:set value="${pageIdMax}" var="pageIdMax"/>
                <div class="col-md-4">
                    <button onclick="window.location.href='<c:url
                            value="/admin/showDivorce?pageId=1"/>'" class="btn btn-primary"
                            style="margin-left: 3%;padding-left: 10px;padding-right: 10px">首页
                    </button>
                    <c:if test="${pageId != 1}">
                        <button onclick="window.location.href='<c:url
                                value="/admin/showDivorce?pageId=${pageId-1}"/>'"
                                class="btn btn-primary"
                                style="margin-left: 3%">${pageId-1}</button>
                    </c:if>

                    <button class="btn btn-primary"
                            style="margin-left: 3%;background-color: #1e9fff">${pageId}
                    </button>

                    <c:if test="${(pageId)<pageIdMax}">
                        <button onclick="window.location.href='<c:url
                                value="/admin/showDivorce?pageId=${pageId+1}"/>'" class="btn btn-primary"
                                style="margin-left: 3%">${pageId+1}</button>

                        <c:if test="${(pageId+1)<pageIdMax}">
                            <button onclick="window.location.href='<c:url
                                    value="/admin/showDivorce?pageId=${pageId+2}"/>'" class="btn btn-primary"
                                    style="margin-left: 3%">${pageId+2}</button>

                            <c:if test="${(pageId+2)<pageIdMax}">
                                <button onclick="window.location.href='<c:url
                                        value="/admin/showDivorce?pageId=${pageId+3}"/>'" class="btn btn-primary"
                                        style="margin-left: 3%">${pageId+3}</button>
                            </c:if>
                        </c:if>
                    </c:if>

                    <button onclick="window.location.href='<c:url
                            value="/admin/showDivorce?pageId=${pageIdMax}"/>'" class="btn btn-primary"
                            style="margin-left: 3%;padding-left: 10px;padding-right: 10px">尾页
                    </button>
                </div>

                <div class="col-md-4"></div>
            </div>

        </div>
    </div>
</div>


<script type="javascript" src="../../js/jquery.min.js"></script>
<script type="javascript" src="../../js/bootstrap.min.js"></script>
<script type="javascript" src="../../js/scripts.js"></script>
</body>
</html>
