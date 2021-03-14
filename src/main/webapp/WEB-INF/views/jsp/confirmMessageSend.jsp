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
            <li><a href="/" class="btn btn--without-border" style="color: blue">Wróć do strony głównej</a></li>
        </ul>

    </nav>

    <div class="slogan container container--90">
        <h2>
            Dziękujemy za przesłanie do Nas wiadomości. Niebawem otrzyma Pan/Pani wiadomośc zwrotną.
        </h2>
    </div>
</header>

</body>
</html>