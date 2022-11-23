package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BoardDAO;

public class BoardReplyUpdateOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String board_cont = request.getParameter("board_cont");
		
		BoardDAO dao = BoardDAO.getInstance();
		int check = dao.BoardReplyUpdate(board_num,board_cont);
		
		PrintWriter out = response.getWriter();
		ActionForward forward = null;
		
		if(check>0) {
			forward = new ActionForward();
			forward.setPath("member_list.do");
			forward.setRedirect(false);
		}else {
			out.println("<script>");
			out.println("alert('update fail')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}
}
