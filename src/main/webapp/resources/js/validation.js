

    // const password = document.getElementById('password');
    // const userName = document.getElementById('username');
    // const button = document.getElementById('submit');
    // const error = document.getElementById('error');
    //
    // button.addEventListener('submit', ev => {
    //     let messages = [];
    //     if (userName.value === '' || userName.value == null) {
    //         messages.push('Wpisz poprawnie adres mailowy');
    //     }
    //
    //     if (password.value.length < 4) {
    //         messages.push("Hasło musi mieć conajmniej 4 znaki");
    //     }
    //
    //     if (messages.length > 0) {
    //         ev.preventDefault();
    //         error.innerText = messages.join(', ');
    //     }
    // });

    var email = document.forms ['form'] ['username'] ;
    var password = document.forms ['form'] [password];

    var emailError = document.getElementById('emailError');
    var passwordError = document.getElementById('passwordError');

    function validation () {
        if(email.value.length <3 ) {
            email.style.border = "1px solid red";

            email.focus();
            return false;

        }

    }
