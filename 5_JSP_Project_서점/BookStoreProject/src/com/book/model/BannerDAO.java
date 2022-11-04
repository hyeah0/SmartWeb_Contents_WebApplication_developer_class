package com.book.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BannerDAO {

 // 멤버변수
    Connection con = null;                      // 데이터 베이스와 연동하는 객체
    PreparedStatement pstmt = null;             // 데이터 베이스에 sql문을 전송하는 객체
    ResultSet rs = null;                        // sql문을 실행 후에 결과값을 가지고 있는 객체
    String sql = null;                          // 쿼리문을 저장할 변수
    
    // 객체 변수
    public static BannerDAO instance;             // 싱글턴 : 2단계
    
    // 생성자
    public BannerDAO() {  }                       // 싱글턴 : 1단계
    
    /**
     * @see .객체 생성 메서드
     */
    public static BannerDAO getInstance() {   // 싱글턴 : 3단계
        
        if(instance == null) {
            instance = new BannerDAO();
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
     * @see 배너 가져오기
     */
    public List<BannerDTO> getBanner(){
        
        List<BannerDTO> bannerDto = new ArrayList<BannerDTO>();
        
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formatedNow = now.format(formatter);
        System.out.println("foramtedNow : " + formatedNow);
        
        try {
            
            openConn();
            
            sql = "select * from banner where to_date(?,'yyyy-mm-dd') between banner_start and banner_end";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, formatedNow);
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                BannerDTO dto = new BannerDTO();
                dto.setBanner_num(rs.getString("banner_num"));
                dto.setBanner_title(rs.getString("banner_title"));
                dto.setBanner_start(rs.getString("banner_start"));
                dto.setBanner_end(rs.getString("banner_end"));
                dto.setBanner_img(rs.getString("banner_img"));
                dto.setBanner_cont(rs.getString("banner_cont"));
                dto.setBanner_event(rs.getInt("banner_event"));
                bannerDto.add(dto);
            }
            System.out.println("배너 가져오기 완료");
        } catch (Exception e) { e.printStackTrace();
        } finally { closeConn(rs, pstmt, con);
        }
        
        
        return bannerDto;
    }
    
    
    
}
