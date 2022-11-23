package com.main.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;

import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import com.book.model.BannerDAO;
import com.book.model.BannerDTO;
import com.book.model.BookDAO;
import com.book.model.BookDTO;
import com.book.model.CategoryDAO;
import com.book.model.CategoryDTO;

public class MainBookListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
			BannerDAO bannerDao = BannerDAO.getInstance();
			List<BannerDTO> bannerList = bannerDao.getBanner();
			
			BookDAO bookDao = BookDAO.getInstance();
			List<BookDTO> bookBestList = bookDao.getBestBooks();        // best5 30일 누적 판매량 순
			List<BookDTO> bookPickList = bookDao.getPickBooks();		// store pick 1년 누적 판매량 순

			// 세션 설정_카테고리 회원 번호
	        HttpSession session = request.getSession();
	        session.getAttribute("userNum");
	        
	        request.setAttribute("bannerList", bannerList);
	        request.setAttribute("bookBestList", bookBestList);
			request.setAttribute("bookPickList", bookPickList);
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("bookmain/main.jsp");
			
			return forward;
	}

}
