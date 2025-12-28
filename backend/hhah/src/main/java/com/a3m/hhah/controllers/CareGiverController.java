package com.a3m.hhah.controllers;

import com.a3m.hhah.dto.ReturnResourceRequest;
import com.a3m.hhah.entities.resources.*;
import com.a3m.hhah.entities.users.CareGiver;
import com.a3m.hhah.services.CareGiverService;
import com.a3m.hhah.services.HealthRecordService;
import com.a3m.hhah.services.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/caregiver")
public class CareGiverController {

    private final CareGiverService careGiverService;
    private final ResourceService resourceService;
    private final HealthRecordService healthRecordService;

    @Autowired
    public CareGiverController(CareGiverService careGiverService, ResourceService resourceService, HealthRecordService healthRecordService) {
        this.careGiverService = careGiverService;
        this.resourceService = resourceService;
        this.healthRecordService = healthRecordService;
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

//    @GetMapping("/getResources")
//    public List<Resource> getResources(@RequestParam String language, @RequestParam String type, @RequestParam String category){
//        return resourceService.getResourceByLanguageAndTypeAndCategory(Language.from(language), ResourceType.from(type), ResourceCategory.from(category));
//    }

    @PostMapping("/getResources")
    public List<Resource> getResources(@RequestBody ReturnResourceRequest dto) {
        return resourceService.getResourceByLanguageAndCategory(Language.from(dto.getLanguage()), ResourceCategory.from(dto.getCategory()));
    }

    @GetMapping("/showLatestRecord")
    public String showLatestRecord(@RequestParam Long childId, @RequestParam String readingType){
        return healthRecordService.getReading(childId, ReadingType.from(readingType));
    }
}
