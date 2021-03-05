package pl.coderslab.charity.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.security.BCrypt;
import pl.coderslab.charity.security.PrincipalDetails;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
public class AdministratorController {

    private final InstitutionRepository institutionRepository;
    private final UserRepository userRepository;

    public AdministratorController(InstitutionRepository institutionRepository, UserRepository userRepository) {
        this.institutionRepository = institutionRepository;
        this.userRepository = userRepository;
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

    //------------------------------------------------------------------------------

    @GetMapping("/admins")
    public String showAllAdmins () {

        return "user/admins";
    }

    //--------------------------------------------------------------------------------

    @GetMapping("/admins/add")
    public String showAdminForm (Model model) {

        model.addAttribute("admin", new User());

        return "forms/adminForm";
    }

    @PostMapping("/admins/add")
    public String createAdmin (@ModelAttribute User admin) {

        admin.setPassword(BCrypt.hashpw(admin.getPassword(),BCrypt.gensalt()));
        admin.setSecurityRole("ROLE_ADMIN");
        userRepository.save(admin);

        return "redirect:/admins";
    }

    //----------------------------------------------------------------------------------

    @GetMapping("/admins/edit/{id}")
    public String showEditAdminForm (@PathVariable Long id, Model model) {

        model.addAttribute("admin", getUserById(id));

        return "forms/adminForm";
    }

    @PostMapping("/admins/edit/{id}")
    public String editAdmin (@ModelAttribute User admin) {

        userRepository.save(admin);

        return "redirect:/admins";
    }

    @GetMapping("/admins/delete/{id}")
    public String deleteAdmin (@PathVariable Long id) {

        userRepository.delete(getUserById(id));

        return "redirect:/admins";
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

    @ModelAttribute("admins")
    private List<User> getAllAdmins () {

        return userRepository.findAll().stream()
                .filter(user -> user.getSecurityRole().equals("ROLE_ADMIN"))
                .collect(Collectors.toList());
    }

    @ModelAttribute("currentUser")
    public User getCurrentUser () {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        PrincipalDetails principalDetails = (PrincipalDetails) auth.getPrincipal();

        return principalDetails.getUser();
    }

    private User getUserById (Long id) {

        Optional <User> optionalUser = userRepository.findById(id);

        return optionalUser.stream()
                .findAny()
                .orElseThrow(NoSuchElementException::new);
    }
}
