package com.spring.model;

import lombok.Data;

@Data
public class FinalMemberDTO {

	private int member_num;
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_birth;
	private String member_email;
	private String member_phone;
	private String member_date;
	private String member_img;
	private String member_addr;
	private String member_addr2;
	private String member_addr3;
	private String member_addr4;
	private String member_addr5;
	private int member_point;		// 주문금액의 5%
	private int test_num;
	private int member_use;
	
	//그외 
	

	private String test_name;
	private String test_full_name;
	private String test_info;
	private String test_match_coffee;
	private String test_mate;
	private String test_img;
	
	private int beans_num;
	private double coffee_star;
	private int coffee_heart;

	private String beans_name;
	private int beans_price;
	private int beans_weight;
	private String beans_taste;
	private String beans_intro;
	private String beans_img;
	private String beans_url;
	
	private int board_num;
	private String board_title;
	private String board_cont;
	private String board_file;
	private String board_date;
	private int board_reply;
	
	private int reply_num;
	private String reply_cont;
	private String reply_date;
	private int admin_num;
	
	private String order_num;
	private int order_row;
	private int order_cnt;
	private int order_price;		// 단가 * 수량 * (그람/100)
	private String order_date;	// 단가
	private int cart_weight;
	private int cart_grind;
	private int use_point;
	
	
	private String admin_id;
	private String admin_pwd;
	private String admin_name;
	private String admin_email;
	private String admin_phone;
	private String admin_date;
	
	private int write_num;
	private String write_cont;
	private String write_date;
	private String write_img;
	
	

	private int beans_count;
	

	

	
}


