package com.book.model;

public class BookDTO {

   private int book_num;
   private String cgy_num; // n001
   private String book_name;
   private int book_price;
   private int book_qty;
   private String book_cont;
   private String book_img;
   private String book_date;
   private String book_update;
   private String book_writer;
   private String book_publisher;
   private int book_sales;
   private int book_page;
   
   // 테이블 외
   private int rownum;
   private int order_month; //한달동안 주문건
   private int order_year;  //1년동안 주문건
   
    
    
    public int getBook_num() {
        return book_num;
    }
    public void setBook_num(int book_num) {
        this.book_num = book_num;
    }
    public String getCgy_num() {
        return cgy_num;
    }
    public void setCgy_num(String cgy_num) {
        this.cgy_num = cgy_num;
    }
    public String getBook_name() {
        return book_name;
    }
    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }
    public int getBook_price() {
        return book_price;
    }
    public void setBook_price(int book_price) {
        this.book_price = book_price;
    }
    public int getBook_qty() {
        return book_qty;
    }
    public void setBook_qty(int book_qty) {
        this.book_qty = book_qty;
    }
    public String getBook_cont() {
        return book_cont;
    }
    public void setBook_cont(String book_cont) {
        this.book_cont = book_cont;
    }
    public String getBook_img() {
        return book_img;
    }
    public void setBook_img(String book_img) {
        this.book_img = book_img;
    }
    public String getBook_date() {
        return book_date;
    }
    public void setBook_date(String book_date) {
        this.book_date = book_date;
    }
    public String getBook_update() {
        return book_update;
    }
    public void setBook_update(String book_update) {
        this.book_update = book_update;
    }
    public String getBook_writer() {
        return book_writer;
    }
    public void setBook_writer(String book_writer) {
        this.book_writer = book_writer;
    }
    public String getBook_publisher() {
        return book_publisher;
    }
    public void setBook_publisher(String book_publisher) {
        this.book_publisher = book_publisher;
    }
    public int getBook_sales() {
        return book_sales;
    }
    public void setBook_sales(int book_sales) {
        this.book_sales = book_sales;
    }
    public int getBook_page() {
        return book_page;
    }
    public void setBook_page(int book_page) {
        this.book_page = book_page;
    }
       
    
    public int getRownum() {
        return rownum;
    }
    public void setRownum(int rownum) {
        this.rownum = rownum;
    }
    public int getOrder_month() {
        return order_month;
    }
    public void setOrder_month(int order_month) {
        this.order_month = order_month;
    }
    public int getOrder_year() {
        return order_year;
    }
    public void setOrder_year(int order_year) {
        this.order_year = order_year;
    }
   
}
