<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <%@include file="../partsOfCode/head.jsp"%>
</head>
<body>
<sec:authorize access="isAuthenticated()">
<header style="height: 50px" class="header--form-page">

    <c:if test="${currentUser.securityRole=='ROLE_USER'}">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li class="logged-user" style="font-size: x-large">
             <sec:authentication property="principal.User.firstName" />

                <ul class="dropdown">
                    <li><a href="#">Profil</a></li>
                    <li><a href="#">Moje zbiórki</a></li>
                    <li><a href="/logout">Wyloguj</a></li>
                </ul>
            </li>
        </ul>
        
    </nav>
    </c:if>

    <c:if test="${currentUser.securityRole == 'ROLE_ADMIN' }">
        <nav class="container container--70">
            <ul class="nav--actions">
                <li class="logged-user" style="font-size: x-large">
                    PANEL ADMINISTRATORA

                    <ul class="dropdown">
                        <li><a href="/fundations">Fundacje</a></li>
                        <li><a href="#">Moje zbiórki</a></li>
                        <li><a href="/logout">Wyloguj</a></li>
                    </ul>
                </li>
            </ul>

        </nav>

    </c:if>
</header>

    <div align="center">
        <h2 style="color: green">
            PANEL UŻYTKOWNIKA
        </h2>
    </div>


<script src="js/app.js"></script>
</sec:authorize>
</body>
</html>
