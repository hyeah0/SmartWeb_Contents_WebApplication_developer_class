```
package com.mybatis.model;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount() {
		return this.sqlSession.selectOne("dbCount");
	}

	@Override
	public List<BoardDTO> getBoardList(PageDTO pdto) {
		return this.sqlSession.selectList("list", pdto);
	}

	@Override
	public BoardDTO getBoardCont(int board_no) {
		return this.sqlSession.selectOne("cont", board_no);
	}

	@Override
	public int insertBoard(BoardDTO dto) {
		return this.sqlSession.insert("insert", dto);
	}

	@Override
	public void readCount(int board_no) {
		this.sqlSession.update("updateHit", board_no);
	}

	@Override
	public int updateBoard(BoardDTO dto) {
		return this.sqlSession.update("update", dto);
	}

	@Override
	public String getPwd(int board_no) {
		return this.sqlSession.selectOne("dbpwd", board_no);
	}

	@Override
	public int deleteBoard(int board_no) {
		return this.sqlSession.delete("delete", board_no);
	}

	@Override
	public void updateSequence(int board_no) {
		this.sqlSession.update("updateSeq", board_no);
	}

	@Override
	public int searchBoardCount(String field, String keyword) {
		return this.sqlSession.selectOne(field+"_cnt", keyword);
	}

	@Override
	public List<BoardDTO> searchBoardList(PageDTO dto) {
		return this.sqlSession.selectList(dto.getField(), dto);
	}



}
```
