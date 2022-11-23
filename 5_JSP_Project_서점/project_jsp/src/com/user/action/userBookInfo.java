package com.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BookDAO;
import com.book.model.BookDTO;

public class userBookInfo implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int book_num = Integer.parseInt(request.getParameter("book_num").trim());
		
		BookDTO bookdto = new BookDTO();
		BookDAO bookdao = BookDAO.getInstance();
		
		bookdto = bookdao.getBook(book_num);
		
		request.setAttribute("bookdto", bookdto);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("bookpage/book_info.jsp");
		
		
		return forward;
	}

}
