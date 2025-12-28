package com.a3m.hhah.repositories;

import com.a3m.hhah.entities.resources.Language;
import com.a3m.hhah.entities.resources.Resource;
import com.a3m.hhah.entities.resources.ResourceCategory;
import com.a3m.hhah.entities.resources.ResourceType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ResourceRepository extends JpaRepository<Resource , Long> {

    List<Resource> findByLanguageAndTypeAndCategory(Language language, ResourceType type, ResourceCategory category);
    List<Resource> findByLanguageAndCategory(Language language,ResourceCategory category);

}
