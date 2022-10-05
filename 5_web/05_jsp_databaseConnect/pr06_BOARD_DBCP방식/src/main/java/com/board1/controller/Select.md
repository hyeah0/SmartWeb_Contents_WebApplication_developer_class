```
package com.board1.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.border.Border;

import com.board1.model.BoardDAO;
import com.board1.model.BoardDTO;

@WebServlet("/select.do")
public class Select extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Select() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		BoardDAO dao = BoardDAO.getInstance();
		List<BoardDTO> list = dao.getBoardList();

		request.setAttribute("list", list);

		RequestDispatcher rd = request.getRequestDispatcher("view/board_list.jsp");
		rd.forward(request, response);
	}

}
```
