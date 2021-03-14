package pl.coderslab.charity.component;

import org.springframework.stereotype.Component;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.repository.DonationRepository;

import java.time.LocalDate;

@Component
public class DonationAdd {

    DonationRepository donationRepository;

    public DonationAdd(DonationRepository donationRepository) {
        this.donationRepository = donationRepository;
    }

    public Donation makeDonationExpired (Donation donation) {

        LocalDate donationTime = donation.getPickUpDate();
        LocalDate dateNow =LocalDate.now();

        if(donationTime.isBefore(dateNow)) {
            donation.setExpired(true);
        }
        return donation;
    }
}
