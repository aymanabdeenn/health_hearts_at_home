package com.a3m.hhah.controllers;

import com.a3m.hhah.entities.resources.Contact;
import com.a3m.hhah.entities.users.CareGiver;
import com.a3m.hhah.services.CareGiverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/caregiver")
public class CareGiverController {

    private final CareGiverService careGiverService;

    @Autowired
    public CareGiverController(CareGiverService careGiverService) {
        this.careGiverService = careGiverService;
    }

    public Contact createContact(String email, String phoneNumber) {
        Contact contact = new Contact();
        contact.addOnEmails(email);
        contact.addOnPhoneNumbers(phoneNumber);
        return contact;
    }

    @GetMapping("/hello")
    public String hello(){
        return "Hey careGiver :) It's WORKING!!!";
    }

    @GetMapping("/signUp")
    public CareGiver createNewUser(@RequestParam String name, @RequestParam String childName, @RequestParam String username, @RequestParam String password, @RequestParam String phoneNumber, @RequestParam String email) {
        Contact contact = createContact(email, phoneNumber);
        return careGiverService.createNewCareGiver(name, childName, username, password, contact);
    }
}
