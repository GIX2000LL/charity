
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <%@include file="partsOfCode/head.jsp"%>
</head>

<body>
<header class="header--form-page" style="height: 200px">
    <nav class="container container--70">
        <ul class="nav--actions">
            <ul class="nav--actions">
                <li><a href="/login" class="btn btn--small btn--without-border">Zaloguj</a></li>
                <li><a href="/registration" class="btn btn--small btn--highlighted">Załóż konto</a></li>
            </ul>
        </ul>

        <%@include file="partsOfCode/headerButtons.jsp"%>
    </nav>

</header>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="2">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="3">
                Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>

        <form method="post" name="donationForm" onsubmit="return donationSubmitValid()">
            <form:form modelAttribute="donation">
            <!-- STEP 1: class .active is switching steps -->
            <div data-step="1" class="active">
                <h3>Zaznacz co chcesz oddać:</h3>

                <c:forEach items="${categoriesModel}" var="cat">

                <div class="form-group form-group--checkbox">
                    <label>
                        <input data-value="${cat.name}" type="checkbox" id="category" name="categories" value="${cat.id}"/>
                        <span class="checkbox"></span>
                        <span class="description"> ${cat.name} </span>
                    </label>
                </div>

                </c:forEach>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 2 -->
            <div data-step="2">
                <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

                <div class="form-group form-group--inline">
                    <label>
                        Liczba 60l worków:
                        <input type="number" id="quantity" name="quantity">
                    </label>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>


            <!-- STEP 4 -->
            <div data-step="3">
                <h3>Wybierz organizacje, której chcesz pomóc:</h3>

                <c:forEach items="${institutions}" var="inst">

                <div class="form-group form-group--checkbox">
                    <label>
                        <input data-value="${inst.name}" type="radio" id="institution" name="institution" value="${inst.id}"/>
                        <span class="checkbox radio"></span>
                        <span class="description">
                            <div class="title"> ${inst.name} </div>
                            <div class="subtitle"> ${inst.description} </div>
                        </span>
                    </label>
                </div>

                </c:forEach>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 5 -->
            <div data-step="4">
                <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4>Adres odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label> Ulica <input id="street" type="text" name="street" /> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Miasto <input id="city" type="text" name="city" /> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Kod pocztowy <input id="zipCode" type="text" name="zipCode" placeholder="Format xx-xxx" />
                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Numer telefonu <input id="phoneNumber"  minlength="9" maxlength="9" type="text" name="phoneNumber" placeholder="Wpisz 9 cyfr" />
                            </label>
                        </div>
                    </div>

                    <div class="form-section--column">
                        <h4>Termin odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label> Data <input id="pickUpDate" type="date" name="pickUpDate" /> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Godzina <input id="pickUpTime" type="time" name="pickUpTime" /> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Uwagi dla kuriera
                                <textarea id="deliveryMessage" name="deliveryMessage" rows="5"></textarea>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step" onclick="getQuantity();getCategory();getInstitution(); getTime();
                    getAddress(); getCity(); getCode(); getPhone(); getDate(); getMessage()">Dalej</button>
                </div>
            </div>

            <!-- STEP 6 -->
            <div data-step="5">
                <h3>Podsumowanie Twojej darowizny</h3>

                <div class="summary">
                    <div class="form-section">
                        <h4>Oddajesz:</h4>
                        <ul>
                            <li>
                                <span class="icon icon-bag"></span>
                                <span class="summary--text">
                                    <input disabled style="background-color: ghostwhite;width: 40px;color: black " class="btn--without-border" id="quantityView"/>
                                    worki <input disabled style="background-color: ghostwhite; color: black" class="btn--without-border" id="categoryView"/> </span>
                            </li>

                            <li>
                                <span class="icon icon-hand"></span>
                                <span class="summary--text"
                                >Dla fundacji <input disabled style="background-color: ghostwhite; color: black" class="btn--without-border" id="institutionView"/></span>
                            </li>
                        </ul>
                    </div>

                    <div class="form-section form-section--columns">
                        <div class="form-section--column">
                            <h4>Adres odbioru:</h4>
                            <ul>
                                <li><input disabled style="background-color: ghostwhite; color: black" class="btn--without-border" id="addressView"/></li>
                                <li><input disabled style="background-color: ghostwhite; color: black" class="btn--without-border" id="cityView"/></li>
                                <li><input disabled style="background-color: ghostwhite; color: black" class="btn--without-border" id="codeView"/></li>
                                <li><input disabled style="background-color: ghostwhite; color: black" class="btn--without-border" id="phoneView"/></li>
                            </ul>
                        </div>

                        <div class="form-section--column">
                            <h4>Termin odbioru:</h4>
                            <ul>
                                <li><input disabled style="background-color: ghostwhite; color: black" class="btn--without-border" id="dateView"/></li>
                                <li><input disabled style="background-color: ghostwhite; color: black" class="btn--without-border" id="timeView"/></li>
                                <li>UWAGI: <input disabled style="background-color: ghostwhite; color: black" class="btn--without-border" id="messageView"/></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="submit" class="btn">Potwierdzam</button>
                </div>
            </div>
            </form:form>
        </form>
    </div>
</section>



<script src="/resources/js/app.js"></script>
<script src="/resources/js/summary.js"></script>
<script src="/resources/js/donationValidSub.js"></script>

</body>
</html>