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


@WebServlet("/delete.do")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public DeleteServlet() {
        super();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 비지니스 로직
		// get방식으로 넘어온 사원 번호에 해당하는 데이터를 db에서 삭제

		// 한글 인코딩
		response.setContentType("text/html; charset=UTF-8");

		// get 방식으로 넘어온 사원 번호
		int empno = Integer.valueOf(request.getParameter("no"));

		// dao 객체
		EmpDAO dao = EmpDAO.getInstance();
		int result = dao.deleteEmp(empno);

		PrintWriter out = response.getWriter();
		if(result>0) {
			out.println("<script>");
			out.println("alert('사원 삭제 완료!')");
			out.println("location.href='select.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('사원 삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

}
```
