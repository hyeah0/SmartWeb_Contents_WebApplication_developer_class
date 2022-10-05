```
package com.member.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

public class MemberListDetailAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// 비지니스 로직
		// get 방식으로 넘어온 회원 번호의 상세 데이터를 출력

		// 1. get 방식으로 넘어온 회원 번호
		int num = Integer.valueOf(request.getParameter("num").trim());
		// System.out.println("member list detail action num >>> " + num);

		// 2. dao 객체 상세 메서드 실행
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dtoTest = dao.getMemberListDetail(num);

		// 3. 묶어주기
		request.setAttribute("DList", dtoTest);

		// 4. 이동될 페이지 입력
		return "view/member_list_detail.jsp";
	}

}
```
