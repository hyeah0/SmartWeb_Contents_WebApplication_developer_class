package com.admin.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BookDAO;
import com.book.model.BookDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BookInsertOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		BookDTO dto = new BookDTO();
		String savePath = request.getServletContext().getRealPath("book_cover");
		int size = 10*1024*1024;
		int check = 0;
		System.out.println(savePath);
		MultipartRequest multi = new MultipartRequest(request, savePath,size,"UTF-8");
		
		String book_img = multi.getFilesystemName("book_img");
		dto.setBook_cont(multi.getParameter("book_cont"));
		dto.setBook_date(multi.getParameter("book_date"));
		dto.setBook_img(book_img);
		dto.setBook_name(multi.getParameter("book_name"));
		dto.setBook_page(Integer.parseInt(multi.getParameter("book_page")));
		dto.setBook_price(Integer.parseInt(multi.getParameter("book_price")));
		dto.setBook_publisher(multi.getParameter("book_publisher"));
		dto.setBook_qty(Integer.parseInt(multi.getParameter("book_qty")));
		dto.setBook_writer(multi.getParameter("book_writer"));
		dto.setCgy_num(multi.getParameter("cgy_num"));
		dto.setBook_writer_cont(multi.getParameter("book_writer_cont"));
		dto.setBook_index(multi.getParameter("book_index"));
		
		BookDAO dao = BookDAO.getInstance();
		check = dao.insertBook(dto);
		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();
		
		if(check>0) {
			forward.setRedirect(false);
			forward.setPath("book_list.do");
		}else {
			out.println("<script>");
			out.println("alert('insert fail')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
		
	}
}
