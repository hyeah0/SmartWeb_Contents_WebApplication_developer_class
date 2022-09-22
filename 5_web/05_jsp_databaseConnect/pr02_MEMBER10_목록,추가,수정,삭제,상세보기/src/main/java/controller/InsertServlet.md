```
package com.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

@WebServlet("/insert.do")
public class InsertServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

    public InsertServlet() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 비지니스 로직
		// member_join.jsp 페이지에서 넘어온 회원 등록
		// 관련 정보들을 DB상의 MEMBER 10 테이블에 저장

		// 한글 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		// 1단계 : 폼페이지에서 입력값을 받아온다.
		String mem_id = request.getParameter("mem_id").trim();
		String mem_name = request.getParameter("mem_name").trim();
		String mem_pwd = request.getParameter("mem_pwd").trim();
		int mem_age = Integer.valueOf(request.getParameter("mem_age").trim());
		int mem_mil = Integer.valueOf(request.getParameter("mem_mil").trim());
		String mem_job = request.getParameter("mem_job").trim();
		String mem_addr = request.getParameter("mem_addr").trim();

		// 2단계 : DTO객체에 입력값을 받아온 것을 넣어준다.
		MemberDTO dto = new MemberDTO();
		dto.setMemid(mem_id);
		dto.setMemname(mem_name);
		dto.setPwd(mem_pwd);
		dto.setAge(mem_age);
		dto.setMileage(mem_mil);
		dto.setJob(mem_job);
		dto.setAddr(mem_addr);

		// 3단계 : dao 메서드를 이용하여 dto값을 DB에 넣어준다.
		MemberDAO dao = new MemberDAO();
		int result = dao.insertMember(dto);

		PrintWriter out = response.getWriter();
		if(result >0) {
			out.println("<script>");
			out.println("alert('회원 등록 성공!')");
			out.println("location.href='select.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('회원 등록 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

}
```
