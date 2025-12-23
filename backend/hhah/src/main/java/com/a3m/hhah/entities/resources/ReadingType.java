package com.a3m.hhah.entities.resources;

import java.util.Arrays;

public enum ReadingType {
    WEIGHT,
    BLOOD_PRESSURE,
    OX_PULSE;

    public static ReadingType from(String value){
        return Arrays.stream(values())
                .filter(r -> r.name().equalsIgnoreCase(value))
                .findFirst()
                .orElseThrow(() -> new IllegalArgumentException("Invalid reading type: " + value));
    }

}
