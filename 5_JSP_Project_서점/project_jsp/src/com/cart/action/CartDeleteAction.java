package com.cart.action;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.CartDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class CartDeleteAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        int cart_num = Integer.parseInt(request.getParameter("num").trim());

        CartDAO dao = CartDAO.getInstance();

        int check = dao.deleteCart(cart_num);

        ActionForward forward = new ActionForward();

        PrintWriter out = response.getWriter();

        if (check > 0) {
            forward.setRedirect(true);
            forward.setPath("cart_list.do");
        } else {
            out.println("<script>");
            out.println("alert('장바구니 삭제 실패')");
            out.println("history.back()");
            out.println("</script>");
        }

        return forward;
    }
}
