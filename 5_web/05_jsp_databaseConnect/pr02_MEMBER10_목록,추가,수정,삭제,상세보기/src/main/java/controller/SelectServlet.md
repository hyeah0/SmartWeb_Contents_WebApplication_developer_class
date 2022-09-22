```
package com.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

@WebServlet("/select.do")
public class SelectServlet extends HttpServlet {

	// 멤버변수
	private static final long serialVersionUID = 1L;

	// 기본생성자
	public SelectServlet() {
		super();
	}

	// 서비스 메서드
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 비지니스 로직
		// 요청 : MEBBER10 테이블 전체 회원 목록을 화면에 보여달라고 사용자가 요청 
	    // 응답 : DB에서 MEBBER10의 회원 전체 목록을 조회하여 해당 전체 리스트를 view page로 넘겨준다.
		
		
		// 1단계 : 오라클 데이터 베이스와 연동
		MemberDAO dao = new MemberDAO();
		
		// 2단계 : MEMVER10 테이블의 회원 전체 목록 조회된것을 list객체에 저장
		List<MemberDTO> memberList = dao.getMemberList();
		
		// 3단계 : DB에서 가져온 정보를 key에 값을 묶는다.
		request.setAttribute("member", memberList);
		
		// 4단계 : 페이지 이동
		RequestDispatcher rd = request.getRequestDispatcher("view/member_list.jsp");
		rd.forward(request, response);
	
	
	}

}

```
