package com.book.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BookDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;

	private static BookDAO instance;

	private BookDAO() {
	}

	public static BookDAO getInstance() {

		if (instance == null) {
			instance = new BookDAO();
		}

		return instance;
	}

	public void openConn() {

		try {
			Context ctx = new InitialContext();

			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");

			con = ds.getConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {

		try {
			if (rs != null)
				rs.close();

			if (pstmt != null)
				pstmt.close();

			if (con != null)
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public List<BookDTO> getBookList() {
		List<BookDTO> list = new ArrayList<BookDTO>();
		openConn();

		try {
			sql = "select book_num, book_name, book_writer, "
					+ "book_date, book_publisher "
					+ "from book order by book_num desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookDTO dto = new BookDTO();
				dto.setBook_num(rs.getInt("book_num"));
				dto.setBook_name(rs.getString("book_name"));
				dto.setBook_date(rs.getString("book_date"));
				dto.setBook_writer(rs.getString("book_writer"));
				dto.setBook_publisher(rs.getString("book_publisher"));
				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}

	public int insertBook(BookDTO dto) {
		int result = 0, count = 0;
		openConn();

		try {
			sql = "select max(book_num) from book";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
			pstmt.close();
			sql = "insert into book values (?,?,?,?,?,?,?,'',?,?,"
					+ "?,0,sysdate,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, count + 1);
			pstmt.setString(2, dto.getCgy_num());
			pstmt.setString(3, dto.getBook_name());
			pstmt.setInt(4, dto.getBook_price());
			pstmt.setInt(5, dto.getBook_qty());
			pstmt.setString(6, dto.getBook_img());
			pstmt.setString(7, dto.getBook_date());
			pstmt.setString(8, dto.getBook_writer());
			pstmt.setString(9, dto.getBook_publisher());
			pstmt.setInt(10, dto.getBook_page());
			pstmt.setString(11, dto.getBook_cont());
			pstmt.setString(12, dto.getBook_writer_cont());
			pstmt.setString(13, dto.getBook_index());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}

	public BookDTO getBook(int book_num) {
		BookDTO dto = null;
		openConn();

		try {
			sql = "select * from book where book_num = ? order by book_num desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, book_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new BookDTO();
				dto.setBook_num(rs.getInt("book_num"));
				dto.setCgy_num(rs.getString("cgy_num"));
				dto.setBook_name(rs.getString("book_name"));
				dto.setBook_price(rs.getInt("book_price"));
				dto.setBook_qty(rs.getInt("book_qty"));
				dto.setBook_cont(rs.getString("book_cont").replace("\r\n", "<br>"));
				dto.setBook_img(rs.getString("book_img"));
				dto.setBook_date(rs.getString("book_date"));
				dto.setBook_update(rs.getString("book_update"));
				dto.setBook_writer(rs.getString("book_writer"));
				dto.setBook_publisher(rs.getString("book_publisher"));
				dto.setBook_sales(rs.getInt("book_sales"));
				dto.setBook_page(rs.getInt("book_page"));
				dto.setBook_writer_cont(rs.getString("book_writer_cont").replace("\r\n", "<br>"));
				dto.setBook_index(rs.getString("book_index").replace("\r\n", "<br>"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}
	public BookDTO getBookUpdate(int book_num) {
		BookDTO dto = null;
		openConn();

		try {
			sql = "select * from book where book_num = ? order by book_num desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, book_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new BookDTO();
				dto.setBook_num(rs.getInt("book_num"));
				dto.setCgy_num(rs.getString("cgy_num"));
				dto.setBook_name(rs.getString("book_name"));
				dto.setBook_price(rs.getInt("book_price"));
				dto.setBook_qty(rs.getInt("book_qty"));
				dto.setBook_cont(rs.getString("book_cont"));
				dto.setBook_img(rs.getString("book_img"));
				dto.setBook_date(rs.getString("book_date"));
				dto.setBook_update(rs.getString("book_update"));
				dto.setBook_writer(rs.getString("book_writer"));
				dto.setBook_publisher(rs.getString("book_publisher"));
				dto.setBook_sales(rs.getInt("book_sales"));
				dto.setBook_page(rs.getInt("book_page"));
				dto.setBook_writer_cont(rs.getString("book_writer_cont"));
				dto.setBook_index(rs.getString("book_index"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}

	public int deleteBook(int book_num) {
		openConn();
		int result = 0;
		
		try {
			sql = "delete from book where book_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, book_num);
			result = pstmt.executeUpdate();
			pstmt.close();
			sql = "update book set book_num = book_num-1 where book_num > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, book_num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}

	public int updateBook(BookDTO dto) {
		openConn();
		int result = 0;
		
		try {
			sql = "update book set cgy_num = ?, book_name = ?, book_price = ?, book_qty = ?, "
					+ "book_cont = ?, book_img = ?, book_date = ?, book_update = sysdate, book_writer = ?, "
					+ "book_publisher = ?, book_sales = ?, book_page = ?, "
					+ "book_writer_cont = ?, book_index = ? "
					+ "where book_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getCgy_num());
			pstmt.setString(2, dto.getBook_name());
			pstmt.setInt(3,dto.getBook_price());
			pstmt.setInt(4, dto.getBook_qty());
			pstmt.setString(5, dto.getBook_cont());
			pstmt.setString(6, dto.getBook_img());
			pstmt.setString(7, dto.getBook_date());
			pstmt.setString(8, dto.getBook_writer());
			pstmt.setString(9, dto.getBook_publisher());
			pstmt.setInt(10, dto.getBook_sales());
			pstmt.setInt(11, dto.getBook_page());
			pstmt.setString(12, dto.getBook_writer_cont());
			pstmt.setString(13, dto.getBook_index());
			pstmt.setInt(14, dto.getBook_num());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}

	public int getSize() {
		openConn();
		int size = 0;
		try {
			sql = "select max(book_num) from book";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				size = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return size;
	}

	public List<BookDTO> getBookListPage(int startPoint, int endPoint) {
		List<BookDTO> list = new ArrayList<BookDTO>();
		openConn();

		try {
			sql = "select book_num, book_name, book_writer, "
					+ "book_date, book_publisher "
					+ "from ("
					+ "select row_number() over (order by book_num desc) num, a.* "
					+ "from book a order by book_num desc) "
					+ "where num between ? and ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startPoint);
			pstmt.setInt(2, endPoint);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookDTO dto = new BookDTO();
				dto.setBook_num(rs.getInt("book_num"));
				dto.setBook_name(rs.getString("book_name"));
				dto.setBook_date(rs.getString("book_date"));
				dto.setBook_writer(rs.getString("book_writer"));
				dto.setBook_publisher(rs.getString("book_publisher"));
				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	} //getBookListPage() end
	
	
	
//	// 책번호에 해당하는 상세 정보 조회 메서드
//	public BookDTO bookInfo(int book_num) {
//		
//		BookDTO info = null;
//		
//		try {
//			
//			openConn();
//			
//
//			sql = "select * from book where book_num = ?";
//
//			
//			pstmt = con.prepareStatement(sql);
//			
//			pstmt.setInt(1, book_num);
//			
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				
//				info = new BookDTO();
//				
//				info.setBook_num(rs.getInt("book_num"));
//				info.setBook_name(rs.getString("book_name"));
//				info.setBook_writer(rs.getString("book_writer"));
//				info.setBook_publisher(rs.getString("book_publisher"));
//				info.setBook_price(rs.getInt("book_price"));
//				info.setBook_page(rs.getInt("book_page"));
//				info.setBook_cont(rs.getString("book_cont"));
//				info.setBook_index(rs.getString("book_index"));
//				info.setBook_writer_cont(rs.getString("book_writer_content"));
//				
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally {
//			closeConn(rs, pstmt, con);
//		}
//		
//		return info;
//		
//	} // bookInfo() end
	


//페이지 사이즈 
	public int getPageSize(String search_tag, String searchText) {
		openConn();
		boolean check = false;
		int result = 0;
		try {
			sql = "select count(*) from book ";
			
			if(search_tag.equals("title+content")) {
				sql += "where book_name like ? or book_cont like ?";
				check = true;
			}else if(search_tag.equals("title")) {
				sql += "where book_name like ?";
			}else if(search_tag.equals("content")) {
				sql += "where book_cont like ?";
			}
			System.out.println(sql);
			System.out.println("===========");
			System.out.println(searchText);
			pstmt = con.prepareStatement(sql);
			if(check) {
				pstmt.setString(1, "%"+searchText+"%");
				pstmt.setString(2, "%"+searchText+"%");
			}else {
				pstmt.setString(1, "%"+searchText+"%");
			}
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
  
  public List<BookDTO> getBookSearchPage(int startPoint, int endPoint, String search_tag, String searchText) {
		List<BookDTO> list = new ArrayList<BookDTO>();
		openConn();
		boolean check = false;
		try {
			sql = "select book_num, book_name, book_writer, "
					+ "book_date, book_publisher "
					+ "from ("
					+ "select row_number() over (order by book_num desc) num, a.* "
					+ "from book a ";
			
			if(search_tag.equals("title+content")) {
				sql += "where a.book_name like ? or a.book_cont like ? "
					+ "order by book_num desc) "
					+ "where num between ? and ?";
				check = true;
			}else if(search_tag.equals("title")) {
				sql += "where a.book_name like ? "
						+ "order by book_num desc) "
						+ "where num between ? and ?";
			}else if(search_tag.equals("content")) {
				sql += "where a.book_cont like ? "
						+ "order by book_num desc) "
						+ "where num between ? and ?";
			}
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			if(check) {
				pstmt.setString(1, "%"+searchText+"%");
				pstmt.setString(2, "%"+searchText+"%");
				pstmt.setInt(3, startPoint);
				pstmt.setInt(4, endPoint);
				
			}else {
				pstmt.setString(1, "%"+searchText+"%");
				pstmt.setInt(2, startPoint);
				pstmt.setInt(3, endPoint);
			}
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookDTO dto = new BookDTO();
				dto.setBook_num(rs.getInt("book_num"));
				dto.setBook_name(rs.getString("book_name"));
				dto.setBook_date(rs.getString("book_date"));
				dto.setBook_writer(rs.getString("book_writer"));
				dto.setBook_publisher(rs.getString("book_publisher"));
				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}
  
  
  /* ----------------------- 메인 페이지 ---------------------------------------------- */
  /**
   * @see .화제의 책 리스트 가져오기
   */
  public List<BookDTO> getBestBooks(){
      List<BookDTO> bookBestList = new ArrayList<BookDTO>();
      
      try {
          openConn();
          
          sql = "select rownum"
              + "     , o.book_num"
              + "     , order_month"
              + "     , b.cgy_num"
              + "     , b.book_name"
              + "     , b.book_price"
              + "     , b.book_qty"
              + "     , b.book_cont"
              + "     , b.book_img"
              + "  from (select book_num"
              + "             , sum(order_qty) as order_month"
              + "          from book_order"
              + "         where sysdate - order_date <= 30"
              + "         group by book_num"
              + "         order by order_month desc) o"
              + "  join book b "
              + "    on o.book_num = b.book_num"
              + " where rownum >=1 and rownum <=5";
          pstmt = con.prepareStatement(sql);
          rs = pstmt.executeQuery();
          
          while(rs.next()) {
              BookDTO dto = new BookDTO();
              dto.setRownum(rs.getInt("rownum"));
              dto.setBook_num(rs.getInt("book_num"));
              dto.setOrder_month(rs.getInt("order_month"));
              dto.setCgy_num(rs.getString("cgy_num"));
              dto.setBook_name(rs.getString("book_name"));
              dto.setBook_price(rs.getInt("book_price"));
              dto.setBook_qty(rs.getInt("book_qty"));
              dto.setBook_cont(rs.getString("book_cont"));
              dto.setBook_img(rs.getString("book_img"));
              
              bookBestList.add(dto);
          }
          
      } catch (Exception e) { e.printStackTrace();
      } finally { closeConn(rs, pstmt, con);
      }
      return bookBestList;
  }
  
  /**
   * @see .종로서적 pick 버튼에 따라 값 가져오기(1년간 판매량이 있는 책 한정)
   */
  public List<BookDTO> getPickBooks(String requestType) {
      
      System.out.println("-------------BookDAO : getPickBooks() 메서드 실행중..");
      
    // book_sales(누적판매순) / book_cheap(낮은가격순) / book_recent(최신 등록순)
      String requestSearch = "";
      
      if(requestType.equals("book_sales")) {
          requestSearch = "order_year desc"; 
          
      }else if(requestType.equals("book_price")) {
          requestSearch = "book_price";        //asc
          
      }else{
          requestSearch = "book_date desc";    //desc
      }
      
    // 결과값 가져오기
      List<BookDTO> bookPickList = new ArrayList<BookDTO>();
      
      try {
          openConn();
          System.out.println("requestSearch : " + requestSearch);
          
          sql = "select b.*"
              + "  from book b"
              + "   join (select book_num "
              + "              , sum(order_qty) as order_year"
              + "           from book_order"
              + "          where sysdate - order_date <= 365"
              + "          group by book_num) o"
              + "     on b.book_num = o.book_num "
              + "  order by "+ requestSearch;
          
          pstmt = con.prepareStatement(sql);
          rs = pstmt.executeQuery();
          
          while(rs.next()) {
             BookDTO dto = new BookDTO();
             
             dto.setBook_num(rs.getInt("book_num"));
             dto.setCgy_num(rs.getString("cgy_num"));
             dto.setBook_name(rs.getString("book_name"));
             dto.setBook_price(rs.getInt("book_price"));
             dto.setBook_qty(rs.getInt("book_qty"));
             //dto.setBook_cont(rs.getString("book_cont"));
             dto.setBook_cont(rs.getString("book_cont").replace("\r", "<br>"));
             dto.setBook_img(rs.getString("book_img"));
             bookPickList.add(dto);
          }
          
      } catch (Exception e) { e.printStackTrace();
      } finally { closeConn(rs, pstmt, con);
      }
      
      return bookPickList;
      
  }
  
  /**
   * @see .카테고리별 데이터 수
   */
  public int getDBCount(String cgy_num) {
      int totalRecord = 0;
      
      try {
          openConn();
          
          if(cgy_num.equals("all")) {
              sql="select count(*) from book";
              
          }else {
              sql="select count(*) from book where cgy_num = '" + cgy_num + "'";
          }
          pstmt = con.prepareStatement(sql);
          rs = pstmt.executeQuery();
          
          if(rs.next()) {
              totalRecord = rs.getInt(1);
          }
          
          System.out.println("totalRecord : " + totalRecord);
          System.out.println("---------bookdao : getDBCount() 메서드 실행완료..");
          
      } catch (Exception e) { e.printStackTrace();
      } finally { closeConn(rs, pstmt, con);
      }
      
      return totalRecord;
  }
  
  /**
   * @see. 카테고리별 검색 데이터 갯수 
   */
  public int getDBCount(String searchType, String searchInput) {
   
      int totalRecord = 0;
      
      try {
          
          openConn();
          
          if(searchType.equals("all")) {
              sql = "select count(*)"
                      + "  from book b"
                      + "  where ( book_name like '%" +searchInput + "%'"
                      + "     or book_writer like '%" +searchInput + "%'"
                      + "     or book_publisher like '%" +searchInput + "%'"
                      + "     or book_cont like '%" + searchInput + "%')";
              pstmt = con.prepareStatement(sql);
              
          }else {
              sql = "select count(*)"
                  + "  from book b"
                  + "  where b.cgy_num = '" + searchType + "'"
                  + "    and ( book_name like '%" + searchInput + "%'"
                  + "     or book_writer like '%" + searchInput + "%'"
                  + "     or book_publisher like '%" + searchInput + "%'"
                  + "     or book_cont like '%" + searchInput + "%')";
          }
          pstmt = con.prepareStatement(sql);
          rs = pstmt.executeQuery();
          
          if(rs.next()) {
              totalRecord = rs.getInt(1);
          }
          
      } catch (Exception e) { e.printStackTrace();
      } finally { closeConn(rs, pstmt, con);
      }
      
      return totalRecord;
  }
  
  /**
   * @see .카테고리별 리스트가져오기
   */
  public List<BookDTO> getCgyBooks(String cgy_num, String requestType, int page, int rowsize){
      System.out.println("-------------BookDAO : getCgyBooks() 메서드 실행중..");
      System.out.println("bookdao : 받아온 cgy_num : " + cgy_num);
      System.out.println("bookdao : 받아온 requestType : " + requestType);
      
      List<BookDTO> bookCgyList = new ArrayList<BookDTO>();
      
      // book_sales(누적판매순) / book_cheap(낮은가격순) / book_recent(최신 등록순)
      String requestSearch = "";
      
      if(requestType.equals("book_sales")) {
          requestSearch = "order_year desc"; 
          
      }else if(requestType.equals("book_price")) {
          requestSearch = "book_price";        
          
      }else{
          requestSearch = "book_regdate desc, book_num desc";    
      }
      
      // 포스트 시작, 끝 번호
      int startNo = (page * rowsize) - (rowsize -1);
      int endNo = (page * rowsize);
      System.out.println("bookdao : startNo : " + startNo);
      System.out.println("bookdao : endNo : " + endNo);
      
      try {
          openConn();
          
          // 1년 누적 판매량 기준
          // order_cnt : 기간 오더수 뽑는 쿼리_ 사용 테이블 book_order
          // order_cnt_num : 기간 동안 오더수 없는 책 포함, 주문건 없을 경우 0으로 변경, 카테고리 선택가능
          // order_cnt_row : 기간 오더수 row
          // 마지막 : 기간 오더수 row 설정(페이징)
          if(cgy_num.equals("all")){ // cgy_num=all : nav에서 도서전체 클릭
             
              sql = "with order_cnt as(select book_num"
                  + "                      , sum(order_qty) as order_year"
                  + "                   from book_order"
                  + "                  where sysdate - order_date <= 365" // 기간설정 
                  + "                  group by book_num"
                  + "),order_cnt_num as (select b.*"
                  + "                          , case when o.order_year is null then 0 else o.order_year end as order_year"
                  + "                      from book b"
                  + "                      left join order_cnt o"
                  + "                         on b.book_num = o.book_num "
                  + "),order_cnt_row as("
                  + "                    select ROW_NUMBER() over(order by "+requestSearch +" ) as row_num"
                  + "                         , y.*"
                  + "                      from order_cnt_num y"
                  + ")"
                  + "select r.*"
                  + "   from order_cnt_row r"
                  + "  where r.row_num>= "+ startNo + "and r.row_num<=" + endNo
                  + "  order by r.row_num" ;
                  
                  
                  System.out.println("dao if 1: " + requestSearch);
              
          }else if(!cgy_num.equals("all")&&requestType.equals("book_sales")){ 
                  
                  // 카테고리 선택 + 누적판매순 클릭시
                  sql = "with order_cnt as(select book_num"
                      + "                      , sum(order_qty) as order_year"
                      + "                   from book_order"
                      + "                  where sysdate - order_date <= 365" //기간설정
                      + "                  group by book_num"
                      + " ),order_cnt_num as (select b.*"
                      + "                          , case when o.order_year is null then 0 else o.order_year end as order_year"
                      + "                      from book b"
                      + "                      left join order_cnt o"
                      + "                         on b.book_num = o.book_num "
                      + "                      where b.cgy_num = '"+ cgy_num +"'" // 카테고리 설정
                      + " ),order_cnt_row as("
                      + "                    select ROW_NUMBER() over(order by "+ requestSearch +" ) as row_num"
                      + "                         , y.*"
                      + "                      from order_cnt_num y"
                      + " )"
                      + "select r.*"
                      + "   from order_cnt_row r"
                      + "  where r.row_num >= "+ startNo + " and r.row_num <= " + endNo;
                  
                  System.out.println("dao if 2: " + requestSearch);
          
          } else if(!cgy_num.equals("all")&&!requestType.equals("book_sales")) {
              
              // 카테고리 선택 + 최소주문건, 또는 최신 등록순 클릭시
              sql = "with book_db as (select ROW_NUMBER() over(order by "+ requestSearch +" ) as row_num"
                  + "                       , b.*"
                  + "                   from book b"
                  + "                  where cgy_num = '"+ cgy_num + "'"
                  + ")select d.* "
                  + "   from book_db d"
                  + "  where d.row_num >= "+ startNo + " and d.row_num <= " + endNo
                  + "  order by d.row_num";
                  
                  System.out.println("dao if 2: " + requestSearch);
          }
                 
          pstmt = con.prepareStatement(sql);
          rs = pstmt.executeQuery();
          
          while(rs.next()) {
              BookDTO bookDto = new BookDTO();
              bookDto.setRownum(rs.getInt("row_num"));
              bookDto.setBook_num(rs.getInt("book_num"));
              bookDto.setCgy_num(rs.getString("cgy_num"));
              bookDto.setBook_name(rs.getString("book_name"));
              bookDto.setBook_price(rs.getInt("book_price"));
              bookDto.setBook_qty(rs.getInt("book_qty"));
              bookDto.setBook_cont(rs.getString("book_cont"));
              bookDto.setBook_img(rs.getString("book_img"));
              bookDto.setBook_date(rs.getString("book_date"));
              bookDto.setBook_update(rs.getString("book_update"));
              bookDto.setBook_writer(rs.getString("book_writer"));
              bookDto.setBook_publisher(rs.getString("book_publisher"));
              bookDto.setBook_sales(rs.getInt("book_sales"));
              bookDto.setBook_page(rs.getInt("book_page"));
              
              if(cgy_num.equals("all")||requestType.equals("book_sales")) {
                  bookDto.setOrder_year(rs.getInt("order_year"));
              }
              
              bookCgyList.add(bookDto);
              
          }
          
          System.out.println("-------------BookDAO : getCgyBooks() 메서드 실행완료..");
      } catch (Exception e) { e.printStackTrace();
      } finally { closeConn(rs, pstmt, con);
      }
      
      return bookCgyList;
      
  }
  
  /**
   * @see .검색시 해당하는 자료 요청 카테고리별 리스트가져오기
   */
  public List<BookDTO> getCgyBooks(String requestType, String searchType, String searchInput, int page, int rowsize){
      
      System.out.println("-------------BookDAO : getCgyBooks() 검색용 메서드 실행중..");
      System.out.println("bookbao : requestType 넘어온 값 : " + requestType);
      System.out.println("bookbao : searchType 넘어온 값 : " + searchType);
      System.out.println("bookbao : searchInput 넘어온 값 : " + searchInput);
      System.out.println("bookbao : page 넘어온 값 : " + page);
      System.out.println("bookbao : rowsize 넘어온 값 : " + rowsize);
      
      
      List<BookDTO> bookCgyList = new ArrayList<BookDTO>();
      
      // book_sales(누적판매순) / book_cheap(낮은가격순) / book_recent(최신 등록순)
      String requestSearch = "";
      
      if(requestType.equals("book_sales")) {
          requestSearch = "order_year desc"; 
          
      }else if(requestType.equals("book_price")) {
          requestSearch = "book_price";        
          
      }else{
          requestSearch = "book_regdate desc, book_num desc";    
      }
      
      // 포스트 시작, 끝 번호
      int startNo = (page * rowsize) - (rowsize -1);
      int endNo = (page * rowsize);
      
      try {
          openConn();
          
          // 검색 카테고리, 검색어, 어떤 정렬 방식인지, 현재 페이지
          // searchType : 페이지 카테고리가 아닌 다른 카테고리 선택시 해당 카테고리 번호로 넘어옴, 통합검색은 search_total 로 되어있음
          // searchInput : 검색어
          // requestType : 어떤 정렬을 원하는지
          // startNo : 포스트 시작 번호
          // endNo : 포스트 끝 번호
          if(searchType.equals("all")) { // 통합검색 & 누적 판매순
             
              sql = "with order_cnt as(select book_num, sum(order_qty) as order_year"
                  + "                   from book_order"
                  + "                  where sysdate - order_date <= 365" // 기간설정 
                  + "                  group by book_num"
                  + "),order_cnt_num as (select b.* , case when o.order_year is null then 0 else o.order_year end as order_year"
                  + "                      from book b"
                  + "                      left join order_cnt o"
                  + "                         on b.book_num = o.book_num"
                  + "                      where (book_name like '%" + searchInput + "%'"
                  + "                         or book_writer like '%" + searchInput + "%'"
                  + "                         or book_publisher like '%" + searchInput + "%'"
                  + "                         or book_cont like '%" + searchInput + "%')"
                  + "),order_cnt_row as("
                  + "                    select ROW_NUMBER() over(order by "+requestSearch +" ) as row_num"
                  + "                         , y.*"
                  + "                      from order_cnt_num y)"
                  + "select r.*"
                  + "   from order_cnt_row r"
                  + "  where r.row_num>= "+ startNo + "and r.row_num<=" + endNo
                  + "  order by r.row_num" ;
            
          }else {
              
              sql = "with order_cnt as(select book_num, sum(order_qty) as order_year"
                  + "                   from book_order"
                  + "                  where sysdate - order_date <= 365" // 기간설정 
                  + "                  group by book_num"
                  + "),order_cnt_num as (select b.*, case when o.order_year is null then 0 else o.order_year end as order_year"
                  + "                      from book b"
                  + "                      left join order_cnt o"
                  + "                         on b.book_num = o.book_num "
                  + "                      where b.cgy_num = '"+ searchType +"'"
                  + "                        and (b.book_name like '%" + searchInput + "%'"
                  + "                         or b.book_writer like '%" + searchInput + "%'"
                  + "                         or b.book_publisher like '%" + searchInput + "%'"
                  + "                         or b.book_cont like '%" + searchInput + "%')"
                  + "),order_cnt_row as("
                  + "                    select ROW_NUMBER() over(order by "+requestSearch +" ) as row_num"
                  + "                         , y.*"
                  + "                      from order_cnt_num y)"
                  + "select r.*"
                  + "   from order_cnt_row r"
                  + "  where r.row_num>= "+ startNo + "and r.row_num<=" + endNo
                  + "  order by r.row_num" ;
          }
          
          pstmt = con.prepareStatement(sql);
          rs = pstmt.executeQuery();
          
          while(rs.next()) {
              BookDTO bookDto = new BookDTO();
              bookDto.setRownum(rs.getInt("row_num"));
              bookDto.setBook_num(rs.getInt("book_num"));
              bookDto.setCgy_num(rs.getString("cgy_num"));
              bookDto.setBook_name(rs.getString("book_name"));
              bookDto.setBook_price(rs.getInt("book_price"));
              bookDto.setBook_qty(rs.getInt("book_qty"));
              bookDto.setBook_cont(rs.getString("book_cont"));
              bookDto.setBook_img(rs.getString("book_img"));
              bookDto.setBook_date(rs.getString("book_date"));
              bookDto.setBook_update(rs.getString("book_update"));
              bookDto.setBook_writer(rs.getString("book_writer"));
              bookDto.setBook_publisher(rs.getString("book_publisher"));
              bookDto.setBook_sales(rs.getInt("book_sales"));
              bookDto.setBook_page(rs.getInt("book_page"));
              
              bookCgyList.add(bookDto);
              
          }
          
          System.out.println("-------------BookDAO : getCgyBooks() 검색용 메서드 실행완료..");
      } catch (Exception e) { e.printStackTrace();
      } finally { closeConn(rs, pstmt, con);
      }
      
      return bookCgyList;
      
  }
  
  // ---------------------------------------- 마이페이지 추천 -------------------------------------------------- 
 /**
  * @see .추천책
  */
  public List<BookDTO> recommendBook(int mem_num){
      
      System.out.println("------------ bookDao : recommendBook() 메서드 실행");
      List<BookDTO> bookList = new ArrayList<BookDTO>();
      String cgy_num = null;
      
      try {
          
          openConn();
          
          // 한달이내 자주 구매하는 카테고리
          sql = "select bo.mem_num"
              + "      , max(cgy_num) as max_order_cgy"
              + "   from book_order bo"
              + "   join book b "
              + "     on bo.book_num = b.book_num"
              + "  where sysdate - order_date <= 30"
              + "    and mem_num = "+ mem_num
              + "  group by mem_num";
          pstmt = con.prepareStatement(sql);
          rs = pstmt.executeQuery();
          
          if(rs.next()) {
              cgy_num = rs.getString("max_order_cgy");
          }
          
       // 자주 주문하는 카테고리 한달 주문건 desc
          sql = "select b.book_num"
              + "     , book_name"
              + "     , book_img"
              + "  from book b"
              + "  join (select book_num "
              + "              , sum(order_qty) as order_year"
              + "           from book_order"
              + "          where sysdate - order_date <= 30"
              + "          group by book_num"
              + "          order by order_year desc) o"
              + "     on b.book_num = o.book_num "
              + "  where b.cgy_num = '"+ cgy_num + "'";
          
              pstmt = con.prepareStatement(sql);
              rs = pstmt.executeQuery();
              
              while(rs.next()) {
                  BookDTO bookDto = new BookDTO();
                  
                  bookDto.setBook_num(rs.getInt("book_num"));
                  bookDto.setBook_name(rs.getString("book_name"));
                  bookDto.setBook_img(rs.getString("book_img"));
                  
                  bookList.add(bookDto);
              }
          
      } catch (Exception e) { e.printStackTrace();
      } finally { closeConn(rs, pstmt, con);
      }
      
      return bookList;
      
  }
  
  
  
  
  //----------------------------------------------------------------------------------------------------------
}