```
package com.spring.mybatis01;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.MemberDAO;
import com.spring.model.MemberDTO;

@Controller
public class MemberController {

		@Inject
		private MemberDAO dao;

		@RequestMapping("member_list.do")
		public String list(Model model) {

			List<MemberDTO> list = this.dao.getMemberList();
			model.addAttribute("List",list);

			return "member_list";
		}

		@RequestMapping("member_insert.do")
		public String insert() {
			return "member_insert";
		}

		@RequestMapping("member_insert_ok.do")
		public void insertOk(MemberDTO dto, HttpServletResponse response) throws IOException {

			int res = this.dao.insertMember(dto);
			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();
			if(res>0) {
				out.println("<script>");
				out.println("alert('회원 등록 성공!')");
				out.println("location.href='member_list.do'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('회원 등록 실패!')");
				out.println("history.back()");
				out.println("</script>");
			}

		}

		@RequestMapping("member_content.do")
		public String cont(@RequestParam("num") int no, Model model) {
			MemberDTO dto = this.dao.getMember(no);
			model.addAttribute("Cont", dto);

			return "member_content";
		}

		@RequestMapping("member_modify.do")
		public String modify(@RequestParam("num") int no, Model model) {
			MemberDTO dto = this.dao.getMember(no);
			model.addAttribute("Modify", dto);

			return "member_modify";
		}

		@RequestMapping("member_modify_ok.do")
		public void updateOk(MemberDTO dto, HttpServletResponse response ) throws IOException {

			int res = this.dao.updateMember(dto);

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			if(res>0) {
				out.println("<script>");
				out.println("alert('회원 수정 완료!')");
				out.println("location.href='member_content.do?num=" + dto.getNum() + "'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('회원 수정 실패!')");
				out.println("history.back()");
				out.println("</script>");
			}

		}

		// 비밀번호 확인 후 삭제
		// 1. 비밀번호 확인 페이지로 이동
		@RequestMapping("member_ck_pwd.do")
		public String movePage(@RequestParam("num") int no, Model model) throws IOException {

			model.addAttribute("num", no);

			return "member_ck_pwd";
		}

		// 2. 비밀번호 확인
		@RequestMapping("member_cking_pwd.do")
		public void ckPwd(@RequestParam("num") int no
				        , @RequestParam("input_pwd") String input_pwd
				        , HttpServletResponse response) throws IOException {

			String db_pwd = this.dao.getMemberPwd(no);

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			if(db_pwd.equals(input_pwd)) {

				this.dao.deleteMember(no);
				this.dao.updateSeq(no);

				out.println("<script>");
				out.println("alert('회원 삭제 완료!')");
				out.println("location.href='member_list.do'");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('비밀번호가 다릅니다. 삭제 불가!')");
				out.println("history.back()");
				out.println("</script>");
			}

		}


		@RequestMapping("member_delete.do")
		public void delete(@RequestParam("num") int no, HttpServletResponse response) throws IOException {

			int res = this.dao.deleteMember(no);

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			if(res>0) {
				this.dao.updateSeq(no);

				out.println("<script>");
				out.println("alert('회원 삭제 성공!')");
				out.println("location.href='member_list.do'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('회원 삭제 실패!')");
				out.println("hisotry.back()");
				out.println("</script>");
			}

		}

		@RequestMapping("member_search.do")
		public String search(@RequestParam("field") String field,
				             @RequestParam("keyword") String keyword,
				             Model model) {

			List<MemberDTO> searchList = this.dao.searchMemberList(field, keyword);
			model.addAttribute("searchList", searchList);

			return "member_search";
		}

}
```
