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

import model.DeptDTO;
import model.EmpDAO;
import model.EmpDTO;

@WebServlet("/update.do")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateServlet() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 비지니스 로직
		// get 방식으로 받은 사원 번호에 해당하는 사원 정보를 수정 폼 페이지로 저장

		// url에서 사원번호 받기
		int empno = Integer.valueOf(request.getParameter("no"));

		EmpDAO dao = EmpDAO.getInstance();
		// 담당 업무 조회 메서드 호출
		List<String> jobList = dao.getJobList();

		// 관리자 조회 메서드 호출
		List<EmpDTO> mgrList = dao.getMgrList();

		// 부서번호 조회 메서드 호출
		List<DeptDTO> deptList = dao.getDeptList();

		// 사원번호에 해당하는 정보 조회 메서드 호출
		EmpDTO dto = dao.getMemberDetail(empno);

		// 정보 묶기
		request.setAttribute("job", jobList);
		request.setAttribute("mgr", mgrList);
		request.setAttribute("dept", deptList);
		request.setAttribute("memberDList", dto);

		RequestDispatcher rd = request.getRequestDispatcher("view/emp_modify.jsp");
		rd.forward(request, response);
	}

}
```
