package com.user.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.UserDAO;
import com.book.model.UserDTO;

public class UserLoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 사용자 로그인 폼 페이지에서 넘어온 ID와 PW를 가지고 DB에서 회원 여부를 확인하는 비지니스 로직.
		String user_id = request.getParameter("id").trim();
		String user_pwd = request.getParameter("password").trim();
		UserDAO dao = UserDAO.getInstance();
		
		// 회원인지 여부를 확인하는 메서드 호출.
		int check = dao.userCheck(user_id,user_pwd);
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		if(check > 0) {
			UserDTO dto = dao.getMember(user_id,user_pwd);
			HttpSession session = request.getSession();
			session.setAttribute("userId", dto.getMem_id());
			session.setAttribute("userName", dto.getMem_name());
			session.setAttribute("userNum", dto.getMem_num());
			session.getCreationTime();  // 세션이 생선된 시간을 얻어오는 메서드
			session.getLastAccessedTime(); // 웹 브라우저가 가장 마지막에 세션에 접근한 시간
			session.setMaxInactiveInterval(30*60);   // 30분뒤 자동 로그아웃.
			forward.setRedirect(true);
			
			// 메인 페이지로 이동
			forward.setPath("main.do");
		}else if(check == -1) {
			// 비밀번호가 틀린 경우
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다.')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			// 회원이 아닌 경우(ID가 없거나 ID가 틀린 경우)
			out.println("<script>");
			out.println("alert('없는 ID입니다. ID를 확인하세요')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}
