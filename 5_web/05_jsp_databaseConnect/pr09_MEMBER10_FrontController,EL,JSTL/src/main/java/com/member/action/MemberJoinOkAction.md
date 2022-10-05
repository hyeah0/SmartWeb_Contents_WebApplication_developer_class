```
package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

public class MemberJoinOkAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// 비지니스 로직
		// 회원 등록 폼 페이지에서 넘어온 데이터들을 member10 테이블에 저장

		// 1단계 : 회원등록 폼페이지에서 넘어온 데이터 받아오기
		String mem_id = request.getParameter("mem_id").trim();
		String mem_name = request.getParameter("mem_name").trim();
		String mem_pwd = request.getParameter("mem_pwd").trim();
		int mem_age = Integer.valueOf(request.getParameter("mem_age").trim());
		int mem_mileage = Integer.valueOf(request.getParameter("mem_mileage").trim());
		String mem_job = request.getParameter("mem_job").trim();
		String mem_addr = request.getParameter("mem_addr").trim();

		// 2단계 : dto 객체에 정보 넣기
		MemberDTO dto = new MemberDTO();
		dto.setMemid(mem_id);
		dto.setMemname(mem_name);
		dto.setPwd(mem_pwd);
		dto.setAge(mem_age);
		dto.setMileage(mem_mileage);
		dto.setJob(mem_job);
		dto.setAddr(mem_addr);

		// 3단계 : 테이블에 넣기
		MemberDAO dao = MemberDAO.getInstance();
		int result = dao.insertMember(dto);

		// 4단계 : 결과값 알림
		PrintWriter out = response.getWriter();
		if(result>0) {
			out.println("<script>");
			out.println("alert('회원 추가 완료!')");
			out.println("location.href='select.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('회원 추가 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}

		return null;
	}

}
```
