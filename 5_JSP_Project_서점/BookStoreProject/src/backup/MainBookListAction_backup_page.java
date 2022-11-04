package backup;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BookDAO;
import com.book.model.BookDTO;
import com.book.model.CategoryDAO;
import com.book.model.CategoryDTO;

public class MainBookListAction_backup_page implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
	    System.out.println("------------ MainBookListAction 클래스");
	    //uri 에서 가져온값 ---------------------------------------------------- 
	    String requestType = request.getParameter("requestType");
	    
		HttpSession session = request.getSession();
		//System.out.println("session : " + session);
		
		CategoryDAO cgyDao = CategoryDAO.getInstance();
		BookDAO bookDao = BookDAO.getInstance();
		
		List<CategoryDTO> cgyList = cgyDao.getCategory();
		List<BookDTO> bookBestList = bookDao.getBestBooks();                  // best5
		
		List<BookDTO> bookPickList = null;
		
		if(requestType != null) {
		    bookPickList = bookDao.getPickBooks(requestType);       // pick
		}else {
		    bookPickList = bookDao.getPickBooks("book_sales");
		}
		
		request.setAttribute("session", session);
        request.setAttribute("cgyList", cgyList);
        request.setAttribute("bookBestList", bookBestList);
		request.setAttribute("bookPickList", bookPickList);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("view/main.jsp");
		
		return forward;
	}

}
