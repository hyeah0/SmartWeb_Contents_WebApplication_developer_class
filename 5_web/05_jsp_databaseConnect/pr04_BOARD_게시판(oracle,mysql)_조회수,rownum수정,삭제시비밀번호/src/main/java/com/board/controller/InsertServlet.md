```
package com.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.BoardDTO;

@WebServlet("/insert.do")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertServlet() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 비지니스 로직
		// 게시글 폼페이지에서 넘어온 정보들을 db에 저장하는 비지니스 로직

		// 1. 한글 인코딩
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		// 2. 폼페이지에서 데이터 받아오기
		String board_writer = request.getParameter("board_writer").trim();
		String board_title = request.getParameter("board_title").trim();
		String board_cont = request.getParameter("board_cont").trim();
		String board_pwd = request.getParameter("board_pwd").trim();

		// 3. dto 객체에 폼페이지에서 데이터 받은 변수에 넣는다.
		BoardDTO dto = new BoardDTO();
		dto.setBoard_writer(board_writer);
		dto.setBoard_title(board_title);
		dto.setBoard_cont(board_cont);
		dto.setBoard_pwd(board_pwd);

		// 4. dto 객체를 db에 전송
		BoardDAO dao = BoardDAO.getInstance();
		int result = dao.insertBoard(dto);

		PrintWriter out = response.getWriter();
		if(result>0) {
			out.println("<script>");
			out.println("alert('게시글 작성 완료!')");
			out.println("location.href='select.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시글 작성 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

}
```
