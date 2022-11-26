```
package com.spring.model;

import java.util.List;

public interface MemberDAO {

	List<MemberDTO> getMemberList();
	List<MemberDTO> searchMemberList(String field, String keyword);

	MemberDTO getMember(int num);
	String getMemberPwd(int num);

	int insertMember(MemberDTO dto);
	int updateMember(MemberDTO dto);
	int deleteMember(int num);
	void updateSeq(int num);

}
```
