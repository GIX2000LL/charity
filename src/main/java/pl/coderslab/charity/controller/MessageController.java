package pl.coderslab.charity.controller;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.email.EmailConfig;
import pl.coderslab.charity.model.Message;

import javax.validation.Valid;
import javax.validation.ValidationException;

@Controller
@RequestMapping("/")
public class MessageController {

    private EmailConfig emailConfig;

    public MessageController(EmailConfig emailConfig) {
        this.emailConfig = emailConfig;
    }

    @PostMapping
    public String sendFeedback (@ModelAttribute("message") @Valid Message message, BindingResult result) {

        if(result.hasErrors()) {
            return "index";
        }

        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost(this.emailConfig.getHost());
        mailSender.setPort(this.emailConfig.getPort());
        mailSender.setUsername(this.emailConfig.getUsername());
        mailSender.setPassword(this.emailConfig.getPassword());

        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(message.getEmail());
        mailMessage.setSubject("Wiadomość od "+ message.getName()+" "+message.getSurname());
        mailMessage.setText(message.getMessage());

        mailSender.send(mailMessage);

        return "confirmMessageSend";
    }
}
