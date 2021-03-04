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
            <li><a href="#">Zaloguj</a></li>
            <li class="highlighted"><a href="/registration">Załóż konto</a></li>
        </ul>

        <ul>
            <li><a href="/" class="btn btn--without-border active">Wróć</a></li>

        </ul>
    </nav>
</header>

<section class="login-page">
    <h2>Zaloguj się</h2>

    <form action="/login" method="post" onsubmit="return validation()">
        <div class="form-group">
            <div style="color: red" id="emailError"></div>
            <input type="text" id="username" name="username" placeholder="Email" />
        </div>
        <div class="form-group">
            <div style="color: red" id="passwordError"></div>
            <input id="password" type="password" name="password" placeholder="Hasło" />
            <a href="#" class="btn btn--small btn--without-border reset-password">Przypomnij hasło</a>
        </div>

        <div class="form-group form-group--buttons">
            <a href="/registration" class="btn btn--without-border">Załóż konto</a>
            <input id="submit" name="submit" type="submit" value="ZALOGUJ SIĘ">
        </div>
    </form>
</section>

<footer>

</footer>

</body>
<script defer src="resources/js/validation.js"></script>
</html>
