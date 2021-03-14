package pl.coderslab.charity.model;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import pl.coderslab.charity.security.SecureToken;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Size (min = 2, message = "IMIĘ MUSI SIĘ SKŁADAC Z MINIMUM 2 ZNAKÓW")
    private String firstName;

    @Size (min = 2, message = "NAZWISKO MUSI SIĘ SKŁADAĆ Z MINIMUM 2 ZNAKÓW")
    private String lastName;

    @Size(min =3, message = "WPISZ POPRAWNIE ADRES EMAIL")
    @Email(message = "WPISZ POPRAWNIE ADRES EMAIL")
    @NotNull
    private String email;


    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d.*\\d)[a-zA-Z0-9\\S]{8,}$", message = "HASŁO MUSI SIĘ SKŁADAĆ Z: CONAJMNIEJ 8 ZNAKÓW, MAŁEJ I DUŻEJ LITERY ORAZ CYFRY")
    private String password;

    private String securityRole;

    private boolean isActive=true;

    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany (mappedBy = "user")
    private List<Donation> donations = new ArrayList<>();

    @OneToMany(mappedBy = "user")
    private Set<SecureToken> tokens;

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

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public List<Donation> getDonations() {
        return donations;
    }

    public void setDonations(List<Donation> donations) {
        this.donations = donations;
    }

    public Set<SecureToken> getTokens() {
        return tokens;
    }

    public void setTokens(Set<SecureToken> tokens) {
        this.tokens = tokens;
    }
}

