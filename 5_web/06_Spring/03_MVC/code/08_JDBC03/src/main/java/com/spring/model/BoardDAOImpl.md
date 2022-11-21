```
package com.spring.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository // 빈으로 등록
public class BoardDAOImpl implements BoardDAO {

	@Inject // 오라클 디비 사용위해
	private JdbcTemplate template;

	String sql = null;

	/**
	 * @see 리스트 보기
	 * this.template.query(sql, new RowMapper<BoardDTO>() { } );
	 */
	@Override
	public List<BoardDTO> getBoardList() {

		List<BoardDTO> list = null;

		sql = "select * from board order by board_no desc";

		list = this.template.query(sql, new RowMapper<BoardDTO>() {

			@Override
			public BoardDTO mapRow(ResultSet rs, int rowNum) throws SQLException {

				BoardDTO dto = new BoardDTO();
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setBoard_writer(rs.getString("board_writer"));
				dto.setBoard_title(rs.getString("board_title"));
				dto.setBoard_cont(rs.getString("board_cont"));
				dto.setBoard_pwd(rs.getString("board_pwd"));
				dto.setBoard_hit(rs.getInt("board_hit"));
				dto.setBoard_date(rs.getString("board_date"));
				dto.setBoard_update(rs.getString("board_update"));

				return dto;
			}

		});

		return list;
	}

	/**
	 *  @see 상세보기
	 *  return this.template.queryForObject(sql, new RowMapper<BoardDTO>() { }, no);
	 */
	@Override
	public BoardDTO boardCont(int no) {

		sql = "select * from board where board_no = ?";
		return this.template.queryForObject(sql, new RowMapper<BoardDTO>() {

			@Override
			public BoardDTO mapRow(ResultSet rs, int rowNum) throws SQLException {

				BoardDTO dto = new BoardDTO();
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setBoard_writer(rs.getString("board_writer"));
				dto.setBoard_title(rs.getString("board_title"));
				dto.setBoard_cont(rs.getString("board_cont"));
				dto.setBoard_pwd(rs.getString("board_pwd"));
				dto.setBoard_hit(rs.getInt("board_hit"));
				dto.setBoard_date(rs.getString("board_date"));
				dto.setBoard_update(rs.getString("board_update"));

				return dto;
			}
		}, no);

	}

	/**
	 * 게시글 번호
	 * this.template.update(sql, new PreparedStatementSetter() { });
	 */
	@Override
	public void readCont(final int no) {

		sql = "update board "
			+ "   set board_hit = board_hit+1"
			+ " where board_no = ?";

		this.template.update(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, no);
			}
		});
	}

	/**
	 * @see 게시글 등록
	 * 게시글 번호 추출 : final int board_no = this.template.queryForInt(sql);
	 * 게시글 등록 : this.template.update(sql, new PreparedStatementSetter() { } )
	 */
	@Override
	public int insertBoard(final BoardDTO dto) {

		// 게시글 번호
		sql = "select max(board_no) from board";
		final int board_no = this.template.queryForInt(sql);

		sql = "insert into board values(?, ?, ?, ?, ?, 0 , sysdate, '')";
		int res = this.template.update(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, board_no+1);
				ps.setString(2, dto.getBoard_writer());
				ps.setString(3, dto.getBoard_title());
				ps.setString(4, dto.getBoard_cont());
				ps.setString(5, dto.getBoard_pwd());
			}
		});

		return res;
	}

	@Override
	public int updateBoard(final BoardDTO dto) {

		sql = "update board"
			+ "   set board_title = ?,"
			+ "       board_cont = ?,"
			+ "       board_update = sysdate"
			+ " where board_no = ?";

		int res = this.template.update(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, dto.getBoard_title());
				ps.setString(2, dto.getBoard_cont());
				ps.setInt(3, dto.getBoard_no());
			}
		});

		return res;
	}

	@Override
	public int deleteBoard(final int no) {

		sql = "delete from board where board_no = ?";

		int res = this.template.update(sql, new PreparedStatementSetter() {

				@Override
				public void setValues(PreparedStatement ps) throws SQLException {
					ps.setInt(1, no);
				}
			});

		return res;
	}

	@Override
	public void updateSeq(final int no) {

		sql = "update board set board_no = board_no-1 "
			+ " where board_no > ? ";

		this.template.update(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, no);
			}
		});

	}

	@Override
	public List<BoardDTO> searchBoardList(String field, String keyword) {

		List<BoardDTO> searchList = null;
		sql = "select * from board "
			+ "where " + field + " like ? order by board_no desc";

		searchList = this.template.query(sql, new RowMapper<BoardDTO>() {

			@Override
			public BoardDTO mapRow(ResultSet rs, int rowNum) throws SQLException {

				BoardDTO dto = new BoardDTO();
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setBoard_writer(rs.getString("board_writer"));
				dto.setBoard_title(rs.getString("board_title"));
				dto.setBoard_cont(rs.getString("board_cont"));
				dto.setBoard_pwd(rs.getString("board_pwd"));
				dto.setBoard_hit(rs.getInt("board_hit"));
				dto.setBoard_date(rs.getString("board_date"));
				dto.setBoard_update(rs.getString("board_update"));

				return dto;
			}

		}, "%"+ keyword +"%");


		return searchList;
	}

}
```
