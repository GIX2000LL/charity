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
    <div style="height: 10px"></div>
    <div style="font-size: medium" align="center">
        <a href="/user" style="color: blue; background-color: white" class="btn btn--without-border active">WRÓĆ DO PANELU UŻYTKOWNIKA</a>
    </div>
</header>

<section class="login-page">
    <h2 style="color: green">Twoje dane</h2>
    <div align="center">
        <form name="form" method="post">
            <form:form modelAttribute="user" method="post">

                <form:input path="securityRole" type="hidden"/>

                <div class="form-group">
                    <form:input type='text' path='firstName' placeholder='Imię' cssStyle="background: white" /> <br/>
                    <div style="height: 10px; font-size: medium"><form:errors path="firstName" cssStyle="color: red"/></div>
                </div>
                <div class="form-group">
                    <form:input type="text" path="lastName" placeholder="Nazwisko" cssStyle="background: white" /> <br/>
                    <div style="height: 10px"></div>
                    <div style="height: 10px; font-size: medium"> <form:errors path="lastName" cssStyle="color: red"/></div>
                </div>
                <div class="form-group">
                    <form:input type="email" path="email" placeholder="Email" cssStyle="background-color: white" /> <br/>
                    <div style="height: 10px"></div>
                    <div style="height: 10px; font-size: medium"> <form:errors path="email" cssStyle="color: red"/> </div>
                </div>
                <div class="form-group">
                    <input id="password" type="password" name="password" placeholder="Hasło" style="background: white" /><br/>
                    <div style="height: 10px"></div>
                    <div style="height: 10px; font-size: medium"> <form:errors path="password" cssStyle="color: red"/> </div>
                </div>
                <div class="form-group">
                    <input style="background-color: white" id="password2" type="password" name="password2" placeholder="Powtórz hasło" />
                    <div style="height: 10px"></div>
                    <div id="error" style="height: 10px; font-size: medium;color: red"></div>

                </div>

                <div class="form-group">
                    <button onclick=" return passwordConfirm()" style="color: green; background-color: white" class="btn" type="submit">Zatwierdź edycję</button>
                </div>
            </form:form>
        </form>
    </div>
</section>


</body>
<script src="/resources/js/registerValid.js"></script>
</html>

