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

public class BookUpdateOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String savePath = request.getServletContext().getRealPath("book_cover");
		int size = 10*1024*1024;
		int check = 0;
		MultipartRequest multi = new MultipartRequest(request, savePath,size,"UTF-8");
		String book_img = multi.getFilesystemName("book_img");
		
		if(book_img == null) {
			book_img = multi.getParameter("book_old_img");
			System.out.println(book_img);
		}
		//수정 내용 DTO에 담기
		BookDTO dto = new BookDTO();
		dto.setBook_num(Integer.parseInt(multi.getParameter("book_num")));
		dto.setBook_cont(multi.getParameter("book_cont"));
		dto.setBook_date(multi.getParameter("book_date"));
		dto.setBook_img(book_img);
		dto.setBook_name(multi.getParameter("book_name"));
		dto.setBook_page(Integer.parseInt(multi.getParameter("book_page")));
		dto.setBook_price(Integer.parseInt(multi.getParameter("book_price")));
		dto.setBook_publisher(multi.getParameter("book_publisher"));
		dto.setBook_qty(Integer.parseInt(multi.getParameter("book_qty")));
		dto.setBook_sales(Integer.parseInt(multi.getParameter("book_sales")));
		dto.setBook_writer(multi.getParameter("book_writer"));
		dto.setCgy_num(multi.getParameter("cgy_num"));
		dto.setBook_writer_cont(multi.getParameter("book_writer_cont"));
		dto.setBook_index(multi.getParameter("book_index"));
		BookDAO dao = BookDAO.getInstance();
		
		check = dao.updateBook(dto);
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			if(!book_img.equals(multi.getParameter("book_old_img"))) {
				//원래 있던 이미지 삭제
				String old_img = multi.getParameter("book_old_img");
				String deletePath = request.getServletContext().getRealPath("book_cover");
				File file = new File(deletePath+"/"+old_img);
				System.out.println("파일 삭제 경로 : " + deletePath+"/"+old_img);
				System.out.println("파일 삭제 유무 : " + file.delete());	
			}
			forward.setRedirect(false);
			forward.setPath("book_list.do");
		}else {
			if(!book_img.equals(multi.getParameter("book_old_img"))) {
				//새로운 이미지 삭제
				String deletePath = request.getServletContext().getRealPath("book_cover");
				File file = new File(deletePath+"/"+book_img);
				System.out.println("파일 삭제 경로 : " + deletePath+"/"+book_img);
				System.out.println("파일 삭제 유무 : " + file.delete());	
			}
			out.println("<script>");
			out.println("alert('update fail')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}
}
