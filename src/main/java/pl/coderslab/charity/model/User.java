package pl.coderslab.charity.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Email;
import javax.validation.constraints.Size;

@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;


    @Size (min = 2, message = "IMIĘ MUSI SIĘ SKŁADAC Z MINIMUM 2 ZNAKÓW")
    private String firstName;

    @Size (min = 2, message = "NAZWISKO MUSI SIĘ SKŁADAĆ Z MINIMUM 2 ZNAKÓW")
    private String lastName;

    @Email(message = "WPISZ POPRAWNIE ADRES EMAIL")
    private String email;

    @Size(min=1, message = "HASŁO MUSI MIEĆ CONAJMNIEJ 1 ZNAK")
    private String password;

    private String securityRole;

    //------------------------------------------------------------------------------------------


    public User() {
    }

    //------------------------------------------------------------------------------------------


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSecurityRole() {
        return securityRole;
    }

    public void setSecurityRole(String securityRole) {
        this.securityRole = securityRole;
    }
}

