<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  MyUser: 12817
  Date: 2021/8/7
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>成绩查询</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/style.css" rel="stylesheet">
    <script src="https://npmcdn.com/tether@1.2.4/dist/js/tether.min.js"></script>
    <script src="https://npmcdn.com/bootstrap@4.0.0-alpha.5/dist/js/bootstrap.min.js"></script>

</head>
<style>
    .myWord {
        font-size: 33px;
        font-style: normal;
        color: #2aabd2;
        font-weight: bold;
    }
    .aWord {
        font-size: 22px;
        color: #2aabd2;
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
        </div>
    </div>
    <div class="row">
        <div class="col-md-1">
        </div>
        <div class="col-md-10">
            <div class="row">
                <div class="col-md-1">

                </div>
                <div class="col-md-10">
                    <div align="center" style="font-size: 34px">
                        公务员考试成绩查询
                    </div>
                </div>
                <div class="col-md-1">

                </div>
            </div>
            <br/>
            <br/>
            <div class="row">
                <div class="col-md-6">

                    <div class="form-group">

                        <label for="exampleInputEmail1">
                            考号
                        </label>
                        <input type="text" class="form-control" id="exampleInputEmail1" maxlength="11"
                               placeholder="请输入您的准考证号">
                        <p id="p1" style="color: red"></p>
                        <label for="exampleInputEmail2">
                            身份证号
                        </label>
                        <input type="text" class="form-control" id="exampleInputEmail2" maxlength="18"
                               placeholder="请输入您的身份证号">
                        <p id="p2" style="color: red"></p>
                    </div>
                    <!--<div class="form-group">

                        <label for="exampleInputPassword1">
                            查询密码
                        </label>
                        <input type="password" class="form-control" id="exampleInputPassword1" maxlength="10"
                               placeholder="请输入您的查询密码，长度3-10位">
                    </div>-->

                    <div class="checkbox">

                    </div>
                    <button type="button" class="btn btn-primary" onclick="tranIdCheck()" id="submitButton">
                        确认
                    </button>


                </div>

                <div class="col-md-6">
                    <div>
                        <span id="d1"></span><span class="aWord" id="examineeId"></span>
                    </div>
                    <div>
                        <span id="d2"></span><span class="aWord" id="examineeName"></span>
                    </div>
                    <div>
                        <span id="d3"></span><span class="aWord" id="examName"></span>
                    </div>
                    <div>
                        <span id="d4"></span><span class="myWord" id="score"></span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                </div>
            </div>
            <div class="col-md-1">
            </div>
        </div>
    </div>
</div>
<script>

    function tranIdCheck() {

        reSubmit();

        const value = document.getElementById("exampleInputEmail1").value;
        const value2 = document.getElementById("exampleInputEmail2").value;
        let flag = 0;

        if (numCheck(value,"p1")){
            if (value.length !== 10) {
                document.getElementById("p1").innerHTML = "当前输入为："+value.length+"位，请检查考号正确性";
            }
        } else {
            flag--;
        }

        if (!idCardCheck(value2,"p2")){
            flag--
        }

        if (flag===0) {
            checkTranscript(value,value2);
        } else {
            alert("请检查信息是否正确")
        }

    }

    function numCheck(value,idP) {

        const valueToNum = parseFloat(value);
        const orgP = document.getElementById(idP);

        if (value===""){
            orgP.innerHTML="内容不能为空";
            return false;
        } else if (isNaN(valueToNum)){
            orgP.innerHTML="内容必须为数字";
            return false;
        } else if (value.length !== valueToNum.toString().length) {
            orgP.innerHTML="请检查格式是否正确";
            return false;
        } else if (valueToNum % 1 !== 0 || valueToNum <= 0){
            orgP.innerHTML="数字必须为正整数";
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

    function checkTranscript(examineeId,idCard) {

        let xmlHttp;
        if (window.XMLHttpRequest) {
            xmlHttp = new XMLHttpRequest();
        } else {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
                const jsonText = xmlHttp.responseText;
                if ("" === jsonText) {
                    document.getElementById("examineeId").innerHTML = "查询无果，请检查考号是否填写正确";
                } else {
                    const json = JSON.parse(jsonText);
                    document.getElementById("examineeId").innerHTML = json.examineeId;
                    document.getElementById("examineeName").innerHTML = json.examineeName;
                    document.getElementById("examName").innerHTML = json.examName;
                    document.getElementById("score").innerHTML = json.score;
                    document.getElementById("d1").innerHTML = "考号：";
                    document.getElementById("d2").innerHTML = "姓名：";
                    document.getElementById("d3").innerHTML = "你在：";
                    document.getElementById("d4").innerHTML = "中的考试成绩是：";
                    document.getElementById("submitButton").disable = true;
                }

            }else {
                document.getElementById("examineeId").innerHTML = "查询中...";
                document.getElementById("examName").innerHTML = "如果长时间没有结果，请检查考号准确性";
            }
        }
        xmlHttp.open("POST", "<c:url value="/user/checktranscript"/>", true);
        xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xmlHttp.send("examineeId=" + examineeId + "&idCard=" + idCard);
    }
</script>
<script src="../../js/jquery.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/scripts.js"></script>

</body>
</html>
