```
package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DeptDTO;
import model.EmpDAO;
import model.EmpDTO;

@WebServlet("/insert.do")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertServlet() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 비지니스 로직
		// 사원 등록 폼으로 넘어가기 전 담당업무 리스트, 관리자 리스트, 부서번호 리스트를
		// DB에서 조회하여 사원 등록 폼 페이지로 넘겨준다.

		EmpDAO dao = EmpDAO.getInstance();

		// 담당업무 리스트
		List<String> jobList = dao.getJobList();

		// 관리자 리스트
		List<EmpDTO> mgrList = dao.getMgrList();

		// 부서테이블 전체조회 리스트
		List<DeptDTO> deptList = dao.getDeptList();


		// 묶어주기
		request.setAttribute("job", jobList);
		request.setAttribute("mgr", mgrList);
		request.setAttribute("dept", deptList);

		// 보내줄 주소 지정, 보내주기
		RequestDispatcher rd = request.getRequestDispatcher("view/emp_insert.jsp");
		rd.forward(request, response);

	}

}
```
