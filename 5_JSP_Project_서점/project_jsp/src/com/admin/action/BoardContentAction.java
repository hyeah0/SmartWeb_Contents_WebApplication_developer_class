package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BoardDAO;
import com.book.model.BoardDTO;

public class BoardContentAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		int mem_num = Integer.parseInt(request.getParameter("mem_num"));
		
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO dto = dao.getBoard(mem_num, board_num);
		
		request.setAttribute("boardDTO", dto);
		ActionForward forward = new ActionForward();
		
		forward.setPath("admin/board_content.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
