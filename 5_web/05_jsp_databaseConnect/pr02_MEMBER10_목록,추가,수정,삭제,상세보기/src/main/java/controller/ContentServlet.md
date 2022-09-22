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

@WebServlet("/content.do")
public class ContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ContentServlet() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 비지니스 로직
		// 회원의 이름 클릭시 get방식으로 넘어온 회원 번호에 해당하는 회원의
		// 전체 정보를 데이터 베이스에서 조회후 정보를 view page로 이동

		// get에서 온 회원넘버를 받아온다.
		int member_num = Integer.valueOf(request.getParameter("num"));

		MemberDAO dao = new MemberDAO();
		MemberDTO dto_cont = dao.getContentMember(member_num);

		// 정보가 들어있는 것을 묶는다.
		request.setAttribute("content", dto_cont);

		// 묶은 정보를 홈페이지에 보내준다.
		RequestDispatcher rd = request.getRequestDispatcher("view/member_cont.jsp");
		rd.forward(request, response);

	}

}
```
