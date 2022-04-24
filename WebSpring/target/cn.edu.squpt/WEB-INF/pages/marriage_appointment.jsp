<%--
  Created by IntelliJ IDEA.
  User: 12817
  Date: 2021/8/20
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>结婚预约</title>
    <script type="text/javascript" src="../../js/layui/layui.js"></script>
    <script type="text/javascript" src="../../js/layer/layer.js"></script>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link type="text/css" href="../../css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" href="../../css/style.css" rel="stylesheet">
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
            <a style="color:white;" href="<c:url value="/user/shownewstitles"/>"> 新闻</a>
        </div>
        <div style="display: inline;color: white">
            |
        </div>

        <div class="col-md-1" style="width: 50px">
            <a style="color:white;" href="<c:url value="/user/showRecruitment"/>"> 招聘信息</a>
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
            <a style="color:white;" href="<c:url value="/user/toregister?pageId=1"/>"> 注册</a>
        </div>
        <div style="display: inline;color: white">
            |
        </div>

        <% if (role == 0) {%>

        <div class="col-md-1" style="float: right;margin-right: 0">
            <a style="color:white;" href="<c:url value="/user/tologin?pageId=1"/>"> 登录</a>
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
                        结婚预约
                    </p>
                </div>
                <div class="col-md-1">

                </div>
            </div>
            <dr></dr>
            <br/>

            <form action="<c:url value="/citizen/marriageAppointment"/>" method="post" id="marriageAppointment">
                <div class="row">

                    <div class="col-md-4">

                        <div class="form-group">
                            <label for="exampleInputEmail1">
                                男方姓名
                            </label>
                            <input name="manName" type="text" class="form-control" id="exampleInputEmail1" maxlength="10"
                                   placeholder="请输入姓名">
                            <p id="p1" style="color: red">&nbsp;</p>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputPassword1">
                                男方身份证号
                            </label>
                            <input name="manId" type="text" class="form-control" id="exampleInputPassword1" maxlength="18"
                                   placeholder="请输入身份证号">
                            <p id="p2" style="color: red">&nbsp;</p>
                        </div>

                        <div class="form-group">
                            <label for="tel1">
                                联系电话1
                            </label>
                            <input name="tel1" type="text" class="form-control" id="tel1" maxlength="12"
                                   placeholder="请输入联系电话">
                            <p id="p7" style="color: red">&nbsp;</p>
                        </div>

                        <!--<div class="form-group">

                        </div>-->
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="exampleInputEmail2">
                                女方姓名
                            </label><input name="womanName" type="text" class="form-control" id="exampleInputEmail2" maxlength="10"
                                           placeholder="请输入姓名">
                            <p id="p3" style="color: red">&nbsp;</p>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputPassword2">
                                女方身份证号
                            </label>
                            <input name="womanId" type="text" class="form-control" id="exampleInputPassword2" maxlength="18"
                                   placeholder="请输入身份证号">
                            <p id="p4" style="color: red">&nbsp;</p>
                        </div>
                        <div class="form-group">
                            <label for="tel2">
                                联系电话2
                            </label>
                            <input name="tel2" type="text" class="form-control" id="tel2" maxlength="12"
                                   placeholder="请输入联系电话">
                            <p id="p8" style="color: red">&nbsp;</p>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="marry_data">
                                预约日期
                            </label>
                            <input name="date" type="date" class="form-control" id="marry_data" maxlength="10"
                                   placeholder="请输入日期">
                            <p id="p5" style="color: red">&nbsp;</p>
                        </div>
                        <div class="form-group">
                            <label for="marry_address">
                                登记地点
                            </label>
                            <select name="address" class="form-control" id="marry_address">
                                <option value=""></option>
                                <option value="自贡市民政局">
                                    自贡市民政局
                                    四川省自贡市汇东新区文化路136号
                                </option>
                                <option value="自贡市沿滩区民政局">
                                    自贡市沿滩区民政局
                                    梨园路16
                                </option>
                                <option value="自贡市自流井区民政局婚姻登记处">
                                    自贡市自流井区民政局婚姻登记处
                                    自流井区芦厂坝82号
                                </option>
                                <option value="自贡市贡井区民政局">
                                    自贡市贡井区民政局
                                    青杠林路16
                                </option>
                                <option value="自贡市大安区民政局">
                                    自贡市大安区民政局
                                    清江井71号之5号
                                </option>
                                <option value="自贡市沿滩区民政局婚姻登记处">
                                    自贡市沿滩区民政局婚姻登记处
                                    沿滩区开元南路110号
                                </option>
                                <option value="自贡市大安区民政局婚姻登记处">
                                    自贡市大安区民政局婚姻登记处
                                    自贡市大安区人民医院西南侧约30米
                                </option>
                                <option value="自贡市贡井区民政局-婚姻登记处">
                                    自贡市贡井区民政局-婚姻登记处
                                    自贡市第三人民医院南侧约180米
                                </option>
                                <option value="荣县民政局">
                                    荣县民政局
                                    四川省自贡市荣县幸福路282号
                                </option>

                            </select>
                            <p id="p6" style="color: red">&nbsp;</p>
                        </div>
                        <br/>
                    </div>

                </div>
                <div class="row">

                </div>
                <div class="row">
                    <div class="col-md-5">
                    </div>
                    <div class="col-md-2">

                        <button type="reset" class="btn btn-success" style="display: block;margin: 0 auto">
                            重&nbsp;&nbsp;置
                        </button>
                    </div>
                    <div class="col-md-5">
                    </div>
                </div>

                <br/>
                <br/>
                <br/>
                <div class="row">
                    <div class="col-md-5">
                    </div>
                    <div class="col-md-2">

                        <input type="button" onclick="finallyCheck()" class="btn btn-success"
                                style="display: block;margin: 0 auto" value="确认预约">
                    </div>
                    <div class="col-md-5">
                    </div>
                </div>
            </form>

        </div>
        <div class="col-md-1">
        </div>
    </div>
</div>
<script>

    function finallyCheck() {

        reSubmit();

        let point = 0;

        if (!nameCheck(document.getElementById("exampleInputEmail1").value, "p1", "男方姓名不能为空")) {
            point -= 1;
        }

        if (!idCardCheck(document.getElementById("exampleInputPassword1").value, "p2")) {
            point -= 1;
        }

        if (!nameCheck(document.getElementById("exampleInputEmail2").value, "p3", "女方姓名不能为空")) {
            point -= 1;
        }

        if (!idCardCheck(document.getElementById("exampleInputPassword2").value, "p4")) {
            point -= 1;
        }

        if (!emptyCheck(document.getElementById("marry_data").value, "p5", "预约日期不能为空")) {
            point -= 1;
        }

        if (!emptyCheck(document.getElementById("marry_address").value, "p6", "预约地点不能为空")) {
            point -= 1;
        }

        if (!telCheck(document.getElementById("tel1").value, "p7")) {
            point -= 1;
        }

        if (!telCheck(document.getElementById("tel2").value, "p8")) {
            point -= 1;
        }

        if (point < 0) {
            alert("请检查输入格式");
        } else {
            tips();
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

    function emptyCheck(value, id, string) {
        if (value.length === 0) {
            document.getElementById(id).innerHTML = string;
            return false;
        } else {
            return true;
        }
    }

    function nameCheck(value, id, string) {
        if (emptyCheck(value,id,string)) {
            return isChn(value,id);
        } else {
            return false;
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

    function telCheck(value, idP) {
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
        } else if (var_text1.length !== 11) {
            orgP.innerHTML = "当前填写电话号码为：" + var_text1.length + "位，请检查正确性";
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

    function isChn(value,id){
        const reg = /^[\u4E00-\u9FA5]+$/;

        if(!reg.test(value)){
            document.getElementById(id).innerHTML = "姓名必须为中文";
            return false;
        }
        return true;
    }
</script>

<script type="javascript" src="../../js/jquery.min.js"></script>
<script type="javascript" src="../../js/bootstrap.min.js"></script>
<script type="javascript" src="../../js/scripts.js"></script>
<script>
    function tips() {
        layui.use(['layer'], function () {
            const layer = layui.layer;  //layer初始化
            layer.open({
                area: ['450px', '300px'],
                offset: ['150px', '35%'],
                content: '<h3>确认提交预约信息吗？</h3>  '
                    + '<br/><h5>成功提交后将会跳转主页</h5>'
                    + '<br/><h5>我们会在三个工作日内</h5>'
                    + '<br/><h5>通过电话或短信的方式告知您具体预约状况</h5>',
                btn: ['预约'],
                yes: function (index, layero) {
                    document.getElementById("marriageAppointment").submit();
                },
                cancel: function () {
                }
            });
        });
    }
</script>
</body>
</html>
