```
package com.mybatis.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mybatis.model.BoardDAO;
import com.mybatis.model.BoardDTO;
import com.mybatis.model.PageDTO;

@Controller
public class BoardController {

	@Inject
	private BoardDAO dao;

	// 페이지 관련 변수들 -----------------------------------------------
	private final int rowsize = 4;		// 한 페이지당 보여질 게시물 수
	private int totalRecord = 0;		// DB전체 게시물 수
	// --------------------------------------------------------------

	@RequestMapping("board_list.do")
	public String list(HttpServletRequest request, Model model) {

		// 페이징 처리 작업
		// page : 현재 페이지
		int page;

		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			// page 파라미터가 null 일 경우 1로 지정(처음 게시물 전체 목록 태그 클릭)
			page = 1;
		}

		// DB상의 전체 게시물의 수를 확인하는 메서드 호출
		totalRecord = this.dao.getListCount();

		PageDTO pageDto = new PageDTO(page, rowsize, totalRecord);

		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<BoardDTO> list = this.dao.getBoardList(pageDto);

		model.addAttribute("List", list);
		model.addAttribute("Paging", pageDto);
		return "board_list";

	}

	@RequestMapping("board_cont.do")
	public String cont(@RequestParam("no") int board_no,
			           @RequestParam("page") int nowPage,
			           Model model ) {

		this.dao.readCount(board_no);
		BoardDTO cont = this.dao.getBoardCont(board_no);

		model.addAttribute("cont", cont);
		model.addAttribute("page", nowPage);
		return "board_cont";
	}

	@RequestMapping("board_write.do")
	public String write() {
		return "board_write";
	}

	@RequestMapping("board_write_ok.do")
	public void write_ok(BoardDTO dto ,HttpServletResponse response) throws IOException {
		int res = this.dao.insertBoard(dto);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if(res>0) {
			out.println("<script>");
			out.println("alert('게시글 등록 완료!')");
			out.println("location.href='board_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시글 등록 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

	@RequestMapping("board_update.do")
	public String update(@RequestParam("no") int board_no ,
			 			 @RequestParam("page") int nowPage, Model model) {

		BoardDTO cont = this.dao.getBoardCont(board_no);

		model.addAttribute("cont", cont);
		model.addAttribute("page", nowPage);
		return "board_update";
	}

	@RequestMapping("board_update_ok.do")
	public void update_ok(@RequestParam("input_pwd") String input_pwd,
			 			  @RequestParam("page") int nowPage,
			 			   BoardDTO dto, HttpServletResponse response ) throws IOException {

		String db_pwd = dto.getBoard_pwd();

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if(input_pwd.equals(db_pwd)) {

			int res = this.dao.updateBoard(dto);

			if(res>0) {
				out.println("<script>");
				out.println("alert('게시글 수정 완료!')");
				out.println("location.href='board_cont.do?no=" + dto.getBoard_no() + "&page="+ nowPage +"'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('게시글 수정 실패!')");
				out.println("history.back()");
				out.println("</script>");
			}

		}else {
			out.println("<script>");
			out.println("alert('비밀번호가 다릅니다!')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

	@RequestMapping("board_delete.do")
	public void delete(@RequestParam("no") int board_no,
				       @RequestParam("page") int nowPage,
				       HttpServletResponse response) throws IOException {

		int res = this.dao.deleteBoard(board_no);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(res>0) {
			this.dao.updateSequence(board_no);

			out.println("<script>");
			out.println("alert('게시글 삭제 완료!')");
			out.println("location.href='board_list.do?&page="+ nowPage +"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시글 삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

	@RequestMapping("board_ck_pwd.do")
	public String ck_pwd(@RequestParam("no") int board_no,
					     @RequestParam("page") int nowPage,
					     Model model) throws IOException {

		model.addAttribute("board_no", board_no);
		model.addAttribute("page", nowPage);

		return "board_ck_pwd";
	}

	@RequestMapping("board_ck_pwd_ok.do")
	public void ck_pwd(@RequestParam("no") int board_no,
		     		   @RequestParam("page") int nowPage,
		     		   @RequestParam("input_pwd") String input_pwd,
		     		   HttpServletResponse response) throws IOException {

		String db_pwd = this.dao.getPwd(board_no);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if(db_pwd.equals(input_pwd)) {
			out.println("<script>");
			out.println("location.href='board_delete.do?no="+board_no+"&page="+ nowPage +"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('비밀번호 상이 다시 입력해주세요.!')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

	@RequestMapping("board_search.do")
	public String searchList(@RequestParam("field") String field,
			                 @RequestParam("keyword") String keyword,
			                 HttpServletRequest request,
			                 Model model ) {

		// 페이징 처리 작업
		// page : 현재 페이지
		int page;
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			// page 파라미터가 null 일 경우 1로 지정(처음 게시물 전체 목록 태그 클릭)
			page = 1;
		}

		// DB상의 전체 게시물의 수를 확인하는 메서드 호출
		totalRecord = this.dao.searchBoardCount(field, keyword);

//		System.out.println("controller field : " + field);
//		System.out.println("controller keyword : " + keyword);
//		System.out.println("controller : " + totalRecord);

		PageDTO pageDto = new PageDTO(page, rowsize, totalRecord, field, keyword);

		// 검색한 게시물을 한페이지당 보여질 게시물 수만큼 list 로 가져오는 메서드 호출
		List<BoardDTO> list = this.dao.searchBoardList(pageDto);

	    model.addAttribute("List", list);
		model.addAttribute("Paging", pageDto);
		return "search_list";
		//return null;
	}
}
```
