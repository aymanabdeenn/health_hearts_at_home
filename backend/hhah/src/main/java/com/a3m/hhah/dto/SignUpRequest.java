package com.a3m.hhah.dto;

public record SignUpRequest(
        String userType,
        String name,
        String childName,
        String username,
        String password,
        String phoneNumber,
        String email
) {}
