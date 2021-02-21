package pl.coderslab.charity.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotNull
    @Size(min = 2,message = "Nazwa powinna składac się z minimum 2 znaków")
    private String name;

    //-----------------------------------------------------------------------------------------

    public Category() {
    }

    public Category(long id, @NotNull @Size(min = 2, message = "Nazwa powinna składac się z minimum 2 znaków") String name) {
        this.id = id;
        this.name = name;
    }

    //-----------------------------------------------------------------------------------------

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
}
