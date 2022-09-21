package com.khie.controller;

import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khie.model.DeptDAO;
import com.khie.model.DeptDTO;

/**
 * Servlet implementation class InsertServlet
 */
@WebServlet("/insertOk")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	// 비지니스 로직
    	// insert.jsp 페이지에서 넘어온 데이터들을 DB에 저장 
    	
    	// 한글 인코딩 처리
    	request.setCharacterEncoding("utf-8");
    	response.setContentType("text/html; charset=UTF-8");
    	
    	// 1단계 : 부서등록 폼페이지에서 넘어온 테이블의 데이터를 받아준다.
    	int deptNo = Integer.valueOf(request.getParameter("deptNo").trim());
    	String deptName = request.getParameter("deptName").trim();
    	String deptLoc = request.getParameter("deptLoc").trim();
    	
    	// 2단계 : DTO 객체를 생성하고 멤버 변수에 값을 저장한다.
    	DeptDTO dto = new DeptDTO();
    	dto.setDeptno(deptNo);
    	dto.setDname(deptName);
    	dto.setLoc(deptLoc);
    	
    	// 3단계 : DB에 DTO 객체를 전송
    	DeptDAO dao = new DeptDAO();
    	int res = dao.insertDept(dto);
    	System.out.println("res >>>  " + res);
    	System.out.println("servelt에서 dto 주소 >>> " + dto);
    	
    	PrintWriter out = response.getWriter();
    	if(res>0) {	//부서추가
    		
    		out.println("<script>");
    		out.println("alert('부서추가 성공')");
    		out.println("location.href='select'");
    		out.println("</script>");

//    		scriptTag = "<html>"
//    				+ "	 	<head></head>"
//    				+ "	 	<body>"
//    				+ "        <h2> 스크립트는 안됨 </h2>"
//    				+ "			<script>"
//					+ "           alert('부서추가 성공!')"
//					+ "			  location.href='select'"
//					+ "			</script>"
//					+ "	 	</body>"
//					+ "	</html>";
//    		System.out.println(scriptTag);
//			out.println(scriptTag);
    		
    	
    	}else { // 부서 추가가 실패한 경우
    		
    		out.println("<script>");
    		out.println("alert('부서추가 실패')");
    		out.println("history.back()");
    		out.println("</script>");
    	}
    	
    	
	}
	

}
