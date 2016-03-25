/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.web.mavenproject6.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name = "users")
public class Users implements Serializable { 

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO) 
    private Long id;
    private String email;  
    private String password;
    private long regdate;
    private long lastonline;
    @Column(unique = true) 
    private String login;
    private boolean accountExpired; 
    private boolean accountLocked;
    private boolean enabled;
    
    @OneToOne(mappedBy = "user", cascade = {CascadeType.ALL}) 
    private Roles role;    
   

    public Users() {
        this.email = "";
        this.password = "";
        this.regdate = (new Date()).getTime();
        this.lastonline = (new Date()).getTime();
        this.login = "";
        this.accountExpired = false;
        this.accountLocked = false;
        this.enabled = true;
        this.role = null;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public long getRegdate() {
        return regdate;
    }

    public void setRegdate(long regdate) {
        this.regdate = regdate;
    }

    public long getLastonline() {
        return lastonline;
    }

    public void setLastonline(long lastonline) {
        this.lastonline = lastonline;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public boolean isAccountExpired() {
        return accountExpired;
    }

    public void setAccountExpired(boolean accountExpired) {
        this.accountExpired = accountExpired;
    }

    public boolean isAccountLocked() {
        return accountLocked;
    }

    public void setAccountLocked(boolean accountLocked) {
        this.accountLocked = accountLocked;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public Roles getRole() {
        return role;
    }

    public void setRole(Roles role) {
        this.role = role;
    }

    
    public Users(String email, String password, long regdate, long lastonline, String login, boolean accountExpired, boolean accountLocked, boolean enabled, Roles role) {
        this.email = email;
        this.password = password;
        this.regdate = regdate;
        this.lastonline = lastonline;
        this.login = login;
        this.accountExpired = accountExpired;
        this.accountLocked = accountLocked;
        this.enabled = enabled;
        this.role = role;
    }

    @Override
    public String toString() {
        StringBuilder buf = new StringBuilder();
        buf
                .append("login:").append(login)
                .append(" email:").append(email)
                .append(" password:").append(password)
                .append(" regdate:").append(regdate)
                .append(" lastonline:").append(lastonline)
                .append(" accountExpired:").append(accountExpired)
                .append(" accountLocked:").append(accountLocked)
                .append(" enabled:").append(enabled);
        return buf.toString();
    }
    
}
