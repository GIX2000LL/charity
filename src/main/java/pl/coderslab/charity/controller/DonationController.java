package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Category;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;
import java.util.*;

@RequestMapping("/donationForm")
@Controller
public class DonationController {

    private final CategoryRepository categoryRepository;
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;

    public DonationController(CategoryRepository categoryRepository, InstitutionRepository institutionRepository, DonationRepository donationRepository) {
        this.categoryRepository = categoryRepository;
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
    }

    //-------------------------------------------------------------------------------------------

    @GetMapping("/{userConnected}")
    public String showDonationForm (@PathVariable Boolean userConnected, Model model) {

        Donation donation = new Donation();
        donation.setUserConnected(userConnected);
        model.addAttribute("donation",donation);

        return "donationForm";
    }

    @PostMapping("/{userConnected}")
    public String showConfirmationOfDonation (@ModelAttribute("donation") Donation donation) {

        donationRepository.save(donation);

       return "confirmation";
    }

    //-----------------------------------------------------------------------------------

    @ModelAttribute("categoriesModel")
    public List <Category> showAllCategories () {

        List<Category> categories = new ArrayList<>();

        Category category1 = new Category(1,"Ubrania"); categories.add(category1);
        Category category2 = new Category(2,"Zabawki"); categories.add(category2);
        Category category3 = new Category(3,"Książki"); categories.add(category3);
        Category category4 = new Category(4,"Jedzenie"); categories.add(category4);
        Category category5 = new Category(5,"Chemia"); categories.add(category5);
        Category category6 = new Category(6,"Leki"); categories.add(category6);
        Category category7 = new Category(7,"Karma zwierzęca"); categories.add(category7);

        categories.stream()
                .forEach(category -> categoryRepository.save(category));

        return categories;
    }

    @ModelAttribute("institutions")
    public List<Institution> showAllInstitutions () {
        return institutionRepository.findAll();
    }
}
