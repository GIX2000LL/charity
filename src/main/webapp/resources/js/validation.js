
function validationBags () {

    let quantity = parseInt(document.forms["donation"] ["bags"]);
    if(quantity<1) {
        alert("Wpisz poprawnie liczbę worków")
    } else {
        alert("Zadeklarowałeś liczbę worków");
    }
}

