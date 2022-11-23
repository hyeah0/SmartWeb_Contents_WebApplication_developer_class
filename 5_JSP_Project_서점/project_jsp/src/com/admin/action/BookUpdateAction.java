package com.admin.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BookDAO;
import com.book.model.BookDTO;
import com.book.model.CategoryDAO;
import com.book.model.CategoryDTO;

public class BookUpdateAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int book_num = Integer.parseInt(request.getParameter("book_num"));
		BookDTO bookDTO = new BookDTO();
		BookDAO dao = BookDAO.getInstance();
		bookDTO = dao.getBookUpdate(book_num);
		List<CategoryDTO> list = new ArrayList<CategoryDTO>();
		CategoryDAO ctyDAO = CategoryDAO.getInstance();
		list = ctyDAO.getCategoryList();
		
		request.setAttribute("bookDTO", bookDTO);
		request.setAttribute("categoryList" , list);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("admin/book_update.jsp");
		
		return forward;
	}
}
