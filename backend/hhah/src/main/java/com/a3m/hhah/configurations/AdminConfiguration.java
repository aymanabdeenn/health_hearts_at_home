package com.a3m.hhah.configurations;

import com.a3m.hhah.controllers.AdminController;
import com.a3m.hhah.entities.resources.Contact;
import com.a3m.hhah.services.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AdminConfiguration {

    private final AdminService adminService;

    @Autowired
    public AdminConfiguration(AdminService adminService) {
        this.adminService = adminService;
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