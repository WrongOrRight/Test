/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.web.mavenproject6.service;

import com.web.mavenproject6.repositories.RolesRepository;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("RolesService")
public class RolesServiceImpl implements RolesService {

    @Autowired //подгрузка репозитория
    private RolesRepository rolesRepository;

    @PersistenceContext
    private EntityManager em; //запросы

    @Override
    public RolesRepository getRepository() {
        return rolesRepository;
    }

}
