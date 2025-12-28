package com.a3m.hhah.entities;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table
public class HealthRecord {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ManyToOne
    @JoinColumn(name = "child_id", nullable = false)
    private Child child;

    private float weight;
    private String bloodPressure;
    private float oxPulse;
    private LocalDateTime timeStamp;

    public HealthRecord() {}

    public HealthRecord(Child child , float weight , String bloodPressure , float oxPulse , LocalDateTime timeStamp) {
        this.child = child;
        this.weight = weight;
        this.bloodPressure = bloodPressure;
        this.oxPulse = oxPulse;
        this.timeStamp = timeStamp;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Child getChild() {
        return child;
    }

    public void setChild(Child child) {
        this.child = child;
    }

    public float getWeight() {
        return weight;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }

    public String getBloodPressure() {
        return bloodPressure;
    }

    public void setBloodPressure(String bloodPressure) {
        this.bloodPressure = bloodPressure;
    }

    public float getOxPulse() {
        return oxPulse;
    }

    public void setOxPulse(float oxPulse) {
        this.oxPulse = oxPulse;
    }

    public LocalDateTime getTimeStamp() {
        return timeStamp;
    }

    public void setTimeStamp(LocalDateTime timeStamp) {
        this.timeStamp = timeStamp;
    }
}
