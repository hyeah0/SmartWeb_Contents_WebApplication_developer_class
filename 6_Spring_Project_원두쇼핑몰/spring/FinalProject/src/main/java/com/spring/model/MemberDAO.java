package com.spring.model;



import java.util.List;

import javax.servlet.http.HttpSession;

public interface MemberDAO {

	FinalMemberDTO checkMember(FinalMemberDTO dto);
	FinalAdminDTO checkAdmin(FinalMemberDTO a_dto);
	
	CoffeeTestDTO getTestResult(int no);
	
	public void logout(HttpSession session);
	
	FinalMemberDTO MemberMyPage(int num);
	//주소
	int addrModify(FinalMemberDTO dto);
	
	int addrModify2(FinalMemberDTO dto);
	
	int addrModify3(FinalMemberDTO dto);
	
	int addrModify4(FinalMemberDTO dto);
	
	int addrModify5(FinalMemberDTO dto);

	int deletemember(int num);
	
	int phone_modify(FinalMemberDTO dto);

	int email_modify(FinalMemberDTO dto);

	int pwd_modify(FinalMemberDTO dto);

	List<FinalMemberDTO> member_heart(int num);

	int myheartdelete(int num);
	
	List<FinalMemberDTO> BoardList(int num);
	
	FinalMemberDTO boardcont(int num);
	
	BoardReplyDTO replycont(int num);
	
	int myboard_delete(int no);

	int w_writeok(FinalMemberDTO dto);

	int joinIdCheck(FinalMemberDTO dto);

	int Memberupdate(FinalMemberDTO fmdto);

	int useMember(String member_id);
	
}
