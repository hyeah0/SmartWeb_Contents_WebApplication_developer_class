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

public class MemberDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;

	private static MemberDAO instance;

	private MemberDAO() {
	}

	public static MemberDAO getInstance() {

		if (instance == null) {
			instance = new MemberDAO();
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

	public List<MemberDTO> getMemberList() {
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		openConn();
		
		try {
			sql = "select * from member order by mem_num desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setMem_num(rs.getInt("mem_num"));
				dto.setMem_addr(rs.getString("mem_addr"));
				dto.setMem_card_num(rs.getString("mem_card_num"));
				dto.setMem_card_pwd(rs.getInt("mem_card_pwd"));
				dto.setMem_id(rs.getString("mem_id"));
				dto.setMem_mail(rs.getString("mem_mail"));
				dto.setMem_mileage(rs.getInt("mem_mileage"));
				dto.setMem_name(rs.getString("mem_name"));
				dto.setMem_pwd(rs.getString("mem_pwd"));
				dto.setMem_phone(rs.getString("mem_phone"));
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

	public MemberDTO getMember(int mem_num) {
		MemberDTO dto = null;
		openConn();
		
		try {
			sql = "select * from member where mem_num = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mem_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setMem_num(rs.getInt("mem_num"));
				dto.setMem_addr(rs.getString("mem_addr"));
				dto.setMem_card_num(rs.getString("mem_card_num"));
				dto.setMem_card_pwd(rs.getInt("mem_card_pwd"));
				dto.setMem_id(rs.getString("mem_id"));
				dto.setMem_mail(rs.getString("mem_mail"));
				dto.setMem_mileage(rs.getInt("mem_mileage"));
				dto.setMem_name(rs.getString("mem_name"));
				dto.setMem_pwd(rs.getString("mem_pwd"));
				dto.setMem_phone(rs.getString("mem_phone"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return dto;
	}
	
	// -----------------------------------------------------------------------------
	  
    /**
     * @see .회원 비밀번호 확인 메서드
     */
    public int cheackMemberPwd(int mem_num, String input_pwd) {
        
        int result = 0;
        
        try {
            
            openConn();
            
            // 비밀번호 확인
            sql="select mem_id, mem_pwd from member where mem_num= ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, mem_num);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                String mem_pwd = rs.getString("mem_pwd");
                
                if(!input_pwd.equals(mem_pwd)) {
                    // 입력한 비밀번호가 다른경우
                    result = -1;
                    
                }else {
                    result = 1;
                }
            }
              
        } catch (Exception e) { e.printStackTrace();
        } finally { closeConn(rs, pstmt, con);
        }
        
        return result;
    }
    
    /**
     * @see .회원 정보 업데이트
     */
    public int updateMember(int mem_num, String input_newPwd, String input_name, String input_mail, String input_phone, String input_addr) {
        
        int result = 0;
        
        try {
            
            openConn();
            
            if(input_newPwd != "0") {
                sql = "update member "
                    + "   set mem_pwd = ?"
                    + "     , mem_name = ?"
                    + "     , mem_phone = ?"
                    + "     , mem_addr = ?"
                    + "     , mem_mail = ?"
                    + " where mem_num = ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, input_newPwd);
                pstmt.setString(2, input_name);
                pstmt.setString(3, input_phone);
                pstmt.setString(4, input_addr);
                pstmt.setString(5, input_mail);
                pstmt.setInt(6, mem_num);
                
            }else {
                sql = "update member "
                    + "   set mem_name = ?"
                    + "     , mem_phone = ?"
                    + "     , mem_addr = ?"
                    + "     , mem_mail = ?"
                    + " where mem_num = ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, input_name);
                pstmt.setString(2, input_phone);
                pstmt.setString(3, input_addr);
                pstmt.setString(4, input_mail);
                pstmt.setInt(5, mem_num);
            }
            
            result = pstmt.executeUpdate();
                    
            
        } catch (Exception e) { e.printStackTrace();
        } finally { closeConn(rs, pstmt, con);
        }
        
        
        return result;
    }
    
    /**
     * @see .회원정보 삭제
     */
    public int deleteMember(int mem_num) {
    	
    	int result = 0;
    	try {
    		
    		openConn();
    		
    		sql = "delete from member where mem_num = "+ mem_num;
    		pstmt = con.prepareStatement(sql);
    		result = pstmt.executeUpdate();
    		
    	} catch (Exception e) { e.printStackTrace();
		} finally { closeConn(rs, pstmt, con);
		}
    	
    	return result;
    }
    
	
	// -----------------------------------------------------------------------------
}
