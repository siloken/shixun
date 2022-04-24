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
                                            公司名称：
                                        </div>
                                        <div class="col-md-5">
                                            ${info.companyName}
                                        </div>
                                        <div class="col-md-3">

                                        </div>
                                    </div>

                                    <div class="row" style="margin-top: 10px">
                                        <div class="col-md-1"></div>
                                        <div class="col-md-3">
                                            主营业务/主要产品：
                                        </div>
                                        <div class="col-md-5">
                                            ${info.mainServiceOrProduct}
                                        </div>
                                        <div class="col-md-3">

                                        </div>
                                    </div>

                                    <div class="row" style="margin-top: 10px">
                                        <div class="col-md-1"></div>
                                        <div class="col-md-3">
                                            主营行业：
                                        </div>
                                        <div class="col-md-5">
                                            ${info.mainIndustry}
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
                                <div class="box" style="background-color: rgb(255, 255, 255);"><img alt="" height="40"
                                                                                                    src="../../img/recruitment.JPG">
                                    <a href="<c:url value="/company/toPostRecruitment"/>">发布招聘</a>
                                </div>
                            </div>
                            <div class="col-md-5">

                            </div>
                            <div class="col-md-2"></div>
                        </div>
                        <div class="row">
                            <div class="col-md-5">

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
                                招聘发布记录
                            </div>
                            <div class="col-md-12">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>
                                            岗位
                                        </th>
                                        <th>
                                            薪酬范围
                                        </th>
                                        <th>
                                            地址
                                        </th>
                                        <th>
                                            学历要求
                                        </th>
                                        <th>
                                            全职/兼职
                                        </th>
                                        <th>
                                            招聘人数
                                        </th>
                                        <th>
                                            联系电话
                                        </th>
                                        <th>
                                            审核跟踪
                                        </th>
                                    </tr>
                                    </thead>

                                    <tbody>

                                    <c:choose>
                                        <c:when test="${null != recruitment}">
                                            <%
                                                String[] sty = {"table-active", "table-success", "table-warning", "table-danger"};
                                                int num = 0;
                                            %>
                                            <c:set var="style" scope="page" value="<%=sty%>"/>
                                            <c:forEach items="${recruitment}" var="rec">
                                                <tr class=<c:out value="<%=sty[num%4]%>"/>>

                                                    <td>
                                                            ${rec.jobTitle}
                                                    </td>
                                                    <td>
                                                            ${rec.lowSalary}~~${rec.highSalary}
                                                    </td>
                                                    <td>
                                                            ${rec.address}
                                                    </td>
                                                    <td>
                                                            ${rec.eduBackground}
                                                    </td>
                                                    <td>
                                                            ${rec.fullOrPartTime}
                                                    </td>
                                                    <td>
                                                            ${rec.numOfPeople}
                                                    </td>
                                                    <td>
                                                            ${rec.tel}
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${rec.recruitmentId == '0'}">
                                                                待审核
                                                            </c:when>
                                                            <c:when test="${rec.recruitmentId == '1'}">
                                                                已通过
                                                            </c:when>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                                <tr class=<c:out value="<%=sty[num%4]%>"/>>
                                                    <%num++;%>
                                                    <td style="" ><b>其他要求</b></td>
                                                    <td colspan="7"> ${rec.detail}</td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <p>null</p>
                                        </c:otherwise>
                                    </c:choose>

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

