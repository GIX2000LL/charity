function getQuantity () {

    const quantity=document.getElementById('quantity').value;

    document.getElementById('quantityView').value=quantity;
}

function  getCategory () {

    const elements = document.getElementsByName('categories');

    elements.forEach(function (el) {
        if (el.checked)
        document.getElementById('categoryView').value += el.dataset.value+", ";
    });

}

function  getInstitution () {

    const institutions = document.getElementsByName('institution')
    for (let i=0; i<institutions.length;i++) {

        if(institutions[i].checked)
            document.getElementById('institutionView').value = institutions[i].dataset.value;
    }
}

function getAddress () {
    const street=document.getElementById('street').value;

    document.getElementById('addressView').value= street;
}

function getCity () {
    const city=document.getElementById('city').value;

    document.getElementById('cityView').value= city;
}

function getCode () {
    const code=document.getElementById('zipCode').value;

    document.getElementById('codeView').value= code;
}

function getPhone() {
    const phone=document.getElementById('phoneNumber').value;

    document.getElementById('phoneView').value= phone;
}

function getDate() {
    const date=document.getElementById('pickUpDate').value;

    document.getElementById('dateView').value= date;
}

function getTime() {
    const time=document.getElementById('pickUpTime').value;

    document.getElementById('timeView').value= time;
}

function getMessage() {
    const message=document.getElementById('deliveryMessage').value;

    document.getElementById('messageView').value= message;
}