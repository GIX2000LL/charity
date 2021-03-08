package pl.coderslab.charity.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.security.PrincipalDetails;

import java.util.Optional;


@Service
public class PrincipalUserDetailsService implements UserDetailsService {

    private final UserRepository userRepository;

    public PrincipalUserDetailsService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {

        Optional<User> user=userRepository.findByEmail(email);

        user.orElseThrow(()-> new UsernameNotFoundException("USER"+email+ "NOT FOUND"));

        return user.map(PrincipalDetails::new).get();

    }

//    @Override
//    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
//
//        Optional<User> userOptional = userRepository.findByEmail(email);
//
//        User customer = userOptional.stream()
//                .findAny()
//                .orElseThrow(()->new UsernameNotFoundException("USER "+email+" NOT FOUND"));
//
//        boolean enabled = !customer.isActive();
//        UserDetails user = org.springframework.security.core.userdetails.User.withUsername(customer.getEmail())
//                .password(customer.getPassword())
//                .disabled(enabled)
//                .authorities("USER").build();
//
//        return user;
//    }

}