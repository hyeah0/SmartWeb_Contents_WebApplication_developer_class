package com.spring.model;

import lombok.Data;

@Data
public class CoffeeBeanDTO {
	
	private int beans_num;
	private String beans_name;
	private int beans_price;
	private int beans_count;
	private int beans_weight;
	private String beans_taste;
	private String beans_intro;
	private String beans_img;
	private String beans_add_image;
	
	private int count_h;
	
	private int write_count;
	
	private int star_avg;
}


