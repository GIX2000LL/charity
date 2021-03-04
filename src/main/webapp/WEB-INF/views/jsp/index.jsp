<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <%@include file="partsOfCode/head.jsp"%>
</head>
<body>
<header class="header--main-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li><a href="/login" class="btn btn--small btn--without-border">Zaloguj</a></li>
            <li><a href="/registration" class="btn btn--small btn--highlighted">Załóż konto</a></li>
        </ul>

        <%@include file="partsOfCode/headerButtons.jsp"%>
        
    </nav>

    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                Zacznij pomagać!<br/>
                Oddaj niechciane rzeczy w zaufane ręce
            </h1>
        </div>
    </div>
</header>

<section class="stats">
    <div class="container container--85">
        <div class="stats--item">
            <em>${totalBags}</em>

            <h3>Oddanych worków</h3>
            <p>Oddawaj rzeczy innym w wygodny i szybki sposób. Spakowane worki odbierze od Ciebie nasz kurier</p>
        </div>

        <div class="stats--item">
            <em>${totalDonations}</em>
            <h3>Przekazanych darów</h3>
            <p>Przekaż swoje dary potrzebującym !</p>
        </div>

    </div>
</section>

<section class="steps" id="what'sGoingOn">
    <h2>Wystarczą 4 proste kroki</h2>

    <div class="steps--container">
        <div class="steps--item">
            <span class="icon icon--hands"></span>
            <h3>Wybierz rzeczy</h3>
            <p>ubrania, zabawki, sprzęt i inne</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--arrow"></span>
            <h3>Spakuj je</h3>
            <p>skorzystaj z worków na śmieci</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--glasses"></span>
            <h3>Zdecyduj komu chcesz pomóc</h3>
            <p>wybierz zaufane miejsce</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--courier"></span>
            <h3>Zamów kuriera</h3>
            <p>kurier przyjedzie w dogodnym terminie</p>
        </div>
    </div>

    <a href="/registration" class="btn btn--large">Załóż konto</a> <br/><br/>
    <a href="/donationForm" class="btn btn--small">Pomóż bez rejestracji</a>
</section>

<section class="about-us" id="aboutUs">
    <div class="about-us--text">
        <h2>O nas</h2>
        <p style="color: green">Naszym celem jest stworzenie miejsca, w którym każdy będzie mógł oddać niepotrzebne rzeczy
            zaufanym instytucjom.</p>
        <ul style="font-size: x-large">
        <li> Masz w domu rzeczy, których nie używasz, ale są  one w dobrym stanie i chcesz przekazać je osobom,
            którym się mogą przydać? </li><br/>
            <li> Nie wiesz w jaki sposób dorzeć do potrzebujących ?</li><br/>
            <li>Nie wiesz jak w łątwy sposób przekazać dary</li>
        </ul>
        <p>  Jest wiele dostępnych rozwiązań, ale wiele z nich wymaga dodatkowego wysiłku lub nie budzą one zaufania.
            W zweryfikowane miejsca trzeba pojechać, a nie ma na to czasu lub nie ma jak tam dotrzeć.
            Natomiast kontenery pod domem lub lokalne zbiórki są niezweryfikowane i nie wiadomo czy te rzeczy faktycznie
            trafią do potrzebujących. <p>

        <img src="<c:url value="resources/images/signature.svg"/>" class="about-us--text-signature" alt="Signature"/>
    </div>
    <div class="about-us--image"><img src="<c:url value="resources/images/about-us.jpg"/>" alt="People in circle"/>
    </div>
</section>

<section class="help" id="institutions">
    <h2>Komu pomagamy?</h2>

    <!-- SLIDE 1 -->
    <div class="help--slides active" data-id="1">
        <p>W naszej bazie znajdziesz listę zweryfikowanych Fundacji, z którymi współpracujemy.
            Możesz sprawdzić czym się zajmują.</p>

        <ul class="help--slides-items">
            <li>

                <c:forEach items="${institutions}" var="inst">
                    <c:if test="${inst.id %2 ==0}">
                <div class="col" >
                        <div class="title">Fundacja "${inst.name}"</div>
                        <div class="subtitle">Cel i misja: ${inst.description}.</div>
                </div>
                    </c:if>

            </li>
                    <c:if test="${inst.id % 2 !=0}">
            <li>
                    <div class="col">
                        <div class="title">Fundacja "${inst.name}"</div>
                        <div class="subtitle">Cel i misja: ${inst.description}.</div>
                    </div>
                </c:if>
                </c:forEach>
            </li>
        </ul>
    </div>
</section>

<footer>
   <%@include file="partsOfCode/footer.jsp"%>
</footer>

<script src="<c:url value="resources/js/app.js"/>"></script>
</body>
</html>
