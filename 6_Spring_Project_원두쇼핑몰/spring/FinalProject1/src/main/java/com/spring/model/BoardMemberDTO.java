package com.spring.model;

import lombok.Data;

@Data
public class BoardMemberDTO {

	private int board_num;
	private String board_title;
	private String board_cont;
	private String board_file;
	private String board_date;
	private int board_reply;
	private int member_num;
	

	private int reply_num;
	private String reply_cont;
	private String reply_date;
	private int admin_num;
}


