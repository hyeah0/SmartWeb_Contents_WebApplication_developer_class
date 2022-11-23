package com.mypage.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BookDAO;
import com.book.model.CategoryDAO;
import com.book.model.CategoryDTO;
import com.book.model.MemberDAO;
import com.book.model.MemberDTO;


public class MemberPwdCkAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 화면에서 아이디와 작성한 비밀번호를 가져와 db에서 비교후 
        // 비밀번호가 맞다면 수정 페이지로 이동
        
        // 회원번호 & 비밀번호 저장
        // 회원번호 로그인시 세션설정 한 거로 받아오기
        HttpSession session = request.getSession();
        int mem_num = (Integer)session.getAttribute("userNum");
        String input_pwd = request.getParameter("input_pwd");
        
        int result = 0;
        
        MemberDAO memDao = MemberDAO.getInstance();
        MemberDTO memDto = null;
        
        ActionForward forward = null;
        PrintWriter out = response.getWriter();
        
        // 회원정보 관리 페이지(비밀번호 확인)로 처음 이동  result == null
        if(request.getParameter("result") == null) {
            result = 0;
        
        }else {
            result = Integer.valueOf(request.getParameter("result"));
        }
          
        if(result == 0) {
            // 회원정보 관리 페이지(비밀번호 확인)로 처음 이동
        	result = memDao.cheackMemberPwd(mem_num, input_pwd);
            out.println(result);
              
        }else if(result == -1) {
            // 비밀번호 확인 페이지에서 패스워드 맞지 않음 
            System.out.println("입력한 비밀번호가 db와 상이");
          
        }else{
            // 비밀번호 확인 페이지에서 패스워드 동일 + 회원정보 관리 페이지로 이동
            // 회원 수정 완료
        	memDto = memDao.getMember(mem_num); 
              
            request.setAttribute("memDto", memDto);
              
            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("bookmain/mypage_member_update.jsp");
        
        }
          
          return forward;
    }

}
