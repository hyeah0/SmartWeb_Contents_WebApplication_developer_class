package com.book.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CategoryDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;

	private static CategoryDAO instance;

	private CategoryDAO() {
	}

	public static CategoryDAO getInstance() {

		if (instance == null) {
			instance = new CategoryDAO();
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

	public List<CategoryDTO> getCategoryList() {
		openConn();
		List<CategoryDTO> list = new ArrayList<>();
		
		try {
			sql = "select * from category order by cgy_num desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CategoryDTO dto = new CategoryDTO();
				dto.setCgy_num(rs.getString("cgy_num"));
				dto.setCgy_name(rs.getString("cgy_name"));
				dto.setCgy_date(rs.getString("cgy_date"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}

	public int insertCategory(CategoryDTO dto) {
		int result = 0;
		openConn();
		
		try {
			sql = "insert into category values(?,?,sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getCgy_num());
			pstmt.setString(2, dto.getCgy_name());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}

	public int deleteCategory(String cgy_num) {
		int result = 0;
		openConn();
		
		try {
			sql = "delete from category where cgy_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cgy_num);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}

	public CategoryDTO getCategory(String cgy_num) {
		openConn();
		CategoryDTO dto = null;
		
		try {
			sql = "select * from category where cgy_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cgy_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new CategoryDTO();
				dto.setCgy_num(rs.getString("cgy_num"));
				dto.setCgy_name(rs.getString("cgy_name"));
				dto.setCgy_date(rs.getString("cgy_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}

	public int updateCategory(String cgy_num, CategoryDTO dto) {
		openConn();
		int result = 0;
		
		try {
			sql = "update category set cgy_num = ?, cgy_name = ? where cgy_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getCgy_num());
			pstmt.setString(2, dto.getCgy_name());
			pstmt.setString(3, cgy_num);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
	
	// ----------- 메인페이지, 카테고리 페이지에서 사용
	/**
	 * @see .현재 선택된 카테고리명
	 */
	public CategoryDTO getNowCgyDto(String nowCgy_num) {
	    
	    String nowCgy_Name = "";
	    CategoryDTO nowCgyDto = null;
	    
	    if(nowCgy_num.equals("all")) {
	        nowCgyDto = new CategoryDTO();
	        nowCgyDto.setCgy_name("도서 전체");
	        
	    }else {
	        try {
                
	            openConn();
	            
	            sql = "select cgy_num, cgy_name from category where cgy_num = ?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, nowCgy_num);
	            rs = pstmt.executeQuery();
	            
	            if(rs.next()) {
	                nowCgyDto = new CategoryDTO();
	                nowCgyDto.setCgy_num(rs.getString("cgy_num"));
	                nowCgyDto.setCgy_name(rs.getString("cgy_name"));
	            }
	            
            } catch (Exception e) { e.printStackTrace();
            } finally { closeConn(rs, pstmt, con);
            }
	        
	    }
	    
	    return nowCgyDto;
	            
	}
}
