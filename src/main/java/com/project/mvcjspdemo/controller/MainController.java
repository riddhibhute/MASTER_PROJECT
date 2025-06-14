package com.project.mvcjspdemo.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin(origins = "http://localhost:3000")
@Controller
public class MainController {
    @GetMapping("/")
    public String home() {
        return "home"; // expects /WEB-INF/views/home.jsp
    }
}
