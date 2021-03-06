function passwordConfirm () {

    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('password2').value;
    const error = document.getElementById('error');

    if(password!==confirmPassword) {
        error.innerText='Wpisz poprawnie potwierdzenie hasła';
        return false;
    }
    else {
        return true;
    }

}