```
package com.spring.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpResponse;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.BoardDAO;
import com.spring.model.BoardDTO;

@Controller // 빈으로 등록
public class BoardController {

	@Inject // dao에 주입
	private BoardDAO dao;

	@RequestMapping("board_list.do")
	public String list(Model model) {

	    List<BoardDTO> boardList = this.dao.getBoardList();
		model.addAttribute("boardList", boardList);

		return "board_list";
	}

	@RequestMapping("board_cont.do")
	public String cont(@RequestParam("board_no") int board_no, Model model) {

		this.dao.readCont(board_no);
		BoardDTO boardCont = this.dao.boardCont(board_no);
		model.addAttribute("boardCont", boardCont);

		return "board_cont";

	}

	@RequestMapping("board_write.do")
	public String insert() {
		return "board_write";
	}

	@RequestMapping("board_write_ok.do")
	public String insert_ok(BoardDTO boardDto, HttpServletResponse response) throws IOException {

		int res = this.dao.insertBoard(boardDto);
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();
		if(res>0) {
			out.println("<script>");
			out.println("alert('게시글 작성 완료!')");
			out.println("location.href='board_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시글 작성 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
		return null;
	}

	@RequestMapping("board_update.do")
	public String update(@RequestParam("board_no") int board_no, Model model) {

		BoardDTO boardCont = this.dao.boardCont(board_no);
		model.addAttribute("boardCont", boardCont);

		return "board_update";
	}

	@RequestMapping("board_update_ok.do")
	public String update_ok(@RequestParam("input_pwd") String input_pwd,
			               @RequestParam("DB_pwd") String DB_pwd,
			               BoardDTO boardDto, HttpServletResponse response) throws IOException {

		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		int res;

		if(!input_pwd.equals(DB_pwd)) {
			out.println("<script>");
			out.println("alert('비밀번호가 다릅니다.')");
			out.println("history.back()");
			out.println("</script>");

		}else if(input_pwd.equals(DB_pwd)){
			System.out.println("비밀번호가 같다.");
			res = this.dao.updateBoard(boardDto);

			if(res>0) {
				out.println("<script>");
				out.println("alert('게시물 수정 완료!')");
				out.println("location.href='board_cont.do?board_no=" + boardDto.getBoard_no() + "'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('게시물 수정 실패!')");
				out.println("history.back()");
				out.println("</script>");
			}
		}
		return null;
	}

	// 비밀번호 확인 후 게시글 삭제
	@RequestMapping("board_delete.do")
	public String delete(@RequestParam("board_no") int board_no, Model model) throws IOException {

		BoardDTO dto = this.dao.boardCont(board_no);
		model.addAttribute("dto", dto);

		return "board_delete";
	}

	@RequestMapping("board_delete_ok.do")
	public String delete_ok(@RequestParam("board_no") int board_no,
							@RequestParam("DB_pwd") String DB_pwd,
							@RequestParam("input_pwd") String input_pwd,
							HttpServletResponse response) throws IOException {

		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");

		if(!input_pwd.equals(DB_pwd)) {
			out.println("<script>");
			out.println("alert('비밀번호가 다릅니다.')");
			out.println("history.back()");
			out.println("</script>");

		}else if(input_pwd.equals(DB_pwd)){

			this.dao.deleteBoard(board_no);
			this.dao.updateSeq(board_no);

			out.println("<script>");
			out.println("alert('게시물 삭제 완료!')");
			out.println("location.href='board_list.do'");
			out.println("</script>");
		}
		return null;
	}

//	@RequestMapping("board_delete.do")
//	public String delete(@RequestParam("board_no") int board_no, HttpServletResponse response) throws IOException {
//
//		int res = this.dao.deleteBoard(board_no);
//
//		PrintWriter out = response.getWriter();
//		response.setContentType("text/html; charset=UTF-8");
//
//		if(res>0) {
//			this.dao.updateSeq(board_no);
//			out.println("<script>");
//			out.println("alert('게시물 삭제 완료!')");
//			out.println("location.href='board_list.do'");
//			out.println("</script>");
//		}else {
//			out.println("<script>");
//			out.println("alert('게시물 삭제 실패!')");
//			out.println("history.back()");
//			out.println("</script>");
//		}
//		return null;
//	}

	@RequestMapping("board_search.do")
	public String search(@RequestParam("field") String field,
			             @RequestParam("keyword") String keyword, Model model) {

		List<BoardDTO> searchList = this.dao.searchBoardList(field, keyword);
		model.addAttribute("searchList",searchList);

		return "board_search";
	}

}
```
