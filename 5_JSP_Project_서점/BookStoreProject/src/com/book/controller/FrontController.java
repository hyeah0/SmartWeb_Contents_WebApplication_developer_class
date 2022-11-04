package com.book.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		/* -- 한글 인코딩 ---------------------------------------------------------------------- */ 
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=UTF-8");
		
		/* -- uri 확인 ----------------------------------------------------------------------- */
			String uri = request.getRequestURI();	 					// request.getRequestURI() : /프로젝트/ 파일명(*.do) 문자열 반환 
			String command = request.getServletPath().substring(1);		// request.getServletPath().substring(1)
			String queryString = request.getQueryString();      		// request.getQueryString() : 쿼리문 
			System.out.println("command >> " + command);
			System.out.println("queryString >> " + queryString);
			
			
		/* -- action 선언 ----------------------------------------------------------------------- */
			Action action = null;				// ActionForward 객체를 return 으로 받는 인터페이스
			ActionForward forward = null;		// isRedirect, path 멤버변수로 있는 객체
			
		/* -- java.util.Properties 클래스 -------------------------------------------------------- */
			Properties pro = new Properties();	
		
			FileInputStream fis = new FileInputStream("/Users/Jihye/code/국비(220712-221229)/SmartWeb_Contents_WebApplication_developer_class/6_JSP_Project_서적/BookStoreProject/src/com/book/controller/mapping.properties");
			pro.load(fis);
			String value = pro.getProperty(command);
			System.out.println("이동, 실행할 value >>> " + value);	//value >>> execute|com.reply.action.BbsListAction 
			
			/*
			    String currDir = FrontController.class.getResource(".").getPath();
                System.out.println("현재 작업 경로: " + currDir);
        
                Action action = null;
                ActionForward forward = null;
        
                Properties pro = new Properties();
        
                FileInputStream fis = new FileInputStream(currDir+"mapping.properties");
			 */
			
			if(value.substring(0,7).equals("execute")) {
				
				StringTokenizer st = new StringTokenizer(value, "|");
				String url_1 = st.nextToken();			// execute
				String url_2 = st.nextToken();			// 패키지명.클래스명
				
				System.out.println("url_1 >>> " + url_1);
				System.out.println("url_2 >>> " + url_2);
			
			
		/* -- 동적 객체 생성 : newInstance() ------------------------------------------------------ */
			
				try{
					Class<?> url = Class.forName(url_2);
					
					Constructor<?> constructor = url.getConstructor();
					action = (Action) constructor.newInstance();
					
					forward = action.execute(request, response);
					
				}catch(Exception e) {
					e.printStackTrace();
				}
			
			}else {
				
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath(value);
				
				System.out.println("sql 데이터를 가져오지 않습니다. 바로 페이지로 이동");
			}
			
		if(forward != null) {
			if(forward.isRedirect()) {	// forward.isRedirect() : true인 경우 *.do page
				response.sendRedirect(forward.getPath());
			
			}else { // forward.isRedirect() : false 인 경우 *.jsp page
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
		}
		
	}
}
