```
package com.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberJoinAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		// 비지니스 로직
		// 회원 등록 폼페이지로 이동

		return "view/member_join_form.jsp";
	}

}
```
