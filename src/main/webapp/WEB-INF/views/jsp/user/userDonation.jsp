<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <%@include file="../partsOfCode/head.jsp"%>
</head>
<body style="background-color:bisque">
<section class="login-page">
    <div style="height: 10px"></div>
    <div align="center">
        <a href="/user"> <button style="color: blue; font-size: large">WRÓĆ DO STRONY UŻYTKOWNIKA</button> </a>
    </div>

    <div >
        <div align="center">
            <h2 style="color: green">
                TWOJE DARY</h2> <br/>
        </div>
        <div align="center" style="font-size: large">

                <c:forEach items="${donations}" var="don">

                    <section  class="btn--without-border">
                    <div class="form-group" style="background-color: white;font-size: x-large"> MIASTO: ${don.city} - - -  ULICA: ${don.street}
                        - - - DLA FUNDACJI: ${don.institution.name} - - - DATA ODBIORU: ${don.pickUpDate}
                    </div>
                    <div style="height: 10px; background-color: white"></div>
                    <div style="background-color: white" class="form-group">

                        <c:if test="${!don.pickedUp}">
                            <div style="color: red">*DAR NIEODEBRANY*</div>
                            <div style="height: 10px"></div>
                        <a href="/user/donation/pickedUp/${don.id}">
                        <button style="color: blue" class="btn--small">OZNACZ DAR JAKO ODEBRANY</button> </a>
                        </c:if>
                        <c:if test="${don.pickedUp}">
                            <div style="color: blue">*DAR ODEBRANY*${don.whenPickedUp}</div>
                            <div style="height: 10px"></div>
                            <a href="/user/donation/notPickedUp/${don.id}">
                                <button style="color: blue" class="btn--small">OZNACZ DAR JAKO NIEODEBRANY</button> </a>
                        </c:if>

                        <a href="/user/donation/details/${don.id}"> <button class="btn--small" style="color: green">ZOBACZ SZCZEGÓŁY</button></a>
                    </div>
                    <div style="height: 20px"></div>
                    </section>
                </c:forEach>
        </div>
    </div>
</section>
</body>
</html>

