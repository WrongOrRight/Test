/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.web.mavenproject6.forms;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;

public class UserForm {

    @NotNull
    @Size(min = 1, max = 50)
    private String login;
    @NotNull
    @Size(min = 5, max = 20)
    private String password;
    @NotNull
    @Size(min = 5, max = 20)
    private String confirmPassword;
    @NotNull
    @Size(min = 5, max = 50)
    @Email
    private String email;
    @Length(max = 25)
    private String fname;
    @Length(max = 25)
    private String sname;
    @Length(max = 25)
    private String tname;
    @Length(max = 25)
    private String phone;
    @Length(max = 10)
    private String pasportSeria;
    @Length(max = 10)
    private String pasportNumber;
    @Length(max = 25)
    private String country;
    @Length(max = 25)
    private String region;
    @Length(max = 25)
    private String city;
    @Length(max = 55)
    private String localAddress;
    private int age;
    @Length(max = 50)
    private String university;
    @Length(max = 250)
    private String fclt;
    private int course;
    @Length(max = 20)
    private String studyForm;
    private boolean sex;

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPasportSeria() {
        return pasportSeria;
    }

    public void setPasportSeria(String pasportSeria) {
        this.pasportSeria = pasportSeria;
    }

    public String getPasportNumber() {
        return pasportNumber;
    }

    public void setPasportNumber(String pasportNumber) {
        this.pasportNumber = pasportNumber;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getLocalAddress() {
        return localAddress;
    }

    public void setLocalAddress(String localAddress) {
        this.localAddress = localAddress;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public String getFclt() {
        return fclt;
    }

    public void setFclt(String fclt) {
        this.fclt = fclt;
    }

    public int getCourse() {
        return course;
    }

    public void setCourse(int course) {
        this.course = course;
    }

    public String getStudyForm() {
        return studyForm;
    }

    public void setStudyForm(String studyForm) {
        this.studyForm = studyForm;
    }

    public boolean isSex() {
        return sex;
    }

    public void setSex(boolean sex) {
        this.sex = sex;
    }

    
    public UserForm(String login, String password, String confirmPassword, String email, String fname, String sname, String tname, String phone, String pasportSeria, String pasportNumber, String country, String region, String city, String localAddress, int age, String university, String fclt, int course, String studyForm, boolean sex) {
        this.login = login;
        this.password = password;
        this.confirmPassword = confirmPassword;
        this.email = email;
        this.fname = fname;
        this.sname = sname;
        this.tname = tname;
        this.phone = phone;
        this.pasportSeria = pasportSeria;
        this.pasportNumber = pasportNumber;
        this.country = country;
        this.region = region;
        this.city = city;
        this.localAddress = localAddress;
        this.age = age;
        this.university = university;
        this.fclt = fclt;
        this.course = course;
        this.studyForm = studyForm;
        this.sex = sex;
    }

    public UserForm() {
        this.login = "";
        this.password = "";
        this.confirmPassword = "";
        this.email = "";
        this.fname = "";
        this.sname = "";
        this.tname = "";
        this.phone = "";
        this.pasportSeria = "";
        this.pasportNumber = "";
        this.country = "";
        this.region = "";
        this.city = "";
        this.localAddress = "";
        this.age = 0;
        this.university = "";
        this.fclt = "";
        this.course = 0;
        this.studyForm = "";
        this.sex = false;
    }

    
    @Override
    public String toString() {
        StringBuilder buf = new StringBuilder();
        buf
                .append("login:").append(login)
                .append(" password:").append(password)
                .append(" confirmPassword:").append(confirmPassword)
                .append(" email:").append(email)
                .append(" fname:").append(fname)
                .append(" sname:").append(sname)
                .append(" tname:").append(tname)
                .append(" phone:").append(phone)
                .append(" pasportSeria:").append(pasportSeria)
                .append(" pasportNumber:").append(pasportNumber)
                .append(" country:").append(country)
                .append(" region:").append(region)
                .append(" city:").append(city)
                .append(" localAddress:").append(localAddress)
                .append(" age:").append(age)
                .append(" university:").append(university)
                .append(" fclt:").append(fclt)
                .append(" course:").append(course)
                .append(" studyForm:").append(studyForm)
                .append(" sex:").append(sex);
        return buf.toString();
                
    }
    
    

}
