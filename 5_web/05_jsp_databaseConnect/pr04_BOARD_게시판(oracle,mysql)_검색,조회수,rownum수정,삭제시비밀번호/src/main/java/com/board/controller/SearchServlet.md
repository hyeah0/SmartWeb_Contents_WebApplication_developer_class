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

@WebServlet("/search.do")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SearchServlet() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 비지니스 로직
		// 검색 폼 창에서 넘어온 검색어를 가지고 db에서
		// 검색어에 해당하는 모든 게시물을 가져와서 view page로 이동

		// 한글 인코딩
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		String find_field = request.getParameter("find_field").trim();
		String find_keyword = request.getParameter("find_keyword").trim();

		BoardDAO dao = BoardDAO.getInstance();
		List<BoardDTO> searchList = dao.searchBoard(find_field, find_keyword);

		request.setAttribute("searchList", searchList);

		RequestDispatcher rd = request.getRequestDispatcher("view/board_searchList.jsp");
		rd.forward(request, response);
	}

}
```
