package pl.coderslab.charity.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.security.BCrypt;
import pl.coderslab.charity.security.PrincipalDetails;

import javax.validation.Valid;
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

    //---------------------------------------------------------------------------



//-----------------------------Foundation CRUD ----------------------------------------------

    @GetMapping("/foundations")
    public String showFoundationsList () {

        return "user/foundations";
    }

    @GetMapping("/foundations/edit/{id}")
    public String showFoundationEditForm (@PathVariable Long id, Model model) {

        model.addAttribute("foundation", findInstById(id));
        return "forms/foundationForm";
    }

    @PostMapping("/foundations/edit/{id}")
    public String editFoundation (@ModelAttribute("foundation") @Valid Institution foundation, BindingResult result) {

        if(result.hasErrors()){

            return "forms/foundationForm";
        }
        institutionRepository.save(foundation);

        return "redirect:/foundations";
    }

    @GetMapping("/foundations/add")
    public String showFoundationForm (Model model) {

        model.addAttribute("foundation", new Institution());

        return "forms/foundationForm";
    }

    @PostMapping("/foundations/add")
    public String createFoundation (@ModelAttribute("foundation") @Valid Institution foundation, BindingResult result) {

        if(result.hasErrors()) {
            return "forms/foundationForm";
        }
        institutionRepository.save(foundation);

        return "redirect:/foundations";
    }

    @GetMapping("/foundations/delete/{id}")
    public String deleteFoundation (@PathVariable Long id) {

        Institution institution = findInstById(id);
        institutionRepository.delete(institution);

        return "redirect:/foundations";
    }

//-------------------------------Admins CRUD ---------------------------------------------------

    @GetMapping("/admins")
    public String showAllAdmins () {

        return "user/admins";
    }


    @GetMapping("/admins/add")
    public String showAdminForm (Model model) {

        model.addAttribute("admin", new User());

        return "forms/adminForm";
    }

    @PostMapping("/admins/add")
    public String createAdmin (@ModelAttribute("admin") @Valid User admin, BindingResult result) {

        if(result.hasErrors()){
            return "forms/adminForm";
        }

        admin.setPassword(BCrypt.hashpw(admin.getPassword(),BCrypt.gensalt()));
        admin.setSecurityRole("ROLE_ADMIN");
        userRepository.save(admin);

        return "redirect:/admins";
    }


    @GetMapping("/admins/edit/{id}")
    public String showEditAdminForm (@PathVariable Long id, Model model) {

        model.addAttribute("admin", getUserById(id));

        return "forms/adminForm";
    }

    @PostMapping("/admins/edit/{id}")
    public String editAdmin (@ModelAttribute("admin") @Valid User admin, BindingResult result) {

        if(result.hasErrors()){
            return "forms/adminForm";
        }
        userRepository.save(admin);

        return "redirect:/admins";
    }

    @GetMapping("/admins/delete/{id}")
    public String deleteAdmin (@PathVariable Long id) {

        userRepository.delete(getUserById(id));

        return "redirect:/admins";
    }

    //-------------------------------USERS CRUD -------------------------------------------

    @GetMapping("/users")
    public String showUsers () {

        return "user/users";
    }

    @GetMapping("/users/add")
    public String showUserForm (Model model) {

        model.addAttribute("user", new User());

        return "forms/userForm";
    }

    @PostMapping("/users/add")
    public String createUser (@ModelAttribute("user") @Valid User user, BindingResult result) {

        if(result.hasErrors()){
            return "forms/userForm";
        }

        user.setPassword(BCrypt.hashpw(user.getPassword(),BCrypt.gensalt()));
        user.setSecurityRole("ROLE_USER");
        userRepository.save(user);

        return "redirect:/users";
    }

    @GetMapping("/users/edit/{id}")
    public String showEditUserForm (@PathVariable Long id, Model model) {

        model.addAttribute("user", getUserById(id));

        return "forms/userForm";
    }

    @PostMapping("/users/edit/{id}")
    public String editUser (@ModelAttribute("user") @Valid User user, BindingResult result) {

        if(result.hasErrors()){
            return "forms/userForm";
        }
        userRepository.save(user);

        return "redirect:/users";
    }

    @GetMapping("/users/delete/{id}")
    public String deleteUser (@PathVariable Long id) {

        userRepository.delete(getUserById(id));

        return "redirect:/users";
    }

    @GetMapping("/users/block/{id}")
    public String blockUser (@PathVariable Long id) {

        User user = getUserById(id);
        user.setActive(false);
        userRepository.save(user);

        return "redirect:/users";
    }

    @GetMapping("/users/unblock/{id}")
    public String unblockUser (@PathVariable Long id) {

        User user = getUserById(id);
        user.setActive(true);
        userRepository.save(user);

        return "redirect:/users";
    }

    //--------------------------------------------------------------------------

    @ModelAttribute("institutions")
    private List<Institution> showAllInstitutions () {

        return institutionRepository.findAll();
    }


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
    private User getCurrentUser () {

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

    @ModelAttribute("users")
    private List <User> showUsersList () {

        return userRepository.findAll().stream()
                .filter(user -> user.getSecurityRole().equals("ROLE_USER"))
                .collect(Collectors.toList());
    }

}
