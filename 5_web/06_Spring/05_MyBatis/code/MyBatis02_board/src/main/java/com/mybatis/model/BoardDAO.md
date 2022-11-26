```
package com.mybatis.model;

import java.util.List;

public interface BoardDAO {

	int getListCount();
	List<BoardDTO> getBoardList(PageDTO pdto);

	BoardDTO getBoardCont(int board_no);

	int insertBoard(BoardDTO dto);
	void readCount(int board_no);

	int updateBoard(BoardDTO dto);

	String getPwd(int board_no);
	int deleteBoard(int board_no);
	void updateSequence(int board_no);

	int searchBoardCount(String field, String keyword);
	List<BoardDTO> searchBoardList(PageDTO dto);


}
```
