<%--
  Created by IntelliJ IDEA.
  User: 12817
  Date: 2021/8/27
  Time: 11:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>

<html lang="en" style="padding-bottom: 30px">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>新闻一览</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/style.css" rel="stylesheet">

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

<div class="container-fluid" style="margin-bottom: 40px">
    <div class="row">
        <div class="col-md-1">
        </div>
        <div class="col-md-10">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-1">

                        </div>
                        <div class="col-md-10">
                            <h3 align="center">
                                新闻浏览
                            </h3>
                        </div>
                        <div class="col-md-1">

                        </div>

                    </div>
                    <br/>

                    <div class="row">
                        <div class="regulations">
                            近期新闻
                        </div>
                    </div>
                    <table class="table">
                        <thead>
                        <tr>
                            <th style="min-width:5% !important;">
                                序号
                            </th>
                            <th style="min-width:75% !important;">
                                新闻标题
                            </th>
                            <th style="min-width:20% !important;">
                                新闻发布时间
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
                        </tr>

                        <c:choose>
                            <c:when test="${null != news}">
                                <%
                                    String[] sty = {"table-active", "table-success", "table-warning", "table-danger"};
                                    int num = 0;
                                %>
                                <c:set var="style" scope="page" value="<%=sty%>"/>
                                <c:forEach items="${news}" var="news">
                                    <tr class=<c:out value="<%=sty[num%4]%>"/>>
                                        <td>
                                            <%=++num%>
                                        </td>
                                        <td>
                                            <a style="color: #1d1e1f"
                                               href="<c:url value="/user/shownewstext?newsId=${news.newsId}"/>">${news.title}</a>
                                        </td>
                                        <td>
                                                ${news.dateTime}
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <p>null</p>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>

                    <div class="row" style="margin-top: 20px">
                        <div class="col-md-4"></div>

                        <c:set value="${pageId}" var="pageId"/>
                        <c:set value="${pageIdMax}" var="pageIdMax"/>
                        <div class="col-md-4">
                            <button onclick="window.location.href='<c:url
                                    value="/user/shownewstitles?pageId=1"/>'" class="btn btn-primary"
                                    style="margin-left: 3%;padding-left: 10px;padding-right: 10px">首页
                            </button>
                            <c:if test="${pageId != 1}">
                                <button onclick="window.location.href='<c:url
                                        value="/user/shownewstitles?pageId=${pageId-1}"/>'"
                                        class="btn btn-primary"
                                        style="margin-left: 3%">${pageId-1}</button>
                            </c:if>

                            <button class="btn btn-primary"
                                    style="margin-left: 3%;background-color: #1e9fff">${pageId}
                            </button>

                            <c:if test="${(pageId)<pageIdMax}">
                                <button onclick="window.location.href='<c:url
                                        value="/user/shownewstitles?pageId=${pageId+1}"/>'" class="btn btn-primary"
                                        style="margin-left: 3%">${pageId+1}</button>

                                <c:if test="${(pageId+1)<pageIdMax}">
                                    <button onclick="window.location.href='<c:url
                                            value="/user/shownewstitles?pageId=${pageId+2}"/>'" class="btn btn-primary"
                                            style="margin-left: 3%">${pageId+2}</button>

                                    <c:if test="${(pageId+2)<pageIdMax}">
                                        <button onclick="window.location.href='<c:url
                                                value="/user/shownewstitles?pageId=${pageId+3}"/>'" class="btn btn-primary"
                                                style="margin-left: 3%">${pageId+3}</button>
                                    </c:if>
                                </c:if>
                            </c:if>

                            <button onclick="window.location.href='<c:url
                                    value="/user/shownewstitles?pageId=${pageIdMax}"/>'" class="btn btn-primary"
                                    style="margin-left: 3%;padding-left: 10px;padding-right: 10px">尾页
                            </button>
                        </div>

                        <div class="col-md-4"></div>
                    </div>

                </div>
            </div>
        </div>
        <div class="col-md-1">
        </div>
    </div>
</div>

<script src="../../js/jquery.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/scripts.js"></script>
</body>
</html>
