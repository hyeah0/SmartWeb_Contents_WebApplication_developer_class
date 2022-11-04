package com.mypage.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BoardDAO;
import com.book.model.BoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardUpdateAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
       
        System.out.println("------------------ BoardUpdateAction 클래스");
        HttpSession session = request.getSession();
        int mem_num = (Integer)session.getAttribute("mem_num");
        System.out.println("넘어온 mem_num : " + mem_num);
        
        // 파일 경로 지정
        String saveFolder = request.getServletContext().getRealPath("/boardUpload");
        int fileSize = 10 * 1024 * 1024; //10mb
        MultipartRequest multi = null;
        multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
        
        // 게시물 번호 + 수정 내용
        int board_num = Integer.valueOf(multi.getParameter("board_num")); 
        String board_title = multi.getParameter("board_title");
        String board_cont = multi.getParameter("board_cont");
        
        BoardDTO boardDto = new BoardDTO();
        boardDto.setBoard_num(board_num);
        boardDto.setBoard_title(board_title);
        boardDto.setBoard_cont(board_cont);
        boardDto.setMem_num(mem_num);
        System.out.println("board_img");
        
        if(multi.getFile("board_newimage")!=null) {
            // 변경 이미지
            File upload_file = multi.getFile("board_newimage");
            boardDto.setBoard_image(upload_file.getName());
        }else {
            // 전 이미지
           boardDto.setBoard_image(request.getParameter("board_beimage")); 
        }
        
        BoardDAO boardDao = BoardDAO.getInstance();
        int result = boardDao.updateBoard(boardDto);
        
        // 업데이트 확인 메서드
        ActionForward forward = new ActionForward();
        if(result > 0) {
            System.out.println("문의글 수정 완료!");
            forward.setRedirect(true);
            forward.setPath("mypage_board_cont.do?board_num="+board_num);
            
        }else {
            System.out.println("문의글 수정 실패!");
        }
        
        
        return forward;
    }

}
