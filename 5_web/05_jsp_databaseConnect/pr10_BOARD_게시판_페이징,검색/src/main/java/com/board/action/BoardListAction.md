```
package com.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.BoardDTO;

public class BoardListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		// 비지니스 로직
		// DB에서 게시글 전체 리스트를 조회하여 view page 로 이동
		// 비지니스 로직 수행시 페이징 처리 작업 동시 진행

		/*
		 *  페이징 처리 작업 진행
		    1. 한페이지당 보여질 게시물의 수
		    2. 아래 보여질 최대 페이지수(페이지블럭)
		    	- [1][2][3][4][5][6] / [7][8][9][10][11][12]
		    3. db상의 게시물의 전체수
		    4. 전체페이지 수 - 전체게시물의 수 / 한페이지당 보여질 게시물의 수
		 */

		// 페이지 변수들
		// -- 설정값 -----------------------------------
			int rowsize = 5;    	// 1. 게시물 수
			int block = 3;  	// 2. 페이지 그룹(블럭)
		// -- 계산값 -----------------------------------
			int page = 0; 		// 3. 현재 페이지		(메인에서 넘어간 페이지 : 1 외 나머지 페이지는 현재페이지)
			int totalRecord = 0; 	// 4. DB 데이터 전체 count 	(DB에서 가져옴)
			int allPage = 0; 	// 5. 전체 페이지 		( (int)Math.ceil(totalRecord / (double)rowsize);)
			int startPostNo	= 0;	// 6. 포스트 시작 번호 	( (page * rowsize) - (rowsize - 1); )
			int endPostNo = 0;	// 7. 포스트 끝 번호 	 	( (page * rowsize); )
			int startBlock = 0; 	// 8. 페이지 시작 블락 번호     ( (((page-1) / block) * block) + 1; )
			int endBlock  = 0;  	// 9. 페이지 끝 블락 번호 	( (((page-1) / block) * block) + block; )
		//

		// 현재 페이지
		if(request.getParameter("page")!=null) {
			page = Integer.valueOf(request.getParameter("page").trim());
		}else {
			page = 1;
		}

		// DB 전체 데이터 수 : db상의 게시물의 전체수 db에서 가져오는 메서드 실행
		BoardDAO dao = BoardDAO.getInstance();
		totalRecord = dao.getBoardCount();

		// 전체 페이지 수 : totalRecord / rowsize __ 나머지값 있을경우 +1
		allPage = (int) Math.ceil(totalRecord/(double)rowsize);

		// 포스트 시작 번호, 끝 번호
		startPostNo = (page * rowsize) - (rowsize - 1);
		endPostNo = (page * rowsize);

		// 페이지 시작 블럭, 끝 블럭
		startBlock = (((page-1) / block) * block) + 1;
		endBlock = (((page-1) / block) * block) + block;

		// 전체페이지 보다 끝 블럭이 큰경우
		if(endBlock > allPage) {
			endBlock = allPage;
		}

		// 현재 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<BoardDTO> pageList = dao.getBoardList(page,rowsize);

		// 페이징 처리시 작업했던 모든 값을 view page로 이동
		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("allPage", allPage);
		request.setAttribute("startPostNo", startPostNo);
		request.setAttribute("endPostNo", endPostNo);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
		request.setAttribute("List", pageList);


	}

}



```
