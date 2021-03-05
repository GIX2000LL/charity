<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="pl">
<sec:authorize access="isAuthenticated()">
<head>

    <header class="header">
        <div style="height: 30px"></div>
        <c:if test="${currentUser.securityRole == 'ROLE_ADMIN' }">
        <div align="left">
            <nav style="padding-right: 1000px">
                <ul class="nav--actions">
                    <li class="logged-user" style="font-size: x-large;color:blue">
                        PANEL ADMINISTRATORA

                        <ul class="dropdown">
                            <li><a href="/foundations">Fundacje</a></li>
                            <li><a href="/admins">Lista administratorów</a></li>
                            <li><a href="/logout">Wyloguj</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
        </c:if>
    <nav class="container container--70">

        <ul >
            <li><a href="/" class="btn btn--without-border ">Start</a></li>
            <li><a href="/#what'sGoingOn" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a style="color: red" href="/logout" class="btn btn--without-border">Wyloguj</a></li>
            <li style="width: 100px"></li>
            <li class="logged-user" style="font-size: x-large; color: black" >
                Witaj  <sec:authentication property="principal.User.firstName" />
            </li>
        </ul>

        <div class="container" style="height: 50px"></div>
    <%@include file="../partsOfCode/head.jsp"%>
    </nav>
    </header>
</head>
<body>

<div style="background-image: url('resources/images/interior.jpg');width: 100%; opacity: 0.7;
background-position: center">


<header style="height: 50px" class="header--form-page">



</header>
    <div class="container" style="height: 100px">

    </div>

    <div class="container" align="center" style="height: 300px;font-size: large;color: black">
        ggfgfg
    </div>
</div>
    <div align="bottom">
        <h2 style="color: green">
        </h2></div>
<script src="js/app.js"></script>
</sec:authorize>

</body>
</html>
