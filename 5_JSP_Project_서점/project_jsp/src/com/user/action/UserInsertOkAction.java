package com.user.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.UserDAO;
import com.book.model.UserDTO;

public class UserInsertOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 회원가입 페이지로부터 넘어온 데이터들을 DB에 저장하는 비지니스 로직.
		
request.setCharacterEncoding("UTF-8");
		
		String mem_id = request.getParameter("id").trim();
		String mem_pw = request.getParameter("pwd1").trim();
		String mem_name = request.getParameter("name").trim();
		String email = request.getParameter("email").trim();
		String e_domain = request.getParameter("e_domain").trim();
		String domain = request.getParameter("domain").trim();
		if(domain.equals("1")) {
			domain = e_domain;
		}
		String gol = "@";
		String email2 = gol.concat(domain).trim();
		String hp = request.getParameter("phone").trim() + "-" + request.getParameter("phone1").trim()+"-"+request.getParameter("phone2").trim();
		String mem_addr = request.getParameter("addr").trim();
		String card = request.getParameter("cardNum").trim() +"-"+request.getParameter("cardNum1").trim()+"-"+request.getParameter("cardNum2").trim()+"-"+request.getParameter("cardNum3").trim();
		int mem_card_pwd = Integer.parseInt(request.getParameter("cardPwd").trim());
		
		UserDTO dto = new UserDTO();
		
		dto.setMem_id(mem_id);
		dto.setMem_pwd(mem_pw);
		dto.setMem_name(mem_name);
		dto.setMem_mail(email+email2);
		dto.setMem_phone(hp);
		dto.setMem_addr(mem_addr);
		dto.setMem_card_num(card);
		dto.setmem_card_pwd(mem_card_pwd);
		
		UserDAO dao = UserDAO.getInstance();
		
		int check = dao.getinsertUser(dto);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			forward.setRedirect(false);
			forward.setPath("user/member_login.jsp");
		}else {
			out.println("<script>");
			out.println("alert('회원등록실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}
