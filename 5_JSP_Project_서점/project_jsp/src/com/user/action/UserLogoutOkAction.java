package com.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;

public class UserLogoutOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 로그아웃 작업을 처리하는 Action 클래스
		
		ActionForward forward = new ActionForward();
		
		// 로그아웃시 세션에 담긴 아이디 값을 삭제.
		request.getSession().removeAttribute("userId");
		request.getSession().removeAttribute("userName");
		request.getSession().removeAttribute("userNum");
		
		// 로그아웃 후 메인화면으로 돌아감.
		forward.setRedirect(false);
		forward.setPath("/main.do");
		
		return forward;
	}
}
