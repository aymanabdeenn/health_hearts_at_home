package com.a3m.hhah.entities.resources;

import java.util.Arrays;

public enum Language {
    EN,
    AR;

    public static Language from(String value){
        return Arrays.stream(values())
                .filter(r -> r.name().equalsIgnoreCase(value))
                .findFirst()
                .orElseThrow(() -> new IllegalArgumentException("Invalid language: " + value));
    }
}
