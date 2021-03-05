package pl.coderslab.charity.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import pl.coderslab.charity.service.PrincipalUserDetailsService;


@EnableJpaRepositories(basePackages = "pl.coderslab")
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private PrincipalUserDetailsService userDetailsService;



    @Override
    protected  void configure (AuthenticationManagerBuilder authenticationManagerBuilder) throws Exception {
        authenticationManagerBuilder.userDetailsService(userDetailsService);

    }

    @Bean
    public PasswordEncoder passwordEncoder (){

        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity security) throws Exception {

        security.csrf().disable();
        security.formLogin().loginPage("/login").defaultSuccessUrl("/user");
        security.logout().logoutSuccessUrl("/");

        security.authorizeRequests()
                .antMatchers("/","/donationForm/**").permitAll()
                .antMatchers("/user/**").hasAnyRole("USER","ADMIN");

    }


}
