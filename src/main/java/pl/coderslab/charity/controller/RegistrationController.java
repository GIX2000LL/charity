package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.security.BCrypt;

import javax.validation.Valid;

@RequestMapping("/registration")
@Controller
public class RegistrationController {

    private final UserRepository userRepository;

    public RegistrationController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    //------------------------------------------------------------------------

    @GetMapping
    public String showRegistrationForm (Model model) {

        model.addAttribute("user", new User());

        return "forms/registrationForm";

    }

    @PostMapping
    public String createUser (@ModelAttribute("user") @Valid User user, BindingResult result) {

        if(result.hasErrors()) {

            return "forms/registrationForm";
        }

        user.setPassword(BCrypt.hashpw(user.getPassword(),BCrypt.gensalt()));
        user.setSecurityRole("ROLE_USER");

        userRepository.save(user);

        return "redirect:";
    }
}
