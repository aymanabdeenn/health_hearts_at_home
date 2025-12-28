package com.a3m.hhah.entities.resources;

import java.util.Arrays;

public enum ResourceCategory {
//    CHD_AND_TREATMENT,
    CHD_WEBSITES,
    CHD_VIDEOS,
    CHD_ARTICLES,
    CHD_MEDICATIONS,

//    CHILD_CARE_NEEDS
    CHILD_CARE_FORMULA_MIXES,
    CHILD_CARE_MEDICATION,
    CHILD_CARE_DRAIN_CARE,
    CHILD_CARE_WOUND_CARE,

//    SPIRITUAL
    SP_DEVOTIONALS,
    SP_RESOURCES,

//    HOSPITAL_HELPLINE
    HOSPITAL_HELPLINE_WEBLINKS,
    HOSPITAL_HELPLINE_AREA_MAP,
    HOSPITAL_HELPLINE_SHOWERS,
    HOSPITAL_HELPLINE_CAFETERIA_MENU,

//    Caregiver support
    CAREGIVER_SUPPORT_SUPPORT_GROUPS,

//    CHILD_CARE_INFORMATION
    CHILD_CARE_INFORMATION_ARTICLES;

    public static ResourceCategory from(String value){
        return Arrays.stream(values())
                .filter(r -> r.name().equalsIgnoreCase(value))
                .findFirst()
                .orElseThrow(() -> new IllegalArgumentException("Invalid resource category: " + value));
    }
}
