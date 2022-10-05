```
package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

public class MemberUpdateOkAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// 비지니스 로직
		// 수정 폼 페이지에서 넘어온 데이터들을 member10 테이블에서 해당하는 회원번호의 데이터를 수정

		// 1. 폼값 저장
		// hidden
		int num = Integer.valueOf(request.getParameter("num").trim());
		String db_pwd = request.getParameter("db_pwd").trim();

		// 입력값
		String memname = request.getParameter("memname").trim();
		String input_pwd = request.getParameter("input_pwd").trim();
		String change_pwd = request.getParameter("change_pwd").trim();
		int age = Integer.valueOf(request.getParameter("age").trim());
		int mileage = Integer.valueOf(request.getParameter("mileage").trim());
		String job = request.getParameter("job").trim();
		String addr = request.getParameter("addr").trim();

		// 2. dto에 저장
		MemberDTO dto = new MemberDTO();
		dto.setNum(num);
		dto.setMemname(memname);
		dto.setAge(age);
		dto.setMileage(mileage);
		dto.setJob(job);
		dto.setAddr(addr);

		// 3. 화면 실행을 위한 PrintWriter
		PrintWriter out = response.getWriter();

		// 4. 사용자가 입력한 비밀번호와 데이터 베이스 비밀번호가 같은지 확인
		if(input_pwd.equals(db_pwd)) {

			// 4-1 비밀번호를 수정 할 경우(데이터베이스 비밀번호와 변경 요청 비밀번호가 다를경우)
			if(change_pwd.isBlank()) {
				dto.setPwd(input_pwd);
			}else {
				dto.setPwd(change_pwd);
				 out.println("<script>");
				 out.println("alert('비밀번호 수정 완료!')");
				 out.println("</script>");
			}

			// 4-2. dao 메서드 실행
			MemberDAO dao = MemberDAO.getInstance();
			int result = dao.updateMember(dto);

			if(result>0) {
				 out.println("<script>");
				 out.println("alert('정보 수정 완료!')");
				 out.println("location.href='content.do?num=" + dto.getNum() + "'");
				 out.println("</script>");
			}else {
				 out.println("<script>");
				 out.println("alert('정보 수정 실패!')");
				 out.println("history.back()");
				 out.println("</script>");
			}

		 }else {
			 out.println("<script>");
			 out.println("alert('비밀번호가 틀립니다. 확인 부탁드립니다.')");
			 out.println("history.back()");
			 out.println("</script>");
		 }


		return null;
	}


}
```
