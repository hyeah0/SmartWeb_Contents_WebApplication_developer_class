package com.spring.di02;

public class MySqlDAO implements DAO{

	@Override
	public void add() {
		
		System.out.println("MySQLDAO 연동입니다.");
		
	}

}
