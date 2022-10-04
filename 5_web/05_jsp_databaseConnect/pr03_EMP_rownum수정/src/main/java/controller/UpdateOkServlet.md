```
package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.EmpDAO;
import model.EmpDTO;


@WebServlet("/update_ok.do")
public class UpdateOkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public UpdateOkServlet() {
        super();
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 비지니스 로직
		// 수정 폼페이지에서 넘어온 정보들을 db에서 수정

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		// 폼페이지값 받기
		int empno = Integer.valueOf(request.getParameter("empno"));
		String ename = request.getParameter("ename");
		String job = request.getParameter("job");
		int mgr = Integer.valueOf(request.getParameter("mgr"));
		String hiredate = request.getParameter("hiredate");
		int sal = Integer.valueOf(request.getParameter("sal"));
		int comm = Integer.valueOf(request.getParameter("comm"));
		int dept = Integer.valueOf(request.getParameter("dept"));

		// dto 객체에 저장
		EmpDTO dto = new EmpDTO();
		dto.setEmpno(empno);
		dto.setEname(ename);
		dto.setJob(job);
		dto.setMgr(mgr);
		dto.setHiredate(hiredate);
		dto.setSal(sal);
		dto.setComm(comm);
		dto.setDeptno(dept);


		// dao 메서드 실행
		EmpDAO dao = EmpDAO.getInstance();
		int result = dao.updateEmp(dto);

		PrintWriter out = response.getWriter();
		if(result>0) {
			out.println("<script>");
			out.println("alert('사원 수정 완료!')");
			out.println("location.href='content.do?no=" + dto.getEmpno() + "'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('사원 수정 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

}
```
