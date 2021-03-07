package pl.coderslab.charity.model;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class Message {

    @NotNull
    @Size(min = 2, message = "Imię musi skłądac się z minimum 2 znaków")
    private String name;

    @NotNull
    @Size(min=2, message = "Nazwisko musi składać się z minimum 2 znaków")
    private String surname;

    @NotNull
    @Size(min = 10, message = "Wiadomość musi zawierać przynajmniej 10 znaków")
    private String message;

    @Email(message = "Wpisz poprawnie adres mailowy")
    @NotNull
    private String email;


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
