package com.a3m.hhah.advisor;

import com.a3m.hhah.exceptions.AdminNotFoundException;
import com.a3m.hhah.exceptions.CareGiverNotFoundException;
import com.a3m.hhah.exceptions.ChildNotFoundException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.sql.SQLOutput;

@ControllerAdvice
public class Advisor {

    @ExceptionHandler(CareGiverNotFoundException.class)
    public void careGiverNotFound(CareGiverNotFoundException ex){
        System.out.println(ex.getMessage());
    }

    @ExceptionHandler(ChildNotFoundException.class)
    public void ChildNotFound(ChildNotFoundException ex){
        System.out.println(ex.getMessage());
    }

    @ExceptionHandler(AdminNotFoundException.class)
    public void ChildNotFound(AdminNotFoundException ex){
        System.out.println(ex.getMessage());
    }
}
