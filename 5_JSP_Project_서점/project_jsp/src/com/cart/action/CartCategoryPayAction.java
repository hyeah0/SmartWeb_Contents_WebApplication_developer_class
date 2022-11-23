package com.cart.action;

import java.io.IOException;
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

public class CartCategoryPayAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		int mem_num = (Integer) session.getAttribute("userNum");

		StringBuilder str = new StringBuilder();

		// 체크된 체크박스에 해당하는 cart_num 받아오기
		String[] checkList = request.getParameterValues("buy");
		for (int i = 0; i < checkList.length; i++) {
			if (i == checkList.length - 1) {
				str.append(checkList[i]);
			} else {
				str.append(checkList[i]).append(",");
			}
		}

		List<Integer> list = new ArrayList<>();

		for (String item : checkList) {
			list.add(Integer.parseInt(item));
			System.out.println("item >> " + Integer.parseInt(item));
		}

		CartDAO dao = CartDAO.getInstance();

		MemberDTO dto = dao.getMemberInfo(mem_num);

		request.setAttribute("dto", dto);

		List<CartDTO> payList = dao.getPayList(mem_num, list);
		List<BookDTO> bookPayList = dao.getBookPayList(mem_num, list);

		request.setAttribute("payList", payList);
		request.setAttribute("bookPayList", bookPayList);

		ActionForward forward = new ActionForward();

		forward.setRedirect(false);
		forward.setPath("cart/pay.jsp");

		return forward;
	}
}
