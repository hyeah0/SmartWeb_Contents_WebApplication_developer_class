package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.MemberDAO;
import com.book.model.MemberDTO;

public class MemberSelectAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		MemberDAO dao = MemberDAO.getInstance();
		
		List<MemberDTO> list = null;
		list = dao.getMemberList();
		
		request.setAttribute("memberList", list);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("admin/member_list.jsp");
		
		return forward;
	}
}
