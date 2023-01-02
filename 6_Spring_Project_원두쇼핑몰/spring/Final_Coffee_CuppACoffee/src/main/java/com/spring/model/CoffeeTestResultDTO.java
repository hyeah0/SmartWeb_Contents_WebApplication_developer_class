package com.spring.model;

import lombok.Data;

@Data
public class CoffeeTestResultDTO {
	
	// 0 , 1
	private int test_rs_brew;
	private int test_rs_add;
	private int test_rs_decaff;
	private int test_rs_taste_acid;
	private int test_rs_taste; 
	private int test_num;
	private String test_name;
	
	private int grind_num;
	private int decaf_num;
	
}


