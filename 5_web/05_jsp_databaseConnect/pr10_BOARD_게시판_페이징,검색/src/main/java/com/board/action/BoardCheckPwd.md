```
package com.board.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.BoardDTO;

public class BoardCheckPwd implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		System.out.println("------------- BoardCheckPwd 객체 -------------");
		// 게시글 번호 가져오기
		int no = Integer.valueOf(request.getParameter("no"));
		int page = Integer.valueOf(request.getParameter("page"));

		// 게시물 확인 1 / 수정일경우 2 / 삭제일경우 3
		int type = Integer.valueOf(request.getParameter("type"));

		// dao 메서드 게시글 수정 메서드 실행
		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO dto = dao.checkPwd(no);

		System.out.println("------------- checkPwd 메서드 실행 완료 후 -------------");

		// 자료 묶어서 보내기
		request.setAttribute("no", no);
		request.setAttribute("content", dto);
		request.setAttribute("currentpage", page);
		request.setAttribute("requesttype", type);

	}

}
```
