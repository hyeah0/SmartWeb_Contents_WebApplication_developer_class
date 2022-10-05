```
package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;

public class MemberDeleteOkAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// 비지니스 로직
		// 넘어온 회원번호의 작성 비밀번호와 데이터베이스 비밀번호를 비교하여
		// 회원을 삭제

		// 넘어온 회원번호, 작성 비밀번호 가져오기
		int num = Integer.valueOf(request.getParameter("mem_no").trim());
		String input_pwd = request.getParameter("input_pwd").trim();
		// System.out.println("MemberDeleteOkAction form에서 넘어온 회원 번호, 비밀번호 >>> " + num + ", " + input_pwd );

		MemberDAO dao = MemberDAO.getInstance();
		int result = dao.deleteMember(num, input_pwd);
		// System.out.println("deleteMember 메서드 실행후 num >>> " + num );

		PrintWriter out = response.getWriter();
		if(result>0) {

			//회원 번호 재 작업 메서드
			dao.updateSequence(num);

			out.println("<script>");
			out.println("alert('회원 삭제 완료!')");
			out.println("location.href='select.do'");
			out.println("</script>");

		}else if(result == -1) {
			out.println("<script>");
			out.println("alert('비밀번호가 다릅니다. 확인 부탁드립니다.!')");
			out.println("history.back()");
			out.println("</script>");

		} else {
			out.println("<script>");
			out.println("alert('회원 삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}

		return null;
	}

}
```
