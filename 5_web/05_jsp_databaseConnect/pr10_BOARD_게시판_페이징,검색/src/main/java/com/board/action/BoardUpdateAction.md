```
package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.BoardDTO;
import com.mysql.cj.jdbc.ha.BestResponseTimeBalanceStrategy;

public class BoardUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		System.out.println("------------- BoardUpdateAction 객체 -------------");

		// uri 에서 no, page, type 가져오기
		int no = Integer.valueOf(request.getParameter("no"));
		int page = Integer.valueOf(request.getParameter("page"));
		int type = Integer.valueOf(request.getParameter("type"));

		// form 에서 받아온값
		String update_title = request.getParameter("input_title");
		String update_cont = request.getParameter("input_cont");

		// dto에 저장
		BoardDTO dto = new BoardDTO();
		dto.setBoard_no(no);
		dto.setBoard_title(update_title);
		dto.setBoard_cont(update_cont);

		// dao 메서드 실행
		BoardDAO dao = BoardDAO.getInstance();
		int result = dao.updateBoard(dto);

		PrintWriter out = response.getWriter();

		if(result>0) {
			out.println("<script>");
			out.println("alert('수정 완료!')");
			out.println("location.href='board_content.do?no="+ no + "&page=" + page +"&type=4"+ "'");
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
