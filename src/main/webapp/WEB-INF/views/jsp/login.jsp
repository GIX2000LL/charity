<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <%@include file="partsOfCode/head.jsp"%>

</head>
<body>
<header>
    <nav class="container container--70">
        <ul class="nav--actions">
            <li><a href="/" class="btn btn--without-border active" style="color: blue">Wróć do strony głównej</a></li>
        </ul>
    </nav>
</header>

<section class="login-page">
    <h2 style="color: green">Zaloguj się</h2>
    <div align="center">
    <form action="/login" method="post" onsubmit="return validation()">
        <div class="form-group">
            <div style="color: red" id="emailError"></div>
            <input type="text" id="username" name="username" placeholder="Email" />
        </div>
        <div class="form-group">
            <div style="color: red" id="passwordError"></div>
            <input id="password" type="password" name="password" placeholder="Hasło" /><br/>
            <a href="#" class="btn btn--small btn--without-border reset-password">Przypomnij hasło</a>
        </div>

        <div class="form-group form-group--buttons">
            <a href="/registration" style="color: blue" class="btn btn--without-border">Załóż konto</a>
            <input style="color: green" id="submit" name="submit" type="submit" value="ZALOGUJ SIĘ">
        </div>
    </form>
    </div>
</section>


</body>
<script defer src="resources/js/validation.js"></script>
</html>
