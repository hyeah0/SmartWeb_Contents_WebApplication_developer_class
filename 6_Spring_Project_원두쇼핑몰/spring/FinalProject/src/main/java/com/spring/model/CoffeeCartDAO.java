package com.spring.model;

import java.util.List;
import java.util.Map;

public interface CoffeeCartDAO {
	
	// 장바구니 추가/수정 메서드
	CoffeeCartDTO getCart(Map<String, Integer> cartMap);
	int insertCart(CoffeeCartDTO cartDTO);
	int updateCart(Map<String, Integer> cartMap);
	
	// 장바구니 가져오는 메서드
	List<CoffeeCartDTO> getCartList(int member_num);
	
	// 찜 추가/수정 메서드
	CoffeeCartDTO inHeart(Map<String, Integer> heartMap);
	void insertHeart(Map<String, Integer> heartMap);
	void updateHeart(Map<String, Integer> heartMap);
	
	// 장바구니 삭제 메서드
	int deleteCartRow(int cartNum);
	
	// 장바구니에서 수량, 그람 수정 메서드
	// 수량 업데이트 
	int updateCartCnt(Map<String, Integer> cartCntMap);
	
	// 그람 업데이트
	int updateCartGram(Map<String, Integer> cartGramMap);
	
	// 추천 리스트 가져오는 메서드
	// 카트에 상품이 있을 경우 (카트에 담겨져있는 맛 기준)
	List<CoffeeCartDTO> getRecListCart(int member_num);
	
	// 카트에 상품이 없을 경우 (주문한 맛 기준)
	List<CoffeeCartDTO> getRecListOrder(int member_num);
}
