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
<body>
<div style="height: 10px"></div>
<div align="center">
    <a href="/user"> <button style="color: blue; font-size: large">WRÓĆ DO STRONY UŻYTKOWNIKA</button> </a>
</div>

<div style="background-color: #ceffff">
    <div align="center">
        <h2 style="color: green">
            FUNDACJE</h2> <br/>
        <a style="font-size: large;color: green" href="/foundations/add"> <button> DODAJ NOWĄ FUNDACJE </button></a>
    </div>
    <div align="center">
    <ul style="font-size: x-large">
        <c:forEach items="${institutions}" var="inst">
            <li> ${inst.name} : ${inst.description}
                <table>
                    <tr style="height: 10px"><td></td></tr>
                    <tr>
                        <td> <a href="/foundations/edit/${inst.id}"><button style="color: green; background: white" class="btn" type="button">EDYCJA</button>  </a> </td>
                        <td> <a id="delete" name="deleteButtons" href="/foundations/delete/${inst.id}"><button style="color: red; background: white"
                                                                             onclick="showConfirmation()" class="btn" type="button">USUŃ</button>  </a> </td>
                    <tr/>

                </table>
            </li><br/>
        </c:forEach>
    </ul>
    </div>
</div>
    <script src="js/app.js"></script>
    <script >
        function showConfirmation () {
            const c= confirm("CZY NAPEWNO CHCESZ SKASOWAĆ FUNDACJĘ ?")
            if(!c) {
                const buttons = document.getElementsByName('deleteButtons');
                buttons.forEach(function (button) {
                    button.href='/foundations';
                });
            }

        }
    </script>
</body>
</html>
