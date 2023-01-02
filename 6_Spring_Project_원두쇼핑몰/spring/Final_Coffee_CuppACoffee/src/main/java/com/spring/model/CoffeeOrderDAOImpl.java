package com.spring.model;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CoffeeOrderDAOImpl implements CoffeeOrderDAO {

	@Inject
	private SqlSessionTemplate sqlSession;

	@Override
	public CoffeeBeanDTO getProduct(int beans_num) {
		return this.sqlSession.selectOne("product", beans_num);
	}
	
	@Override
	public FinalMemberDTO getMemberCont(int member_num) {
		return this.sqlSession.selectOne("getMemberCont", member_num);
	}
	
	@Override
	public List<CoffeeOrderDTO> getCartListFin(List<Integer> cartList) {
		return this.sqlSession.selectList("getCartListFin", cartList);
	}

	// 주문 테이블 등록하기 & 재고 마이너스 처리 (여러상품 주문일 경우 & 장바구니통해서 주문)
	@Override
	public int insertOrder(List<CoffeeOrderDTO> orderDto) {
		return this.sqlSession.update("insertOrder", orderDto);
	}
	// 한번에 여러행 추가 방법 : https://aljjabaegi.tistory.com/528

	@Override
	public int updateBeanCnt(List<CoffeeOrderDTO> orderDto) {
		return this.sqlSession.update("updateBeanCnt", orderDto);
	}
	
	// 주문 테이블 등록하기 & 재고 마이너스 처리 (바로가기 주문일 경우)
	@Override
	public int insertOneOrder(CoffeeOrderDTO orderDto) {
		return this.sqlSession.insert("insertOneOrder", orderDto);
	}
	
	@Override
	public int updateOneBeanCnt(CoffeeOrderDTO orderDto) {
		return this.sqlSession.update("updateOneBeanCnt", orderDto);
	}
	
	// 업데이트 포인트
	@Override
	public int updatePoint(Map<String, Object> map) {
		return this.sqlSession.update("updatePoint", map);
	}

	// 장바구니 삭제
	@Override
	public int deleteCart(List<CoffeeOrderDTO> orderDto) {
		return this.sqlSession.delete("deleteCart", orderDto);
	}

	// 주문내역
	@Override
	public List<CoffeeOrderDTO> getOrderCont(String order_num) {
		return this.sqlSession.selectList("getOrderCont", order_num);
	}

	// 주문내역 리스트
	@Override
	public List<CoffeeOrderDTO> getOrderList(Map<String, Object> stEnRowMap) {
		return this.sqlSession.selectList("getOrderList", stEnRowMap);
	}


	// 주문타입 수정 (주문취소처리, 배송완료처리)
	@Override
	public int updateOrderType(Map<String, Object> typeMap) {
		return this.sqlSession.update("updateOrderType", typeMap);
	}

	// 포인트 사용시 사용 취소
	@Override
	public int updateUsePointCancel(Map<String, Object> typeMap) {
		return this.sqlSession.update("updateUsePointCancel", typeMap);
	}

	// 주문건 수 확인(아무것도 선택안할경우, 타입선택, 일자선택, 타입&일자 선택일때 사용)
	@Override
	public int getSelectedRowCount(Map<String, Object> selectedMap) {
		return this.sqlSession.selectOne("getRowCount", selectedMap);
	}
	
	// 배송 타입별 주문건수 가져오기 (배송완료, 배송중... 수량)
	@Override
	public List<Map<String, Integer>> getDeliveryTypeCnt(int member_num) {
		return this.sqlSession.selectList("getDeliveryTypeCnt", member_num);
	}
	
	
	//////////////////////////////////////////////////////////////////////////////
	// 관리자 배송
	
	// 배송 타입별 주문건수(배송대기, 배송중 .. 건수)
	@Override
	public List<Map<String, Integer>> getDeliveryTypeCntA() {
		return this.sqlSession.selectList("getDeliveryTypeCntAdmin");
	}
	
	// 주문건수 확인_페이징 totalRecord (타입선택 안함)
	@Override
	public int getRowCountAdmin() {
		return this.sqlSession.selectOne("getRowCountAdmin");
	}
	
	// 주문건수 확인_페이징 totalRecord (타입선택 함)
	@Override
	public int getRowTypeCountAdmin(int type_num) {
		return this.sqlSession.selectOne("getTypeRowCountAdmin", type_num);
	}

	// 주문리스트
	@Override
	public List<CoffeeOrderDTO> getOrderListAdmin(Map<String, Object> stEnRowMap) {
		return this.sqlSession.selectList("getOrderListAdmin", stEnRowMap);
	}

	// row 타입번호 변경
	@Override
	public int updateRowTypeNum(String order_num) {
		return this.sqlSession.update("updateRowTypeNum",order_num);
	}

	// 배송대기중인 전체 타입번호 1:배송중으로 변경
	@Override
	public int updateAllTypeNum() {
		return this.sqlSession.update("updateAllTypeNum");
	}

	@Override
	public int getMemberPoint(int member_num) {
		return this.sqlSession.selectOne("getMemberPoint", member_num);
	}



	
}
