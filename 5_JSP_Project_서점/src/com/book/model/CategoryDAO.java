package com.book.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.book.controller.Action;
import com.book.controller.ActionForward;

public class CategoryDAO {

	// 멤버변수
		Connection con = null;						// 데이터 베이스와 연동하는 객체
		PreparedStatement pstmt = null;				// 데이터 베이스에 sql문을 전송하는 객체
		ResultSet rs = null;						// sql문을 실행 후에 결과값을 가지고 있는 객체
		String sql = null; 							// 쿼리문을 저장할 변수
		
		// 객체 변수
		public static CategoryDAO instance;				// 싱글턴 : 2단계
		
		// 생성자
		public CategoryDAO() {	}						// 싱글턴 : 1단계
		
		/**
		 * @see .객체 생성 메서드
		 */
		public static CategoryDAO getInstance() {	// 싱글턴 : 3단계
			
			if(instance == null) {
				instance = new CategoryDAO();
			}
			
			return instance;
		}

		/**
		 * @see .DB연동 메서드
		 */
		public void openConn() {
			try {
				Context ctx = new InitialContext();
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");
				con = ds.getConnection();
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("* ----- 데이터베이스 연결 실패! ----- *");
			}
		}
		
		/**
		 * @see .DB연결 종료 메서드 
		 */
		public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {
			
			try{
				// ResultSet rs 종료 
				if(rs != null) { rs.close(); }
				// PreparedStatement pstmt 종료
				if(pstmt != null) { pstmt.close(); }
				// Connection con 종료
				if(con != null) { con.close(); }
				
			}catch(Exception e) { e.printStackTrace(); }
		}
		
		/*--------------------------- select ---------------------------*/
		/**
		 * @see .카테고리 가져오는 메서드
		 */
		public List<CategoryDTO> getCategory(){
			
			List<CategoryDTO> cgyList = new ArrayList<CategoryDTO>();
			
			try {
				
				openConn();
				
				sql = "select * from category order by cgy_num";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					CategoryDTO cgyDto = new CategoryDTO();
					cgyDto.setCgy_num(rs.getString("cgy_num"));
					cgyDto.setCgy_name(rs.getString("cgy_name"));
					cgyDto.setCgy_date(rs.getString("cgy_date"));
					cgyList.add(cgyDto);
				}
				
			} catch (Exception e) { e.printStackTrace();
			} finally { closeConn(rs, pstmt, con);
			}
			
			return cgyList;
		}

		/**
		 * @see .현재 선택된 카테고리명
		 */
		public CategoryDTO getNowCgyDto(String nowCgy_num) {
		    
		    System.out.println("-------------- CategoryDAO. getNowCgyName() 메서드 실행중..");
		    String nowCgy_Name = "";
		    CategoryDTO nowCgyDto = null;
		    System.out.println("categorydao : 받아온 nowCgy_Num : " + nowCgy_num);
		    
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
		        
		        System.out.println("categorydao : 받아온 nowCgy_name : " + nowCgy_Name); 
		    }
		    
		    return nowCgyDto;
		            
		}
}
