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
<header class="header--form-page">

    <nav class="container container--70">
        <ul class="nav--actions">
            <li class="logged-user">
                <sec:authentication property="principal.User.firstName" />
                <c:if test="${currentUser.securityRole == 'ROLE_ADMIN' }">
                    ADMIN
                </c:if>
                <ul class="dropdown">
                    <li><a href="#">Profil</a></li>
                    <li><a href="#">Moje zbiórki</a></li>
                    <li><a href="/logout">Wyloguj</a></li>
                </ul>
            </li>
        </ul>
        
    </nav>

    <div class="slogan container container--90">
        <h2 style="color: green">
            USER ZONE
        </h2>
    </div>
</header>

<footer>
  
</footer>

<script src="js/app.js"></script>
</sec:authorize>
</body>
</html>
