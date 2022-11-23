package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.OrderDAO;

public class MemberOrderDeleteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int order_num = Integer.parseInt(request.getParameter("order_num"));
		int book_price = Integer.parseInt(request.getParameter("book_price"))/100;
		OrderDAO dao = OrderDAO.getInstance();
		int check = dao.orderDelete(order_num,book_price);
		
		ActionForward forward = null;
		PrintWriter out = response.getWriter();
		if(check > 0) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("member_list.do");
		}else {
			out.println("<script>");
			out.println("alert('delete fail')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}
}
