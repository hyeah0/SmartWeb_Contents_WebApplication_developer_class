```
package com.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.BoardDTO;

@WebServlet("/select.do")
public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectServlet() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		BoardDAO dao = BoardDAO.getInstance();
		List<BoardDTO> boardList = dao.getBoard();

		// 묶기
		request.setAttribute("boardList", boardList);

		// 보내기
		RequestDispatcher rd = request.getRequestDispatcher("view/board_select.jsp");
		rd.forward(request, response);
	}

}
```
