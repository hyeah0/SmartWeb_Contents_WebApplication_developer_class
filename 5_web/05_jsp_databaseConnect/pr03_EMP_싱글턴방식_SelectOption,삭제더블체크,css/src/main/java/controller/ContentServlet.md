```
package controller;

import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.EmpDAO;
import model.EmpDTO;


@WebServlet("/content.do")
public class ContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public ContentServlet() {
        super();
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 비지니스 로직
		// get 메서드 타입으로 사원번호를 받아
		// 해당하는 사원의 상세 정보를 출력한다.

		// url에서 사원번호 받기
		int empno = Integer.valueOf(request.getParameter("no"));

		// dao 메서드에서 데이터값 받기
		EmpDAO dao = EmpDAO.getInstance();
		EmpDTO dto = dao.getMemberDetail(empno);

		// 데이터 묶기
		request.setAttribute("memberDList", dto);

		// 데이터 보내기
		RequestDispatcher rd = request.getRequestDispatcher("view/emp_list_detail.jsp");
		rd.forward(request, response);

	}

}
```
