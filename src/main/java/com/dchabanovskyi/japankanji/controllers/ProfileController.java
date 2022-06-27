package com.dchabanovskyi.japankanji.controllers;

import com.dchabanovskyi.japankanji.entities.KanjiUser;
import com.dchabanovskyi.japankanji.entities.User;
import com.dchabanovskyi.japankanji.repositories.KanjiUserRepository;
import com.dchabanovskyi.japankanji.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.security.Principal;

@Controller
public class ProfileController {

    KanjiUserRepository kanjiUserRepository;

    UserRepository userRepository;

    @Autowired
    public ProfileController(
            KanjiUserRepository kanjiUserRepository,
            UserRepository userRepository
    ) {
        this.kanjiUserRepository = kanjiUserRepository;
        this.userRepository = userRepository;
    }
    @GetMapping("/profile")
    public String kanjiesList(Principal principal, Model model) {
        User user = userRepository.findByUsername(principal.getName());

        model.addAttribute("learnedKanjies", kanjiUserRepository.findLearnedKanji(user.getId()));
        model.addAttribute("processKanjies", kanjiUserRepository.findProcessKanji(user.getId()));

        return "profile/index";
    }

    @GetMapping("/profile/clean/{id}")
    public String delete(@PathVariable("id") long id) {
        KanjiUser kanjiUser = kanjiUserRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("invalid expression id"));;
        kanjiUserRepository.delete(kanjiUser);
        return "redirect:/profile";
    }
}
