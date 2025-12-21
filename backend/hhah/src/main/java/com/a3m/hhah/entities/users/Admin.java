package com.a3m.hhah.entities.users;

import com.a3m.hhah.entities.resources.Contact;
import jakarta.persistence.*;

@Entity
@Table
public class Admin {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false)
    private String name;

    @Embedded
    private Contact personalContact;

    public Admin() {}

    public Admin(String name , Contact personalContact) {
        this.name = name;
        this.personalContact = personalContact;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName(){
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Contact getPersonalContact() {
        return personalContact;
    }

    public void setPersonalContact(Contact personalContact){
        this.personalContact = personalContact;
    }
}
