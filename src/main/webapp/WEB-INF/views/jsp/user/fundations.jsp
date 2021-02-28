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
    <header style="height: 50px" class="header--form-page">

            <nav class="container container--70">
                <ul class="nav--actions">
                    <li class="logged-user" style="font-size: x-large">
                        PANEL ADMINISTRATORA

                        <ul class="dropdown">
                            <li><a href="/fundations">Fundacje</a></li>
                            <li><a href="#">Moje zbiórki</a></li>
                            <li><a href="/logout">Wyloguj</a></li>
                        </ul>
                    </li>
                </ul>

            </nav>
    </header>

    <div align="center">
        <h2 style="color: green">
            FUNDACJE</h2> <br/>
            <a style="font-size: large;color: green" href="/fundations/add">DODAJ NOWĄ FUNDACJE</a>
    </div>
    <div align="center">
    <ul style="font-size: x-large">
        <c:forEach items="${institutions}" var="inst">
            <li> ${inst.name} : ${inst.description}
                <table>
                    <tr>
                        <td> <a href="/fundations/edit/${inst.id}"><button class="btn" type="button">EDYCJA</button>  </a> </td>
                        <td> <a href="/fundations/delete/${inst.id}"><button class="btn" type="button">USUŃ</button>  </a> </td>
                    <tr/>
                </table>
            </li><br/>
        </c:forEach>
    </ul>
    </div>

    <script src="js/app.js"></script>
</body>
</html>
