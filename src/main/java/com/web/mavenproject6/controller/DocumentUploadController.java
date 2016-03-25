/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.web.mavenproject6.controller;

import com.web.mavenproject6.other.XLSParser;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.MessageSource;
import org.springframework.core.env.Environment;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class DocumentUploadController {

    @Autowired
    Environment env;

    @ResponseBody
    @RequestMapping(value = "/uploadMultipleFile", method = RequestMethod.POST)
    public Object uploadMultipleFileHandler(
            @RequestParam("file") MultipartFile[] files) {
        System.out.print("PATH IS A:"+env.getProperty("upload.files.dir"));
        String buf = "";
        List<String> l = new ArrayList<>();
        for (MultipartFile file : files) {
            try {
                byte[] bytes = file.getBytes();

                String rootPath = env.getProperty("upload.files.dir");
                
                File dir = new File(rootPath);
                if (!dir.exists()) {
                    dir.mkdirs();
                    dir.setWritable(true);
                }
                File serverFile = new File(rootPath
                        + File.separator + file.getOriginalFilename());
                serverFile.createNewFile();
                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
                System.err.println(file.getOriginalFilename());
                buf = XLSParser.parse(env.getProperty("upload.files.dir")+"\\"+file.getOriginalFilename());
                
                l.add(file.getOriginalFilename());
            } catch (Exception e) {

            }
        }
       // ModelAndView model = new ModelAndView("jsp/uploadedFiles");
        //model.addObject("list", l.toArray());
       // model.addObject("buffer",buf);
      //  return model;
        return buf;
    }
}
