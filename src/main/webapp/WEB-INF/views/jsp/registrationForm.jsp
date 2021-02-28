<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
            <li class="highlighted"><a href="#">Załóż konto</a></li>
        </ul>

        <ul>
            <li><a href="/" class="btn btn--without-border active">WRÓĆ</a></li>
        </ul>
    </nav>
</header>

<section class="login-page">
    <h2>Załóż konto</h2>
    <form method="post">
        <form:form modelAttribute="user">
        <div class="form-group">
            <input type="text" name="firstName" placeholder="Imię" />
            <form:errors path="firstName" cssStyle="color: red"/>
        </div>
        <div class="form-group">
            <input type="text" name="lastName" placeholder="Nazwisko" />
            <form:errors path="lastName" cssStyle="color: red"/>
        </div>
        <div class="form-group">
            <input name="email" placeholder="Email" />
            <form:errors path="email" cssStyle="color: red"/>
        </div>
        <div class="form-group">
            <input type="password" name="password" placeholder="Hasło" />
            <form:errors path="password" cssStyle="color: red"/>
        </div>
        <div class="form-group">
            <input type="password" name="password2" placeholder="Powtórz hasło" />
        </div>

        <div class="form-group form-group--buttons">
            <a href="login.html" class="btn btn--without-border">Zaloguj się</a>
            <button class="btn" type="submit">Załóż konto</button>
        </div>
        </form:form>
    </form>
</section>

<footer>
    <%@include file="partsOfCode/footer.jsp"%>
</footer>
</body>
</html>

