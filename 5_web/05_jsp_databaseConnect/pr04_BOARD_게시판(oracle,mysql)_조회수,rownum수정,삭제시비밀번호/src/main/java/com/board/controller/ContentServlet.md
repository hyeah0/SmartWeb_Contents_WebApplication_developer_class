```
package com.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.BoardDTO;

@WebServlet("/board_content.do")
public class ContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public ContentServlet() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 한글 인코딩
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		// url 에서 가져온 글번호
		int board_no = Integer.valueOf(request.getParameter("no"));

		BoardDAO dao = BoardDAO.getInstance();

		// 조회수 증가 메서드
		dao.boardHit(board_no);

		// url 가져온 글번호 기준 dao 메서드로 데이터 가져오기

		BoardDTO detailContent = dao.getDetailContent(board_no);

		// 가져온 데이터 묶기
		request.setAttribute("detailContent", detailContent);

		// 데이터 보내기
		RequestDispatcher rd = request.getRequestDispatcher("view/board_detail.jsp");
		rd.forward(request, response);
	}

}
```
