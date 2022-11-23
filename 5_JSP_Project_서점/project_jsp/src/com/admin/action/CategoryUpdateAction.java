package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.CategoryDAO;
import com.book.model.CategoryDTO;

public class CategoryUpdateAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String cgy_num = request.getParameter("cgy_num");
		CategoryDTO dto = new CategoryDTO();
		CategoryDAO dao = CategoryDAO.getInstance();
		dto = dao.getCategory(cgy_num);
		
		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("admin/category_update.jsp");
		
		return forward;
	}
}
