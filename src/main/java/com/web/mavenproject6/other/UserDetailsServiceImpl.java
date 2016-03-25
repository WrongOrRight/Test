/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.web.mavenproject6.other;

import com.web.mavenproject6.entities.Users;
import com.web.mavenproject6.repositories.UserRepository;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

/**
 *
 * @author Smitg
 */
@Component("UserDetailsServiceImpl")
public class UserDetailsServiceImpl implements UserDetailsService
{   
   // @PersistenceContext
  //  private EntityManager entityManager;
    @Autowired
    private UserRepository userRepository;
    @Override
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
        try {
            System.out.print("TestindData: "+login);
            Users domainUser = userRepository.findUsersByLogin(login);
            System.out.print("TestindData: " + domainUser.getLogin() + ' ' + domainUser.getPassword());

            boolean accountNonExpired = true;
            boolean credentialsNonExpired = true;
            boolean accountNonLocked = true;          
      
            return new org.springframework.security.core.userdetails.User(
                    domainUser.getEmail(),
                    domainUser.getPassword(),
                    true,
                    accountNonExpired,
                    credentialsNonExpired,
                    accountNonLocked,
                    getAuthorities(domainUser.getRole().getRole()));
        }
        catch (Exception e) 
        {   
            System.out.printf("TestindData: "+e.getMessage());
            throw new RuntimeException(e);
        }
    }
    
    public Collection<? extends GrantedAuthority> getAuthorities(Integer role) {
        List<GrantedAuthority> authList = getGrantedAuthorities(getRoles(role));
        return authList;
    }

    /**
     * Converts a numerical role to an equivalent list of roles
     *
     * @param role the numerical role
     * @return list of roles as as a list of {@link String}
     */
    public  List<String> getRoles(Integer role) {
        List<String> roles = new ArrayList<>();
        switch (role) {
            case 1:
                roles.add("ROLE_ADMIN");
                break;
            case 2:
                roles.add("ROLE_USER");               
                break;
            case 3:
                roles.add("ROLE_ORGANIZATION"); 
                break;
                
        }
        return roles;
    }
    
    public static List<GrantedAuthority> getGrantedAuthorities(List<String> roles) {
        List<GrantedAuthority> authorities = new ArrayList<>();
        for (String role : roles) {
            authorities.add(new SimpleGrantedAuthority(role));
        }
        return authorities;
    }
    
}
