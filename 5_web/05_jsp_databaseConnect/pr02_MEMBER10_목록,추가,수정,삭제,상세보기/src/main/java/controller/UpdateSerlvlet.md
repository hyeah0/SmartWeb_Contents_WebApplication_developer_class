```
package com.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

@WebServlet("/update.do")
public class UpdateSerlvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateSerlvlet() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 비지니스 로직
		// get 방식으로 넘어온 회원 번호에 해당하는 회원의 정보를 조회해서
		// 수정 폼 페이지로 이동

		int member_num = Integer.valueOf(request.getParameter("num"));
		MemberDAO dao = new MemberDAO();
		MemberDTO cont = dao.getContentMember(member_num);	//한 회원의 상세정보

		// 데이터 묶기
		request.setAttribute("modify", cont);

		// 데이터 보내기
		RequestDispatcher rd = request.getRequestDispatcher("view/member_update.jsp");
		rd.forward(request, response);

	}

}
```
