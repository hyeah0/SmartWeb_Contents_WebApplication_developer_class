package com.khie.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khie.model.DeptDAO;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteServlet() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 비지니스 로직
		// 삭제 버튼을 누르면 get방식으로 넘어온 부서번호를 가지고
		// db에서 해당 부서번호를 삭제
	
		// 한글 인코딩
		response.setContentType("text/html; charset=UTF-8");
		
		// 1단계 : 삭제 버튼을 눌렀을때 get방식으로 넘어온 부서번호를 받아야한다.
		int no = Integer.valueOf(request.getParameter("deptno").trim());
		
		// 2단계 : 삭제할 부서번호를 DB에 넘겨줘야한다.
		DeptDAO dao = new DeptDAO();
		int res = dao.deleteDept(no);
		
		// 3단계 : DB에 DTO 객체를 전송
		PrintWriter out = response.getWriter();
    	if(res>0) {	//부서삭제
    		
    		out.println("<script>");
    		out.println("alert('부서삭제 성공')");
    		out.println("location.href='select'");
    		out.println("</script>");
    		
    	
    	}else { // 부서 추가가 실패한 경우
    		
    		out.println("<script>");
    		out.println("alert('부서삭제 실패')");
    		out.println("history.back()");
    		out.println("</script>");
    		
    	}
		
		
	
	}


}
