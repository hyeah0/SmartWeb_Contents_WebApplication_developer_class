package com.khie.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khie.model.DeptDAO;
import com.khie.model.DeptDTO;

@WebServlet("/updateOk")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    // url 주소 끝이 /update 로 된것을 처리
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 비지니스 로직
		// 수정폼 페이지에서 넘어온 정보들을 DB에서 부서번호에 해당하는 정보를 수정
	
		// 한글 인코딩
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 1단계 : 수정 폼페이지에서 넘어온 정보를 받아야한다.
		int deptNo = Integer.valueOf(request.getParameter("deptNo").trim());
		String dName = request.getParameter("reName").trim();
		String dLoc = request.getParameter("reLoc").trim();
	
		// 2단계 : DTO 객체에 수정된 데이터를 저장해주자
		DeptDTO dto = new DeptDTO();
		dto.setDeptno(deptNo);
		dto.setDname(dName);
		dto.setLoc(dLoc);
		// 1,2단계 합쳐진 버전
		// == dto.setLoc(request.getParameter("reLoc").trim());
		
		
		// 3단계 : 데이터베이스 값 수정 해주자
		// DB에 DTO 객체를 전송
		DeptDAO dao = new DeptDAO();
		
		//DeptDAO 클래스에 있는 updateDept(dto) 메서드
		dao.updateDept(dto);
		
    	int res = dao.insertDept(dto);
    	System.out.println("servelt에서 dto 주소 >>> " + dto);
    	
    	PrintWriter out = response.getWriter();
    	if(res>0) {	//부서수정
    		
    		out.println("<script>");
    		out.println("alert('부서수정 성공')");
    		out.println("location.href='select'");
    		out.println("</script>");
    		
    	}else { // 부서 추가가 실패한 경우
    		
    		out.println("<script>");
    		out.println("alert('부서수정 실패')");
    		out.println("history.back()");
    		out.println("</script>");
    		
    	}
				
	}

}
