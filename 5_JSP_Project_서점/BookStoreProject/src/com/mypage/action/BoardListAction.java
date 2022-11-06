package com.mypage.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BoardDAO;
import com.book.model.BoardDTO;
import com.book.model.BookDAO;

public class BoardListAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
        System.out.println("------------------ BoardListAction 클래스");
        HttpSession session = request.getSession();
        int mem_num = (Integer)session.getAttribute("userNum");
        System.out.println("넘어온 mem_num : " + mem_num);
        
   
        /* 페이징 -------------------------------------------------------------------------- */
        // 페이지 변수들
        // -- 설정값 -----------------------------------
            int rowsize = 10;        // 1. 게시물 수
            int block = 3;           // 2. 페이지 그룹(블럭)
            
        // -- 계산값 -----------------------------------
            int page = 0;           // 3. 현재 페이지            (메인에서 넘어간 페이지 : 1 외 나머지 페이지는 현재페이지)
            int totalRecord = 0;    // 4. DB 데이터 전체 count   (DB에서 가져옴)
            int allPage = 0;        // 5. 전체 페이지            (계산식 >> (int) Math.ceil(totalRecord / (double)rowsize); )
            int startNo = 0;        // 6. 포스트 시작 번호         (계산식 >> (page * rowsize) - (rowsize - 1); )
            int endNo = 0;          // 7. 포스트 끝 번호          (계산식 >> (page * rowsize); )
            int startBlock = 0;     // 8. 페이지 시작 블락 번호     (계산식 >> (((page-1) / block) * block) + 1; )
            int endBlock  = 0;      // 9. 페이지 끝 블락 번호       (계산식 >> (((page-1) / block) * block) + block; )
        //
            
        // 현재 페이지 
        if(request.getParameter("page")!=null) {
            page = Integer.valueOf(request.getParameter("page").trim());
        }else {
            page = 1;
        }
        
        // 검색시 넘어온값 -------------------------------------------------------------------- */
        // search_type: 검색 카테고리 번호
        String search_type = request.getParameter("search_type");
        System.out.println("search_type : " + search_type);
        
        // DB 전체 데이터 수 
        BoardDAO boardDao = BoardDAO.getInstance();
        String board_cgy_num = null;
        
        // 검색시에는 데이터 수 다시 집계 -------------------------------------------------------
        if(request.getParameter("search_type")==null || search_type.equals("all")) {
        	search_type = "all";
        	totalRecord = boardDao.getDBCount(mem_num);
        
        }else {
        	board_cgy_num = request.getParameter("search_type");
        	totalRecord = boardDao.getDBCount(mem_num, board_cgy_num);
        }
        
        // 전체 페이지 수 : totalRecord / rowsize __ 나머지값 있을경우 +1
        allPage = (int) Math.ceil(totalRecord/(double)rowsize);
        
        // 포스트 시작 번호, 끝 번호
        startNo = (page * rowsize) - (rowsize - 1);         
        endNo = (page * rowsize);   
        
        // 페이지 시작 블럭, 끝 블럭
        startBlock = (((page-1) / block) * block) + 1;      
        endBlock = (((page-1) / block) * block) + block;    
        
        // 전체페이지 보다 끝 블럭이 큰경우
        if(endBlock > allPage) {
            endBlock = allPage;
        }
        
        // 게시글 카테고리별 검색
        List<BoardDTO> boardCgyList = boardDao.getCgy();
        
        // 게시글 데이터 받아오기
        List<BoardDTO> boardList = null;
        // 게시글 카테고리에 따라 다르게 받아오기
        if(request.getParameter("search_type")==null || search_type.equals("all")) {
        	boardList = boardDao.getBoard(mem_num, page, rowsize);
        
        }else {
        	boardList = boardDao.getBoard(mem_num, board_cgy_num, page, rowsize);
        }
        
        request.setAttribute("search_type", search_type);
        request.setAttribute("boardCgyList", boardCgyList);
        request.setAttribute("boardList", boardList);
        // 페이지 보내주기
        request.setAttribute("rowsize", rowsize);
        request.setAttribute("block", block);
        request.setAttribute("page", page);
        request.setAttribute("totalRecord", totalRecord);
        request.setAttribute("allPage", allPage);
        request.setAttribute("startNo", startNo);
        request.setAttribute("endNo", endNo);
        request.setAttribute("startBlock", startBlock);
        request.setAttribute("endBlock", endBlock);
        
        
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("bookmain/mypage_board_list.jsp");
        
        System.out.println("------------------ BoardListAction 클래스끝!");
        return forward;
    }

}
