package com.book.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.book.controller.Action;
import com.book.controller.ActionForward;

public class MemberDAO {

    // 멤버변수
    Connection con = null;                      // 데이터 베이스와 연동하는 객체
    PreparedStatement pstmt = null;             // 데이터 베이스에 sql문을 전송하는 객체
    ResultSet rs = null;                        // sql문을 실행 후에 결과값을 가지고 있는 객체
    String sql = null;                          // 쿼리문을 저장할 변수
    
    // 객체 변수
    public static MemberDAO instance;             // 싱글턴 : 2단계
    
    // 생성자
    public MemberDAO() {  }                       // 싱글턴 : 1단계
    
    /**
     * @see .객체 생성 메서드
     */
    public static MemberDAO getInstance() {   // 싱글턴 : 3단계
        
        if(instance == null) {
            instance = new MemberDAO();
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
     * @see .멤버 정보 가져오는 메서드
     */
    public MemberDTO getMember(int mem_num) {
        MemberDTO memDto = null;

        try {
            
            openConn();
            
            sql ="select * from member where mem_num = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, mem_num);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                memDto = new MemberDTO();
                memDto.setMem_num(rs.getInt("mem_num"));
                memDto.setMem_id(rs.getString("mem_id"));
                memDto.setMem_name(rs.getString("mem_name"));
                memDto.setMem_phone(rs.getString("mem_phone"));
                memDto.setMem_addr(rs.getString("mem_addr"));
                memDto.setMem_mail(rs.getString("mem_mail"));
                memDto.setMem_mileage(rs.getInt("mem_mileage"));
            }
                    
        } catch (Exception e) { e.printStackTrace();
        } finally { closeConn(rs, pstmt, con);
        }
        
        return memDto;
    }
    
    /**
     * @see .회원 정보 업데이트
     */
    public int updateMember(int mem_num, String input_newPwd, String input_name, String input_mail, String input_phone, String input_addr) {
        
        System.out.println("memberDao : updateMember() 실행중 ...");
        System.out.println("넘어온 input_newPwd : " + input_newPwd);
        
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
    
    // ----------------------------- 마이페이지 
    
    
}
