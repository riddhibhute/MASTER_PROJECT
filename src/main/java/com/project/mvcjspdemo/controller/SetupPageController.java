package com.project.mvcjspdemo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SetupPageController {

    @GetMapping("/setup")
    public String index() {
        return "setup"; // setup.jsp
    }
}
