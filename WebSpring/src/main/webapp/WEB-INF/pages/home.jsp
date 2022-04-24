<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>自贡集约化平台</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link type="text/css" href="../../css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" href="../../css/style.css" rel="stylesheet">

    <style>
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        li {
            list-style-type: none;
            padding: 0;
            margin: 0 0 5px;
        }

        ul li a {
            color: #464a4c;
        }
    </style>

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
            <a style="color:white;" href="#toService"> 业务办理</a>
        </div>

        <div style="display: inline;color: white">
            |
        </div>

        <div class="col-md-1" style="width: 50px">
            <a style="color:white;" href="#toHref"> 相关链接</a>
        </div>

        <div style="display: inline;color: white">
            |
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

    <div align="center">
        <img src="../../img/header.jpg" width="100%" alt="">
    </div>
</header>


<div class="container-fluid">
    <div class="row">

        <div class="col-md-1" style="display: block">

        </div>

        <div class="col-md-10">
            <div class="row">
                <div class="col-md-12">
                    <img src="../../img/title.JPG" width="100%" height="105px" alt="">
                </div>
            </div>
        </div>

        <div class="col-md-1" style="display:block;">

        </div>

    </div>
    <div class="row">
        <div class="col-md-1">

        </div>
        <div class="col-md-10">
            <div class="row">
                <div class="col-md-12">

                    <div class="row">
                        <div class="col-md-6">
                            <!-- 建立一个div控件作为图片框 -->
                            <div style="height: 100%;margin-top: 5px">
                                <!-- alt：图片路径失败时替换显示内容 -->
                                <img class="img-slide img" src="../../img/change1.JPG" alt="img1" style="height: 100%">
                                <img class="img-slide img" src="../../img/change5.JPG" alt="img2" style="height: 100%">
                                <img class="img-slide img" src="../../img/change4.JPG" alt="img3" style="height: 100%">
                                <img class="img-slide img" src="../../img/change2.JPG" alt="img4" style="height: 100%">
                                <img class="img-slide img" src="../../img/change3.JPG" alt="img5" style="height: 100%">
                            </div>


                        </div>

                        <div class="col-md-6" style="margin-top: 5px">
                            <div id="zigong_news" class="tabody" style="margin-top: 5px;height: 50%">
                                <div class="_cms1_WAR_CMSportlet_INSTANCE_EzyZF9Hzh43s_-tabcon" style="">
                                    <table style="width: 100%">
                                        <tbody>
                                        <tr valign="top">
                                            <td class="colpos-0">
                                                <span class="regulations"
                                                      style="display: inline-block;width: 100%; margin-bottom: 6px;">
                                                    <a style="color: white"
                                                       href="<c:url value="/user/shownewstitles?pageId=1"/>">自贡新闻</a>
                                                </span>
                                                <ul>
                                                    <c:choose>
                                                        <c:when test="${null != cityNews}">
                                                            <c:forEach items="${cityNews}" var="cityNews">
                                                                <li><a target="_blank"
                                                                       href="<c:url value="/user/shownewstext?newsId=${cityNews.newsId}"/>"
                                                                       style="float:left; font-size: 16px;width:80%; display:block; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">${cityNews.title}</a><span
                                                                        style="float:right;">[${cityNews.dateTime}]</span>
                                                                </li>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <li><a target="_blank"
                                                                   style="float:left; font-size: 16px;width:80%; display:block; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">......暂无新闻......</a><span
                                                                    style="float:right;">[]</span></li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </ul>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div id="country_news" class="tabody" style="margin-top: 5px;height: 50%">
                                <div class="_cms1_WAR_CMSportlet_INSTANCE_EzyZF9Hzh43s_-tabcon" style="">
                                    <table style="width: 100%">
                                        <tbody>
                                        <tr valign="top">
                                            <td class="colpos-0">
                                                <span class="regulations"
                                                      style="display: inline-block;width: 100%; margin-bottom: 6px;">
                                                    <a style="color: white"
                                                       href="<c:url value="/user/shownewstitles?pageId=1"/>">国家新闻</a>
                                                </span>
                                                <ul>
                                                    <c:choose>
                                                        <c:when test="${null != countryNews}">
                                                            <c:forEach items="${countryNews}" var="countryNews">
                                                                <li><a target="_blank"
                                                                       href="<c:url value="/user/shownewstext?newsId=${countryNews.newsId}"/>"
                                                                       style="float:left; font-size: 16px;width:80%; display:block; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">${countryNews.title}</a><span
                                                                        style="float:right;">[${countryNews.dateTime}]</span>
                                                                </li>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <li><a target="_blank"
                                                                   style="float:left; font-size: 16px;width:80%; display:block; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">......暂无新闻......</a><span
                                                                    style="float:right;">[]</span></li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </ul>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>


                        </div>
                    </div>
                    <div class="row" style="margin-top: 10px">
                        <div class="col-md-12">
                            <div class="regulation" style="width: 100%">
                                招聘信息
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>
                                        序号
                                    </th>
                                    <th>
                                        公司名称
                                    </th>
                                    <th>
                                        岗位
                                    </th>
                                    <th>
                                        薪酬范围
                                    </th>
                                    <th style="width: 100px;text-align: center;">
                                        <a href="<c:url value="/user/showRecruitment?pageId=1"/>" target="_blank"
                                           style="padding-top: 2px;height: 30px;background-color: #2aabd2;color: white;border-radius: 15px;display: block">更多</a>
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
                                                    <%=num += 1%>
                                                </td>
                                                <td>
                                                        ${rec.company.getCompanyName()}
                                                </td>
                                                <td>
                                                        ${rec.jobTitle}
                                                </td>
                                                <td>
                                                        ${rec.lowSalary}~~${rec.highSalary}
                                                </td>
                                                <td></td>
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
                    <div class="row">
                        <div class="col-md-12">
                            <div id="toService" class="regulation" style="width: 100%">
                                办理业务
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="box" style="background-color: rgb(255, 255, 255);"><img alt="" height="40"
                                                                                                src="../../img/grade.JPG">
                                <a href="<c:url value="/user/tochecktranscript" />">成绩查询</a>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="box" style="background-color: rgb(255, 255, 255);"><img alt="" height="40"
                                                                                                src="../../img/Inkedmassage_LI.jpg">
                                <a href="<c:url value="/user/showmessage?pageId=1" />">查看意见</a>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="box" style="background-color: rgb(255, 255, 255);"><img alt="" height="40"
                                                                                                src="../../img/recruitment.JPG">
                                <a href="<c:url value="/user/showRecruitment?pageId=1"/>">查看招聘</a>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="box" style="background-color: rgb(255, 255, 255);"><img alt="" height="40"
                                                                                                src="../../img/recruitment.JPG">
                                <a href="<c:url value="/user/showbidding?pageId=1"/>">查看招标</a>
                            </div>
                        </div>
                    </div>

                    <security:authorize access="hasRole('CITIZEN')">

                        <div class="row">
                            <div class="col-md-3">
                                <div class="box" style="background-color: rgb(255, 255, 255);"><img alt="" height="40"
                                                                                                    src="../../img/advice.JPG">
                                    <a href="<c:url value="/citizen/toleavemessage" />">提出意见</a>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="box" style="background-color: rgb(255, 255, 255);"><img alt="" height="40"
                                                                                                    src="../../img/marry.JPG">
                                    <a href="<c:url value="/citizen/toMarriageAppointment" />">结婚预约</a>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="box" style="background-color: rgb(255, 255, 255);"><img alt="" height="40"
                                                                                                    src="../../img/divide.JPG">
                                    <a href="<c:url value="/citizen/toDivorceAppointment" />">离婚预约</a>
                                </div>
                            </div>
                        </div>
                    </security:authorize>

                    <security:authorize access="hasRole('COMPANY')">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="box" style="background-color: rgb(255, 255, 255);"><img alt="" height="40"
                                                                                                    src="../../img/recruitment.JPG">
                                    <a href="<c:url value="/company/toPostRecruitment"/>">发布招聘</a>
                                </div>
                            </div>
                        </div>
                    </security:authorize>

                    <security:authorize access="hasRole('ADMIN')">

                        <div class="row">
                            <div class="col-md-3">
                                <div class="box" style="background-color: rgb(255, 255, 255);"><img alt="" height="40"
                                                                                                    src="../../img/advice.JPG">
                                    <a href="<c:url value="/admin/showmessage?pageId=1" />">审核意见</a>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="box" style="background-color: rgb(255, 255, 255);"><img alt="" height="40"
                                                                                                    src="../../img/marry.JPG">
                                    <a href="<c:url value="/admin/showMarriage?pageId=1" />">查询结婚预约记录</a>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="box" style="background-color: rgb(255, 255, 255);"><img alt="" height="40"
                                                                                                    src="../../img/divide.JPG">
                                    <a href="<c:url value="/admin/showDivorce?pageId=1" />">查询离婚预约记录</a>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="box" style="background-color: rgb(255, 255, 255);"><img alt="" height="40"
                                                                                                    src="../../img/advice.JPG">
                                    <a href="<c:url value="/admin/showRecruitment?pageId=1"/>">审核招聘</a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="box" style="background-color: rgb(255, 255, 255);"><img alt="" height="40"
                                                                                                    src="../../img/advice.JPG">
                                    <a href="<c:url value="/admin/toposttranscript" />">录入成绩</a>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="box" style="background-color: rgb(255, 255, 255);"><img alt="" height="40"
                                                                                                    src="../../img/advice.JPG">
                                    <a href="<c:url value="/admin/topostbidding" />">发布招标</a>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="box" style="background-color: rgb(255, 255, 255);"><img alt="" height="40"
                                                                                                    src="../../img/advice.JPG">
                                    <a href="<c:url value="/admin/topostnews" />">新闻发布</a>
                                </div>
                            </div>
                        </div>
                    </security:authorize>


                    <div class="row">
                        <div class="col-md-12">
                            <div id="toHref" class="regulation" style="width: 100%">
                                有关链接
                            </div>
                        </div>
                        <div class="col-md-12" style="margin-bottom: 100px">
                            <div class="row">
                                <div class="col-md-3" align="center">
                                    <a href="http://www.zg.gov.cn/new" target="_blank">自贡市人民政府网站集约化平台门户</a>
                                </div>
                                <div class="col-md-3" align="center">
                                    <a href="http://www.rongzhou.gov.cn/web/mobile" target="_blank">自贡市政府网站集约化平台首页</a>
                                </div>
                                <div class="col-md-3" align="center">
                                    <a href="http://www.zg.gov.cn/ldlb" target="_blank">自贡市人民政府领导</a>
                                </div>
                                <div class="col-md-3" align="center">
                                    <a href="http://zgs.sczwfw.gov.cn/?areaCode=510300000000"
                                       target="_blank">四川政府服务网</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-1">
                </div>
            </div>
        </div>
        <div class="col-md-1">

        </div>
    </div>
</div>
<script type="javascript" src="../../js/jquery.min.js"></script>
<script type="javascript" src="../../js/bootstrap.min.js"></script>
<script type="javascript" src="../../js/scripts.js"></script>
</body>
<script type="text/javascript">
    // index：索引， len：长度
    let index = 0, len;
    // 类似获取一个元素数组
    const imgBox = document.getElementsByClassName("img-slide");
    len = imgBox.length;
    imgBox[index].style.display = 'block';

    // 逻辑控制函数
    function slideShow() {
        index++;
        // 防止数组溢出
        if (index >= len) index = 0;
        // 遍历每一个元素
        for (let i = 0; i < len; i++) {
            imgBox[i].style.display = 'none';
        }
        // 每次只有一张图片显示
        imgBox[index].style.display = 'block';
    }

    // 定时器，间隔3s切换图片
    setInterval(slideShow, 3000);

</script>
</html>