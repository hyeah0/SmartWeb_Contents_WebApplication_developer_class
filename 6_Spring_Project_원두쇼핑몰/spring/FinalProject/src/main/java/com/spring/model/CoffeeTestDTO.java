package com.spring.model;

import lombok.Data;

@Data
public class CoffeeTestDTO {
	
	private int test_num;
	private String test_name;
	private String test_full_name;
	private String test_info;
	private int match_num;
	private String test_match_coffee;
	private String test_mate;
	private String test_img;

	
	//매칭된 이미지
	private String test_match_img;
	// 매칭된 커피이름
	private String match_coffee;
	
}


