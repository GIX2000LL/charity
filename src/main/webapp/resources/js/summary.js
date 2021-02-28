function getQuantity () {

    const quantity=document.getElementById('quantity').value;

    document.getElementById('quantityView').value=quantity;
}

function  getCategory () {

    const elements = document.getElementsByName('categories');
    for (let i=0; i<elements.length;i++) {

        if(elements[i].checked)
       document.getElementById('categoryView').value += elements[i].value+" ";
    }
}

function  getInstitution () {

    const institutions = document.getElementsByName('institution')
    for (let i=0; i<institutions.length;i++) {

        if(institutions[i].checked)
            document.getElementById('institutionView').value = institutions[i].value;
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