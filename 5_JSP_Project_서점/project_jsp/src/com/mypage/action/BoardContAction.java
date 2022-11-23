package com.mypage.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BoardDAO;
import com.book.model.BoardDTO;

public class BoardContAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
      
        // 받아온 세션
        HttpSession session = request.getSession();
        int mem_num = (Integer)session.getAttribute("userNum");
        
        // 받아온 게시글 고유 번호
        String board_num = request.getParameter("board_num");
        System.out.println("board_num : " + board_num + ", mem_num : " + mem_num);
        
        BoardDAO boardDao = BoardDAO.getInstance();
        BoardDTO boardDto = boardDao.getBoard(mem_num, board_num);
        
        request.setAttribute("boardDto", boardDto);
        ActionForward forward = new ActionForward();
        
        if(request.getParameter("update")== null) {
            
            forward.setRedirect(false);
            forward.setPath("bookmain/mypage_board_cont.jsp");
        
        }else if(request.getParameter("update").equals("1")){
            
            forward.setRedirect(false);
            forward.setPath("bookmain/mypage_board_update.jsp");
            
        }
        
        
        return forward;
    }

}
