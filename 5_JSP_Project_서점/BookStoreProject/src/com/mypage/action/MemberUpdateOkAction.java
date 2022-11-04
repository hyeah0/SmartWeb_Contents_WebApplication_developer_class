package com.mypage.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BookDAO;
import com.book.model.CategoryDAO;
import com.book.model.CategoryDTO;
import com.book.model.MemberDAO;

public class MemberUpdateOkAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
       
        // 헤더 카테고리
        CategoryDAO cgyDao = CategoryDAO.getInstance();
        BookDAO bookDao = BookDAO.getInstance();
        
        List<CategoryDTO> cgyList = cgyDao.getCategory();
        request.setAttribute("cgyList", cgyList);
        
        // 넘어온 mem_num
        int mem_num = Integer.valueOf(request.getParameter("mem_num"));
        String input_newPwd = "0";
        
        if(!request.getParameter("input_newPwd").isEmpty()) {
            input_newPwd = request.getParameter("input_newPwd");
        }
        
        String input_name = request.getParameter("input_name");
        String input_mail = request.getParameter("input_mail");
        
        String input_phone1 = request.getParameter("input_phone1");
        String input_phone2 = request.getParameter("input_phone2");
        String input_phone3 = request.getParameter("input_phone3");
        String input_phone = String.format("%s-%s-%s", input_phone1, input_phone2, input_phone3);
        
        String input_addr = request.getParameter("input_addr");
        System.out.println("넘어온 mem_num : " + mem_num);
        
        MemberDAO memDao = MemberDAO.getInstance();
        int result = memDao.updateMember(mem_num, input_newPwd, input_name, input_mail, input_phone, input_addr);
        ActionForward forward = new ActionForward();
        
        if(result>0) {
            System.out.println("회원정보 수정 완료!");
            forward.setRedirect(true);
            forward.setPath("mypage_member_update.do?result=1");
        }else {
            System.out.println("회원정보 수정 실패!");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('회원 정보 수정 실패!')");
            out.println("history.back()");
            out.println("</script>");
        }
        
        return forward;
    }

}
