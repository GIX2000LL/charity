<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="contact" id="contact">
    <h2>Skontaktuj się z nami</h2>
    <h3>Formularz kontaktowy</h3>
    <form  class="form--contact" method="post">
        <form:form modelAttribute="message" method="post">
            <div class="form-group form-group"><form:input type="text" path="name" placeholder="Imię"/></div>
            <div style="height: 10px"></div>
            <div style="font-size: medium"><form:errors path="name" cssStyle="color: red"/> </div>
            <div class="form-group form-group"><form:input type="text" path="surname" placeholder="Nazwisko"/></div>
            <div style="height: 10px"></div>
            <div style="font-size: medium"><form:errors path="surname" cssStyle="color: red"/> </div>
            <div class="form-group form-group"><form:input type="email" path="email" placeholder="Email"/></div>
            <div style="height: 10px"></div>
            <div style="font-size: medium"><form:errors path="email" cssStyle="color: red"/> </div>

            <div class="form-group"><form:textarea path="message" placeholder="Wiadomość" rows="1"/></div>
            <div style="height: 10px"></div>
            <div style="font-size: medium"><form:errors path="message" cssStyle="color: red"/> </div>

            <button class="btn" type="submit">Wyślij</button>
        </form:form>
    </form>
</div>
<div style="height: 50px"></div>
<div class="bottom-line">
    <span class="bottom-line--copy">Copyright &copy; 2018</span>
    <div class="bottom-line--icons">
        <a href="https://www.facebook.com/" class="btn btn--small"><img src="resources/images/icon-facebook.svg"/></a>
        <a href="https://www.instagram.com/" class="btn btn--small"><img
            src="resources/images/icon-instagram.svg"/></a>
    </div>
</div>

<script>

</script>