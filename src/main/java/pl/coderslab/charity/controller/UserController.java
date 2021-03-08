package pl.coderslab.charity.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Category;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.security.BCrypt;
import pl.coderslab.charity.security.PrincipalDetails;
import javax.validation.Valid;
import java.util.*;
import java.util.stream.Collectors;

@RequestMapping("/user")
@Controller
public class UserController {

    final private UserRepository userRepository;
    final private DonationRepository donationRepository;

    public UserController(UserRepository userRepository, DonationRepository donationRepository) {
        this.userRepository = userRepository;
        this.donationRepository = donationRepository;
    }

    //------------------------------------------------------------

    @GetMapping
    public String showUserZone(Model model) {

        User user = getCurrentUser();
        List<Donation> donations = user.getDonations();
        List<Donation> result=donations.stream()
                .filter(donat -> !donat.isPickedUp())
                .collect(Collectors.toList());
        Collections.sort(result);

        Donation donation = result.get(0);
        model.addAttribute("primeDonation",donation);

        return "user/userZone";
    }

    @GetMapping("/details/{id}")
    public String showUserDetails (@PathVariable Long id, Model model) {

        model.addAttribute("user",getUserById(id));

        return "user/userEdit";
    }

    @PostMapping("/details/{id}")
    public String editDetails (@ModelAttribute ("user") @Valid User user, BindingResult result) {

        if(result.hasErrors()) {
            return "user/userEdit";
        }

        user.setPassword(BCrypt.hashpw(user.getPassword(),BCrypt.gensalt()));
        userRepository.save(user);
        return "redirect:/user";
    }

    //------------------------------------User Donations -------------------------------------------------

    @GetMapping("/donations/{id}")
    public String showUserDonations (@PathVariable Long id, Model model) {

        User user= getUserById(id);
        List <Donation> userDonations = user.getDonations();
        Collections.sort(userDonations);

        model.addAttribute("donations",userDonations);

        return "user/userDonation";
    }

    @GetMapping("/donation/pickedUp/{id}")
    public String markDonationAsPicked (@PathVariable Long id) {

        Donation donation = findDonationById(id);
        donation.setPickedUp(true);
        donationRepository.save(donation);

        return "redirect:/user/donations/"+donation.getUser().getId();
    }

    @GetMapping("/donation/notPickedUp/{id}")
    public String markDonationAsNotPicked (@PathVariable Long id) {

        Donation donation = findDonationById(id);
        donation.setPickedUp(false);
        donationRepository.save(donation);

        return "redirect:/user/donations/"+donation.getUser().getId();
    }

    @GetMapping("/donation/details/{id}")
    public String showDonationDetails (@PathVariable Long id, Model model) {

        Donation donation = findDonationById(id);
        model.addAttribute("donation",donation);

        return "user/donationDetails";
    }

    //-------------------------------------------------------------

    @ModelAttribute("currentUser")
    public User getCurrentUser () {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        PrincipalDetails principalDetails = (PrincipalDetails) auth.getPrincipal();

        return principalDetails.getUser();
    }

    private User getUserById (Long id) {

        Optional<User> optionalUser = userRepository.findById(id);

        return optionalUser.stream()
                .findAny()
                .orElseThrow(NoSuchElementException::new);
    }

    private Donation findDonationById (Long id) {

        Optional <Donation> optionalDonation = donationRepository.findById(id);

        return optionalDonation.stream()
                .findAny()
                .orElseThrow(NoSuchElementException::new);
    }

}