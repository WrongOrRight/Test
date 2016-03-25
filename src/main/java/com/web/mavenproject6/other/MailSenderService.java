/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.web.mavenproject6.other;


import com.web.mavenproject6.forms.MailForm;
import java.util.HashMap;
import java.util.Map;
import javax.mail.internet.MimeMessage;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.env.Environment;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;

@Service
public class MailSenderService {

    @Autowired
    private Environment env;
    
    @Autowired
    private JavaMailSender mailSender;
    @Autowired
    private VelocityEngine velocityEngine;
    
    @Autowired
    @Qualifier("mailForm")
    private MailForm mailForm;

    private static String CONFIRMATION_TEMPLATE = "greating.html";

    public JavaMailSender getMailSender() {
        return mailSender;
    }

    public void setMailSender(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    public VelocityEngine getVelocityEngine() {
        return velocityEngine;
    }

    public void setVelocityEngine(VelocityEngine velocityEngine) {
        this.velocityEngine = velocityEngine;
    }

    @Async
    public void sendGreatingMail(String mail,String textMessage) {
        MimeMessagePreparator preparator = new MimeMessagePreparator() {
            @Override
            public void prepare(MimeMessage mimeMessage) throws Exception {
                MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
                message.setSubject(mailForm.getSubject());
                message.setTo(mail);
                message.setFrom(mailForm.getFrom());
                Map model = new HashMap();
                model.put("websiteName", mailForm.getWebsiteName());
                model.put("email", mail); 
                model.put("textMessage",textMessage);
                String text = VelocityEngineUtils.mergeTemplateIntoString(
                        velocityEngine, CONFIRMATION_TEMPLATE, model);
                message.setText(text, true);
            }
        };
        this.mailSender.send(preparator);
    }
}