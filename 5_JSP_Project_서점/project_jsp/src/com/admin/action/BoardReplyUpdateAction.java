package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BoardDAO;
import com.book.model.BoardReplyDTO;

public class BoardReplyUpdateAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		BoardReplyDTO dto = null;
		
		BoardDAO dao = BoardDAO.getInstance();
		dto = dao.getBoardReplyUpdate(board_num);
		
		request.setAttribute("replyDTO", dto);
		ActionForward forward = new ActionForward();
		
		forward.setPath("admin/board_reply_update.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
