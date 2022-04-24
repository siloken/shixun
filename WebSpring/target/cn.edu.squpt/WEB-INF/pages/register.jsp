<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>用户注册</title>
    <script type="text/javascript" src="../../js/layui/layui.js"></script>
    <script type="text/javascript" src="../../js/layer/layer.js"></script>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/style.css" rel="stylesheet">
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
<div class="container-fluid" style="margin-bottom: 5%">
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-1">
                </div>
                <div class="col-md-10">
                    <div align="center" style="font-size: 34px">
                        用户注册
                    </div>
                </div>
                <div class="col-md-1">
                </div>
            </div>

            <div class="row">

                <div class="col-md-1"></div>

                <div class="col-md-5">
                    <button id="cit" type="button" class="btn btn-success" style="float: right">
                        普通用户注册
                    </button>
                </div>
                <div class="col-md-5">
                    <button id="com" type="button" class="btn btn-success" style="float: left">
                        企业用户注册
                    </button>
                </div>

                <div class="col-md-1"></div>

            </div>

            <div class="row">
                <div class="col-md-1" style="display: block"></div>

                <div id="citizenRegister" style="display: none" class="col-md-10">
                    <div class="col-md-12">
                        <div align="center" style="font-size: 20px">
                            普通用户注册
                        </div>
                    </div>
                    <form role="form" id="citizen" action="<c:url value="/citizen/register"/>" method="post" style="margin: 0 20% 0;">
                        <div class="form-group">
                            <label for="username">
                                账号
                            </label>
                            <input type="text" class="form-control" id="username" name="registerName">
                            <p id="p1" style="color: red"></p>
                        </div>
                        <div class="form-group">
                            <label for="password">
                                密码
                            </label>
                            <input type="password" class="form-control" id="password" name="registerPass">
                            <p id="p2" style="color: red"></p>
                        </div>
                        <div class="form-group">
                            <label for="password2">
                                确认密码
                            </label>
                            <input type="password" class="form-control" id="password2">
                            <p id="p3" style="color: red"></p>
                        </div>
                        <div class="form-group">
                            <label for="citizenName">
                                姓名
                            </label>
                            <input type="text" class="form-control" id="citizenName" name="citizenName">
                            <p id="p4" style="color: red"></p>
                        </div>
                        <div class="form-group">

                            <label for="idCard">
                                身份证号
                            </label>
                            <input type="text" class="form-control" id="idCard" name="idCard">
                            <p id="p5" style="color: red"></p>
                        </div>
                        <div class="form-group">
                            性别：
                            &nbsp;&nbsp;<label for="partTime">男</label><input type="radio" id="partTime" name="sex"
                                                                              value="男">
                            &nbsp;&nbsp;<label for="fullTime">女</label><input type="radio" id="fullTime" name="sex"
                                                                              value="女">
                            <p id="p6" style="color: red"></p>
                        </div>
                        <div class="form-group">

                            <label for="age">
                                年龄
                            </label>
                            <input type="text" class="form-control" id="age" name="age">
                            <p id="p7" style="color: red"></p>
                        </div>
                        <button type="button" class="btn btn-primary" onclick="finallyCheck0()">
                            注册
                        </button>
                    </form>
                </div>

                <div id="companyRegister" style="display: none" class="col-md-10">
                    <div class="col-md-12">
                        <div align="center" style="font-size: 20px">
                            企业用户注册
                        </div>
                    </div>
                    <form role="form" id="company" action="<c:url value="/company/register"/>" method="post" style="margin: 0 20% 0;">
                        <div class="form-group">
                            <label for="usernameC">
                                账号
                            </label>
                            <input type="text" class="form-control" id="usernameC" name="registerName">
                            <p id="p8" style="color: red"></p>
                        </div>
                        <div class="form-group">
                            <label for="passwordC">
                                密码
                            </label>
                            <input type="text" class="form-control" id="passwordC" name="registerPass">
                            <p id="p9" style="color: red"></p>
                        </div>
                        <div class="form-group">
                            <label for="password2C">
                                确认密码
                            </label>
                            <input type="text" class="form-control" id="password2C">
                            <p id="p10" style="color: red"></p>
                        </div>
                        <div class="form-group">
                            <label for="company_name">
                                公司名称
                            </label>
                            <input type="text" class="form-control" id="company_name" name="companyName">
                            <p id="p11" style="color: red"></p>
                        </div>
                        <div class="form-group">

                            <label for="mainIndustry">
                                主营行业
                            </label>
                            <input type="text" class="form-control" id="mainIndustry" name="mainIndustry">
                            <p id="p12" style="color: red"></p>
                        </div>
                        <div class="form-group">

                            <label for="mainServiceOrProduct">
                                主要业务
                            </label>
                            <input type="text" class="form-control" id="mainServiceOrProduct"
                                   name="mainServiceOrProduct">
                            <p id="p13" style="color: red"></p>
                        </div>

                        <button type="button" class="btn btn-primary" onclick="finallyCheck2()">
                            注册
                        </button>
                    </form>
                </div>

                <div class="col-md-1" style="display: block"></div>
            </div>
        </div>
    </div>
</div>

<script>

    function finallyCheck0() {

        reSubmit();

        let point = 0;

        if (!emptyCheck(document.getElementById("username").value, "p1", "用户名不能为空")) {
            point -= 1;
        } else if (!lengthCheck(document.getElementById("username").value, "p1", 6 ,10, "用户名")) {
            point -= 1;
        }

        if (!emptyCheck(document.getElementById("password").value, "p2", "密码不能为空")) {
            point -= 1;
        } else if (!lengthCheck(document.getElementById("password").value, "p2", 6 , 10, "密码")) {
            point -= 1;
        }

        if (!passwordCheck("password", "password2", "p3")) {
            point -= 1;
        }

        if (!isChn(document.getElementById("citizenName").value, "p4")) {
            point -= 1;
        }

        if (!idCardCheck(document.getElementById("idCard").value, "p5")) {
            point -= 1;
        }

        if (!labelCheck()) {
            point -= 1;
        }

        if (!numCheck(document.getElementById("age").value, "p7")) {
            point -= 1;
        }

        if (point < 0) {
            layui.use(['layer'], function () {
                const layer = layui.layer;  //layer初始化
                layer.msg("请检查输入格式", {time: 1600, shift: 6}, function () {
                })
            });
        } else {
            document.getElementById("citizen").submit();
        }

    }

    function finallyCheck2() {

        reSubmit();

        let point = 0;

        if (!emptyCheck(document.getElementById("usernameC").value, "p8", "用户名不能为空")) {
            point -= 1;
        } else if (!lengthCheck(document.getElementById("usernameC").value, "p8", 6,10, "用户名")) {
            point -= 1;
        }

        if (!emptyCheck(document.getElementById("passwordC").value, "p9", "密码不能为空")) {
            point -= 1;
        } else if (!lengthCheck(document.getElementById("passwordC").value, "p9", 7,10, "密码")) {
            point -= 1;
        }

        if (!passwordCheck("passwordC", "password2C", "p10")) {
            point -= 1;
        }

        if (!emptyCheck(document.getElementById("company_name").value, "p11", "不能为空")) {
            point -= 1;
        }

        if (!emptyCheck(document.getElementById("mainIndustry").value, "p12", "不能为空")) {
            point -= 1;
        }

        if (!emptyCheck(document.getElementById("mainServiceOrProduct").value, "p13", "不能为空")) {
            point -= 1;
        }

        if (point < 0) {
            layui.use(['layer'], function () {
                const layer = layui.layer;  //layer初始化
                layer.msg("请检查输入格式", {time: 1600, shift: 6}, function () {
                })
            });
        } else {
            document.getElementById("company").submit();
        }

    }

    function passwordCheck(id1, id2, idP) {
        if (document.getElementById(id1).value === document.getElementById(id2).value) {
            return true;
        } else {
            document.getElementById(idP).innerHTML = "两次密码输入不一致，请重新确认"
            return false
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
            document.getElementById("p6").innerHTML = "请选定一个选项";
            return false;
        } else {
            return true;
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
        } else if (value.length !== valueToNum.toString().length) {
            orgP.innerHTML = "请检查格式是否正确";
            return false;
        } else if (valueToNum % 1 !== 0 || valueToNum <= 0) {
            orgP.innerHTML = "数字必须为正整数";
            return false;
        } else {
            return true;
        }
    }

    function idCardCheck(value, idP) {
        const var_text1 = value;
        const var_text2 = parseFloat(var_text1);
        const orgP = document.getElementById(idP);

        if (var_text1 === "") {
            orgP.innerHTML = "不能为空！";
            return false;
        } else if (isNaN(var_text2)) {
            orgP.innerHTML = "不是数字！";
            return false;
        } else if (var_text2 % 1 !== 0 || var_text2 < 0) {
            orgP.innerHTML = "请输入正整数！";
            return false;
        } else if (var_text1.length !== 18) {
            orgP.innerHTML = "当前填写身份证号为：" + var_text1.length + "位，请检查正确性";
            return false;
        } else if (var_text1.length !== ("" + var_text2).length) {
            orgP.innerHTML = "格式不正确！请检查输入是否为纯数字";
            return false;
        } else {
            return true;
        }

    }

    function reSubmit() {
        const texObjs = document.getElementsByTagName("p");

        for (let i = 0; i < texObjs.length; i++) {
            texObjs[i].innerHTML = "&nbsp;";
        }
    }

    function isChn(value, id) {
        const reg = /^[\u4E00-\u9FA5]+$/;

        if (!reg.test(value)) {
            document.getElementById(id).innerHTML = "姓名必须为中文";
            return false;
        }
        return true;
    }

    function lengthCheck(value, id, minLength,maxLength, string) {
        if (value.length > maxLength || value.length<minLength) {
            document.getElementById(id).innerHTML = string + "的长度必须为"+minLength+"~"+maxLength+"位";
            return false;
        } else {
            return true;
        }
    }
</script>

<script src="../../js/jquery.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/scripts.js"></script>

<script>

    $(
        function () {
            $("#com").click(
                function () {
                    $("#cit").css("background-color","gray");
                    $("#com").css("background-color","#449d44");
                    $("#companyRegister").show();
                    $("#citizenRegister").hide();
                }
            )
        }
    )
    $(
        function () {
            $("#cit").click(
                function () {
                    $("#com").css("background-color","gray");
                    $("#cit").css("background-color","#449d44");
                    $("#citizenRegister").show();
                    $("#companyRegister").hide();
                }
            )
        }
    )
</script>
</body>
</html>