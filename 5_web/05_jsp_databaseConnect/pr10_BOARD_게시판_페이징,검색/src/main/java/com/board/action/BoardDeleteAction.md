```
package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;

public class BoardDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// 비지니스 로직
		// get 방식으로 넘어온 회원번호의 데이터 삭제

		System.out.println("------------- BoardDeleteAction 객체 -------------");
		int no = Integer.valueOf(request.getParameter("no"));
		int page = Integer.valueOf(request.getParameter("page"));

		System.out.println("------------- BoardDeleteAction 객체로 넘어온 no >> "+ no +" -------------");

		// dao 메서드 실행
		BoardDAO dao = BoardDAO.getInstance();

		// 삭제 진행
		int result = dao.deleteBoard(no);

		// 게시물 번호 수정
		dao.updateBoardNo(no);

		PrintWriter out = response.getWriter();
		if(result>0) {
			out.println("<script>");
			out.println("alert('게시글 삭제 완료!')");
			out.println("location.href='board_list.do?page="+ page +"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시글 삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

}
```
