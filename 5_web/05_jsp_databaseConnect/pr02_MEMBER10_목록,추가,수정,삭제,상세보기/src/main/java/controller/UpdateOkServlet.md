```
package com.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

/**
 * Servlet implementation class UpdateOkServlet
 */
@WebServlet("/update_ok.do")
public class UpdateOkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateOkServlet() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 비지니스 로직
		// 회원 수정 폼 페이지에서 넘어온 데이터를 받아
		// DB에 MEBMER10 테이블의 회원번호에 해당하는 회원의 정보 수정

		// 한글
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		// 1단계 : 폼페이지에서 입력값을 받아온다.
		// type="hidden"으로 넘어온 회원번호(num) 받아오기
		int mem_num = Integer.valueOf(request.getParameter("num").trim());

		String mem_id = request.getParameter("mem_id").trim();
		String mem_name = request.getParameter("mem_name").trim();
		String mem_pwd = request.getParameter("mem_pwd").trim();
		int mem_age = Integer.valueOf(request.getParameter("mem_age").trim());
		int mem_mil = Integer.valueOf(request.getParameter("mem_mil").trim());
		String mem_job = request.getParameter("mem_job").trim();
		String mem_addr = request.getParameter("mem_addr").trim();

		// 2단계
		MemberDTO dto = new MemberDTO();
		dto.setNum(mem_num);
		dto.setMemid(mem_id);
		dto.setMemname(mem_name);
		dto.setPwd(mem_pwd);
		dto.setAge(mem_age);
		dto.setMileage(mem_mil);
		dto.setJob(mem_job);
		dto.setAddr(mem_addr);


		MemberDAO dao = new MemberDAO();

		int check = dao.updateMember(dto);

		PrintWriter out = response.getWriter();
		if(check > 0) {
			out.println("<script>");
			out.println("alert('회원 정보 수정 성공!')");
			out.println("location.href='content.do?num="+ dto.getNum()+"'");
			out.println("</script>");
		}else if(check == -1){
			out.println("<script>");
			out.println("alert('비밀번호가 틀렸습니다!')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('회원 정보 수정 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}


	}

}
```
