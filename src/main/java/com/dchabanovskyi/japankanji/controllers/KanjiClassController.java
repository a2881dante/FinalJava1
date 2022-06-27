package com.dchabanovskyi.japankanji.controllers;

import com.dchabanovskyi.japankanji.entities.KanjiClass;
import com.dchabanovskyi.japankanji.repositories.KanjiClassRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class KanjiClassController {

    KanjiClassRepository kanjiClassRepository;

    @Autowired
    public KanjiClassController(
            KanjiClassRepository kanjiClassRepository
    ) {
        this.kanjiClassRepository = kanjiClassRepository;
    }

    @GetMapping("/kanji-classes")
    public String index(Model model){
        model.addAttribute("kanjiClasses", kanjiClassRepository.findAll());
        return "kanji-classes/index";
    }

    @GetMapping("/kanji-classes/{id}")
    public String kanjiesList(@PathVariable("id") long id, Model model) {
        KanjiClass kanjiClass = kanjiClassRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("invalid expression id"));
        model.addAttribute("kanjies", kanjiClass.getKanjies());
        return "kanji-classes/kanjies-list";
    }
}
