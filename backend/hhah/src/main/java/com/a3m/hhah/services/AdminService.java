package com.a3m.hhah.services;

import com.a3m.hhah.entities.users.Account;
import com.a3m.hhah.entities.users.Admin;
import com.a3m.hhah.entities.users.Role;
import com.a3m.hhah.exceptions.AdminNotFoundException;
import com.a3m.hhah.repositories.AccountRepository;
import com.a3m.hhah.repositories.AdminRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {

    private final AdminRepository adminRepository;
    private final AccountRepository accountRepository;
    private final AccountService accountService;


    @Autowired
    public AdminService(AdminRepository adminRepository, AccountRepository accountRepository, AccountService accountService) {
        this.adminRepository = adminRepository;
        this.accountRepository = accountRepository;
        this.accountService = accountService;
    }

    public Admin getAdminById(long id){
        return adminRepository.findById(id).orElseThrow(() -> new AdminNotFoundException("Admin not found."));
    }

    @Transactional
    public Admin createNewAdmin(String name, String username, String password){
        Admin admin = new Admin(name);
        Account account = accountService.createNewAdminAccount(username, password, admin, Role.ROLE_ADMIN);

        accountRepository.save(account);
        adminRepository.save(admin);

        return admin;
    }
}
