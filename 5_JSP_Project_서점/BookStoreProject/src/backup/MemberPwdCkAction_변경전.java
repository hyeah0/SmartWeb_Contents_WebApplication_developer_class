package backup;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.MemberDAO;
import com.book.model.MemberDTO;

public class MemberPwdCkAction_변경전 implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 화면에서 아이디와 작성한 비밀번호를 가져와 db에서 비교후 
        // 비밀번호가 맞다면 수정 페이지로 이동

        // 회원번호 & 비밀번호 저장
        // 회원번호 어떻게 가져올건지 확인 필요(세선?)
        System.out.println("--------------- MemberPwdCkAction 클래스");
        int mem_num = 1;    // 회원번호
        String input_pwd = request.getParameter("input_pwd");
        int result = 0;
        MemberDTO memDto = null;
        
        MemberDAO memDao = MemberDAO.getInstance();
        PrintWriter out = response.getWriter();
        ActionForward forward = null;
        
        if(result == 0) {
            // 회원정보 관리 페이지(비밀번호 확인)로 처음 이동
            result = memDao.cheackMemberPwd(mem_num, input_pwd);
            out.println(result);
            
        }else if(result == -1) {
            // 비밀번호 확인 페이지에서 패스워드 맞지 않음 
            System.out.println("result : " + result);
        
        }else {
            // 비밀번호 확인 페이지에서 패스워드 동일 + 회원정보 관리 페이지로 이동
            memDto = memDao.getMember(mem_num); 
            
            request.setAttribute("memDto", memDto);
            
            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("view/mypage_member_update.jsp");
        }
       
        
        return forward;
    }

}

