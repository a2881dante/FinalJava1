package com.dchabanovskyi.japankanji.repositories;

import com.dchabanovskyi.japankanji.entities.KanjiClass;
import org.springframework.data.jpa.repository.JpaRepository;

public interface KanjiClassRepository extends JpaRepository<KanjiClass, Long> {
}
