```
package com.cp.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cp.board.model.BoardDAO;

/**
 * Servlet implementation class Servlet_04_Delete
 */
@WebServlet("/delete.do")
public class Servlet_04_Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Servlet_04_Delete() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		int board_no = Integer.valueOf(request.getParameter("no"));
		BoardDAO dao = BoardDAO.getInstance();

		int result = dao.deleteBoard(board_no);

		PrintWriter out = response.getWriter();
		if(result>0) {
			out.println("<script>");
			out.println("alert('삭제 완료!')");
			out.println("location.href='select.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
}
```
