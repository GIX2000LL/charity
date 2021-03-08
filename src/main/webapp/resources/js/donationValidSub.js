function donationSubmitValid () {
    const quantity = document.getElementById('quantityView');
    const categoryView=document.getElementById('categoryView');
    const institutionView = document.getElementById('institutionView');
    const address =  document.getElementById('addressView');
    const city =document.getElementById('cityView')
    const code =document.getElementById('codeView')
    const phone =document.getElementById('phoneView')
    const data =document.getElementById('dateView')
    const time =document.getElementById('timeView')


    if(quantity.value == 0 || categoryView.value.length <1 || institutionView.value.length<1 || data.value.length<1
        || address.value.length<2 || city.value.length<1 || !code.value.match('[0-9]{2}-[0-9]{3}') || !phone.value.match('\\d{9}') || time.value.length<1 ) {
        alert('UZUPEŁNIJ POPRAWNIE WSZYSTKIE POTRZEBNE DANE ZANIM WYŚLESZ DARY');
        return false;
    }
}