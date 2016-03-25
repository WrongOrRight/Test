/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.web.mavenproject6.entities;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "organization")
public class Organization implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private long icode;//идентификационный код
    private String i;//индекс
    private String opf;//отделение пенсионного фонда
    private String orgName;//название организации
    private String leaderName;//ф.и.о. директора
    private String phone;//телефон
    private String webSite;//сайт
    private String city;//город
    private String district;//район
    private String street;//улица
    private String home;//дом
    private String part;//корпус\часть дома
    private String room;//квартира\комната
    private String diractionName;//орган управления
    private long regDate;//дата регистрации

}
