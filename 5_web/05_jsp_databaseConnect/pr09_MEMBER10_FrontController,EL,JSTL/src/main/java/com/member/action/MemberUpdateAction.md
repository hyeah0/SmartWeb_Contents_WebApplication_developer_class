```
package com.member.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

public class MemberUpdateAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// 비지니스 로직
		// get 방식으로 넘어온 회원 번호 데이터를 조회하여
		// 수정 폼페이지로 이동

		int num = Integer.valueOf(request.getParameter("num"));
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = dao.getMemberListDetail(num);
		request.setAttribute("Update", dto);

		return "view/member_list_update_form.jsp";
	}

}
```
