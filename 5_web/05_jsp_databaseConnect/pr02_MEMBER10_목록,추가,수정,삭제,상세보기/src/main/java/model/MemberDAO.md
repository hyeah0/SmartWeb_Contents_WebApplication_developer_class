 ### 메서드 1(전체) : getMemberList()
 - 전체 테이블 조회
```
public List<MemberDTO> getMemberList(){
```
### 메서드 3(1개전체) : getContentMember()
* - 회원 이름 클릭시 회원 번호에 대한 모든 정보를 조회해준다.
List 여러명 정보 / MemberDTO 한사람 정보
```
public MemberDTO getContentMember(int memNum) {
```	
### 메서드 2(추가) : insertData()
 - 테이블에 데이터 추가
```
public int insertMember(MemberDTO dto) {
```
### 메서드 4(수정) : updateMember()
 - 회원 이름 클릭시 회원 번호에 대한 모든 정보를 조회해준다.
```
public int updateMember(MemberDTO dto) {
```	
	
```
package com.member.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {

	// 멤버변수
	Connection con = null;					// 데이터 베이스와 연동하는 객체
	PreparedStatement pstmt = null;			// 데이터 베이스에 sql문을 전송하는 객체
	ResultSet rs = null;					// sql문을 실행 후에 결과값을 가지고 있는 객체
	String sql = null; 						// 쿼리문을 저장할 변수

	// 기본생성자
	// 데이터 연동 (1~2단계)
	// - 오라클 드라이버 메모리 로딩, 데이터베이스 연결
	public MemberDAO() {

		// 윈도우용
		// String dirver = "oracle.jdbc.driver.OracleDriver";
		// String url = "jdbc:oracle:thin:@localhost:1521:XE";
		// String user = "[유저명]";
		// String password = "[비밀번호]";

		// 맥용
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@[전자지갑명]_high?TNS_ADMIN=[전자지갑경로]";
		String user = "[사용자명]";
		String password = "[비밀번호]";

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);

		}catch(Exception e) {
			e.printStackTrace();
		}

	} // 기본 생성자 종료


	/**
	 * 메서드 1 : getMemberList()
	 * - 전체 테이블 조회
	 */
	public List<MemberDTO> getMemberList(){

		// 객체 생성
		List<MemberDTO> list = new ArrayList<MemberDTO>();

		try{

			// 1. DB전송할 SQL문 작성
			sql = "select * from member10 order by num desc";

			// 2. sql문을 데이터 베이스 전송 객체에 저장
			pstmt = con.prepareStatement(sql);

			// 3. 데이터베이스에 sql문 전송 및 실행
			rs = pstmt.executeQuery();


			// 4. sql 결과 값을 dto객체에 저장
			// 데이터가 없을때까지 반복하여 list 에 dto 주소값 저장
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();

				dto.setNum( rs.getInt("num"));
				dto.setMemid(rs.getString("memid"));
				dto.setMemname(rs.getString("memname"));
				dto.setPwd(rs.getString("pwd"));
				dto.setAge(rs.getInt("age"));
				dto.setMileage(rs.getInt("mileage"));
				dto.setJob(rs.getString("job"));
				dto.setAddr(rs.getString("addr"));
				dto.setRegdate(rs.getString("regdate"));

				list.add(dto);
			}

			// 5. 연결자원 종료
			rs.close(); pstmt.close(); con.close();

		}catch(SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	/**
	 * 메서드 2 : insertData()
	 * - 테이블에 데이터 추가
	 */
	public int insertMember(MemberDTO dto) {
		int result=0, count =0;

		try {
			sql = "select max(num) from member10";
			pstmt = con.prepareStatement(sql);
			pstmt.executeQuery();
			rs = pstmt.getResultSet();

			// 데이터 1개 나올경우 if / 여러개 나올경우 while
			if(rs.next()) {
				// getInt(인덱스) --> 인덱스 값을 가져온다.
				count = rs.getInt(1);
			}

			sql = "insert into member10 "
				+ "values(?, ?, ?, ?, ?, ?, ?, ?, sysdate)";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, count+1);
			pstmt.setString(2, dto.getMemid());
			pstmt.setString(3, dto.getMemname());
			pstmt.setString(4, dto.getPwd());
			pstmt.setInt(5, dto.getAge());
			pstmt.setInt(6, dto.getMileage());
			pstmt.setString(7, dto.getJob());
			pstmt.setString(8, dto.getAddr());

			result = pstmt.executeUpdate();

			// 연결자원 종료
			rs.close();
			pstmt.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}


	/**
	 * 메서드 3 : getContentMember()
	 * - 회원 이름 클릭시 회원 번호에 대한 모든 정보를 조회해준다.
	 * List 여러명 정보 / MemberDTO 한사람 정보
	 */
	public MemberDTO getContentMember(int memNum) {

		MemberDTO dto = null;

		try {
			sql = "select * from member10 where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, memNum);
			rs = pstmt.executeQuery();

			if(rs.next()) {

				dto = new MemberDTO();

				dto.setNum( rs.getInt("num"));
				dto.setMemid(rs.getString("memid"));
				dto.setMemname(rs.getString("memname"));
				dto.setPwd(rs.getString("pwd"));
				dto.setAge(rs.getInt("age"));
				dto.setMileage(rs.getInt("mileage"));
				dto.setJob(rs.getString("job"));
				dto.setAddr(rs.getString("addr"));
				dto.setRegdate(rs.getString("regdate"));
			}

			rs.close(); pstmt.close(); con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return dto;
	}

	/**
	 * 메서드 4 : updateMember()
	 * - 입력받은 값으로 값으로 데이터 수정
	 */

	public int updateMember(MemberDTO dto) {
		int result = 0;

		try {

			sql = "select * from member10 where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());

			rs = pstmt.executeQuery();

			if(rs.next()) {

				// 수정폼페이지에서 입력한 dto에 있는 getPwd()와
				// 데이터베이스 상의 pwd가 동일 하면 입력값으로 데이터베이스 수정
				if(dto.getPwd().equals(rs.getString("pwd"))) {
					sql = "update member10 "
						+ "   set age=?"
						+ "	    , mileage = ?"
						+ "     , job = ?"
						+ "     , addr = ?"
						+ " where num = ?";

					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, dto.getAge());
					pstmt.setInt(2, dto.getMileage());
					pstmt.setString(3, dto.getJob());
					pstmt.setString(4, dto.getAddr());
					pstmt.setInt(5, dto.getNum());

					result =pstmt.executeUpdate();

				}else { // 비밀번호가 다른경우
					result = -1;
				}
			}

				rs.close();
				pstmt.close();
				con.close();

		}catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}


}
```
