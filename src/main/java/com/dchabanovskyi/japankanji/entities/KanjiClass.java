package com.dchabanovskyi.japankanji.entities;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "kanji_classes")
@NoArgsConstructor
@AllArgsConstructor
public class KanjiClass {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name="name")
    private String name;

    @OneToMany(orphanRemoval = true)
    @JoinColumn(name = "class_id")
    private List<Kanji> kanjies = new ArrayList<>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Kanji> getKanjies() {
        return kanjies;
    }

    public void setKanjis(List<Kanji> kanjis) {
        this.kanjies = kanjis;
    }
}
