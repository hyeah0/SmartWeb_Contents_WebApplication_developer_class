```
package com.member.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.action.*;

// 서블릿 생성 : 서블릿 파일로 생성시에는 @WebServlet("/urlmapping값") 이 생김

// 0. extends HttpServlet
public class FrontController extends HttpServlet {

	// 1. serialVersionUID 변수 생성
	private static final long serialVersionUID = 1L;

	// 2. service 메서드 생성
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {

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

			System.out.println("*******************************************************");
		/* ---------------------------------------------------------------------------------- */

		// 생성한 Action 인터페이스 실행
		Action action = null;

		// 실행된 uri 에 따라 객체 저장
		// Action action = new 객체명();
		if(command.equals("select.do")) {
			// action 에 MemberListAction 객체(클래스)를 저장
			action = new MemberListAction();

		}else if(command.equals("insert.do")){
			action = new MemberJoinAction();

		}else if(command.equals("insert_ok.do")) {
			action = new MemberJoinOkAction();

		}else if(command.equals("content.do")) {
			action = new MemberListDetailAction();

		}else if(command.equals("update.do")){
			action = new MemberUpdateAction();

		}else if(command.equals("update_ok.do")) {
			action = new MemberUpdateOkAction();

		}else if(command.equals("delete.do")) {
			action = new MemberDeleteAction();

		}else if(command.equals("delete_ok.do")) {
			action = new MemberDeleteOkAction();

		}

		/* -- action에서 이동경로를 받아 이동 ----------------------------------------------------------------------- */
		// 상단 if 결과에 따라 jsp 이동 경로는 상이
		// 예시) MemberListAction 클래스에서 넘어온 "view/member_list.jsp";
		// RequestDispatcher ==> 자료를 보낼 위치 지정
		String path1 = action.execute(request, response);

		RequestDispatcher rd = request.getRequestDispatcher(path1);
		rd.forward(request, response);
	}

}
```
