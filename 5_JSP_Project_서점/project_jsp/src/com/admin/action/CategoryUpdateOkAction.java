package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.CategoryDAO;
import com.book.model.CategoryDTO;

public class CategoryUpdateOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String cgy_num = request.getParameter("cgy_num");
		CategoryDTO dto = new CategoryDTO();
		dto.setCgy_num(request.getParameter("cgy_num_update"));
		dto.setCgy_name(request.getParameter("cgy_name_update"));
		System.out.println("cgy_num : "+request.getParameter("cgy_num_update"));
		System.out.println("cgy_name : "+request.getParameter("cgy_name_update"));
		
		CategoryDAO dao = CategoryDAO.getInstance();
		int check = dao.updateCategory(cgy_num,dto);
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(check>0) {
			forward.setRedirect(false);
			forward.setPath("category_list.do");
		}else {
			out.println("<script>");
			out.println("alert('update fail')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}
}
