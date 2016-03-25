package com.web.mytest.repositories;

import com.web.mytest.entities.Users;
import org.springframework.data.jpa.repository.JpaRepository;


public interface UserRepository extends JpaRepository<Users, Long> {

    Users findUsersByLogin(String login);
    Users findUsersByEmail(String email);
    Users findUsersById(long id);
    Users findUsersByLoginOrEmail(String login, String email);
}
