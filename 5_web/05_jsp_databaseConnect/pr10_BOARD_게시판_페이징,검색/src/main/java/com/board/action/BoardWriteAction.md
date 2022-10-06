```
package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.BoardDTO;

public class BoardWriteAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// 비지니스 로직
		// 폼에서 값을 받아 dao 메서드 실행후 자료를 넘겨준다.

		// 1. 입력값 받아오기
		String input_writer = request.getParameter("input_writer").trim();
		String input_title = request.getParameter("input_title").trim();
		String input_cont = request.getParameter("input_cont").trim();
		String input_pwd = request.getParameter("input_pwd").trim();

		// 2. dto 객체에 저장
		BoardDTO dto = new BoardDTO();
		dto.setBoard_writer(input_writer);
		dto.setBoard_title(input_title);
		dto.setBoard_cont(input_cont);
		dto.setBoard_pwd(input_pwd);

		// dao 메서드 실행
		BoardDAO dao = BoardDAO.getInstance();
		int result = dao.insertBoard(dto);

		PrintWriter out = response.getWriter();
		if(result>0) {
			out.println("<script>");
			out.println("alert('게시글 추가 성공!')");
			out.println("location.href='board_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시글 추가 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
}
```
