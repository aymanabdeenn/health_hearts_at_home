package com.a3m.hhah.controllers;

import com.a3m.hhah.entities.users.Admin;
import com.a3m.hhah.services.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin")
public class AdminController {

    private final AdminService adminService;

    @Autowired
    public AdminController(AdminService adminService) {
        this.adminService = adminService;
    }

    @GetMapping("/hello")
    public String hello(){
        return "Hey admin :) It's WORKING!!!";
    }

    @GetMapping("/signUp")
    public Admin createNewUser(@RequestParam String name, @RequestParam String username, @RequestParam String password) {
        return adminService.createNewAdmin(name, username, password);
    }

}
