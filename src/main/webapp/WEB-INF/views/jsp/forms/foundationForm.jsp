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

<body style="background-color: #bcfcff">
<header>
    <div style="height: 10px "></div>
    <div align="center">
            <a href="/foundations"> <button style="color: blue; font-size: large"> WRÓĆ DO LISTY FUNDACJI </button></a>
    </div>
</header>
    <section class="login-page">
        <div align="center">
        <form method="post">
            <form:form modelAttribute="foundation" method="post">

                <c:if test="${foundation.id !=0}">
              <form:input path="id" type="hidden"/>
              </c:if>

            <div class="form-group">
                <label style="font-size: large">NAZWA: </label> <br/>
                <div style="height: 10px;"></div>
                <form:input path="name" type="text" cssStyle="background: white"/><br/>
                <div style="height: 10px"></div>
                <div style="height: 20px; font-size: medium"><form:errors path="name" type="text" cssStyle="color: red"/></div>
                </div>
            <div class="form-group">
               <label style="font-size: large">CEL FUNDACJI: </label> <br>
                <div style="height: 10px;"></div>
                <form:textarea path="description" type="text" cssStyle="background: white"/><br>
                <div style="height: 10px"></div>
                <div style="height: 20px; font-size: medium"><form:errors path="description" cssStyle="color: red"/></div>
            </div>
            </div>
                <div style="height: 50px"></div>
                <div class="form-group">
                    <c:choose>
                    <c:when test="${foundation.id !=0}">
                        <button class="btn" type="submit" style="color: green; background-color: white">Zatwierdź edycję</button>
                    </c:when>
                    <c:otherwise>
                        <button class="btn" type="submit" style="color: green; background-color: white">Stwórz fundację</button>
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
                    <c:when test="${foundation.id !=0}">
                        EDYCJA FUNDACJI ${foundation.name}
                    </c:when>
                    <c:otherwise>
                        TWORZENIE NOWEJ FUNDACJI
                    </c:otherwise>

                </c:choose>
                </h2>
            </div>

    </section>
</body>
</html>

