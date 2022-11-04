package com.mypage.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BoardDAO;
import com.book.model.BoardDTO;

public class BoardListAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
        System.out.println("------------------ BoardListAction 클래스");
        HttpSession session = request.getSession();
        int mem_num = (Integer)session.getAttribute("mem_num");
        System.out.println("넘어온 mem_num : " + mem_num);
        
        BoardDAO boardDao = BoardDAO.getInstance();
        List<BoardDTO> boardList = boardDao.getBoard(mem_num);
        
        request.setAttribute("boardList", boardList);
        System.out.println("boardList : " + boardList);
        
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("view/mypage_board_list.jsp");
        
        System.out.println("------------------ BoardListAction 클래스끝!");
        return forward;
    }

}
