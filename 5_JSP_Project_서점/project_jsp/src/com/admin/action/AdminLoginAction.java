package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.AdminDAO;

public class AdminLoginAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		AdminDAO dao = AdminDAO.getInstance();
		int check = dao.checkAdmin(id, password);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(check == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("admin_id", id);
			forward.setPath("admin/admin_main.jsp");
			forward.setRedirect(false);
		}else if(check == -1) {
			out.println("<script>");
			out.println("alert('password fail')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('id fail')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}
}
