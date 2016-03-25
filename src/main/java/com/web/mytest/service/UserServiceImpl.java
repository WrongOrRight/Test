/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.web.mytest.service;

import com.web.mytest.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Татьяна Юрченко
 */
@Service("UserService")
public class UserServiceImpl implements UserService {

    @Autowired //подгрузка репозитория
    private UserRepository userRepository;

    @Override
    public UserRepository getRepository() {
        return userRepository;
    }

}
