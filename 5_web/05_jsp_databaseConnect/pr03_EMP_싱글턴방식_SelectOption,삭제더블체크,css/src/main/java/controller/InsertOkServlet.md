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

@WebServlet("/insert_ok.do")
public class InsertOkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertOkServlet() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 비지니스 로직
		// 사원 등록 폼 페이지에서 넘어온 정보들을
		// DB의 EMP 테이블에 저장

		// 한글 인코딩
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		// 폼에서 데이터 가져오기
		int number = Integer.valueOf(request.getParameter("num").trim());
		String name = request.getParameter("name").trim();
		String job = request.getParameter("job").trim();
		int mgrNo = Integer.valueOf(request.getParameter("mgr").trim());
		//String hireDate = request.getParameter("hireDate").trim();
		int sal = Integer.valueOf(request.getParameter("sal").trim());
		int comm = Integer.valueOf(request.getParameter("comm").trim());
		int dept = Integer.valueOf(request.getParameter("dept").trim());

		// dto 객체에 받아온 데이터 입력
		EmpDTO dto = new EmpDTO();
		dto.setEmpno(number);
		dto.setEname(name);
		dto.setJob(job);
		dto.setMgr(mgrNo);
		//dto.setHiredate(hireDate);
		dto.setSal(sal);
		dto.setComm(comm);
		dto.setDeptno(dept);

		EmpDAO dao = EmpDAO.getInstance();
		int result = dao.insertEmp(dto);

		PrintWriter out = response.getWriter();
		if(result>0) {
			out.println("<script>");
			out.println("alert('사원 등록 완료!')");
			out.println("location.href = 'select.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('사원 등록 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

}
```
