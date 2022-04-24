<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cn.edu.cqupt.domain.MyUser" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored ="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>&lt;功能测试&gt;</title>
</head>
<body>
<div><h4>JSON测试</h4></div>
<div id="test1"></div>
<div id="test2"></div>
<div id="test3"></div>
<button type="button" onclick=approved()>开始测试</button>
<%--<%
    Cookie LastUrlCookie = new Cookie("url","test");
    response.addCookie(LastUrlCookie);
    session.setAttribute("url","test");
%>

<p><%=session%></p>
<form action="${pageContext.request.contextPath}/testThis" method="post">
    name<label>
    <input type="text" name="username"/>
</label>
    password<label>
    <input type="password" name="password"/>
</label>
&lt;%&ndash;    <label>
    <input type="hidden" value="leaveMessage" name="url"/>
</label>&ndash;%&gt;
<input type="submit" value="submit">

</form>--%>


<%--<%
    List<MyUser> list = new ArrayList<>();
    list.add(new MyUser("aa","11"));
    list.add(new MyUser("bb","22"));
    list.add(new MyUser("cc","22"));
    request.setAttribute("userList",list);
%>

<h2>I wish you success!</h2>
<c:set var="salary"  scope="session"  value="${2000*2}" />
<c:out value="${salary}" />

<c:forEach items="${userList}" var="u">
    姓名<c:out value="${u.username}" />
    密码<c:out value="${u.password}" />
</c:forEach>--%>
</body>
<script>
    function approved() {
        let xmlHttp;
        if (window.XMLHttpRequest)
        {
            xmlHttp=new XMLHttpRequest();
        }
        else
        {
            xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlHttp.onreadystatechange=function()
        {
            if (xmlHttp.readyState===4 && xmlHttp.status===200)
            {
                const json = JSON.parse(xmlHttp.responseText);
                document.getElementById("test1").innerHTML=json.name;
                document.getElementById("test2").innerHTML=json.username;
                document.getElementById("test3").innerHTML=json.role;
            }
            else {
                document.getElementById("test1").innerHTML="error";
            }
        }
        xmlHttp.open("Get","<c:url value="/testJson"/>",true);
        xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlHttp.send();
    }

</script>
</html>
