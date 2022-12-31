package com.spring.model;

import lombok.Data;

@Data
public class CoffeeOrderDTO {

	private String order_num;
	private int order_row;
	private int order_cnt;
	private int order_price;		// 단가 * 수량 * (그람/100)
	private String order_date;
	private int beans_num;
	private String beans_name;
	private int beans_price;		// 단가
	private String beans_taste;		
	private int cart_weight;
	private int cart_grind;
	private int member_num;
	private int use_point;
	private int type_num;			// 배송 사항
	
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
	
	
	
	// 테이블 외 필요
	private int cart_num;			// 장바구니 번호
	private String beans_img;		// 상품 이미지
	private String order_month;		// 주문 월
	private String type_name;		// 배송 타입 명
	private int row_num; 			// 전체 row(행)번호
	

}


