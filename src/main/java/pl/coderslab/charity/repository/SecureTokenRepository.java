package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.charity.security.SecureToken;

public interface SecureTokenRepository extends JpaRepository<SecureToken, Long> {

    SecureToken findByToken (String token);

    Long removeByToken (String token);  //usunięcie tokena w przypadku jego użycia
}
