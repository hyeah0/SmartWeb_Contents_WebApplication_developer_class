package com.mypage.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BookDAO;
import com.book.model.BookDTO;
import com.book.model.CategoryDAO;
import com.book.model.CategoryDTO;
import com.book.model.MemberDAO;
import com.book.model.MemberDTO;
import com.book.model.OrderDTO;

public class MyMainAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
     
        // 받아온 회원 번호
        HttpSession session = request.getSession();
        int mem_num = (Integer)session.getAttribute("userNum");
        
        // 회원 마일리지, 회원 최근 주문건, 회원 자주 구매하는 카테고리의 한달 주문건 top3 
        // 추천 책 , 최근주문건
        BookDAO bookDao = BookDAO.getInstance();
        List<BookDTO> bookList = bookDao.recommendBook(mem_num);
        // List<OrderDTO> orderList = bookDao.getWeekOrder(mem_num);
        
        // 회원정보 마일리지, 이름
        MemberDAO memDao = MemberDAO.getInstance();
        MemberDTO memberList = memDao.getMember(mem_num);
        
        // 추천책, 회원정보(이름,마일리지), 최근주문건
        request.setAttribute("bookList", bookList);
        request.setAttribute("memberList", memberList);
        // request.setAttribute("orderList", orderList);
        
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("bookmain/mypage_main.jsp");
        
        return forward;
    }

}
