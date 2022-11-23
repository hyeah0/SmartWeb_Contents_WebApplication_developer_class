package com.user.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.UserDAO;

public class UserJoinCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 회원가입 중복체크 사용 
		
		String id = request.getParameter("id").trim();
		
		UserDAO dao = UserDAO.getInstance();
		
		boolean result = dao.checkMemberId(id);
		
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out =  response.getWriter();
		
		if(result) {
			out.println("0");
		}else {
			out.println("1");
		}
		return null;
	}

}
