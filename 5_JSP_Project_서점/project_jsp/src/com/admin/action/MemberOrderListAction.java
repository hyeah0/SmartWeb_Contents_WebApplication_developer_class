package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.OrderDAO;
import com.book.model.OrderDTO;

public class MemberOrderListAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int mem_num = Integer.parseInt(request.getParameter("mem_num"));
		
		List<OrderDTO> list = null;
		OrderDAO dao = OrderDAO.getInstance();
		
		list = dao.adminGetOrderList(mem_num);
		
		request.setAttribute("orderList", list);
		ActionForward forward = new ActionForward();
		forward.setPath("admin/member_order_list.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
