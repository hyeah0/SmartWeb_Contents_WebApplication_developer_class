package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BoardDAO;
import com.book.model.BoardDTO;

public class BoardListAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int mem_num = Integer.parseInt(request.getParameter("mem_num"));

		BoardDAO dao = BoardDAO.getInstance();
		List<BoardDTO> list = dao.getBoard(mem_num);

		request.setAttribute("boardList", list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("admin/board_list.jsp");
		
		return forward;
	}
}
