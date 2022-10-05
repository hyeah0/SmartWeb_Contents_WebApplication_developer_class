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

		int rowsize = 3;		// 1. 한페이지 게시물의 수
		int block = 3;			// 2. 아래 보여질 페이지 블럭(그룹) 수
		int totalRecord = 0;	// 3. db상의 게시물의 전체수
		int allPage = 0;		// 4. 전체페이지 수
		int page = 0; 			// 5. 현재페이지

		if(request.getParameter("page")!=null) {
			page = Integer.valueOf(request.getParameter("page").trim());

		}else {
			// main.jsp "전체 게시물 목록" a 태그 클릭한 경우_가장 첫페이지
			page = 1;
		}

		// 포스트 시작 번호
		// 포스트 끝 	번호
		int startNo = (page * rowsize) - (rowsize - 1);
		int endNo = (page * rowsize);

		// 페이지 시작 블럭
		// 페이지 끝 	블럭
		int startBlock = (((page-1) / block) * block) + 1;
		int endBlock = (((page-1) / block) * block) + block;

		// db 게시글 수 : db상의 게시물의 전체수 db에서 가져오는 메서드 실행
		BoardDAO dao = BoardDAO.getInstance();
		totalRecord = dao.getBoardCount();

		// 전체 페이지 수 : 전체 게시물 수 /한 페이지당 보여질 게시물수
		// 나머지 값이 있을 경우 +1 페이지 실행
		allPage = (int) Math.ceil(totalRecord / (double)rowsize);

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
		request.setAttribute("startNo", startNo);
		request.setAttribute("endNo", endNo);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
		request.setAttribute("List", pageList);

	}

}



/*
 * 유데미 자바스크립트 참고 (newsPage_useAPI main.js)
 * // total_pages  총 몇페이지
    // page  현재 페이지
    // page group  몇 번째 그룹에 있는지
    // last page 마지막 페이지
    // first page 첫번쨰 페이지
    // first to last print 첫번째 페이지 부터 마지막 페이지 까지 프린트

    // total page 3 일 경우 3개의 페이지만 프린트 하는법
    // << >> 버튼 만들기, 버튼을 누르면 맨처음, 맨 끝으로 가기 done
    // 내가 그룹 1 일때 << 버튼이 없어짐 done
    // 내가 마지막 그룹 일때 >> 버튼이 없다 done

    let pageGroup = Math.ceil(page/5)
    let lastPage = pageGroup*5
    let firstPage = lastPage-4
 */
```
