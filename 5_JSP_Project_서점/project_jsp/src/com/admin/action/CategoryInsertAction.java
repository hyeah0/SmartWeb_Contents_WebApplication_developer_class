package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.CategoryDAO;
import com.book.model.CategoryDTO;

public class CategoryInsertAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		CategoryDTO dto = new CategoryDTO();
		dto.setCgy_num(request.getParameter("cgy_num"));
		dto.setCgy_name(request.getParameter("cgy_name"));
		
		CategoryDAO dao = CategoryDAO.getInstance();
		int result = dao.insertCategory(dto);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			forward.setRedirect(false);
			forward.setPath("category_list.do");
		}else {
			out.println("<script>");
			out.println("alert('insert fail')");
			out.println("history.back()");
			out.println("</script>");	
		}
		
		return forward;
	}
}
