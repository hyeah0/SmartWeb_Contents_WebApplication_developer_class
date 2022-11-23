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

public class MyPageOrderAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession();
        int mem_num = (Integer)session.getAttribute("userNum");

        OrderDAO dao = OrderDAO.getInstance();

        List<OrderDTO> orderDetail = dao.getOrderDetail(mem_num);
        List<OrderDTO> list = dao.getOrderList(mem_num);

        request.setAttribute("orderDetail", orderDetail);
        request.setAttribute("orderCon", list);

        ActionForward forward = new ActionForward();

        forward.setRedirect(false);
        forward.setPath("cart/order_list.jsp");

        return forward;
    }
}
