```
package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.EmpDAO;
import model.EmpDTO;

@WebServlet("/select.do")
public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectServlet() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 비지니스 로직
		// DB에 접속하여 EMP 테이블의 전체 리스트를 가져와서
		// view member_list 페이지로 이동

		EmpDAO empDao = EmpDAO.getInstance();
		List<EmpDTO> empDto = empDao.getMember();

		// 묶어주기
		request.setAttribute("empMember", empDto);

		// 보낼위치 정하고 보내기
		RequestDispatcher rd = request.getRequestDispatcher("view/emp_list.jsp");
		rd.forward(request, response);

	}

}
```
