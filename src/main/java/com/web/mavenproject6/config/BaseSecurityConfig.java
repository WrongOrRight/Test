package com.web.mavenproject6.config;

import com.web.mavenproject6.other.UserDetailsServiceImpl;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;

@Configuration
@EnableWebMvcSecurity
public class BaseSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    DataSource dataSource;

    @Autowired
    private UserDetailsServiceImpl detailsService;

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {

        auth
                .userDetailsService(detailsService)
                .and()
                .inMemoryAuthentication()
                .withUser("SYSTEMADMIN").password("SPASSWORD")
                .roles("SECURE", "ADMIN", "USER");

    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/**").permitAll()
                .antMatchers("/resources/**").permitAll()
                .antMatchers("/admin/**").hasRole("ADMIN")
                .anyRequest().authenticated()
                .and()
                .formLogin()
                //.loginPage("/login")
                .permitAll()
                .failureUrl("/login?error")
                .and()
                .logout().logoutUrl("/j_spring_security_logout")
                .invalidateHttpSession(true)
                .and()
                .exceptionHandling().accessDeniedPage("/403")
//                .usernameParameter("username").passwordParameter("password")
//            .and()
//                .logout().logoutSuccessUrl("/login?logout")
//            .and()
//                .exceptionHandling().accessDeniedPage("/403")
            .and()
                .csrf().disable();
    }
}
