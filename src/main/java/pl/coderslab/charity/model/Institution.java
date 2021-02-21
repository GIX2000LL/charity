package pl.coderslab.charity.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Institution {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotNull
    @Size(min=2,message = "Nazwa powinna skłądać się z minimum 2 znaków")
    private String name;

    @NotNull
    @Size(min=2,message = "Opis powinien zawierać minimum 2 znaki" )
    private String description;

    @OneToMany(mappedBy = "institution")
    private List<Donation> donations=new ArrayList<>();


    //------------------------------------------------------------------------------------

    public Institution() {

    }

    //-----------------------------------------------------------------------------------------------

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Donation> getDonations() {
        return donations;
    }

    public void setDonations(List<Donation> donations) {
        this.donations = donations;
    }
}
