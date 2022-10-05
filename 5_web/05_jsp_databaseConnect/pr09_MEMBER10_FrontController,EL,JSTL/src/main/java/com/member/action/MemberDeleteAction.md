```
package com.member.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberDeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// 비지니스 로직
		// get 방식으로 넘어온 회원번호를 회원삭제 폼페이지로 이동

		int num = Integer.valueOf(request.getParameter("num").trim());
		request.setAttribute("memberno", num);

		System.out.println("num >>> " + num);

		return "view/member_delete_form.jsp";
	}

}
```
