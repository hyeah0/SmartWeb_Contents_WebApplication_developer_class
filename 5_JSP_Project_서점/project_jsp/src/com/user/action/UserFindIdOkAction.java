package com.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.UserDAO;
import com.book.model.UserDTO;

public class UserFindIdOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// member_findId 에서 넘어온 값들을 DB에 조회
		
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("me_name").trim();
		String phone = request.getParameter("me_tel").trim();
		
		UserDAO dao = UserDAO.getInstance();
		
		UserDTO dto = dao.findId(name, phone);
		
		ActionForward forward = new ActionForward();
		
		request.setAttribute("Cont", dto);
		
		forward.setRedirect(false);
		
		forward.setPath("user/member_findIdResult.jsp");
		
		return forward;
	}

}
