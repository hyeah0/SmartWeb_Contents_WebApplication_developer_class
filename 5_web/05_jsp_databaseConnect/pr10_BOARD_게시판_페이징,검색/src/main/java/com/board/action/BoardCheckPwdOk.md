```
package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardCheckPwdOk implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		System.out.println("------------- BoardCheckPwdOk 객체 -------------");

		int no = Integer.valueOf(request.getParameter("no"));
		int page = Integer.valueOf(request.getParameter("page"));
		int type = Integer.valueOf(request.getParameter("type"));
		String db_pwd = request.getParameter("db_pwd");
		String input_pwd = request.getParameter("input_pwd").trim();

		PrintWriter out = response.getWriter();
		if(db_pwd.equals(input_pwd)) {
			if(type == 2) {
				out.println("<script>");
				out.println("alert('수정페이지로 이동합니다.')");
				out.println("location.href='board_update_form.do?"
					      + "no="+ no + "&page="+ page + "&type="+ type+ "'");
				out.println("</script>");
			}else if(type == 3) {
				out.println("<script>");
				out.println("alert('데이터를 삭제중 입니다..')");
				out.println("location.href='board_delete_ok.do?"
						  + "no="+ no + "&page="+ page + "&type="+ type+ "'");
				out.println("</script>");
			}
		}else {
			out.println("<script>");
			out.println("alert('비밀번호가 다릅니다.')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

}
```
