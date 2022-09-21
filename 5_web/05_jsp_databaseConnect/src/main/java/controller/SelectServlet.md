```
package com.khie.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khie.model.DeptDAO;
import com.khie.model.DeptDTO;


@WebServlet("/select")
public class SelectServlet extends HttpServlet {

	// 멤버변수
	private static final long serialVersionUID = 1L;

	// 생성자
    public SelectServlet() {
        super();
    }

    /*
       doget, dopost 메서드는
       servlet life circle
       init() -> service() -> doGet()/doPost() -> destroy() 순으로 메서드를 호출해 준다.
       init() -> service() 만 호출해주는 경우가 있다.  (service 메서드가 doget, dopost 역할 모두 한다)
     */

    // service 메서드
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	/*
    	 * 비즈니스 로직
    	 * index.jsp 페이지에서 요청해서 dept 테이블의 전체 부서 목록을 화면 출력 요청
    	 * ㄴ 상위 요청에 대한 응답
    	 */

    	// 1단계 : DB연결 작업 진행
    	// - 준비과정
    	// 		- DAO(Data Access Object) 객체 준비 _ 데이터 접근 객체(데이터 연동해서 정보 가져오는 객체)
	    // 		- DTO(Data Transfer Object) 객체 준비
    	DeptDAO dao = new DeptDAO();

    	// 2단계 : DB에서 DEPT테이블의 전체 목록 조회
        List<DeptDTO> deltList = dao.selectList();

        // 3단계 : 2단계에서 받은 정보를 key와 value값으로 묶어서 뷰(html) 페이지로 넘겨준다.
        // 페이지 이동 작업시 데이터를 같이 넘김
        // request.setAttribute() : 데이터를 묶어서 넘김
        request.setAttribute("List", deltList);

        // 4단계 : 실제로 페이지를 넘김
        // 이동할 페이지 주소 설정
        RequestDispatcher rd = request.getRequestDispatcher("select.jsp");

        // 실제 페이지를 이동이 진행 되는 곳
        rd.forward(request, response);

    }


}


```
