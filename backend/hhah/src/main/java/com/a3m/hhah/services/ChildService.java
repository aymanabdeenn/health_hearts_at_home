package com.a3m.hhah.services;

import com.a3m.hhah.entities.Child;
import com.a3m.hhah.entities.HealthRecord;
import com.a3m.hhah.entities.users.CareGiver;
import com.a3m.hhah.exceptions.ChildNotFoundException;
import com.a3m.hhah.repositories.ChildRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ChildService {

    private final ChildRepository childRepository;

    @Autowired
    public ChildService(ChildRepository childRepository){
        this.childRepository = childRepository;
    }

    public Child getChildById(Long id){
        return childRepository.findById(id).orElseThrow(() -> new ChildNotFoundException("Child not found."));
    }

    public Child createNewChild(String name){
        return new Child(name);
    }
}
