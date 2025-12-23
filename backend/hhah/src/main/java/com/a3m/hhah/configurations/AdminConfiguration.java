package com.a3m.hhah.configurations;

import com.a3m.hhah.controllers.AdminController;
import com.a3m.hhah.entities.resources.Contact;
import com.a3m.hhah.services.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.security.KeyStore;

@Configuration
public class AdminConfiguration {

    private final AdminService adminService;
    private final PasswordEncoder passwordEncoder;

    @Autowired
    public AdminConfiguration(AdminService adminService, PasswordEncoder passwordEncoder) {
        this.adminService = adminService;
        this.passwordEncoder = passwordEncoder;
    }

    @Bean
    CommandLineRunner commandLineRunnerAdmin() {
        return args ->  {
            Contact contact = new Contact();
            contact.addOnPhoneNumbers("01234");
            contact.addOnEmails("adm1@gmail.com");

            adminService.createNewAdmin("admin", "adm1", "123", contact);
        };
    }
}