/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.web.mavenproject6.entities;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "promotion")
public class Promotion implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String pictureURL;
    private String promoURL;
    private String title;
    private String timing;

    public Promotion() {
    }

    public Promotion(String pictureURL, String promoURL, String title, String timing) {
        this.pictureURL = pictureURL;
        this.promoURL = promoURL;
        this.title = title;
        this.timing = timing;
    }

    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPictureURL() {
        return pictureURL;
    }

    public void setPictureURL(String pictureURL) {
        this.pictureURL = pictureURL;
    }

    public String getPromoURL() {
        return promoURL;
    }

    public void setPromoURL(String promoURL) {
        this.promoURL = promoURL;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTiming() {
        return timing;
    }

    public void setTiming(String timing) {
        this.timing = timing;
    }
    
    

}
