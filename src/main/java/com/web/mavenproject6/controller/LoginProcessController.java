///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.web.mavenproject6.controller;
//
//
//import com.web.mavenproject6.entities.Roles;
//import com.web.mavenproject6.entities.Users;
////import com.web.mavenproject6.entities.UsersTypes;
//import com.web.mavenproject6.forms.UserForm;
//
//import com.web.mavenproject6.other.MailSenderService;
////import com.web.mavenproject6.service.PaymentSystemService;
//import com.web.mavenproject6.service.RolesService;
//import com.web.mavenproject6.service.UserService;
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//import java.util.Locale;
//import javax.servlet.ServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import net.tanesha.recaptcha.ReCaptchaImpl;
//import net.tanesha.recaptcha.ReCaptchaResponse;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.context.MessageSource;
//import org.springframework.core.env.Environment;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.GrantedAuthorityImpl;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.servlet.view.RedirectView;
//
//@Controller
//public class LoginProcessController {
//
//    @Autowired
//    Environment env;
//
//    @Autowired
//    @Qualifier("UserService")
//    UserService userService;
//
//    @Autowired
//    @Qualifier("RolesService")
//    RolesService rolesService;
//
//    @Autowired
//    private MessageSource messageSource;
//
//    @Autowired
//    MailSenderService mailSenderService;
//
//    @Autowired
//    UserDetailsService myUserDetailsService;
//
//    private static List<GrantedAuthority> AUTHORITIES = new ArrayList<GrantedAuthority>(1) {
//        {
//            add(new GrantedAuthorityImpl("ROLE_USER"));
//        }
//    };
//
//    public void setMyUserDetailsService(UserDetailsService myUserDetailsService) {
//        this.myUserDetailsService = myUserDetailsService;
//    }
//
//    @RequestMapping(value = "/public/signup_confirm", method = RequestMethod.POST)
//    public Object createUser(Model model,
//            @ModelAttribute("user") UserForm form,
//            @RequestParam(value = "recaptcha_challenge_field", required = false) String challangeField,
//            @RequestParam(value = "recaptcha_response_field", required = false) String responseField,
//            ServletRequest servletRequest, HttpServletResponse servletResponse) throws IOException {
//
//        ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
//        reCaptcha.setPrivateKey(env.getProperty("key.private"));
//        String remoteAdress = servletRequest.getRemoteAddr();
//        ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAdress, challangeField, responseField);
//        if (!reCaptchaResponse.isValid()) {
//            servletRequest.setAttribute("user", new UserForm());
//            RedirectView re = new RedirectView("/login#signup", true);
//            re.addStaticAttribute("user", form);
//            return re;
//        }
//
//        String login = userService.getRepository().findUsersByLogin(form.getLogin()).getLogin();
//        if (form.getLogin().length() < 6
//                || login != null
//                || !form.getPassword().equals(form.getConfirmPassword())) {
//            ModelAndView m = new ModelAndView("registr");
//            m.addObject("user", form);
//            return m;
//        }
//        Users user = new Users();
//        user.setEmail(form.getEmail());
//        user.setLogin(form.getLogin());
//        user.setPassword(form.getPassword());
//        
//        Roles role = new Roles();
//        role.setUser(user);
//        role.setRole(2);
//        user.setRole(role);
//        
//        PersonalInfo pi = new PersonalInfo();
//        pi.setAge(form.getAge());
//        pi.setCashe(0.0);
//        pi.setCity(form.getCity());
//        pi.setComment("");
//        pi.setCountry(form.getCountry());
//        pi.setCourse(form.getCourse());
//        pi.setFclt(form.getFclt());
//        pi.setFname(form.getFname());
//        pi.setLocalAddress(form.getLocalAddress());
//        pi.setPasportNumber(form.getPasportNumber());
//        pi.setPasportSeria(form.getPasportSeria());
//        pi.setPhone(form.getPhone());
//        pi.setRegion(form.getRegion());
//        pi.setSex(form.isSex());
//        pi.setSname(form.getSname());
//        pi.setStudyForm(form.getStudyForm());
//        pi.setTname(form.getTname());
//        pi.setUniversity(form.getUniversity());
//        pi.setUser(user);
//        user.setPersonalInfo(pi);
//        
//        userService.getRepository().save(user);
//        mailSenderService.sendGreatingMail(user.getEmail(), "Register new user["+user.toString()+"]");
//
//        RedirectView re = new RedirectView("/login#signup", true);
//        return re;
//    }
//    
//    @RequestMapping(value = "/login")
//    public String login(@RequestParam(value = "error", required = false) String error,
//            @RequestParam(value = "logout", required = false) String logout, Model model,
//            ServletRequest servletRequest, HttpServletResponse servletResponse) {
//
//        model.addAttribute("user", new UserForm());
//
//        if (logout != null) {
//            return "jsp/index";
//        }
//        return "jsp/index";
//
//    }
//
//    @ResponseBody
//    @RequestMapping(value = "/public/remeberMyPassword", method = RequestMethod.POST)
//    public String remeberPassword(Locale locale,
//            @RequestParam(value = "mail", required = true) String mail, Model model,
//            ServletRequest servletRequest, HttpServletResponse servletResponse) {
//
//        Users user = null;
//
//        try {
//            user = userService.getRepository().findUsersByEmail(mail);
//            mailSenderService.sendGreatingMail(user.getEmail(), String.format(messageSource.getMessage("account.remember.ok", null, locale), user.getLogin(), user.getPassword()));
//        } catch (Exception e) {
//            mailSenderService.sendGreatingMail(mail, messageSource.getMessage("account.remember.bad", null, locale));
//        }
//
//        return "ok";
//    }
//    
//    
//
//}
