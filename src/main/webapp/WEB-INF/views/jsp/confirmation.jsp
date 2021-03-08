<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>

    <link rel="stylesheet" href="<c:url value ="/resources/css/style.css"/>"/>
</head>

<body>
<header class="header--form-page">
    <nav class="container container--70">

        <ul>
            <c:choose>
            <c:when test="${userId!=0}">
            <li><a href="/user" class="btn btn--without-border" style="color: blue">Wróć do panelu użytkownika</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="/" class="btn btn--without-border" style="color: blue">Wróć do strony głównej</a></li>
            </c:otherwise>
            </c:choose>
        </ul>

    </nav>

    <div class="slogan container container--90">
        <h2>
            Dziękujemy za przesłanie formularza Na maila prześlemy wszelkie
            informacje o odbiorze.
        </h2>
    </div>
</header>

</body>
</html>