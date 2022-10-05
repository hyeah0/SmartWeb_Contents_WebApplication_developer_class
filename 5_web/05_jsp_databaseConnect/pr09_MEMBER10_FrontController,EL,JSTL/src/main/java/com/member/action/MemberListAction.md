```
package com.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

// action 인터페이스 상속 받음
public class MemberListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		// 비지니스 로직
		// Member10 테이블에 있는 회원 전체 리스트를 조회하여
		// DAO 클래스 getMemberList() 메서드 실행 후
		// view page로 이동

		MemberDAO dao = MemberDAO.getInstance();
		List<MemberDTO> memberList = dao.getMemberList();

		// DB에서 가져온 전체 회원 리스트를 view page로 이동
		request.setAttribute("List", memberList);

		// 이동될 view 페이지 이름명 적기
		return "view/member_list.jsp";
	}

}
```
