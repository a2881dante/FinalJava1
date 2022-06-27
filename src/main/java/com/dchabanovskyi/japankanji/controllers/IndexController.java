package com.dchabanovskyi.japankanji.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/kanji-info")
    public String knajiInfo() {
        return "extras/kanji-info";
    }

    @GetMapping("/learn-info")
    public String learnInfo() {
        return "extras/learn-info";
    }

}
