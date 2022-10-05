```
package com.cp.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cp.board.model.BoardDAO;
import com.cp.board.model.BoardDTO;

@WebServlet("/update.do")
public class Servlet_03_Update extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public Servlet_03_Update() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		int board_no = Integer.valueOf(request.getParameter("no"));
		String board_title = request.getParameter("title");
		String board_cont = request.getParameter("cont");

		BoardDAO dao = BoardDAO.getInstance();

		int result = dao.updateBoard(board_no, board_title, board_cont);

		PrintWriter out = response.getWriter();
		if(result>0) {
			out.println("<script>");
			out.println("alert('수정 완료!')");
			out.println("location.href='select_list.do?selectUp=0&no=" + board_no + "'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('수정 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

}
```
