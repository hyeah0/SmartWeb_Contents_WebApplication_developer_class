package com.spring.model;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CoffeeWriteDTO {
	
	private int write_num;
	private String write_cont;
	private String write_date;
	private String write_img;
	private String member_id;
	private int beans_num;
	private int member_num;
	
	private int coffee_star;
}


