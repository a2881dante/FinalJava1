package com.dchabanovskyi.japankanji.repositories;


import com.dchabanovskyi.japankanji.entities.KanjiUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface KanjiUserRepository extends JpaRepository<KanjiUser, Long> {

    @Modifying
    @Transactional
    @Query(nativeQuery = true,
            value = "INSERT INTO kanji_users (`user_id`, `kanji_id`, `last_update`, `repeat_count`) " +
                    "VALUES (:userId, :kanjiId, NOW(), 0)")
    int setNewKanjiUser(@Param("userId") long userId, @Param("kanjiId") long kanjiId);

    @Query(nativeQuery = true,
            value = "SELECT * FROM kanji_users ku " +
                    "WHERE ku.kanji_id = :kanjiId AND ku.user_id = :userId " +
                    "ORDER BY ku.id LIMIT 1")
    KanjiUser findByUserAndKanji(@Param("userId") long userId, @Param("kanjiId") long kanjiId);

    @Query(nativeQuery = true,
            value = "SELECT * FROM kanji_users ku " +
                    "WHERE ku.repeat_count = 6 AND ku.user_id = :userId " +
                    "ORDER BY ku.kanji_id")
    List<KanjiUser> findLearnedKanji(@Param("userId") long userId);

    @Query(nativeQuery = true,
            value = "SELECT * FROM kanji_users ku " +
                    "WHERE ku.repeat_count <> 6 AND ku.user_id = :userId " +
                    "ORDER BY ku.kanji_id")
    List<KanjiUser> findProcessKanji(@Param("userId") long userId);
}
