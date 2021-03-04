package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

@Controller
public class AdministratorController {

    private final InstitutionRepository institutionRepository;

    public AdministratorController(InstitutionRepository institutionRepository) {
        this.institutionRepository = institutionRepository;
    }

    @GetMapping("/foundations")
    public String showFoundationsList () {

        return "user/foundations";
    }

    //---------------------------------------------------------------------------

    @GetMapping("/foundations/edit/{id}")
    public String showFoundationEditForm (@PathVariable Long id, Model model) {

        model.addAttribute("foundation", findInstById(id));
        return "forms/foundationForm";
    }

    @PostMapping("/foundations/edit/{id}")
    public String editFoundation (@ModelAttribute Institution foundation) {

        institutionRepository.save(foundation);

        return "redirect:/foundations";
    }

    //------------------------------------------------------------------------------

    @GetMapping("/foundations/add")
    public String showFoundationForm (Model model) {

        model.addAttribute("foundation", new Institution());

        return "forms/foundationForm";
    }

    @PostMapping("/foundations/add")
    public String createFoundation (@ModelAttribute Institution foundation) {

        institutionRepository.save(foundation);

        return "redirect:/foundations";
    }

    @GetMapping("/foundations/delete/{id}")
    public String deleteFoundation (@PathVariable Long id) {

        Institution institution = findInstById(id);
        institutionRepository.delete(institution);

        return "redirect:/foundations";
    }
    //--------------------------------------------------------------------------

    @ModelAttribute("institutions")
    private List<Institution> showAllInstitutions () {

        return institutionRepository.findAll();
    }

    //-------------------------------------------------------------------------------------
    private Institution findInstById (Long id) {

        Optional<Institution> optInst =institutionRepository.findById(id);

        Institution institution = optInst.stream()
                .findFirst()
                .orElseThrow(NoSuchElementException::new);

        return institution;
    }
}
