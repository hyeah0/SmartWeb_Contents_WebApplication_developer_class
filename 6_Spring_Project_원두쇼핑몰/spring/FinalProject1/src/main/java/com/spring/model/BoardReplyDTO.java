package com.spring.model;

import lombok.Data;

@Data
public class BoardReplyDTO {
	
	private int reply_num;
	private String reply_cont;
	private String reply_date;
	private int admin_num;
	private int board_num;
}


