```
package com.spring.model;

import java.util.List;

public interface BoardDAO {

	List<BoardDTO> getBoardList();
	BoardDTO boardCont(int no);
	void readCont(int no);

	int insertBoard(BoardDTO dto);
	int updateBoard(BoardDTO dto);
	int deleteBoard(int no);
	void updateSeq(int no);

	List<BoardDTO> searchBoardList(String field, String keyword);
}
```
