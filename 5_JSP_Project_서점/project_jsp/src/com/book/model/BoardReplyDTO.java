package com.book.model;

public class BoardReplyDTO {
	
	private int reply_num;
	private String reply_cont;
	private String reply_date;
	private String reply_update;
	private int board_num;
	
	// 답변
	private String board_title;
	private String board_date;
	private String board_update;
	private String board_cgy_num;
	private String board_cgy_name;
	
	
	
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public String getReply_cont() {
		return reply_cont;
	}
	public void setReply_cont(String reply_cont) {
		this.reply_cont = reply_cont;
	}
	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}
	public String getReply_update() {
		return reply_update;
	}
	public void setReply_update(String reply_update) {
		this.reply_update = reply_update;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_cgy_num() {
		return board_cgy_num;
	}
	public void setBoard_cgy_num(String board_cgy_num) {
		this.board_cgy_num = board_cgy_num;
	}
	public String getBoard_cgy_name() {
		return board_cgy_name;
	}
	public void setBoard_cgy_name(String board_cgy_name) {
		this.board_cgy_name = board_cgy_name;
	}
	
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
	public String getBoard_update() {
		return board_update;
	}
	public void setBoard_update(String board_update) {
		this.board_update = board_update;
	}
	
	
}
