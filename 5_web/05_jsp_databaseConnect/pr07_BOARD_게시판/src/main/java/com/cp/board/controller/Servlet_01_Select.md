```
package com.cp.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cp.board.model.BoardDAO;
import com.cp.board.model.BoardDTO;


@WebServlet("/select.do")
public class Servlet_01_Select extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Servlet_01_Select() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// dao 메서드에 자료 저장
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardDTO> boardList = (List<BoardDTO>) dao.getBoard();

		request.setAttribute("boardList", boardList);

		RequestDispatcher rd = request.getRequestDispatcher("view/board_list.jsp");
		rd.forward(request, response);
	}

}
```
