```
package com.board.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.action.Action;
import com.board.action.BoardContentViewAction;
import com.board.action.BoardListAction;
import com.board.action.BoardWriteAction;

// 0. extends HttpServlet
public class FrontController extends HttpServlet {

	// 1. serialVersionUID 변수 생성
	private static final long serialVersionUID = 1L;

	// 2. service 메서드 생성
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/* -- 한글 인코딩 ---------------------------------------------------------------------- */
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=UTF-8");

		/* -- uri 확인 ----------------------------------------------------------------------- */

			// getRequestURI() : "/프로젝트명/파일명(*.do)" 문자열인 uri 반환
			String uri = request.getRequestURI();
			System.out.println("uri >>> " + uri); 					// >>> /12_Member_MVC2/select.do

			// getContextPath() : "/프로젝트명/ 프로젝트명 문자열로 반환
			String path = request.getContextPath();
			System.out.println("path >>> " + path);  				// >>> /12_Member_MVC2

			// *** 파일명 문자열 반환
			String command = uri.substring(path.length() + 1);
			System.out.println("command >>> " + command); 			// >>> select.do

			// 파일명?num=n
			String queryString = request.getQueryString();
			System.out.println("queryString >>> " + queryString); 	// >>> num=n

			System.out.println("***********************************************************");
		/* ---------------------------------------------------------------------------------- */

		// 생성한 Action 인터페이스 실행
		Action action = null;
		String viewPage = null;

		if(command.equals("board_list.do")) {
			action = new BoardListAction();
			action.execute(request, response);

			viewPage = "view/board_list.jsp";

		}else if(command.equals("board_write.do")) {
			viewPage = "view/board_write_form.jsp";

		}else if(command.equals("board_write_ok.do")){
			action = new BoardWriteAction();
			action.execute(request, response);

		}else if(command.equals("board_content.do")) {
			action = new BoardContentViewAction();
			action.execute(request, response);
			viewPage = "view/board_content_view.jsp";
		}


		// 이동할 페이지 지정 후 이동
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);
	}


}
```
