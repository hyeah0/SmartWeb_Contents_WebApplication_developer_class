package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BookDAO;
import com.book.model.BookDTO;
import com.book.model.CategoryDAO;
import com.book.model.CategoryDTO;

public class BookContentAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int book_num = Integer.parseInt(request.getParameter("book_num"));
		BookDTO bookdto = new BookDTO();
		BookDAO bookdao = BookDAO.getInstance();
		CategoryDTO cgydto = new CategoryDTO();
		CategoryDAO cgydao = CategoryDAO.getInstance();
		
		bookdto = bookdao.getBook(book_num);
		request.setAttribute("bookdto", bookdto);
		cgydto = cgydao.getCategory(bookdto.getCgy_num());
		request.setAttribute("cgydto", cgydto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("admin/book_content.jsp");
		
		return forward;
	}

}
