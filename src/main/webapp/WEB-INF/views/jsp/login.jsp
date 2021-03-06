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
    <form action="/login" method="post" name="form" onsubmit="return validLoginForm()">
        <div class="form-group">
            <div style="color: red; font-size: large" id="emailError"></div><br/>
            <input type="text" id="username" name="username" placeholder="Email" />
        </div>
        <div class="form-group">
            <div style="color: red; font-size: large" id="passwordError"></div><br/>
            <input type="password" id="password" name="password" placeholder="Hasło" /><br/>
            <a href="#" style="color: red" class="btn btn--small btn--without-border reset-password">Zapomniałem hasła</a>
        </div>

        <div class="form-group form-group--buttons">
            <a href="/registration" style="color: blue" class="btn btn--without-border">Załóż konto</a>
            <input style="color: green" id="submit" name="submit" type="submit" value="ZALOGUJ SIĘ">
        </div>
    </form>
    </div>
</section>


</body>
<script src="resources/js/loginValid.js">

</script>
</html>
