package pl.coderslab.charity.model;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Donation implements Comparable <Donation> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NumberFormat(style = NumberFormat.Style.NUMBER)
    private int quantity;

    @LazyCollection(LazyCollectionOption.FALSE)
    @NotNull
    @OneToMany
    @JoinColumn
    private Set<Category> categories = new HashSet<>();

    @NotNull
    @ManyToOne
    private Institution institution;

    @Size(min=2, message = "Nazwa ulicy powinna składac się przynajmniej z dwóch znaków")
    private String street;

    @Size(min=2,message = "Podaj miasto")
    private String city;

    @Pattern(regexp = "[0-9]{2}-[0-9]{3}",message = "Proszę wpisac poprawnie kod pocztowy")
    private String zipCode;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate pickUpDate;

    private LocalTime pickUpTime;

    @Pattern(regexp = "\\d{9}",message = "TELEFON MUSI SKŁADAĆ Z CYFR I MAKSYMALNIE 9 ZNAKÓW")
    private String phoneNumber;

    private String deliveryMessage;

    private boolean userConnected=true;

    private boolean isPickedUp=false;

    private LocalDateTime whenPickedUp;

    private boolean expired=false;

    @ManyToOne
    private User user;

    //------------------------------------------------------------------------------

    public Donation() {
    }

    //-------------------------------------------------------------------------------

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Set<Category> getCategories() {
        return categories;
    }

    public void setCategories(Set<Category> categories) {
        this.categories = categories;
    }

    public Institution getInstitution() {
        return institution;
    }

    public void setInstitution(Institution institution) {
        this.institution = institution;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public LocalDate getPickUpDate() {
        return pickUpDate;
    }

    public void setPickUpDate(LocalDate pickUpDate) {
        this.pickUpDate = pickUpDate;
    }

    public LocalTime getPickUpTime() {
        return pickUpTime;
    }

    public void setPickUpTime(LocalTime pickUpTime) {
        this.pickUpTime = pickUpTime;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getDeliveryMessage() {
        return deliveryMessage;
    }

    public void setDeliveryMessage(String deliveryMessage) {
        this.deliveryMessage = deliveryMessage;
    }

    public boolean isUserConnected() {
        return userConnected;
    }

    public void setUserConnected(boolean userConnected) {
        this.userConnected = userConnected;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public boolean isPickedUp() {
        return isPickedUp;
    }

    public void setPickedUp(boolean pickedUp) {
        isPickedUp = pickedUp;
    }

    public LocalDateTime getWhenPickedUp() {
        return whenPickedUp;
    }

    public boolean isExpired() {
        return expired;
    }

    public void setExpired(boolean expired) {
        this.expired = expired;
    }

    public void setWhenPickedUp(LocalDateTime whenPickedUp) {
        this.whenPickedUp = whenPickedUp;
    }

    @Override
    public int compareTo(Donation o) {
        return getPickUpDate().compareTo(o.getPickUpDate());
    }

}
