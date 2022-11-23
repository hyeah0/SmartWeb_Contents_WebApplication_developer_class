package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.CategoryDAO;
import com.book.model.CategoryDTO;

public class CategoryDeleteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String cgy_num = request.getParameter("cgy_num");
		System.out.println(cgy_num);
		CategoryDAO dao = CategoryDAO.getInstance();
		int result = dao.deleteCategory(cgy_num);
		
		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();

		if(result > 0) {
			forward.setRedirect(false);
			forward.setPath("category_list.do");

		}else {
			out.println("<script>");
			out.println("alert('delete fail')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}
}
