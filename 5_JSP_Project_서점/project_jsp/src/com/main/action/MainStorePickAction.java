package com.main.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BookDAO;

public class MainStorePickAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		 //jax로 받은 requestType ---------------------------------------------------- 
        String requestType = request.getParameter("requestType");
        
        BookDAO bookDao = BookDAO.getInstance();
        String bookPickStr = bookDao.getPickBooksXML(requestType);
        
        PrintWriter out = response.getWriter();
        out.println(bookPickStr);
		
		return null;
	}

}
