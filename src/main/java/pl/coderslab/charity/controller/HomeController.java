package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.model.Message;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.List;

@RequestMapping("/")
@Controller
public class HomeController {

    private InstitutionRepository institutionRepository;
    private DonationRepository donationRepository;

    public HomeController(InstitutionRepository institutionRepository, DonationRepository donationRepository) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
    }

    //--------------------------------------------------------------------------------------------------

    @GetMapping
    public String homeAction(Model model){

        model.addAttribute("message",new Message());

        return "index";
    }

    //--------------------------------------------------------------------------------------------------------

    @ModelAttribute("institutions")
    public List<Institution> getAllInstitutions () {

        return institutionRepository.findAll();
    }

    @ModelAttribute ("totalBags")
    public int getNumberOfAllBags () {

       return donationRepository.findAll().stream()
               .mapToInt(Donation::getQuantity)
               .sum();
    }

    @ModelAttribute ("totalDonations")
    public int getNumberOfDonations () {

        return donationRepository.findAll().size();
    }

}
