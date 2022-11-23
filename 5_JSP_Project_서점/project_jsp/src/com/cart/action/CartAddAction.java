package com.cart.action;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.CartDAO;
import com.book.model.CartDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class CartAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();

		if(session.getAttribute("userNum") == null) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인을 해주세요')");
			out.println("history.back()");
			out.println("</script>");
			return null;
		}

		int mem_num = (Integer)session.getAttribute("userNum");

		int book_num = Integer.parseInt(request.getParameter("book_num").trim());
		int cart_qty = Integer.parseInt(request.getParameter("cart_qty").trim());

		System.out.println("cart_qty는? >> " + cart_qty);
		CartDAO dao = CartDAO.getInstance();

		int check = dao.countUpdate(book_num, mem_num, cart_qty);

		if (check != 1) {
			dao.insertCart(book_num, mem_num, cart_qty);
		}

		ActionForward forward = new ActionForward();

		forward.setRedirect(true);
		forward.setPath("cart_list.do");

		return forward;
	}
}