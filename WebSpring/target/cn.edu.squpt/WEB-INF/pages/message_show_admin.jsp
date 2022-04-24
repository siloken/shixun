<%--
  Created by IntelliJ IDEA.
  User: 12817
  Date: 2021/8/20
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>massageBrowse</title>
    <script type="text/javascript" src="../../js/layui/layui.js"></script>
    <script type="text/javascript" src="../../js/layer/layer.js"></script>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/style.css" rel="stylesheet">
    <link type="text/css" href="../../js/layui/css/layui.css" rel="stylesheet">

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
                        意见浏览
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
                            <th style="min-width:10% !important;">
                                序号
                            </th>
                            <th style="min-width:10% !important;">
                                提交人
                            </th>
                            <th style="min-width:10% !important;">
                                提交人性别
                            </th>
                            <th style="min-width:10% !important;">
                                提交人年龄
                            </th>
                            <th style="min-width:50% !important;">
                                意见信息
                            </th>
                            <th style="min-width:10% !important;">
                                发送日期
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
                            <c:when test="${null != messages}">
                                <%
                                    String[] sty = {"table-active", "table-success", "table-warning", "table-danger"};
                                    int num = 0;
                                %>
                                <c:set var="style" scope="page" value="<%=sty%>"/>
                                <c:forEach items="${messages}" var="message">
                                    <c:set var="numC" value="<%=num%>" scope="page"/>
                                    <tr class=<c:out value="<%=sty[num%4]%>"/>>
                                        <td>
                                            <%=num += 1%>
                                        </td>
                                        <td>
                                                ${message.citizen.citizenName}
                                        </td>
                                        <td>
                                                ${message.citizen.sex}
                                        </td>
                                        <td>
                                                ${message.citizen.age}
                                        </td>
                                        <td>
                                                ${message.message}
                                        </td>
                                        <td>
                                                ${message.dateTimeInsert}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="5" style="margin-top: 0;height: 75px">
                                            <c:set var="messageC" value='<%="message"+num%>' scope="page"/>
                                            <c:set var="pC" value='<%="p"+num%>' scope="page"/>
                                            <label style="width: 100%;height: 75px">
                                                <!--class="field_required" style="width:100%;height:100%;"-->
                                                <textarea class="form-control" name="message" id="${messageC}"
                                                          placeholder="反馈内容不能超过1000个字..." maxlength="1000"
                                                          style="width: 100%;height:100%;"></textarea>
                                            </label>
                                            <p style="color: red" id="${pC}"></p>
                                        </td>
                                        <td style="margin-top: 0;height: 75px">
                                            <button onclick="finallyCheck('${messageC}','${pC}',this,${message.messageId})"
                                                    type="submit" class="btn btn-primary"
                                                    style="display: block;margin: 15px auto 0;">
                                                确认反馈
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <p>还没有未处理的留言哦</p>
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
                            value="/admin/showmessage?pageId=1"/>'" class="btn btn-primary"
                            style="margin-left: 3%;padding-left: 10px;padding-right: 10px">首页
                    </button>
                    <c:if test="${pageId != 1}">
                        <button onclick="window.location.href='<c:url
                                value="/admin/showmessage?pageId=${pageId-1}"/>'"
                                class="btn btn-primary"
                                style="margin-left: 3%">${pageId-1}</button>
                    </c:if>

                    <button class="btn btn-primary"
                            style="margin-left: 3%;background-color: #1e9fff">${pageId}
                    </button>

                    <c:if test="${(pageId)<pageIdMax}">
                        <button onclick="window.location.href='<c:url
                                value="/admin/showmessage?pageId=${pageId+1}"/>'" class="btn btn-primary"
                                style="margin-left: 3%">${pageId+1}</button>

                        <c:if test="${(pageId+1)<pageIdMax}">
                            <button onclick="window.location.href='<c:url
                                    value="/admin/showmessage?pageId=${pageId+2}"/>'" class="btn btn-primary"
                                    style="margin-left: 3%">${pageId+2}</button>

                            <c:if test="${(pageId+2)<pageIdMax}">
                                <button onclick="window.location.href='<c:url
                                        value="/admin/showmessage?pageId=${pageId+3}"/>'" class="btn btn-primary"
                                        style="margin-left: 3%">${pageId+3}</button>
                            </c:if>
                        </c:if>
                    </c:if>

                    <button onclick="window.location.href='<c:url
                            value="/admin/showmessage?pageId=${pageIdMax}"/>'" class="btn btn-primary"
                            style="margin-left: 3%;padding-left: 10px;padding-right: 10px">尾页
                    </button>
                </div>

                <div class="col-md-4"></div>
            </div>

        </div>
    </div>
</div>

<script>

    function approved(idT,messageId) {
        const respond = document.getElementById(idT).value;
        let xmlHttp;
        if (window.XMLHttpRequest) {
            xmlHttp = new XMLHttpRequest();
        } else {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }

        xmlHttp.open("POST", "<c:url value="/admin/checkmessage"/>", true);
        xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xmlHttp.send("messageId=" + messageId+"&respond=" + respond);
    }

    function finallyCheck(idT, idP, org,messageId) {
        reSubmit();

        if (emptyCheck(document.getElementById(idT).value, idP, "内容不能为空")) {

            approved(idT,messageId);
            org.style.backgroundColor = "green";
            org.innerHTML = "反馈成功!";
            org.disable = true;

        } else {
            layui.use(['layer'], function () {
                const layer = layui.layer;  //layer初始化
                layer.msg("请填写反馈内容", {time: 1600, shift: 6}, function () {
                })
            });
        }

    }

    function reSubmit() {
        const texObjs = document.getElementsByTagName("p");

        for (let i = 0; i < texObjs.length; i++) {
            texObjs[i].innerHTML = "&nbsp;";
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

<script type="javascript" src="../../js/jquery.min.js"></script>
<script type="javascript" src="../../js/bootstrap.min.js"></script>
<script type="javascript" src="../../js/scripts.js"></script>
</body>
</html>
