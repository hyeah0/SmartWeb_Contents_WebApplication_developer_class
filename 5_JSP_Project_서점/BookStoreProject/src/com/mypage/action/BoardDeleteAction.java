package com.mypage.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BoardDAO;

public class BoardDeleteAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
     
        System.out.println("------------- BoardDeleteAction 클래스 ");
        // 넘어온값
        // 받아온 세션
        HttpSession session = request.getSession();
        int mem_num = (Integer)session.getAttribute("mem_num");
        String board_num = request.getParameter("board_num");
        System.out.println("board_num : " + board_num + ", mem_num : " + mem_num);
        
        BoardDAO boardDao = BoardDAO.getInstance();
        int result = boardDao.deleteBoard(mem_num, board_num);
        System.out.println("삭제 result : " + result);
        
        ActionForward forward = new ActionForward();
        PrintWriter out = response.getWriter();
        
        if(result>0) {
            forward.setRedirect(true);
            forward.setPath("mypage_board_list.do");
        }else {
            out.println("<script>");
            out.println("alert('삭제 실패했습니다.')");
            out.println("history.back()");
            out.println("</script>");
        }
        
        return forward;
    }

}
