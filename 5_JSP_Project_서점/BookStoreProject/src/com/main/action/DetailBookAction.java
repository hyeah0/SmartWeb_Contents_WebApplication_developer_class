package com.main.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;

public class DetailBookAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // get방식으로 받아온 book num
        int book_num = Integer.valueOf(request.getParameter("book_num")); 
        System.out.println("book_num >>> " + book_num);
        
        
        return null;
    }

}
