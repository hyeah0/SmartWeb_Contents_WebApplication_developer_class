package backup;

import java.io.IOException;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BannerDAO;
import com.book.model.BannerDTO;
import com.book.model.BookDAO;
import com.book.model.BookDTO;
import com.book.model.CategoryDAO;
import com.book.model.CategoryDTO;

//@WebServlet("/main.do")
public class MainBookListAction_Start없이하기전 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
	    System.out.println("------------ MainBookListAction 클래스");
	    //uri 에서 가져온값 ---------------------------------------------------- 
	    String requestType = request.getParameter("requestType");
	    if(requestType == null) {
	        requestType = "book_sales";
	    }
	    
		CategoryDAO cgyDao = CategoryDAO.getInstance();
		List<CategoryDTO> cgyList = cgyDao.getCategory();
		
		BannerDAO bannerDao = BannerDAO.getInstance();
		List<BannerDTO> bannerList = bannerDao.getBanner();
		
		BookDAO bookDao = BookDAO.getInstance();
		List<BookDTO> bookBestList = bookDao.getBestBooks();        // best5
		
		List<BookDTO> bookPickList = null;
		
		if(requestType != null) {
		    bookPickList = bookDao.getPickBooks(requestType);       // pick
		}else {
		    bookPickList = bookDao.getPickBooks("book_sales");
		}

		// 세션 설정_카테고리 회원 번호
        HttpSession session = request.getSession();
        session.setAttribute("mem_num",1);
        session.setAttribute("cgyList", cgyList );
		
        request.setAttribute("cgyList", cgyList);
        request.setAttribute("bannerList", bannerList);
        request.setAttribute("bookBestList", bookBestList);
		request.setAttribute("bookPickList", bookPickList);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("view/main.jsp");
		
		return forward;
		
	    //return null;
	}

}
