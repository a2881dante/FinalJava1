package com.dchabanovskyi.japankanji.repositories;

import com.dchabanovskyi.japankanji.entities.Kanji;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface KanjiRepository extends JpaRepository<Kanji, Long> {

    @Query(nativeQuery = true,
            value = "SELECT * FROM kanjies k " +
                    "WHERE k.id NOT IN (SELECT ku.id FROM kanji_users ku WHERE ku.user_id = :userId) " +
                    "ORDER BY RAND(), k.class_id ASC LIMIT :limit")
    List<Kanji> getRandomUnlearnedKanji(@Param("userId") long userId, @Param("limit")int limit);

    @Query(nativeQuery = true,
            value = "SELECT * FROM kanjies k " +
                    "WHERE id IN (" +
                    "   SELECT ku.kanji_id FROM kanji_users ku" +
                    "   WHERE ku.user_id = :userId " +
                    "       AND (" +
                    "           (ku.repeat_count=0 AND ku.last_update <= DATE_SUB(SYSDATE(), INTERVAL 1 DAY))" +
                    "           OR (ku.repeat_count=1 AND ku.last_update <= DATE_SUB(SYSDATE(), INTERVAL 3 DAY))" +
                    "           OR (ku.repeat_count=2 AND ku.last_update <= DATE_SUB(SYSDATE(), INTERVAL 7 DAY))" +
                    "           OR (ku.repeat_count=3 AND ku.last_update <= DATE_SUB(SYSDATE(), INTERVAL 14 DAY))" +
                    "           OR (ku.repeat_count=4 AND ku.last_update <= DATE_SUB(SYSDATE(), INTERVAL 30 DAY))" +
                    "           OR (ku.repeat_count=5 AND ku.last_update <= DATE_SUB(SYSDATE(), INTERVAL 60 DAY))" +
                    ")) ORDER BY RAND(), k.class_id ASC LIMIT :limit")
    List<Kanji> getKanjiesToRepeat(@Param("userId") long userId, @Param("limit")int limit);

}
