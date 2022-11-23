package com.cart.action;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.OrderDAO;
import com.book.model.OrderDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class OrderCompleteAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession();
        int mem_num = (Integer)session.getAttribute("userNum");

        int total = Integer.parseInt(request.getParameter("total"));
        request.setAttribute("total", total);


        OrderDAO orderDAO = OrderDAO.getInstance();

        List<OrderDTO> list = orderDAO.getOrderList(mem_num);

        request.setAttribute("order", list);

        ActionForward forward = new ActionForward();

        forward.setRedirect(false);
        forward.setPath("cart/order_complete.jsp");

        return forward;
    }
}
