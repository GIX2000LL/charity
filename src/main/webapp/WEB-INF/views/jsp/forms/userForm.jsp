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

<body style="background: #bcfcff">
<header>
    <div style="height: 10px "></div>
    <div align="center">
        <a href="/users"> <button style="color: blue; background-color: white" class="btn"> WRÓĆ DO LISTY UŻTKOWNIKÓW </button></a>
    </div>
</header>
<section class="login-page">
    <div align="center">
        <form method="post">
            <form:form modelAttribute="user">

                <c:if test="${user.id !=0}">
                    <form:input path="id" type="hidden"/>
                </c:if>

                <form:input path="isActive" type="hidden"/>

                <div class="form-group">

                    <label style="font-size: large">IMIĘ: </label><br/>
                    <form:input path="firstName" type="text" cssStyle="background: white"/> <br/>
                    <div style="height: 10px"></div>
                    <div style="font-size: medium"><form:errors path="firstName" type="text" cssStyle="color: red"/> </div>
                </div>
                <div style="height: 10px"></div>
                <div class="form-group">
                    <label style="font-size: large">NAZWISKO: </label><br/>
                    <form:input path="lastName" type="text" cssStyle="background: white"/> <br/>
                    <div style="height: 10px"></div>
                    <div style="font-size: medium"><form:errors path="lastName" type="text" cssStyle="color: red"/> </div>
                </div>
                <div style="height: 10px"></div>
                <div class="form-group">
                    <label style="font-size: large">EMAIL: </label><br/>
                    <form:input path="email" type="email" cssStyle="background: white"/> <br/>
                    <div style="height: 10px"></div>
                    <div style="font-size: medium"><form:errors path="email" type="text" cssStyle="color: red"/> </div>
                </div>
                <div style="height: 10px"></div>
                <div class="form-group">
                    <c:choose>
                        <c:when test="${user.id !=0}">
                            <form:input type="hidden" path="password" cssStyle="background: white"/> <br/>
                        </c:when>
                        <c:otherwise>
                            <label style="font-size: large">PASSWORD: </label><br>
                            <form:input path="password" type="password" cssStyle="background: white"/> <br/>
                            <div style="height: 10px"></div>
                            <div style="font-size: medium"><form:errors path="password" type="password" cssStyle="color: red"/> </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <form:input type="hidden" path="securityRole"/> <br/>


                <div style="height: 30px"></div>
                <div class="form-group">
                    <c:choose>
                        <c:when test="${user.id !=0}">
                            <button class="btn" type="submit" style="color: green;background-color: white">Zatwierdź edycję</button>
                        </c:when>
                        <c:otherwise>
                            <button class="btn" type="submit" style="color: green; background-color: white">Stwórz nowego użykownika</button>
                        </c:otherwise>
                    </c:choose>
                </div>
            </form:form>
        </form>
    </div>

    <div style="height: 50px"></div>
    <div style="font-size: x-large;color:blue" align="center">
        <h2>
            <c:choose>
                <c:when test="${user.id !=0}">
                    EDYCJA UŻYTKOWNIKA ${user.firstName} ${user.lastName}
                </c:when>
                <c:otherwise>
                    TWORZENIE NOWEGO UŻYTKOWNIKA
                </c:otherwise>

            </c:choose>
        </h2>
    </div>

</section>
</body>
</html>

