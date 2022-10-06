```
package com.board.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;
import com.board.model.BoardDTO;

public class BoardSearchAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// 비지니스 로직
		// 검색 폼페이지에서 넘어온 데이터를 가지고 검색
		// 해당하는 게시물들을 db에서 조회 후 view page로 이동

		System.out.println("------------- BoardSearchAction 객체 -------------");

		// 폼페이지에서 넘어온 값
		String search_field = request.getParameter("search_field").trim();
		String search_keyword = request.getParameter("search_keyword").trim();

		System.out.println("------------- BoardSearchAction 객체 / board_list 검색 폼에서 넘어온 값 >>> search_field "+ search_field +" -------------");

		// 페이징 처리를 위한 변수
		int rowsize = 3;		// 1. 한페이지 게시물의 수
		int block = 4;			// 2. 아래 보여질 페이지 블럭(그룹) 수
		int totalRecord = 0;	// 3. db상의 게시물의 전체수
		int allPage = 0;		// 4. 전체페이지 수
		int page = 0; 			// 5. 현재페이지

		if(request.getParameter("page")!=null) {
			page = Integer.valueOf(request.getParameter("page").trim());

		}else {
			page = 1;			// 현재 페이지를 가장 첫 페이지로 지정
		}

		int startNo = (page * rowsize) - (rowsize - 1);			// 포스트 시작 번호
		int endNo = (page * rowsize);							// 포스트 끝 	번호

		int startBlock = (((page-1) / block) * block) + 1;		// 페이지 시작 블럭
		int endBlock = (((page-1) / block) * block) + block;	// 페이지 끝 	블럭

		// dao 객체 생성
		BoardDAO dao = BoardDAO.getInstance();

		// db상의 검색 게시물의 수를 확인 하는 메서드 호출
		totalRecord = dao.searchListCount(search_field,search_keyword);

		System.out.println("------------- BoardSearchAction 객체 / 검색값에 따른 게시물 수 확인 메서드 완료  -------------");

		// 전체 페이지 수 : 전체 게시물 수 /한 페이지당 보여질 게시물수
		// 나머지 값이 있을 경우 +1 페이지 실행
		allPage = (int) Math.ceil(totalRecord / (double)rowsize);


		// 전체페이지 보다 끝 블럭이 큰경우
		if(endBlock > allPage) {
			endBlock = allPage;
		}

		// 현재 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<BoardDTO> searchList = dao.searchBoardList(search_field, search_keyword, page, rowsize);

		System.out.println("------------- BoardSearchAction 객체 / 검색값에 따른 게시물 가져오는 메서드 완료  -------------");

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

		request.setAttribute("searchList", searchList);
		request.setAttribute("searchField", search_field);
		request.setAttribute("searchKeyword", search_keyword);



	}
}

```
