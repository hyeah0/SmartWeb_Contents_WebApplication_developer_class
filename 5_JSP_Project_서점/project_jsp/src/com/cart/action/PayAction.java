package com.cart.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BookDTO;
import com.book.model.CartDAO;
import com.book.model.CartDTO;
import com.book.model.MemberDTO;

public class PayAction implements Action {
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
		
		int mem_num = (Integer) session.getAttribute("userNum");
		int book_num = Integer.parseInt(request.getParameter("book_num"));

		int order_qty = Integer.parseInt(request.getParameter("order_qty"));
		System.out.println("order_qty는? >> " + order_qty);

		CartDAO dao = CartDAO.getInstance();

		MemberDTO dto = dao.getMemberInfo(mem_num);

		request.setAttribute("dto", dto);

		List<CartDTO> payList = new ArrayList<CartDTO>();
		CartDTO tempCart = new CartDTO();
		tempCart.setCart_qty(order_qty);
		payList.add(tempCart);
		
		List<BookDTO> bookPayList = new ArrayList<BookDTO>();
		BookDTO tempBook = dao.getBook(book_num);
		bookPayList.add(tempBook);
		
		request.setAttribute("payList", payList);
		request.setAttribute("bookPayList", bookPayList);

		ActionForward forward = new ActionForward();

		forward.setRedirect(false);
		forward.setPath("cart/pay.jsp");

		return forward;
	}
}
