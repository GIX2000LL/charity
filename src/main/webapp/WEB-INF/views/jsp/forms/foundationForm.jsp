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
            <a href="/foundations"> <button style="color: blue"> WRÓĆ DO LISTY FUNDACJI </button></a>
    </div>
</header>
    <div style="height: 50px"></div>
    <div align="center">
    <form method="post">
        <form:form modelAttribute="foundation">

                <c:if test="${foundation.id !=0}">
                    <form:input path="id" type="hidden"/>
                </c:if>

                <label>NAZWA: </label><form:input path="name" type="text"/>

               <label>CEL FUNDACJI: </label> <form:input path="description" type="text"/>

                <div style="height: 50px"></div>
            <c:choose>
            <c:when test="${foundation.id !=0}">
                <button class="btn" type="submit" style="color: green">Zatwierdź edycję</button>
            </c:when>
            <c:otherwise>
                <button class="btn" type="submit" style="color: green">Stwórz fundację</button>
            </c:otherwise>
            </c:choose>

        </form:form>
    </form>
    </div>

<div style="height: 50px"></div>
            <div style="font-size: x-large;color:blue" align="center">
                <c:choose>
                    <c:when test="${foundation.id !=0}">
                        EDYCJA FUNDACJI ${foundation.name}
                    </c:when>
                    <c:otherwise>
                        TWORZENIE NOWEJ FUNDACJI
                    </c:otherwise>

                </c:choose>
            </div>


</body>
</html>

