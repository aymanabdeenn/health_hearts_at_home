package com.a3m.hhah.entities.users;

import com.a3m.hhah.entities.Child;
import com.a3m.hhah.entities.resources.Contact;
import jakarta.persistence.*;

@Entity
@Table
public class CareGiver {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(
            nullable = false
    )
    private String name;

    @OneToOne(mappedBy = "careGiver")
    private Child child;

    @Embedded
    private Contact personalContact;

    public CareGiver() {}

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

    public Child getChild() {
        return child;
    }

    public void setChild(Child child) {
        this.child = child;
    }

    public Contact getPersonalContact() {
        return personalContact;
    }

    public void setPersonalContact(Contact personalContact) {
        this.personalContact = personalContact;
    }
}