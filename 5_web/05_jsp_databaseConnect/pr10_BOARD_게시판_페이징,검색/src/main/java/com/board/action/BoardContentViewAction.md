```
package com.board.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.BoardDTO;

public class BoardContentViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// 비지니스 로직
		// get 방식으로 넘어온 게시글 번호의 상세 데이터를 가져온다.

		// 게시글 번호 가져오기
		int no = Integer.valueOf(request.getParameter("no"));
		int page = Integer.valueOf(request.getParameter("page"));

		// dao 메서드 게시글 수정 메서드 실행
		BoardDAO dao = BoardDAO.getInstance();

		// 조회수 증가 메서드 호출
		dao.getBoardHit(no);
		System.out.println("조회수 증가 메서드 호출 완료!");

		// 상세 보기
		BoardDTO dto = dao.getBoardContent(no);
		System.out.println("상세 보기 메서드 호출 완료!");

		// 자료 묶어서 보내기
		request.setAttribute("content", dto);
		request.setAttribute("nowpage", page);

	}

}
```
