package com.a3m.hhah.services;

import com.a3m.hhah.entities.Child;
import com.a3m.hhah.entities.resources.Contact;
import com.a3m.hhah.entities.users.Account;
import com.a3m.hhah.entities.users.CareGiver;
import com.a3m.hhah.entities.users.Role;
import com.a3m.hhah.exceptions.CareGiverNotFoundException;
import com.a3m.hhah.repositories.AccountRepository;
import com.a3m.hhah.repositories.CareGiverRepository;
import com.a3m.hhah.repositories.ChildRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CareGiverService {

    private final CareGiverRepository careGiverRepository;
    private final ChildRepository childRepository;
    private final AccountRepository accountRepository;
    private final ChildService childService;
    private final AccountService accountService;

    @Autowired
    public CareGiverService(CareGiverRepository careGiverRepository, ChildRepository childRepository , AccountRepository accountRepository,ChildService childService, AccountService accountService){
        this.careGiverRepository = careGiverRepository;
        this.childRepository = childRepository;
        this.accountRepository = accountRepository;
        this.childService = childService;
        this.accountService = accountService;
    }

    public CareGiver getCareGiverById(Long id){
        return careGiverRepository.findById(id).orElseThrow(() -> new CareGiverNotFoundException("CareGiver not found!"));
    }

    @Transactional
    public CareGiver createNewCareGiver(String name, String childName, String username, String password, Contact personalContact){
        CareGiver careGiver = new CareGiver(name, personalContact);
        Child child = childService.createNewChild(childName);
        Account account = accountService.createNewCareGiverAccount(username, password, careGiver, Role.ROLE_CAREGIVER);

        careGiver.setChild(child);
        careGiver.setAccount(account);
        child.setCareGiver(careGiver);

        accountRepository.save(account);
        careGiverRepository.save(careGiver);
        childRepository.save(child);

        return careGiver;
    }
}
