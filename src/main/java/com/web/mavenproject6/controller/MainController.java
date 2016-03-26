/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.web.mavenproject6.controller;

import com.web.mavenproject6.entities.Promotion;
import com.web.mavenproject6.forms.UserForm;
import com.web.mavenproject6.service.PromotionService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.env.Environment;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Aleks
 */
@Controller
public class MainController {

    @Autowired
    @Qualifier("PromotionService")
    PromotionService promoService;

    @Autowired
    Environment env;

    @RequestMapping(value = {"/"})
    public String loginPage(Model model, @RequestParam(required = false) String message) throws IOException {

        Document document = Jsoup.connect("https://rozetka.com.ua/").get();
        Elements elements = document.select("body");
        System.out.println("bufff1!" + elements.html());
        Pattern p = Pattern.compile("(\\{\"pages\":\\[)(.+)(\\])");
        Matcher m = p.matcher(elements.html());
        String buf = m.find() ? m.group() : "";
        System.out.println("bufff2!" + buf);
        Pattern p1 = Pattern.compile("(http:.{0,40}big_promo)(.{0,60})\\.(jpg)");
        Matcher m1 = p1.matcher(buf);
        Pattern p2 = Pattern.compile("(http:.{0,40}promotions)(.{0,60})\\.(html)");
        Matcher m2 = p2.matcher(buf);

        String buf1 = "";
        m1.find(0);
        m2.find(0);
        for (int i = 0; i < Math.min(m1.groupCount(), m2.groupCount()); i++) {
            String imgBuf = m1.group();
            String linkBuf = m2.group().replaceAll("\\\\", "");
            String promoInfo = "";
            String promoTime = "";
            buf1 += "<a href=" + linkBuf + ">" + linkBuf + "</a><br>";
            try {

                Document document2 = Jsoup.connect(linkBuf).get();
                Elements elements2 = document2.select(".promo-details-banner-info-text");
                promoInfo = elements2.html();
                buf1 += promoInfo;
                Elements elements3 = document2.select(".promo-details-banner-remark");
                promoTime = elements3.html();
                buf1 += promoTime;

            } catch (Exception e) {

            }
            Promotion pp = new Promotion();
            pp.setPictureURL(imgBuf);
            pp.setPromoURL(linkBuf);
            pp.setTiming(promoTime);
            pp.setTitle(promoInfo);

            promoService.getRepository().save(pp);
            m1.find();
            m2.find();
        }

        model.addAttribute("text", buf1);
        return "jsp/index";
    }

}
