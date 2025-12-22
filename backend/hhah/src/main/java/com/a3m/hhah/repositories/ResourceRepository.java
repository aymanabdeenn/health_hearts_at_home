package com.a3m.hhah.repositories;

import com.a3m.hhah.entities.resources.Resource;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ResourceRepository extends JpaRepository<Resource , Long> {
}
