package com.spring.model;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

public interface CoffeeOrderDAO {

	// 상품 정보 가져오는 메서드
	CoffeeBeanDTO getProduct(int beans_num);
		
	// 멤버 정보 가져오기
	FinalMemberDTO getMemberCont(int member_num);
	
	// 장바구니 목록 가져오기
	List<CoffeeOrderDTO> getCartListFin(List<Integer> cartList);
	
	// 주문 테이블 등록하기 & 재고 마이너스 처리 (여러상품 주문일 경우 & 장바구니통해서 주문)
	int insertOrder(List<CoffeeOrderDTO> orderDto);
	int updateBeanCnt(List<CoffeeOrderDTO> orderDto);
	
	// 주문 테이블 등록하기 & 재고 마이너스 처리 (바로가기 주문일 경우)
	int insertOneOrder(CoffeeOrderDTO orderDto);
	int updateOneBeanCnt(CoffeeOrderDTO orderDto);
	
	// 멤버 포인트 업데이트
	int updatePoint(Map<String, Object> map);
	
	// 장바구니 삭제
	int deleteCart(List<CoffeeOrderDTO> orderDto);
	
	// 주문내역 가져오기
	List<CoffeeOrderDTO> getOrderCont(String order_num);
	
	// 주문목록 가져오기(list)
	List<CoffeeOrderDTO> getOrderList(Map<String, Object> stEnRowMap);
	
	// 주문 타입 수정
	int updateOrderType(Map<String, Object> typeMap);
	
	// 포인트 사용시 포인트 취소
	int updateUsePointCancel(Map<String, Object> typeMap);
	
	// 주문건 수 확인(아무것도 선택안할경우, 타입선택, 일자선택, 타입&일자 선택일때 사용)
	int getSelectedRowCount(Map<String, Object> selectedMap);
	
	// 배송 타입별 주문건수 가져오기 
	List<Map<String, Integer>>  getDeliveryTypeCnt(int member_num);
	
	//////////////////////////////////////////////////////////////////////////////
	// 관리자 배송
	
	// 배송 타입별 주문건수(배송대기, 배송중 .. 건수)
	List<Map<String, Integer>>  getDeliveryTypeCntA();
	
	// 주문건수 확인_페이징 totalRecord (타입선택 안함)
	int getRowCountAdmin();
	
	// 주문건수 확인_페이징 totalRecord (타입선택 함)
	int getRowTypeCountAdmin(int type_num);
	
	// 주문리스트
	List<CoffeeOrderDTO> getOrderListAdmin(Map<String, Object> stEnRowMap);
	
	// row 배송 타입번호(type_num) 변경
	int updateRowTypeNum(String order_num);
	
	// 배송대기중인 전체 배송 타입번호(type_num) 1:배송중으로 변경
	int updateAllTypeNum();
	
}
