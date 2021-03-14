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


<header class="header--form-page" style="height: 50px">
    <c:if test="${filter eq 'all'}">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li><a style="background-color: white" href="/allDonations/expire" class="btn"> DARY NIEAKTYWNE </a> </li>
            <li><a style="background-color: white" href="/allDonations/noUser" class="btn">DARY PRZEKAZANE PRZEZ NIEZAREJESTROWANEGO UŻYTKOWNIKA</a></li>
        </ul>
    </nav>
    </c:if>
</header>

<section class="login-page">
    <div style="height: 10px"></div>
    <div align="center">
        <a href="/user"> <button style="color: blue; font-size: large">WRÓĆ DO STRONY UŻYTKOWNIKA</button> </a>
    </div>

    <div >
        <div align="center">
            <h2 style="color: green">
                <c:choose>
                    <c:when test="${filter eq 'all'}">
                        WSZYSTKIE DARY
                    </c:when>
                    <c:when test="${filter eq 'expire'}">
                        DARY NIEAKTYWNE
                    </c:when>
                </c:choose>

            </h2> <br/>
        </div>


        <div align="center" style="font-size: large">
            <c:choose>
            <c:when test="${filter eq 'all'}">
                <c:forEach items="${all}" var="don">


                <section  class="btn--without-border">
                    <div class="form-group" style="background-color: white;font-size: x-large"> MIASTO: ${don.city} - - -  ULICA: ${don.street}
                        - - - DLA FUNDACJI: ${don.institution.name} - - - DATA ODBIORU: ${don.pickUpDate}
                    </div>
                    <div style="height: 10px; background-color: white"></div>
                    <div style="background-color: white" class="form-group">

                        <c:if test="${!don.pickedUp}">
                            <div style="color: red">*DAR NIEODEBRANY*</div>
                            <div style="height: 10px"></div>
                            <a href="/allDonations/pickedUp/${don.id}">
                                <button style="color: blue" class="btn--small">OZNACZ DAR JAKO ODEBRANY</button> </a>
                        </c:if>
                        <c:if test="${don.pickedUp}">
                            <div style="color: blue">*DAR ODEBRANY*${don.whenPickedUp}</div>
                            <div style="height: 10px"></div>
                            <a href="allDonations/notPickedUp/${don.id}">
                                <button style="color: blue" class="btn--small">OZNACZ DAR JAKO NIEODEBRANY</button> </a>
                        </c:if>

                        <a href="/allDonations/details/${don.id}/x"> <button class="btn--small" style="color: green">ZOBACZ SZCZEGÓŁY</button></a>
                    </div>
                    <div style="height: 20px"></div>
                </section>
                 </c:forEach>
            </c:when>
            <c:when test="${filter eq 'expire'}">
                <c:forEach items="${expire}" var="don">


                    <section  class="btn--without-border">
                        <div class="form-group" style="background-color: white;font-size: x-large"> MIASTO: ${don.city} - - -  ULICA: ${don.street}
                            - - - DLA FUNDACJI: ${don.institution.name} - - - DATA ODBIORU: ${don.pickUpDate}
                        </div>
                        <div style="height: 10px; background-color: white"></div>
                        <div style="background-color: white" class="form-group">

                            <c:if test="${!don.pickedUp}">
                                <div style="color: red">*DAR NIEODEBRANY*</div>
                                <div style="height: 10px"></div>
                                <a href="/allDonations/pickedUp/${don.id}">
                                    <button style="color: blue" class="btn--small">OZNACZ DAR JAKO ODEBRANY</button> </a>
                            </c:if>
                            <c:if test="${don.pickedUp}">
                                <div style="color: blue">*DAR ODEBRANY*${don.whenPickedUp}</div>
                                <div style="height: 10px"></div>
                                <a href="allDonations/notPickedUp/${don.id}">
                                    <button style="color: blue" class="btn--small">OZNACZ DAR JAKO NIEODEBRANY</button> </a>
                            </c:if>

                            <a href="/allDonations/details/${don.id}/x"> <button class="btn--small" style="color: green">ZOBACZ SZCZEGÓŁY</button></a>
                        </div>
                        <div style="height: 20px"></div>
                    </section>
                </c:forEach>
            </c:when>
            </c:choose>
        </div>
    </div>
</section>
</body>
</html>

