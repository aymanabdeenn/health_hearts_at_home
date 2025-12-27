package com.a3m.hhah.controllers;

import com.a3m.hhah.dto.AuthResponseDTO;
import com.a3m.hhah.dto.LoginRequest;
import com.a3m.hhah.dto.SignUpRequest;
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

    @PostMapping("/signUp")
    public ResponseEntity<?> createNewUser(@RequestBody SignUpRequest request) {

        Contact contact = createContact(request.email(), request.phoneNumber());

        if (request.userType().equalsIgnoreCase("ADMIN")) {
            adminService.createNewAdmin(
                    request.name(),
                    request.username(),
                    request.password(),
                    contact
            );
        } else if (request.userType().equalsIgnoreCase("CAREGIVER")) {
            careGiverService.createNewCareGiver(
                    request.name(),
                    request.childName(),
                    request.username(),
                    request.password(),
                    contact
            );
        } else {
            return ResponseEntity.badRequest().body("Invalid user type");
        }

        return ResponseEntity.ok("User created successfully");
    }


    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest loginRequest) {
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        loginRequest.getUsername(),
                        loginRequest.getPassword()
                )
        );

        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        String token = jwtGenerator.generateToken(authentication);

        // Return token and role
        String role = authentication.getAuthorities().iterator().next().getAuthority();
        return ResponseEntity.ok(new AuthResponseDTO(token, role));
    }

}
