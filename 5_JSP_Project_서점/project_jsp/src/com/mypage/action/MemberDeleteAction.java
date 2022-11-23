package com.mypage.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.MemberDAO;
import com.book.model.MemberDTO;

public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 받아온 회원 번호
        HttpSession session = request.getSession();
        int mem_num = (Integer)session.getAttribute("userNum");
		
    	MemberDAO memDao = MemberDAO.getInstance();
    	ActionForward forward = null;
        
    	int result = memDao.deleteMember(mem_num);
    	
    	if(result >0) {
    		System.out.println("회원 삭제 완료!");
    		request.getSession().removeAttribute("userId");
    		request.getSession().removeAttribute("userName");
    		request.getSession().removeAttribute("userNum");
    		
    		forward = new ActionForward();
    		forward.setRedirect(true);
    		forward.setPath(request.getContextPath()+"/main.do");
    		
    	}else {
    		System.out.println("회원 삭제 실패!");
    		PrintWriter out = response.getWriter();
    		out.println("<script>");
    		out.println("history.back()");
    		out.println("</script>");
    	}
	  
        return forward;
	}

}
