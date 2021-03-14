<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <%@include file="../partsOfCode/head.jsp"%>
</head>
<body style="background-color: bisque">
<header style="height: 20px">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li><a href="/" style="color: blue" class="btn btn--without-border active">WRÓĆ</a></li>
        </ul>
    </nav>
</header>

<section class="login-page">
    <h2 style="color: green">Załóż konto</h2>
    <div align="center">
        <form name="form" method="post">
        <form:form modelAttribute="user" method="post">
        <div class="form-group">
            <form:input type='text' path='firstName' placeholder='Imię' cssStyle="background-color: white" /> <br/>
            <div style="height: 10px; font-size: medium"><form:errors path="firstName" cssStyle="color: red"/></div>
        </div>
        <div class="form-group">
            <form:input type="text" path="lastName" placeholder="Nazwisko" cssStyle="background-color: white" /> <br/>
            <div style="height: 10px"></div>
            <div style="height: 10px; font-size: medium"> <form:errors path="lastName" cssStyle="color: red"/></div>
        </div>
        <div class="form-group">
            <form:input type="email" path="email" placeholder="Email" cssStyle="background-color: white" /> <br/>
            <div style="height: 10px"></div>
            <div style="height: 10px; font-size: medium"> <form:errors path="email" cssStyle="color: red"/> </div>
        </div>
        <div class="form-group">
            <input id="password" type="password" name="password" placeholder="Hasło" style="background-color: white" /><br/>
            <div style="height: 10px"></div>
            <div style="height: 10px; font-size: medium"> <form:errors path="password" cssStyle="color: red"/> </div>
        </div>
        <div class="form-group">
            <input id="password2" type="password" name="password2" placeholder="Powtórz hasło" style="background-color: white" />
            <div style="height: 10px"></div>
            <div id="error" style="height: 10px; font-size: medium;color: red"></div>

        </div>

        <div class="form-group form-group--buttons">
            <a href="/login" class="btn btn--without-border">Zaloguj się</a>
            <button onclick=" return passwordConfirm()" class="btn" type="submit">Załóż konto</button>
        </div>
        </form:form>
        </form>
    </div>
</section>


</body>
    <script src="/resources/js/registerValid.js"></script>
</html>

