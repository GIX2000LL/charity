<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="pl">

<head>

</head>

<body style="background: #ceffff">
<header>
    <div align="center">
        <a href="/admins"> <button style="color: blue"> WRÓĆ DO LISTY ADMINISTRATORÓW </button></a>
    </div>
</header>
<div style="height: 50px"></div>
<div align="center">
    <form method="post">
        <form:form modelAttribute="admin">

            <c:if test="${admin.id !=0}">
                <form:input path="id" type="hidden"/>
            </c:if>

            <label>IMIĘ: </label><form:input path="firstName" type="text"/> <br/>
            <div style="height: 10px"></div>
            <label>NAZWISKO: </label> <form:input path="lastName" type="text"/> <br/>
            <div style="height: 10px"></div>
            <label>EMAIL: </label> <form:input path="email" type="email"/> <br/>
            <div style="height: 10px"></div>
            <c:choose>
                <c:when test="${admin.id !=0}">
                    <form:input type="hidden" path="password"/> <br/>
                </c:when>
                <c:otherwise>
                    <label>PASSWORD: </label> <form:input path="password" type="password"/> <br/>
                </c:otherwise>
            </c:choose>

             <form:input type="hidden" path="securityRole"/> <br/>


            <div style="height: 30px"></div>
            <c:choose>
                <c:when test="${admin.id !=0}">
                    <button class="btn" type="submit" style="color: green">Zatwierdź edycję</button>
                </c:when>
                <c:otherwise>
                    <button class="btn" type="submit" style="color: green">Stwórz nowego administartora</button>
                </c:otherwise>
            </c:choose>

        </form:form>
    </form>
</div>

<div style="height: 50px"></div>
<div style="font-size: x-large;color:blue" align="center">
    <c:choose>
        <c:when test="${admin.id !=0}">
            EDYCJA UŻYTKOWNIKA ${admin.firstName} ${admin.lastName}
        </c:when>
        <c:otherwise>
            TWORZENIE NOWEGO ADMINISTRATORA
        </c:otherwise>

    </c:choose>
</div>


</body>
</html>

