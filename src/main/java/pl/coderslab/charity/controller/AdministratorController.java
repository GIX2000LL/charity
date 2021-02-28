package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.List;

@Controller
public class AdministratorController {

    private final InstitutionRepository institutionRepository;

    public AdministratorController(InstitutionRepository institutionRepository) {
        this.institutionRepository = institutionRepository;
    }

    @GetMapping("/fundations")
    public String showFundationsList () {

        return "user/fundations";
    }

    //--------------------------------------------------------------------------

    @ModelAttribute("institutions")
    private List<Institution> showAllInstitutions () {

        return institutionRepository.findAll();
    }
}
