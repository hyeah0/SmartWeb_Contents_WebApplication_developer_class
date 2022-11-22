```
package com.spring.model;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	// @Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MemberDTO> getMemberList() {
		return this.sqlSession.selectList("all");
	}

	@Override
	public List<MemberDTO> searchMemberList(String field, String keyword) {
		return this.sqlSession.selectList(field, keyword);
	}

	@Override
	public MemberDTO getMember(int num) {
		return this.sqlSession.selectOne("content", num);
	}

	@Override
	public String getMemberPwd(int num) {
		return this.sqlSession.selectOne("ck", num);
	}

	@Override
	public int insertMember(MemberDTO dto) {
		return this.sqlSession.insert("add", dto);
	}

	@Override
	public int updateMember(MemberDTO dto) {
		return this.sqlSession.update("edit", dto);
	}

	@Override
	public int deleteMember(int num) {
		return this.sqlSession.delete("del", num);
	}

	@Override
	public void updateSeq(int num) {
		this.sqlSession.update("updateSeq", num);
	}



}
```
