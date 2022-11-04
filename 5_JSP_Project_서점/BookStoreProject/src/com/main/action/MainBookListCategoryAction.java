package com.main.action;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BookDAO;
import com.book.model.BookDTO;
import com.book.model.CategoryDAO;
import com.book.model.CategoryDTO;

public class MainBookListCategoryAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        System.out.println("-------------MainBookListCategoryAction");
        
        /* uri에서 넘어온 값 ------------------------------------------------------------------ */
        // 상단 nav 리스트 가져오기 & 현재 카테고리 이름
        String nowCgy_num = request.getParameter("category").trim();
        CategoryDAO cgyDao = CategoryDAO.getInstance();
        List<CategoryDTO> cgyList = cgyDao.getCategory();
        
        CategoryDTO nowCgyDto = cgyDao.getNowCgyDto(nowCgy_num);
        String nowCgy_name = nowCgyDto.getCgy_name();
        System.out.println("nowCgy_name : " + nowCgy_name);
        
        // type =1 일경우 메인에서 카테고리 페이지로 이동할 경우 default 책 배열형식 앨범형식 
        // type =2 일경우 카테고리 페이지에서 책 배열형식 리스트형식으로 변경
        int listType = Integer.valueOf(request.getParameter("listType").trim());
        System.out.println("가져온 listType >> " + listType );
        
        // requestType 버튼 클릭(누적판매기준, 최소주문금액, 최신등록순) 
        String requestType = request.getParameter("requestType").trim();
        if(requestType.equals("1")) {
            requestType = "book_sales";
        }
        
        // 검색시 넘어온값 -------------------------------------------------------------------- */
        // search_type: 검색 카테고리 번호
        // search_input : 검색어
        // int search = 0;
        String search_type = request.getParameter("search_type");
        String search_input = request.getParameter("search_input");
        System.out.println("검색 버튼 클릭함! > search_type : " + search_type + ", search_input : " + search_input);
        
        
        /* 페이징 -------------------------------------------------------------------------- */
        // 페이지 변수들
        // -- 설정값 -----------------------------------
            int rowsize = 15;        // 1. 게시물 수
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
        
        // DB 전체 데이터 수 
        BookDAO dao = BookDAO.getInstance();
        
        // 검색시에는 데이터 수 다시 집계 -------------------------------------------------------
        if(request.getParameter("search_input")==null ) {
            totalRecord = dao.getDBCount(nowCgy_num);
            
        } else {
            // 현재 있는 카테고리 페이지와 검색시 다른 카테고리를 선택했다면.
            if(!nowCgy_name.equals(search_type)) {
                
                nowCgyDto = cgyDao.getNowCgyDto(search_type);
                nowCgy_name = nowCgyDto.getCgy_name();
                
                if(search_type.equals("all")) {
                    nowCgy_num = "all";
                }else {
                    nowCgy_num = nowCgyDto.getCgy_num();
                }
            }
            
            totalRecord = dao.getDBCount(search_type, search_input);
        }
        
        // -------------------------------------------------------------------------------
        
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
        
        // 현재 페이지, 받아온 카테고리 번호에 해당하는 데이터 받아오기
        // default = 1년 누적 판매량 기준 sysdate -365
        BookDAO bookDao = BookDAO.getInstance();
        List<BookDTO> bookCgyList = null;
        
        // 검색유무에 따라 변경
        if(request.getParameter("search_input")==null ) {
            bookCgyList = bookDao.getCgyBooks(nowCgy_num, requestType, page, rowsize);  
        
        }else {
            page = 1;
            bookCgyList = bookDao.getCgyBooks(requestType, search_type, search_input , page, rowsize);  
            
           
            
            // search = 1;
            // 검색했을 경우 값 보내주기
            request.setAttribute("search", 1);
            request.setAttribute("search_type", search_type);
            request.setAttribute("search_input", search_input);
            
        }
       
        /* ------------------------------------------------------- */
        
        // 값 보내주기
        request.setAttribute("nowCgy_num", nowCgy_num);
        request.setAttribute("nowCgy_name", nowCgy_name);
        request.setAttribute("listType", listType);
        request.setAttribute("requestType", requestType);
        //request.setAttribute("cgyList", cgyList);
        request.setAttribute("bookCgyList", bookCgyList);
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
        forward.setPath("view/category.jsp");
        
        
        return forward;
    }

}