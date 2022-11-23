package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.OrderDAO;
import com.book.model.OrderDTO;

public class MemberOrderContentAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int order_num = Integer.parseInt(request.getParameter("order_num"));
		OrderDTO dto = null;
		OrderDAO dao = OrderDAO.getInstance();
		dto = dao.adminGetOrder(order_num);
		request.setAttribute("orderDTO", dto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("admin/member_order_content.jsp");

		return forward;
	}
}
