package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BookDAO;
import com.book.model.BookDTO;
import com.book.model.CategoryDAO;
import com.book.model.CategoryDTO;
import com.book.model.Page;

public class BookSelectAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		BookDAO dao = BookDAO.getInstance();

		// page
		int pageNum = 0;
		int onePage = 5;
		int amount = 10;
		int total = 0;

		String searchText = "";
		String search_tag = "";
		searchText = request.getParameter("searchText");
		search_tag = request.getParameter("search_tag");

		total = dao.getSize();

		if (request.getParameter("pageNum") == null) {
			pageNum = 1;
		} else {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		Page page = new Page(pageNum, total, onePage, amount);

		// list
		List<BookDTO> list = null;
		ActionForward forward = new ActionForward();
		list = dao.getBookListPage(page.getStartPoint(), page.getEndPoint());
		request.setAttribute("page", page);
		request.setAttribute("bookList", list);
		request.setAttribute("searchText", searchText);
		request.setAttribute("search_tag", search_tag);

		forward.setRedirect(false);
		forward.setPath("admin/book_list.jsp");

		return forward;
	}
}
