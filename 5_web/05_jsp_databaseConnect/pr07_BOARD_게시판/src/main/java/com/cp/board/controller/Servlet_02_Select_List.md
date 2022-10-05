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

@WebServlet("/select_list.do")
public class Servlet_02_Select_List extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Servlet_02_Select_List() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		int board_no = Integer.valueOf(request.getParameter("no"));
		int select = Integer.valueOf(request.getParameter("selectUp"));

		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO dto = null;
		RequestDispatcher rd = null;

		// 데이터 조회 메서드


		if(select == 0) {
			// 일반 데이터 상세보기일 경우
			// 조회수 하나 상승 메서드
			dao.addHit(board_no);
			dto = dao.getBoardDetail(board_no);

			request.setAttribute("dto", dto);
			rd = request.getRequestDispatcher("view/board_list_detail.jsp");

		}else {
			// 업데이터용 데이터 보기일 경우
			dto = dao.getBoardDetail(board_no);
			request.setAttribute("dto", dto);

			PrintWriter out = response.getWriter();

			rd = request.getRequestDispatcher("view/board_update.jsp");
		}

		rd.forward(request, response);

	}

}
```
