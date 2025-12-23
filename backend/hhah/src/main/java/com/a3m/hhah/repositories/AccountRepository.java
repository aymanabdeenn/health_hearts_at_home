package com.a3m.hhah.repositories;

import com.a3m.hhah.entities.users.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface AccountRepository extends JpaRepository<Account, Long> {

    public Optional<Account> findByUsername(String username);
}
