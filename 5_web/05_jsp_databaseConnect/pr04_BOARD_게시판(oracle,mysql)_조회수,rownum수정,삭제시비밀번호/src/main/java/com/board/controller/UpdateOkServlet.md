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

@WebServlet("/update_ok.do")
public class UpdateOkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateOkServlet() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 비지니스 로직
		// 수정 폼 페이지에서 넘어온 정보들을 db에 저장

		// 한글 인코딩 (폼에서 데이터가 넘어올때)
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		// get 방식으로 가져온 글번호
		int board_no = Integer.parseInt(request.getParameter("no"));

		String board_writer = request.getParameter("writer");
		String board_title = request.getParameter("title");
		String board_cont = request.getParameter("content");
		String board_pwd = request.getParameter("pwd");

		BoardDTO dto = new BoardDTO();
		dto.setBoard_no(board_no);
		dto.setBoard_writer(board_writer);
		dto.setBoard_title(board_title);
		dto.setBoard_cont(board_cont);
		dto.setBoard_pwd(board_pwd);

		// dao에 있는 메서드로 데이터 베이스 수정
		BoardDAO dao = BoardDAO.getInstance();
		int result = dao.updateBoard(dto);

		PrintWriter out = response.getWriter();
		if(result > 0 ) {
			out.println("<script>");
			out.println("alert('게시글 수정 완료!')");
			out.println("location.href='board_content.do?no=" + dto.getBoard_no() + "'");
			out.println("</script>");
		}else if(result == -1 ) {
			out.println("<script>");
			out.println("alert('비밀번호가 틀렸습니다.!')");
			out.println("history.back()");
			out.println("</script>");
		}else{
			out.println("<script>");
			out.println("alert('게시글 수정 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}




	}

}
```
