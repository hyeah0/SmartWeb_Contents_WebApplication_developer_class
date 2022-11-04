package com.book.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BannerDTO {
    
    private String banner_num;
    private String banner_title;
    private String banner_start;
    private String banner_end;
    private String banner_img;
    private String banner_cont;
    private int banner_event;
    
    public String getBanner_num() {
        return banner_num;
    }
    public void setBanner_num(String banner_num) {
        this.banner_num = banner_num;
    }
    public String getBanner_title() {
        return banner_title;
    }
    public void setBanner_title(String banner_title) {
        this.banner_title = banner_title;
    }
    public String getBanner_start() {
        return banner_start;
    }
    public void setBanner_start(String banner_start) {
        this.banner_start = banner_start;
    }
    public String getBanner_end() {
        return banner_end;
    }
    public void setBanner_end(String banner_end) {
        this.banner_end = banner_end;
    }
    public String getBanner_img() {
        return banner_img;
    }
    public void setBanner_img(String banner_img) {
        this.banner_img = banner_img;
    }
    public String getBanner_cont() {
        return banner_cont;
    }
    public void setBanner_cont(String banner_cont) {
        this.banner_cont = banner_cont;
    }
    public int getBanner_event() {
        return banner_event;
    }
    public void setBanner_event(int banner_event) {
        this.banner_event = banner_event;
    }
 
}

