package pl.coderslab.charity;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class CharityApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(CharityApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure (SpringApplicationBuilder applicationBuilder) {

        return applicationBuilder.sources(CharityApplication.class);
    }

}
