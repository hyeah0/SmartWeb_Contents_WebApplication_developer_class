package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.CategoryDAO;
import com.book.model.CategoryDTO;

public class CategorySelectAction implements Action{
		@Override
		public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
			CategoryDAO dao = CategoryDAO.getInstance();
			List<CategoryDTO> list = dao.getCategoryList();
			request.setAttribute("categoryList", list);
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("admin/category_list.jsp");
			
			return forward;
		}

}
