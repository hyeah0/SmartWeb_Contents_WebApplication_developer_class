package com.book.model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = null;

    private static CartDAO instance;

    private CartDAO() {

    }

    public static CartDAO getInstance() {

        if (instance == null) {
            instance = new CartDAO();
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
            if (rs != null) rs.close();

            if (pstmt != null) pstmt.close();

            if (con != null) con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertCart(int book_num, int mem_num, int cart_qty) {

        int count = 0;

        try {
            openConn();

            sql = "select max(cart_num) from cart";

            pstmt = con.prepareStatement(sql);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1) + 1;
            }

            sql = "insert into cart values (?, ?, ?, ?)";

            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, count);
            pstmt.setInt(2, book_num);
            pstmt.setInt(3, mem_num);
            pstmt.setInt(4, cart_qty);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConn(rs, pstmt, con);
        }
    }
    // 상세정보 페이지에서 장바구니에 상품을 담는 메서드.
    public int countUpdate(int book_num, int mem_num, int cart_qty) {

        int result = 0;

        try {
            openConn();

            sql = "select * from cart where book_num = ? and mem_num = ?";

            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, book_num);
            pstmt.setInt(2, mem_num);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                result = 1;

                sql = "update cart set cart_qty = cart_qty + ? where book_num = ? and mem_num = ?";

                pstmt = con.prepareStatement(sql);

                pstmt.setInt(1, cart_qty);
                pstmt.setInt(2, book_num);
                pstmt.setInt(3, mem_num);

                pstmt.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConn(rs, pstmt, con);
        }

        return result;
    }

    // 장바구니에 담긴 상품을 각각 cart_num(pk)로 받아오는 메서드.
    public List<BookDTO> getBookList(int num) {

        List<BookDTO> list = new ArrayList<>();

        try {
            openConn();

            sql = "select b.book_img, b.book_name, b.book_price, c.cart_qty from cart c inner join book b on b.book_num = c.book_num inner join member m on c.mem_num = m.mem_num where m.mem_num = ? order by c.cart_num";

            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                BookDTO dto = new BookDTO();

                dto.setBook_img(rs.getString("book_img"));
                dto.setBook_name(rs.getString("book_name"));
                dto.setBook_price(rs.getInt("book_price"));

                list.add(dto);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConn(rs, pstmt, con);
        }

        return list;
    }

    // 주문 수량(cart_qty)을 받아오기 위해 cart 테이블 전체 리스트를 조회하는 메서드.
    public List<CartDTO> getCartList(int num) {

        List<CartDTO> list = new ArrayList<>();

        try {
            openConn();

            sql = "select * from cart where mem_num = ? order by cart_num";

            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                CartDTO dto = new CartDTO();

                dto.setCart_num(rs.getInt("cart_num"));
                dto.setBook_num(rs.getInt("book_num"));
                dto.setMem_num(rs.getInt("mem_num"));
                dto.setCart_qty(rs.getInt("cart_qty"));

                list.add(dto);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConn(rs, pstmt, con);
        }

        return list;
    }

    // 장바구니에 담은 상품의 부분합계를 구하는 메서드.
    public int getCartSum(int num) {

        int result = 0;

        try {
            openConn();

            sql = "select sum(b.book_price * c.cart_qty) as total from cart c inner join book b on b.book_num = c.book_num where c.mem_num = ?";

            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                result = rs.getInt("total");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConn(rs, pstmt, con);
        }

        return result;
    }

    // 장바구니에 담긴 상품을 삭제하는 메서드.
    public int deleteCart(int num) {

        int result = 0;

        try {
            openConn();

            sql = "delete from cart where cart_num = ?";

            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, num);

            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConn(rs, pstmt, con);
        }

        return result;
    }

    // 장바구니에서 상품의 수량을 변경했을 때 cart 테이블 DB에 저장하는 메서드.
    public int updateCnt(int cnt, int num) {

        int result = 0;

        try {
            openConn();

            sql = "update cart set cart_qty = ? where cart_num = ?";

            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, cnt);
            pstmt.setInt(2, num);

            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConn(rs, pstmt, con);
        }
        return result;
    }

    // 장바구니에서 주문한 상품들을 결제창에서 보여주는 메서드.
    public List<CartDTO> getPayList(int num, List<Integer> check) {

        List<CartDTO> list = new ArrayList<>();

        StringBuilder str = new StringBuilder();

        for (int i = 0; i < check.size(); i++) {
            if (i == check.size() - 1) {
                str.append("cart_num = ").append("?");
            }else {
                str.append("cart_num = ").append("?").append(" or ");
            }
        }

        try {
            openConn();

            sql = "select c.cart_qty, c.cart_num from cart c inner join book b on b.book_num = c.book_num where c.mem_num = ? and " + str + " order by c.cart_num";

            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, num);

            int su = 2;

            for (int item : check){
                pstmt.setInt(su++, item);
            }

            rs = pstmt.executeQuery();

            while (rs.next()) {
                CartDTO dto = new CartDTO();

                dto.setCart_num(rs.getInt("cart_num"));
                dto.setCart_qty(rs.getInt("cart_qty"));

                list.add(dto);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConn(rs, pstmt, con);
        }

        return list;
    }

    // 장바구니에 담긴 상품을 각각 cart_num(pk)로 받아오는 메서드.
    public List<BookDTO> getBookPayList(int num, List<Integer> check) {

        List<BookDTO> list = new ArrayList<>();

        StringBuilder str = new StringBuilder();

        for (int i = 0; i < check.size(); i++) {
            if (i == check.size() - 1) {
                str.append("cart_num = ").append("?");
            }else {
                str.append("cart_num = ").append("?").append(" or ");
            }
        }

        try {
            openConn();

            sql = "select b.book_img, b.book_name, b.book_price, b.book_num from cart c inner join book b on b.book_num = c.book_num inner join member m on c.mem_num = m.mem_num where m.mem_num = ? and " + str + "order by c.cart_num";

            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);

            int su = 2;

            for (int item : check){
                pstmt.setInt(su++, item);
            }

            rs = pstmt.executeQuery();

            while (rs.next()) {
                BookDTO dto = new BookDTO();

                dto.setBook_img(rs.getString("book_img"));
                dto.setBook_name(rs.getString("book_name"));
                dto.setBook_price(rs.getInt("book_price"));
                dto.setBook_num(rs.getInt("book_num"));

                list.add(dto);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConn(rs, pstmt, con);
        }

        return list;
    }

    // 결제창의 배송정보 입력란에 로그인 한 회원의 정보를 불러오는 메서드.
    public MemberDTO getMemberInfo(int no) {

        MemberDTO dto = null;

        try {
            openConn();

            sql = "select * from member where mem_num = ?";

            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, no);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto = new MemberDTO();
                dto.setMem_num(rs.getInt("mem_num"));
                dto.setMem_id(rs.getString("mem_id"));
                dto.setMem_pwd(rs.getString("mem_pwd"));
                dto.setMem_name(rs.getString("mem_name"));
                dto.setMem_phone(rs.getString("mem_phone"));
                dto.setMem_addr(rs.getString("mem_addr"));
                dto.setMem_mail(rs.getString("mem_mail"));
                dto.setMem_card_num(rs.getString("mem_card_num"));
                dto.setMem_card_pwd(rs.getInt("mem_card_pwd"));
                dto.setMem_mileage(rs.getInt("mem_mileage"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeConn(rs, pstmt, con);
        }
        return dto;
    }

    // 결제창에서 회원이 등록한 카드번호/카드 비밀번호가 결제 시 이용하는 카드번호/카드 비밀번호와 일치하는지 확인하는 메서드.
    public int cardCheck(String card_num, int pwd, int mem_num) {

        int result = 0;     // 등록되지 않은 카드인 경우

        try {
            openConn();

            sql = "select * from member where mem_card_num = ? and mem_num = ?";

            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, card_num);
            pstmt.setInt(2, mem_num);

            rs = pstmt.executeQuery();

            if(rs.next()) {
                if(pwd == rs.getInt("mem_card_pwd")) {
                    // 등록된 카드인 경우
                    result = 1;
                }else {
                    // 카드번호는 맞으나 카드 비밀번호가 틀린 경우
                    result = -1;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConn(rs, pstmt, con);
        }

        return result;
    }

    // 결제창에서 결제하기 실행이 됐을 경우 합계금액의 1%만큼 마일리지를 update 하는 메서드.
    public void updateMileage(int mem_num, double mileage) {

        try {
            openConn();

            sql = "update member set mem_mileage = mem_mileage + ? where mem_num = ?";

            pstmt = con.prepareStatement(sql);

            pstmt.setDouble(1, mileage);
            pstmt.setInt(2, mem_num);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConn(rs, pstmt, con);
        }
    }

    // 결제 완료 시 장바구니에서 체크한(주문한) 상품을 삭제하는 메서드.
    public void deletePaidItem(int num, int[] list) {

        StringBuilder str = new StringBuilder();

        for (int i = 0; i < list.length; i++) {
            if (i == list.length - 1) {
                str.append("cart_num = ").append("?");
            }else {
                str.append("cart_num = ").append("?").append(" or ");
            }
        }

        try {
            openConn();

            sql = "delete from cart where mem_num = ? and "+ str;

            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, num);

            int su = 2;

            for (int item : list){
                pstmt.setInt(su++, item);
            }

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConn(rs, pstmt, con);
        }
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
}
