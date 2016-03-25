package com.web.mavenproject6.repositories;

import com.web.mavenproject6.entities.Users;
import org.springframework.data.jpa.repository.JpaRepository;


public interface UserRepository extends JpaRepository<Users, Long> {

    Users findUsersByLogin(String login);
    Users findUsersByEmail(String email);
    Users findUsersById(long id);
    Users findUsersByLoginOrEmail(String login, String email);
}
