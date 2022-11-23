package com.cart.action;

import com.book.model.CartDAO;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateCountAction", value = "/UpdateCountAction.do")
public class UpdateCountAction extends HttpServlet {

    @Override
    public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        int cnt = Integer.parseInt(request.getParameter("cnt"));
        int num = Integer.parseInt(request.getParameter("num"));

        CartDAO dao = CartDAO.getInstance();

        int check = dao.updateCnt(cnt, num);

        PrintWriter out = response.getWriter();

        out.println(check);
    }
}
