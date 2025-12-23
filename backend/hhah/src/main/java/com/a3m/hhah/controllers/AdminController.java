package com.a3m.hhah.controllers;

import com.a3m.hhah.entities.HealthRecord;
import com.a3m.hhah.entities.resources.*;
import com.a3m.hhah.entities.users.Admin;
import com.a3m.hhah.services.AdminService;
import com.a3m.hhah.services.HealthRecordService;
import com.a3m.hhah.services.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/admin")
public class AdminController {

    private final AdminService adminService;
    private final ResourceService resourceService;
    private final HealthRecordService healthRecordService;

    @Autowired
    public AdminController(AdminService adminService, ResourceService resourceService, HealthRecordService healthRecordService) {
        this.adminService = adminService;
        this.resourceService = resourceService;
        this.healthRecordService = healthRecordService;
    }

    public Contact createContact(String phoneNumber, String email){
        Contact contact = new Contact();
        contact.addOnPhoneNumbers(phoneNumber);
        contact.addOnEmails(email);
        return contact;
    }

    @GetMapping("/hello")
    public String hello(){
        return "Hey admin :) It's WORKING!!!";
    }

    @GetMapping("/signUp")
    public Admin createNewUser(@RequestParam String name, @RequestParam String username, @RequestParam String password, @RequestParam String phoneNumber, @RequestParam String email) {
        Contact contact = createContact(phoneNumber, email);
        return adminService.createNewAdmin(name, username, password, contact);
    }

    @GetMapping("/addResource")
    public Resource addNewResource(@RequestParam String title, @RequestParam String language, @RequestParam String type, @RequestParam String category, @RequestParam String link) {
        return resourceService.createNewResource(title, Language.from(language), ResourceType.from(type), ResourceCategory.from(category), link);
    }

    @GetMapping("/addToChildRecords")
    public HealthRecord addToChildRecords(@RequestParam long childId, @RequestParam float weight, @RequestParam float bloodPressure, @RequestParam float oxPulse){
        return healthRecordService.addHealthRecord(childId, weight, bloodPressure, oxPulse);
    }

}
