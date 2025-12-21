package com.a3m.hhah.entities;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Embeddable
public class Contact {
    @ElementCollection
    private List<String> emails = new ArrayList<>();

    @ElementCollection
    private List<String> phoneNumbers = new ArrayList<>();

    public List<String> getEmails() {
        return emails;
    }

    public void setEmails(List<String> emails) {
        this.emails = emails;
    }

    public List<String> getPhoneNumbers() {
        return phoneNumbers;
    }

    public void setPhoneNumbers(List<String> phoneNumbers) {
        this.phoneNumbers = phoneNumbers;
    }
}
