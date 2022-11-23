package com.cart.action;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BookDTO;
import com.book.model.CartDAO;
import com.book.model.CartDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class CartListAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession();
        int mem_num = (Integer)session.getAttribute("userNum");

        CartDAO dao = CartDAO.getInstance();

        List<BookDTO> bookList = dao.getBookList(mem_num);
        List<CartDTO> cartList = dao.getCartList(mem_num);
        int total = dao.getCartSum(mem_num);

        request.setAttribute("bookList", bookList);
        request.setAttribute("cartList", cartList);
        request.setAttribute("total", total);

        ActionForward forward = new ActionForward();

        forward.setRedirect(false);
        forward.setPath("cart/cart.jsp");

        return forward;
    }
}
