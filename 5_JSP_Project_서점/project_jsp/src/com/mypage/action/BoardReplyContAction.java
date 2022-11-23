package com.mypage.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BoardDAO;
import com.book.model.BoardReplyDTO;

public class BoardReplyContAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 가져온 회원번호, 게시글번호
		HttpSession session = request.getSession();
	    int mem_num = (Integer)session.getAttribute("userNum");
	    int reply_num = Integer.valueOf(request.getParameter("reply_num"));
	    int page = Integer.valueOf(request.getParameter("page"));
	    
	    // 댓글 가져오기
	    BoardDAO boardDao = BoardDAO.getInstance();
	    BoardReplyDTO boardReplyDto = boardDao.getBoardReply(reply_num);
	    
	    request.setAttribute("page", page);
	    request.setAttribute("boardReplyDto", boardReplyDto);
	    ActionForward forward = new ActionForward();
	    forward.setRedirect(false);
	    forward.setPath("bookmain/mypage_board_reply.jsp");
	    
		return forward;
	}

}
