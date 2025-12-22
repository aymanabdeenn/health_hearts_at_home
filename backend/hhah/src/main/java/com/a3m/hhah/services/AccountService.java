package com.a3m.hhah.services;

import com.a3m.hhah.entities.users.Account;
import com.a3m.hhah.entities.users.Admin;
import com.a3m.hhah.entities.users.CareGiver;
import com.a3m.hhah.entities.users.Role;
import com.a3m.hhah.repositories.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountService {

    private final AccountRepository accountRepository;

    @Autowired
    public AccountService(AccountRepository accountRepository){
        this.accountRepository = accountRepository;
    }

    public Account createNewCareGiverAccount(String username, String password, CareGiver careGiver, Role role){
        return new Account(username, password, careGiver, role);
    }

    public Account createNewAdminAccount(String username, String password, Admin admin, Role role){
        return new Account(username, password, admin, role);
    }

}
