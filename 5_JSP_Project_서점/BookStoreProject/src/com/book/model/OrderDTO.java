package com.book.model;

public class OrderDTO {

    // 일주일 주문건 필요컬럼
    private String order_tmp_num;      // 임시로 만든 주문번호 (일자+멤버번호)
    private String order_date;      // 주문일
    private int order_count;        // 주문 한건당 주문한 책 종류 갯수 (a책 1건, b책 2건, c책 1건 주문시 집계는 3개)  
    private int mem_num;            // 주문 멤버 번호
    private int total_order_qty;    // 주문한 책 토탈 갯수 (a책 1건, b책 2건, c책 1건 주문시 집계는 4개)  
    private int total_order_price;  // 토탈 주문 금액 
    private int book_num;           // 주문한 책중 가장 최신 등록 책 번호 
    private String book_name;       // 책 이름
    private String book_img;        // 책 이미지 경로
   
    public String getOrder_tmp_num() {
        return order_tmp_num;
    }
    public void setOrder_tmp_num(String order_tmp_num) {
        this.order_tmp_num = order_tmp_num;
    }
    public String getOrder_date() {
        return order_date;
    }
    public void setOrder_date(String order_date) {
        this.order_date = order_date;
    }
    public int getOrder_count() {
        return order_count;
    }
    public void setOrder_count(int order_count) {
        this.order_count = order_count;
    }
    public int getMem_num() {
        return mem_num;
    }
    public void setMem_num(int mem_num) {
        this.mem_num = mem_num;
    }
    public int getTotal_order_qty() {
        return total_order_qty;
    }
    public void setTotal_order_qty(int total_order_qty) {
        this.total_order_qty = total_order_qty;
    }
    public int getTotal_order_price() {
        return total_order_price;
    }
    public void setTotal_order_price(int total_order_price) {
        this.total_order_price = total_order_price;
    }
    public int getBook_num() {
        return book_num;
    }
    public void setBook_num(int book_num) {
        this.book_num = book_num;
    }
    public String getBook_name() {
        return book_name;
    }
    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }
    public String getBook_img() {
        return book_img;
    }
    public void setBook_img(String book_img) {
        this.book_img = book_img;
    }
    
    
}
