function validLoginForm() {

    const email = document.forms ['form'] ['username'];
    const emailError =document.getElementById('emailError');

    const password = document.forms ['form'] ['password'];
    const passwordError = document.getElementById('passwordError');

    if(email.value.length <3 || !email.value.includes('@')) {
        emailError.innerText = 'WISZ POPRAWNIE ADRES MAILOWY'
        email.focus();
        return false;
    }

    if(password.value.length <4) {
        passwordError.innerText = 'HASŁO MUSI ZAWIERAĆ CONAJMNIEJ 4 ZNAKI';
        password.focus();
        return false;
    }
}