package com.a3m.hhah.entities.resources;

import java.util.Arrays;

public enum ResourceType {
    VIDEO,
    ARTICLE,
    MAP,
    LINK;

    public static ResourceType from(String value){
        return Arrays.stream(values())
                .filter(r -> r.name().equalsIgnoreCase(value))
                .findFirst()
                .orElseThrow(() -> new IllegalArgumentException("Invalid resource type: " + value));
    }
}
