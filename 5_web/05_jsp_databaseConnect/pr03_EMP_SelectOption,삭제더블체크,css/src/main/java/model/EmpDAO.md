```
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmpDAO {

	/*
	 DAO 객체를 싱글턴 방식으로 사용
	 ProductDAO 객체를 싱글턴 방식으로 생성하기
	 1단계 : private 기본생성자
	 		  기본생성자의 접근제어자를 public 이 아닌 private 으로 변경해야한다.
			  외부에서 직접적으로 기본생성자를 호출하지 못하게 하기 위함

	 2단계 : ProductDAO 객체를 정적(static) 멤버로 선언

	 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 하는
	        getInstance() 메서드 생성
	        getInstance()를 통해 기본 생성자를 외부에서 접근할 수 있도록 해준다.
 	*/

	// 멤버변수
	Connection con = null;						// 데이터 베이스와 연동하는 객체
	PreparedStatement pstmt = null;				// 데이터 베이스에 sql문을 전송하는 객체
	ResultSet rs = null;						// sql문을 실행 후에 결과값을 가지고 있는 객체
	String sql = null; 							// 쿼리문을 저장할 변수

	// 객체 변수
	private static EmpDAO instance;				// 싱글턴 : 2단계

	// 생성자
	private EmpDAO() {	}						// 싱글턴 : 1단계

	/**
	 * 싱글턴 객체 생성 메서드
	 * - EmpDAO getInstance()
	 * - 자료형 메서드명()
	 */
	public static EmpDAO getInstance() {	// 싱글턴 : 3단계

		if(instance == null) {
			instance = new EmpDAO();
		}

		return instance;
	}

	/**
	 * DB연동 메서드
	 * - openCon()
	 */
	public void openCon() {

		// 맥용
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@[전자지갑이름]_high?TNS_ADMIN=[전자지갑경로]";
		String user = "[유저명]";
		String password = "[비밀번호]";

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			System.out.println("* ----- 데이터베이스 연결 성공! ----- *");

		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("* ----- 데이터베이스 연결 실패! ----- *");
		}

	}

	/**
	 * DB연결 종료 메서드
	 * - closeConn(ResultSet rs, PreparedStatement pstmt, Connection con)
	 */
	public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {

		try{

			// ResultSet rs 종료
			if(rs != null) { rs.close(); }

			// PreparedStatement pstmt 종료
			if(pstmt != null) { pstmt.close(); }

			// Connection con 종료
			if(con != null) { con.close(); }

		}catch(Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 사원 목록 출력 메서드(일부출력시 사용)
	 */
	public List<EmpDTO> getMember(){

		List<EmpDTO> memberList = new ArrayList<EmpDTO>();

		try {

			// 데이터 베이스 연결
			openCon();

			// sql 작성
			sql = "select * from emp order by deptno, hiredate";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				EmpDTO dto = new EmpDTO();
				dto.setEmpno(rs.getInt("empno"));
				dto.setEname(rs.getString("ename"));
				dto.setJob(rs.getString("job"));
				dto.setMgr(rs.getInt("mgr"));
				dto.setHiredate(rs.getString("hiredate").substring(0,10));
				dto.setSal(rs.getInt("sal"));
				dto.setComm(rs.getInt("comm"));
				dto.setDeptno(rs.getInt("deptno"));

				memberList.add(dto);
			}

		}catch(Exception e) {
			e.printStackTrace();

		}finally {
			closeConn(rs, pstmt, con);
		}

		return memberList;
	}

	/**
	 * 사원 목록 출력 메서드(사원 한명 상세 출력시 사용)
	 */
	public EmpDTO getMemberDetail(int empno){

		EmpDTO memberDList = new EmpDTO();

		try {

			// 데이터 베이스 연결
			openCon();

			// sql 작성
			sql = "select e.*"
				+ "      , d.dname||'[' ||d.deptno ||']' as deptNameNo"
				+ "   from emp e"
				+ "  inner join dept d on e.deptno = d.deptno"
				+ "  where empno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, empno);
			rs = pstmt.executeQuery();

			if(rs.next()) {

				memberDList.setEmpno(rs.getInt("empno"));
				memberDList.setEname(rs.getString("ename"));
				memberDList.setJob(rs.getString("job"));
				memberDList.setMgr(rs.getInt("mgr"));
				memberDList.setHiredate(rs.getString("hiredate").substring(0,10));
				memberDList.setSal(rs.getInt("sal"));
				memberDList.setComm(rs.getInt("comm"));
				memberDList.setDeptno(rs.getInt("deptno"));
				memberDList.setDeptNameNo(rs.getString("deptNameNo"));
			}

		}catch(Exception e) {
			e.printStackTrace();

		}finally {
			closeConn(rs, pstmt, con);
		}

		return memberDList;
	}

	/**
	 * 담당 업무 조회 메서드
	 */
	public List<String> getJobList() {

		 List<String> jobList = new ArrayList<String>();

		 try {

			openCon();

			sql = "select distinct job from emp order by job";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {

				String job = rs.getString("job");
				jobList.add(job);
			}

		 }catch (Exception e) {
			e.printStackTrace();

		}finally {
			closeConn(rs, pstmt, con);
		}

		 return jobList;
	}

	/**
	 * 관리자 조회 메서드
	 */
	public List<EmpDTO> getMgrList(){

		List<EmpDTO> mgrList = new ArrayList<EmpDTO>();

		try {

			openCon();

			sql = " select *"
				+ "   from emp"
				+ "  where empno in (select distinct mgr from emp)";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				EmpDTO dto = new EmpDTO();
				dto.setEmpno(rs.getInt("empno"));
				dto.setEname(rs.getString("ename"));

				mgrList.add(dto);
				//System.out.println("empno : " + dto.getEmpno() + "/" + dto.getEname());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}



		return mgrList;

	}

	/**
	 * 부서테이블 조회 메서드
	 */
	public List<DeptDTO> getDeptList(){

	List<DeptDTO> deptList = new ArrayList<DeptDTO>();

			try {

				openCon();

				sql = "select *"
					+ "  from dept "
					+ " order by deptno";
				pstmt = con.prepareStatement(sql);

				rs = pstmt.executeQuery();

				while(rs.next()) {

					DeptDTO dto = new DeptDTO();
					dto.setDeptno(rs.getInt("deptno"));
					dto.setDname(rs.getString("dname"));
					dto.setLoc(rs.getString("loc"));

					deptList.add(dto);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}

			return deptList;
	}

	/**
	 * 사원 등록 메서드
	 */
	public int insertEmp(EmpDTO dto) {

		int result = 0;

		try {

			openCon();

			sql = "insert into emp values(?,?,?,?, sysdate, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getEmpno());
			pstmt.setString(2, dto.getEname());
			pstmt.setString(3, dto.getJob());
			pstmt.setInt(4, dto.getMgr());
			pstmt.setInt(5, dto.getSal());
			pstmt.setInt(6, dto.getComm());
			pstmt.setInt(7, dto.getDeptno());

			result = pstmt.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();

		}finally {
			closeConn(rs, pstmt, con);

		}

		return result;

	}

	/**
	 * 사원 수정 메서드
	 */
	public int updateEmp(EmpDTO dto) {
		int result = 0;

		try {

			openCon();

			sql = "update emp"
				+ "   set ename=?"
				+ "		, job=?"
				+ "		, mgr=?"
				+ "		, sal=?"
				+ "		, comm=?"
				+ "		, deptno=?"
				+ " where empno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dto.getEname());
			pstmt.setString(2, dto.getJob());
			pstmt.setInt(3, dto.getMgr());
			pstmt.setInt(4, dto.getSal());
			pstmt.setInt(5, dto.getComm());
			pstmt.setInt(6, dto.getDeptno());
			pstmt.setInt(7, dto.getEmpno());
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}


		return result;
	}

	/**
	 * 사원 삭제 메서드
	 */
	public int deleteEmp(int empno) {

		int result = 0;

		try {

			openCon();

			sql = "delete from emp where empno =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, empno);
			result = pstmt.executeUpdate();

		}catch (Exception e) {
			e.printStackTrace();

		}finally {
			closeConn(rs, pstmt, con);
		}


		return result;
	}
}
```
