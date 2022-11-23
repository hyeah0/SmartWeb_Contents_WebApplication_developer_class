package com.book.model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    String sql = null;

    private static OrderDAO instance;

    private OrderDAO() {

    }

    public static OrderDAO getInstance() {

        if (instance == null) {
            instance = new OrderDAO();
        }

        return instance;
    }

    public void openConn() {

        try {
            Context ctx = new InitialContext();

            DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");

            connection = ds.getConnection();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void closeConn(ResultSet resultSet, PreparedStatement preparedStatement, Connection connection) {

        try {
            if (resultSet != null) resultSet.close();

            if (preparedStatement != null) preparedStatement.close();

            if (connection != null) connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 결제 완료 시 order 테이블에 주문 내역을 담는 메서드.
    public void insertOrder(int bookNum, int memNum, int qty) {

        int count = 0;

        try {
            openConn();

            sql = "select max(order_num) from book_order";

            preparedStatement = connection.prepareStatement(sql);

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                count = resultSet.getInt(1) + 1;
            }

            sql = "insert into book_order values (?, ?, ?, ?, sysdate)";

            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, count);
            preparedStatement.setInt(2, bookNum);
            preparedStatement.setInt(3, memNum);
            preparedStatement.setInt(4, qty);

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConn(resultSet, preparedStatement, connection);
        }
    }

    // 결제 완료창에서 주문 내역을 불러오는 메서드.
    public List<OrderDTO> getOrderList(int mem_num) {

        List<OrderDTO> list = new ArrayList<>();

        try {
            openConn();

            sql = "select * from book_order where mem_num = ? order by order_num desc";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, mem_num);

            resultSet = preparedStatement.executeQuery();

            while(resultSet.next()) {
                OrderDTO dto = new OrderDTO();

                dto.setOrder_num(resultSet.getInt("order_num"));
                dto.setBook_num(resultSet.getInt("book_num"));
                dto.setMem_num(resultSet.getInt("mem_num"));
                dto.setOrder_qty(resultSet.getInt("order_qty"));
                dto.setOrder_date(resultSet.getString("order_date"));

                list.add(dto);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConn(resultSet, preparedStatement, connection);
        }

        return list;
    }
    //관리자 페이지에서 회원 결제 내역
    public List<OrderDTO> adminGetOrderList(int mem_num) {

        List<OrderDTO> list = new ArrayList<>();

        try {
            openConn();

            sql = "select * from book b left join book_order o on b.book_num = o.book_num where o.mem_num = ?";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, mem_num);

            resultSet = preparedStatement.executeQuery();

            while(resultSet.next()) {
                OrderDTO dto = new OrderDTO();

                dto.setOrder_num(resultSet.getInt("order_num"));
                dto.setBook_num(resultSet.getInt("book_num"));
                dto.setMem_num(resultSet.getInt("mem_num"));
                dto.setOrder_qty(resultSet.getInt("order_qty"));
                dto.setOrder_date(resultSet.getString("order_date"));
                dto.setBook_name(resultSet.getString("book_name"));
                dto.setBook_price(resultSet.getInt("book_price"));
                
                list.add(dto);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConn(resultSet, preparedStatement, connection);
        }

        return list;
    }
    
    public OrderDTO adminGetOrder(int order_num) {
    	OrderDTO dto = new OrderDTO();
    	
        try {
            openConn();

            sql = "select * from book b left join book_order o on b.book_num = o.book_num where o.order_num = ?";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, order_num);

            resultSet = preparedStatement.executeQuery();

            if(resultSet.next()) {

                dto.setOrder_num(resultSet.getInt("order_num"));
                dto.setBook_num(resultSet.getInt("book_num"));
                dto.setMem_num(resultSet.getInt("mem_num"));
                dto.setOrder_qty(resultSet.getInt("order_qty"));
                dto.setOrder_date(resultSet.getString("order_date"));
                dto.setBook_name(resultSet.getString("book_name"));
                dto.setBook_price(resultSet.getInt("book_price"));
                dto.setBook_img(resultSet.getString("book_img"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConn(resultSet, preparedStatement, connection);
        }

        return dto;
    }

	public int orderDelete(int order_num, int book_price) {
		int result = 0;
		
		try {
            openConn();

            sql = "delete from book_order where order_num = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, order_num);
            result = preparedStatement.executeUpdate();
            
            sql = "update book_order set order_num = order_num-1 where order_num > ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, order_num);
            preparedStatement.executeUpdate();
            
            sql = "update member set mem_mileage = mem_mileage - ? where mem_num in "
            		+ "(select m.mem_num from member m join book_order o on m.mem_num = o.mem_num where o.order_num = ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, book_price);
            preparedStatement.setInt(2, order_num);
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConn(resultSet, preparedStatement, connection);
        }
		
		return result;
	}

    public List<OrderDTO> getOrderDetail(int mem_num) {

        List<OrderDTO> detail = new ArrayList<>();

        try {
            openConn();

            sql = "with ordernum as (select 'o'||to_char(order_date, 'yyyyMMddhh24miss')||mem_num as order_tmp_num, order_num, order_date, bo.book_num, bo.mem_num, order_qty, b.book_price from book_order bo " +
                    "join book b on bo.book_num = b.book_num order by mem_num, order_num), " +
                    "ordernum2 as ( select order_tmp_num, max(order_date) as order_date, count(order_tmp_num) as order_count, max(mem_num) as mem_num, max(book_num) as repre_book_num, sum(order_qty) as total_order_qty, " +
                    "sum(book_price * order_qty) as total_order_price from ordernum where mem_num = ? group by order_tmp_num order by order_tmp_num desc) " +
                    "select o.order_tmp_num, o.order_date, o.order_count, o.mem_num, o.total_order_qty, o.total_order_price, b.book_num, b.book_name, b.book_img, b.book_price from ordernum2 o join book b on o.repre_book_num = b.book_num order by order_date desc";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, mem_num);

            resultSet = preparedStatement.executeQuery();

            while(resultSet.next()) {
                OrderDTO dto = new OrderDTO();

                dto.setBook_price(resultSet.getInt("book_price"));
                dto.setOrder_tmp_num(resultSet.getString("order_tmp_num"));
                dto.setOrder_date(resultSet.getString("order_date"));
                dto.setOrder_count(resultSet.getInt("order_count"));
                dto.setMem_num(resultSet.getInt("mem_num"));
                dto.setTotal_order_qty(resultSet.getInt("total_order_qty"));
                dto.setTotal_order_price(resultSet.getInt("total_order_price"));
                dto.setBook_num(resultSet.getInt("book_num"));
                dto.setBook_name(resultSet.getString("book_name"));
                dto.setBook_img(resultSet.getString("book_img"));

                detail.add(dto);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConn(resultSet, preparedStatement, connection);
        }

        return detail;
    }
}
