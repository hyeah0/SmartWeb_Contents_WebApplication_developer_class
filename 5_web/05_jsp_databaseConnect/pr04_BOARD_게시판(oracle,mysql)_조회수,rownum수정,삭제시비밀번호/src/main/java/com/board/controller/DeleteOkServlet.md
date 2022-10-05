```
package com.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.BoardDAO;

/**
 * Servlet implementation class DeleteOkServlet
 */
@WebServlet("/delete_ok.do")
public class DeleteOkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteOkServlet() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 삭제 폼에서 넘어온 글 번호에 해당하는 게시글 데이터베이스에서 삭제
		// 한글처리
		response.setContentType("text/html; charset=UTF-8");

		// 넘어온 비밀번호, 게시글 번호 삭제
		int board_no = Integer.valueOf(request.getParameter("no"));
		String board_pwd = request.getParameter("pwd");

		BoardDAO dao = BoardDAO.getInstance();
		int result = dao.deleteBoard(board_no, board_pwd);

		PrintWriter out = response.getWriter();
		if(result>0) {
			dao.updateSequence(board_no);
			out.println("<script>");
			out.println("alert('삭제 완료!')");
			out.println("location.href='select.do'");
			out.println("</script>");
		}else if(result == -1) {
			out.println("<script>");
			out.println("alert('비밀번호가 다릅니다.')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

}
```
