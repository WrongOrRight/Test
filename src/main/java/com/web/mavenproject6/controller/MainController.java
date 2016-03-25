/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.web.mavenproject6.controller;

import com.web.mavenproject6.forms.UserForm;
import com.web.mavenproject6.service.UserService;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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
    UserDetailsService myUserDetailsService;

    @Autowired
    @Qualifier("UserService")
    UserService userService;

    @RequestMapping(value = {"/"})
    public String loginPage(Model model, @RequestParam(required = false) String message) throws IOException {

        System.out.print("aaa!!!11");
        Document document = Jsoup.connect("http://rozetka.com.ua/").get();

        Elements elements = document.select("script");

        Pattern p = Pattern.compile("(\\{\"pages\":\\[)(.+)(\\])"); // Regex for the value of the key
        Matcher m = p.matcher(elements.html()); // you have to use html here and NOT text! Text will drop the 'key' part
        String buf = "";
        while (m.find(1)) {
            buf += m.group();

            buf += "[" + m.group(1) + "]"; // value only
        }
        System.out.println("aaa4!!" + buf + "<br>" + elements.html());

        Pattern p1 = Pattern.compile("(http:.{0,40}big_promo)(.{0,60})\\.(jpg)"); // Regex for the value of the key
        Matcher m1 = p1.matcher(buf); // you have to use html here and NOT text! Text will drop the 'key' part

        String buf1 = "";

        while (m1.find()) {
            buf1 += "<img src=" + m1.group() + "><br>"; // the whole key ('key = value')
            //  buf+="["+m.group(1)+"]"; // value only
        }

        Pattern p2 = Pattern.compile("(http:.{0,40}promotions)(.{0,60})\\.(html)"); // Regex for the value of the key
        Matcher m2 = p2.matcher(buf); // you have to use html here and NOT text! Text will drop the 'key' part
        int index = 0;
        while (m2.find()) {
            String s = m2.group().replaceAll("/", "");

            buf1 += "<a href=" + s + ">" + s + "</a><br>";
            try {
           
                if (index == 0) {
                    Document document2 = Jsoup.connect("http://rozetka.com.ua/news-articles-promotions/promotions/acer_aspire_notebook_0909.html").get();

                    Elements elements2 = document2.select(".promo-details-banner-info-text");
                    buf1 += elements2.html();
                }

                if (index == 1) {
                    Document document2 = Jsoup.connect("http://rozetka.com.ua/news-articles-promotions/promotions/acer_aspire_notebook_0909.html").get();

                    Elements elements2 = document2.select(".promo-details-banner-info-text");
                    buf1 += elements2.html();
                }
                
                 if (index >1) {
                   
                    Document document2 = Jsoup.connect(s).get();

                    Elements elements2 = document2.select(".promo-details-banner-info-text");
                    buf1 += elements2.html();
                }

                index++;
            } catch (Exception e) {
                System.out.println("aaa!!ERROR" + e);
            }

            // Elements elements3 = document2.select(".promo-details-banner-remark");
            //buf1 += elements3.html();
        }
        //System.out.println("aaa2!!" + buf1);

        model.addAttribute("text", buf1);
        return "jsp/index";
    }

}
