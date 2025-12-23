package com.a3m.hhah.controllers;

import com.a3m.hhah.dto.AuthResponseDTO;
import com.a3m.hhah.entities.resources.Contact;
import com.a3m.hhah.security.CustomUserDetails;
import com.a3m.hhah.security.JwtGenerator;
import com.a3m.hhah.services.AdminService;
import com.a3m.hhah.services.CareGiverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
public class AuthController {

    private final CareGiverService careGiverService;
    private final AdminService adminService;
    private JwtGenerator jwtGenerator;
    private AuthenticationManager authenticationManager;


    @Autowired
    public AuthController(CareGiverService careGiverService,
                          AdminService adminService,
                          JwtGenerator jwtGenerator,
                          AuthenticationManager authenticationManager) {
        this.careGiverService = careGiverService;
        this.adminService = adminService;
        this.jwtGenerator = jwtGenerator;
        this.authenticationManager = authenticationManager;

    }

    private Contact createContact(String email, String phoneNumber) {
        Contact contact = new Contact();
        contact.addOnEmails(email);
        contact.addOnPhoneNumbers(phoneNumber);
        return contact;
    }

    @GetMapping("/signUp")
    public ResponseEntity<?> createNewUser(
            @RequestParam String userType,
            @RequestParam String name,
            @RequestParam(required = false) String childName,
            @RequestParam String username,
            @RequestParam String password,
            @RequestParam String phoneNumber,
            @RequestParam String email) {

        Contact contact = createContact(email, phoneNumber);

        try {
            if (userType.equalsIgnoreCase("ADMIN")) {
                adminService.createNewAdmin(name, username, password, contact);
            } else if (userType.equalsIgnoreCase("CAREGIVER")) {
                if (childName == null || childName.isBlank()) {
                    return ResponseEntity.badRequest().body("childName is required for caregivers");
                }
                careGiverService.createNewCareGiver(name, childName, username, password, contact);
            } else {
                return ResponseEntity.badRequest().body("Invalid userType. Must be 'ADMIN' or 'CAREGIVER'.");
            }
        } catch (Exception e) {
            return ResponseEntity.status(500).body("Error creating user: " + e.getMessage());
        }

        return ResponseEntity.ok("User created successfully");
    }

    @GetMapping("/login")
    public ResponseEntity<?> login(@RequestParam String username, @RequestParam String password) {
            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(
                            username,  // record getter
                            password
                    )
            );

            CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
            String token = jwtGenerator.generateToken(authentication); // pass userDetails or account depending on your provider

            return ResponseEntity.ok(new AuthResponseDTO(token));
    }
}
