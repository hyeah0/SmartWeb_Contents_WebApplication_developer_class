package com.mypage.action;

import java.io.IOException;
import java.util.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BoardDAO;
import com.book.model.BoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardInsertOkAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
        HttpSession session = request.getSession();
        MultipartRequest multi = null;
        
        // 로그인시 세션으로 받아온 회원 번호
        int mem_num = (Integer)session.getAttribute("mem_num");

        // 파일 경로 지정
        String saveFolder = request.getServletContext().getRealPath("/boardUpload");
        int fileSize = 10 * 1024 * 1024; //10mb
        multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
        
        // 폼페이지에서 받아온 데이터 db에 저장
        String board_cgy_num = multi.getParameter("board_cgy_num").trim();
        String board_title = multi.getParameter("board_title").trim();
        String board_cont = multi.getParameter("board_cont").trim();
        
        // 첨부파일이 존재하는 경우 파일이름 변경
        // 일자 + 문의카테고리번호 + 게시글 번호 + 회원번호
        // 일자
        // Date now = new Date();
         LocalDateTime now = LocalDateTime.now();
         DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss");
         String formatedNow = now.format(formatter);
         System.out.println("foramtedNow : " + formatedNow);
        
         // 게시글 번호
         BoardDAO boardDao = BoardDAO.getInstance();
         int result = boardDao.getBoardNum();
         int board_num = result+1;

        BoardDTO boardDto = new BoardDTO();
        boardDto.setMem_num(mem_num);
        boardDto.setBoard_num(board_num);
        boardDto.setBoard_cgy_num(board_cgy_num);
        boardDto.setBoard_title(board_title);
        boardDto.setBoard_cont(board_cont);
        boardDto.setBoard_date(formatedNow);
        if(multi.getFile("board_image")!=null) {
            File upload_file = multi.getFile("board_image");
            boardDto.setBoard_image(upload_file.getName());
        }
        
        // 등록 확인 메서드
        int insertRs = boardDao.insertBoard(boardDto);
        
        ActionForward forward = new ActionForward();
        if(insertRs > 0) {
            System.out.println("문의글 작성 완료!");
            forward.setRedirect(true);
            forward.setPath("mypage_board_cont.do?board_num="+board_num);
            
        }else {
            System.out.println("문의글 작성 실패!");
        }
        
        
        return forward;
    }

}
