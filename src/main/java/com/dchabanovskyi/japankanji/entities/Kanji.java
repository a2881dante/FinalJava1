package com.dchabanovskyi.japankanji.entities;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "kanjies")
@NoArgsConstructor
@AllArgsConstructor
public class Kanji {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name="sign")
    private String sign;

    @Column(name="on_read", length = 50)
    private String onRead;

    @Column(name="kun_read", length = 50)
    private String kunRead;

    @Column(name="meaning", length = 100)
    private String meaning;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "class_id")
    private KanjiClass kanjiClass;

    @OneToMany(orphanRemoval = true)
    @JoinColumn(name = "kanji_id")
    private List<KanjiUser> kanjiUsers = new ArrayList<>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getOnRead() {
        return onRead;
    }

    public void setOnRead(String onRead) {
        this.onRead = onRead;
    }

    public String getKunRead() {
        return kunRead;
    }

    public void setKunRead(String kunRead) {
        this.kunRead = kunRead;
    }

    public String getMeaning() {
        return meaning;
    }

    public void setMeaning(String meaning) {
        this.meaning = meaning;
    }

    public KanjiClass getKanjiClass() {
        return kanjiClass;
    }

    public void setKanjiClass(KanjiClass kanjiClass) {
        this.kanjiClass = kanjiClass;
    }
}
