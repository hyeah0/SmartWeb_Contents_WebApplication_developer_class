package com.book.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AdminDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;

	private static AdminDAO instance;

	private AdminDAO() {
	}

	public static AdminDAO getInstance() {

		if (instance == null) {
			instance = new AdminDAO();
		}

		return instance;
	}

	public void openConn() {

		try {
			Context ctx = new InitialContext();

			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");

			con = ds.getConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {

		try {
			if (rs != null)
				rs.close();

			if (pstmt != null)
				pstmt.close();

			if (con != null)
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public int checkAdmin(String id, String password) {
		int result = 0;
		openConn();
		try {
			sql = "select admin_pwd from admin where admin_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("admin_pwd").equals(password)) {
					result = 1;
				}else {
					result = -1;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			 closeConn(rs, pstmt, con);
		}
		
		return result;
	}

}
