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
            UŻYTKOWNICY</h2> <br/>
        <a style="font-size: large;color: green" href="/users/add"> <button> DODAJ NOWEGO UŻYTKOWNIKA </button></a>
    </div>
    <div align="center">
        <ul style="font-size: large">
            <c:forEach items="${users}" var="user">
                <li style="font-size: xx-large"> ${user.firstName}  ${user.lastName}
                    <table>
                        <tr style="height: 10px"><td></td></tr>
                        <tr>
                            <td> <a href="/users/edit/${user.id}"><button style="color: green; background: white" class="btn" type="button">EDYCJA</button>  </a> </td>
                            <td> <a id="delete" name="deleteButtons" href="/users/delete/${user.id}"><button style="color: red; background: white"
                                     onclick="showConfirmation()" class="btn" type="button">USUŃ</button>  </a> </td>
                            <c:if test="${user.active}">
                                <td> <a href="/users/block/${user.id}"><button style="color: red; background: white"  class="btn--small" type="button">ZABLOKUJ</button>  </a> </td>
                            </c:if>
                            <c:if test="${!user.active}">
                                <td> <a href="/users/unblock/${user.id}"><button class="btn--small" style="color: blue; background: white" type="button">ODBLOKUJ</button>  </a> </td>
                            </c:if>

                        <tr/>

                    </table>
                </li><br/>
            </c:forEach>
        </ul>
    </div>
</div>

<script >
    function showConfirmation () {
        const c= confirm("CZY NAPEWNO CHCESZ SKASOWAĆ UŻYTKOWNIKA ?")
        if(!c) {
            const buttons = document.getElementsByName('deleteButtons');
            buttons.forEach(function (button) {
                button.href='/users';
            });
        }

    }
</script>
</body>
</html>
