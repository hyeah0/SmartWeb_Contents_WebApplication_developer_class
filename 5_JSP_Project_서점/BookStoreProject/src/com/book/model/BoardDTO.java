package com.book.model;

import java.util.Date;
import java.time.LocalDateTime;

public class BoardDTO {

    private int board_num;
    private String board_title;
    private String board_cont;
    private String board_date;
    private String board_update;
    private int mem_num;
    private String board_cgy_num;
    private String board_image;
    
    // 마이페이지 문의 카테고리    
    private String board_cgy_name;

    // row
    private int row;

    public int getRow() {
        return row;
    }

    public void setRow(int row) {
        this.row = row;
    }

    public int getBoard_num() {
        return board_num;
    }

    public void setBoard_num(int board_num) {
        this.board_num = board_num;
    }

    public String getBoard_title() {
        return board_title;
    }

    public void setBoard_title(String board_title) {
        this.board_title = board_title;
    }

    public String getBoard_cont() {
        return board_cont;
    }

    public void setBoard_cont(String board_cont) {
        this.board_cont = board_cont;
    }

    //** -------------------------------
    public String getBoard_date() {
        return board_date;
    }

    public void setBoard_date(String now) {
        this.board_date = now;
    }

    
    public String getBoard_update() {
        return board_update;
    }

    public void setBoard_update(String board_update) {
        this.board_update = board_update;
    }

    public int getMem_num() {
        return mem_num;
    }

    public void setMem_num(int mem_num) {
        this.mem_num = mem_num;
    }

    public String getBoard_cgy_num() {
        return board_cgy_num;
    }

    public void setBoard_cgy_num(String board_cgy_num) {
        this.board_cgy_num = board_cgy_num;
    }

    public String getBoard_image() {
        return board_image;
    }

    public void setBoard_image(String board_image) {
        this.board_image = board_image;
    }

    public String getBoard_cgy_name() {
        return board_cgy_name;
    }

    public void setBoard_cgy_name(String board_cgy_name) {
        this.board_cgy_name = board_cgy_name;
    }
    
    
}
