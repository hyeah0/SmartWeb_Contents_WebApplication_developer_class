package com.admin.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BookDAO;

public class BookDeleteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int book_num = Integer.parseInt(request.getParameter("book_num"));
		String book_img = request.getParameter("book_img");
		BookDAO dao = BookDAO.getInstance();
		int check = dao.deleteBook(book_num);
		
		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();
		if(check > 0) {
			if(!book_img.equals("")) {
				String deletePath = request.getServletContext().getRealPath("book_cover");
				File file = new File(deletePath+"/"+book_img);
				System.out.println("파일 삭제 경로 : " + deletePath+"/"+book_img);
				System.out.println("파일 삭제 유무 : " + file.delete());
			}
			forward.setRedirect(false);
			forward.setPath("book_list.do");

		}else {
			out.println("<script>");
			out.println("alert('delete fail')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}
}
