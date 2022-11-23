package com.cart.action;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.CartDAO;
import com.book.model.OrderDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class CartPayOkAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String mem_card_num = request.getParameter("mem_card_num").trim();
        int mem_card_pwd = Integer.parseInt(request.getParameter("mem_card_pwd").trim());

        HttpSession session = request.getSession();
        int mem_num = (Integer)session.getAttribute("userNum");

        int total = Integer.parseInt(request.getParameter("total"));
        double mileage = total * 0.01;

        String[] buyList = request.getParameterValues("buy");
        int[] tempList = new int[buyList.length];

        for (int i = 0; i < buyList.length; i++) {
            tempList[i] = Integer.parseInt(buyList[i]);
        }

        StringBuilder str1 = new StringBuilder();

        String[] bookNumList = request.getParameterValues("bookNum");

        for (int i = 0; i < bookNumList.length; i++) {
            if (i == bookNumList.length - 1) {
                str1.append(bookNumList[i]);
            }else {
                str1.append(bookNumList[i]).append(",");
            }
        }

        List<Integer> numList = new ArrayList<>();

        for (String bookNum : bookNumList) {
            numList.add(Integer.parseInt(bookNum));
            System.out.println("book_num >> " + Integer.parseInt(bookNum));
        }

        StringBuilder str2 = new StringBuilder();

        String[] countList = request.getParameterValues("count");

        for (int i = 0; i < countList.length; i++) {
            if (i == countList.length - 1) {
                str2.append(countList[i]);
            }else {
                str2.append(countList[i]).append(",");
            }
        }

        List<Integer> qtyList = new ArrayList<>();

        for (String count : countList) {
            qtyList.add(Integer.parseInt(count));
            System.out.println("count >> " + Integer.parseInt(count));
        }

        CartDAO cartDAO = CartDAO.getInstance();

        OrderDAO orderDAO = OrderDAO.getInstance();

        // 카드번호/비밀번호 확인
        int check = cartDAO.cardCheck(mem_card_num, mem_card_pwd, mem_num);

        ActionForward forward = new ActionForward();

        PrintWriter out = response.getWriter();

        if(check > 0) {
            cartDAO.updateMileage(mem_num, mileage);
            cartDAO.deletePaidItem(mem_num, tempList);
            for (int i = 0; i < numList.size(); i++) {
                orderDAO.insertOrder(numList.get(i), mem_num, qtyList.get(i));
            }
            forward.setRedirect(false);
            forward.setPath("order_complete.do");

        }else if(check == -1) {
            // 카드 비밀번호가 틀린 경우
            out.println("<script>");
            out.println("alert('카드 비밀번호가 틀립니다.')");
            out.println("history.back()");
            out.println("</script>");
        }else {
            // 카드가 등록되지 않았거나 카드번호가 틀린 경우
            out.println("<script>");
            out.println("alert('등록되지 않은 카드입니다.')");
            out.println("history.back()");
            out.println("</script>");
        }

        return forward;
    }
}
