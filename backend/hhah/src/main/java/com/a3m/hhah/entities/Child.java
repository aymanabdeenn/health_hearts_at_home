package com.a3m.hhah.entities;

import com.a3m.hhah.entities.users.CareGiver;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table
public class Child {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    
    @Column(nullable = false)
    private String name;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "care_giver_id")
    private CareGiver careGiver;
    
    @OneToMany(mappedBy = "child", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<HealthRecord> records = new ArrayList<>();

    public Child() {}

    public Child(String name, CareGiver careGiver, List<HealthRecord> records) {
        this.name = name;
        this.careGiver = careGiver;
        this.records = records;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public CareGiver getCareGiver() {
        return careGiver;
    }

    public void setCareGiver(CareGiver careGiver) {
        this.careGiver = careGiver;
    }

    public List<HealthRecord> getRecords() {
        return records;
    }

    public void setRecords(List<HealthRecord> records) {
        this.records = records;
    }
}
