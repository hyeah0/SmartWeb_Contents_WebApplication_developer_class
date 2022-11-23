package com.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.UserDAO;
import com.book.model.UserDTO;

public class UserFindPwOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// member_findpw 에서 넘어온 값들을 DB에 조회
		
		request.setCharacterEncoding("UTF-8");
		
		String mem_Id = request.getParameter("mem_id").trim();
		String mem_mail = request.getParameter("mem_mail").trim();
		String mem_phone = request.getParameter("mem_phone").trim();
		
		UserDAO dao = UserDAO.getInstance();
		
		UserDTO dto = dao.findPw(mem_Id,mem_mail,mem_phone);
		
		ActionForward forward = new ActionForward();
		
		request.setAttribute("Pwd", dto);
		
		forward.setRedirect(false);
		
		forward.setPath("user/member_findPwResult.jsp");
		
		return forward;
	}

}
