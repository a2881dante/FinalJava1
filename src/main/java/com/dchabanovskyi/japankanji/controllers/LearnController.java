package com.dchabanovskyi.japankanji.controllers;

import com.dchabanovskyi.japankanji.entities.Kanji;
import com.dchabanovskyi.japankanji.entities.KanjiUser;
import com.dchabanovskyi.japankanji.entities.User;
import com.dchabanovskyi.japankanji.repositories.KanjiRepository;
import com.dchabanovskyi.japankanji.repositories.KanjiUserRepository;
import com.dchabanovskyi.japankanji.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.security.Principal;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class LearnController {

    final private KanjiRepository kanjiRepository;

    final private UserRepository userRepository;

    final private KanjiUserRepository kanjiUserRepository;

    @Autowired
    public LearnController(
            KanjiRepository kanjiRepository,
            UserRepository userRepository,
            KanjiUserRepository kanjiUserRepository
    ) {
        this.kanjiRepository = kanjiRepository;
        this.userRepository = userRepository;
        this.kanjiUserRepository = kanjiUserRepository;
    }

    @GetMapping("/learn")
    public String learn(Principal principal, Model model) {
        User user = userRepository.findByUsername(principal.getName());
        List<Kanji> kanjiList = kanjiRepository.getRandomUnlearnedKanji(user.getId(), 5);
        String json = kanjiesToJson(kanjiList);

        model.addAttribute("save_mode", "str");
        model.addAttribute("message", json);

        return "tests/index";
    }

    @PostMapping("/compleate-learning")
    public String completeLearning(
            @RequestParam(name = "ids") String ids,
            @RequestParam(name = "save_mode") String saveMode,
            Principal principal
    ) {
        User user = userRepository.findByUsername(principal.getName());

        for(String id: ids.split("\\|")){
            if(saveMode.equals("upd")) {
                KanjiUser kanjiUser = kanjiUserRepository.findByUserAndKanji(user.getId(), Long.parseLong(id));
                kanjiUser.setLastUpdate(new Date());
                kanjiUser.setRepeatCount( kanjiUser.getRepeatCount() + 1 );
                kanjiUserRepository.save(kanjiUser);
            } else {
                kanjiUserRepository.setNewKanjiUser(user.getId(), Long.parseLong(id));
            }
        };

        return "tests/learning-success";
    }

    @GetMapping("/repeat")
    public String repeat(Principal principal, Model model) {
        User user = userRepository.findByUsername(principal.getName());
        List<Kanji> kanjiList = kanjiRepository.getKanjiesToRepeat(user.getId(), 5);
        String json = kanjiesToJson(kanjiList);

        model.addAttribute("save_mode", "upd");
        model.addAttribute("message", json);

        return "tests/index";
    }

    private String kanjiesToJson(List<Kanji> kanjies) {
        String json = kanjies.stream().map(k -> "{ \"sign\": \"" + k.getSign() + "\", "
                    + "\"on_read\": \"" + k.getOnRead() + "\", "
                    + "\"kun_read\": \"" + k.getKunRead() + "\", "
                    + "\"meaning\": \"" + k.getMeaning() + "\", "
                    + "\"id\": " + k.getId() + "}"
        ).collect(Collectors.joining(", ", "[", "]"));
        return json;
    }

}
