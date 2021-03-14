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
        <c:choose>
            <c:when test="${x eq 'x'}">
        <a href="/allDonations"> <button style="color: blue; font-size: large">WRÓĆ DO LISTY WSZYSTKICH DARÓW</button> </a>
            </c:when>
            <c:otherwise>

        <a href="/user/donations/${currentUser.id}"> <button style="color: blue; font-size: large">WRÓĆ DO LISTY TWOICH DARÓW</button> </a>
            </c:otherwise>
        </c:choose>
    </div>

    <div >
        <div align="center">
            <h2 style="color: green">
                SZCZEGÓŁY DARU</h2> <br/>
        </div>
        <div align="center" style="font-size: large">

            <section>
                <div class="form-group" style="background-color: white"> <span style="color: brown">MIASTO:</span> ${donation.zipCode} ${donation.city} </div>
                <div style="height: 20px"></div>
                <div class="form-group" style="background-color: white"> <span style="color: brown"> ULICA:</span> ${donation.street} </div>
                <div style="height: 20px"></div>
                <div class="form-group" style="background-color: white"> <span style="color: brown">NUMER TELEFONU:</span> ${donation.phoneNumber} </div>
                <div style="height: 20px"></div>
                <div class="form-group" style="background-color: white"> <span style="color: brown"> WIADOMOŚĆ DLA DOSTAWCY:</span> ${donation.deliveryMessage} </div>
                <div style="height: 20px"></div>
                <div class="form-group" style="background-color: white"> <span style="color: brown">FUNDACJA DLA KTÓREJ PRZEKAZANO DARY:</span>  ${donation.institution.name} </div>
                <div style="height: 20px"></div>
                <div class="form-group" style="background-color: white"> <span style="color: brown"> ILOŚĆ WORKÓW: </span> ${donation.quantity} </div>
                <div style="height: 20px"></div>
                <div class="form-group" style="background-color: white"> <span style="color: brown"> DATA ODBIORU: </span> ${donation.pickUpDate} </div>
                <div style="height: 20px"></div>
                <div class="form-group" style="background-color: white"> <span style="color: brown"> GODZINA ODBIORU: </span> ${donation.pickUpTime} </div>
                <div style="height: 20px"></div>
                <div class="form-group" style="background-color: white">
                    <c:if test="${donation.pickedUp}"> <span style="color: blue"> DAR ODEBRANY ${donation.whenPickedUp} </span>  </div> </c:if>
                    <c:if test="${!donation.pickedUp}"> <span style="color: red"> DAR NIEODEBRANY </span>  </div> </c:if>
                <div style="height: 20px"></div>


            </section>
        </div>
    </div>
</section>
</body>
</html>

