package backup;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BookDAO;
import com.book.model.BookDTO;

public class MainBookListPickAction_사용안함 implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
        System.out.println("-------------MainBookListPickAction");
        // requestType
        // book_sales(누적판매순) / book_cheap(낮은가격순) / book_recent(최신 등록순)
        String requestType = request.getParameter("requestType");
        
        BookDAO dao = BookDAO.getInstance();
        List<BookDTO> bookPickList = dao.getPickBooks(requestType);
        
        request.setAttribute("bookPickList", bookPickList);
        
        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("main_open.do");
        
        return forward;
    }

}
