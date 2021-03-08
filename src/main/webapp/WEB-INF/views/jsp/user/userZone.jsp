<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="pl">
<sec:authorize access="isAuthenticated()">
<head>

    <header class="header">
        <div style="height: 30px"></div>
        <c:if test="${currentUser.securityRole == 'ROLE_ADMIN' }">
        <div align="left">
            <nav style="padding-right: 1000px">
                <ul class="nav--actions">
                    <li class="logged-user" style="font-size: x-large;color:blue">
                        PANEL ADMINISTRATORA

                        <ul class="dropdown">
                            <li><a href="/foundations">Fundacje</a></li>
                            <li><a href="/admins">Administratorzy</a></li>
                            <li><a href="/users">Użytkownicy</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
        </c:if>
    <nav class="container container--70">

        <ul >
            <li><a href="user/details/${currentUser.id}" class="btn btn--without-border ">Moje dane</a></li>
            <li><a href="/user/donations/${currentUser.id}" class="btn btn--without-border">Moje dary</a></li>
            <li><a href="/donationForm/true/${currentUser.id}" class="btn btn--without-border">Złóż nowy dar</a></li>
            <li><a style="color: red" href="/logout" class="btn btn--without-border">Wyloguj</a></li>
            <li style="width: 100px"></li>
            <li class="logged-user" style="font-size: x-large; color: black" >
                Witaj  <sec:authentication property="principal.User.firstName" />
            </li>
        </ul>

        <div class="container" style="height: 50px"></div>
    <%@include file="../partsOfCode/head.jsp"%>
    </nav>
    </header>
</head>
<body>

    <div style="background-image: url('resources/images/interior.jpg');width: 100%; opacity: 0.7;
    background-position: center">

        <div style="height: 100px"></div>
    <div align="center" style="height: 400px;font-size: x-large;color: black">
        <div style="font-size: xx-large; color: brown" class="form-group">
               <span style="background-color: white"> KURIER POJAWI SIĘ NAJPIERW PO TEN DAR:</span>
        </div>
        <div style="height: 20px"></div>
        <div class="form-group">
            <span style="background-color: white">DLA FUNDACJI: ${primeDonation.institution.name} </span>
        </div>
        <div class="form-group" >
            <span style="background-color: white"> ADRES ODBIORU: ${primeDonation.zipCode} ${primeDonation.city} </span>
           <span style="background-color: white"> ${primeDonation.street}</span>
        </div>
        <div class="form-group" style="height: 20px"></div>
        <div >
            <span style="background-color: white"> TERMIN ODBIORU: ${primeDonation.pickUpDate} ${primeDonation.pickUpTime}  </span>
        </div>
        <div class="form-group">
        </div>


    </div>
</div>
    <div align="bottom">
        <h2 style="color: green"> PANEL UŻYTKOWNIKA
        </h2></div>
<script src="js/app.js"></script>
</sec:authorize>

</body>
</html>
