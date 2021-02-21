package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Category;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("/donationForm")
public class DonationController {

    private CategoryRepository categoryRepository;
    public InstitutionRepository institutionRepository;

    public DonationController(CategoryRepository categoryRepository, InstitutionRepository institutionRepository) {
        this.categoryRepository = categoryRepository;
        this.institutionRepository = institutionRepository;
    }

    //-------------------------------------------------------------------------------------------

    @GetMapping
    public String showDonationForm (Model model) {

        model.addAttribute("donation",new Donation());

        return "donationForm";
    }

//    @PostMapping
//    @ResponseBody
//    public String makeNewDonation (@ModelAttribute Donation donation) {
//
//      return
//
//    }

    @PostMapping("/confirmation")
    public String showConfirmationOfDonation () {

        return "confirmation";
    }

    //-----------------------------------------------------------------------------------

    @ModelAttribute("categories")
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
