package com.spring.model;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CoffeeCartDAOImpl implements CoffeeCartDAO {

	@Inject
	private SqlSessionTemplate sqlSession;
	
	// 장바구니 요청 상품 유무 확인
	@Override
	public CoffeeCartDTO getCart(Map<String, Integer> cartMap) {
		return this.sqlSession.selectOne("findCart", cartMap);
	}
	
	// 장바구니 테이블에 상품 추가
	@Override
	public int insertCart(CoffeeCartDTO cartDTO) {
		return this.sqlSession.insert("insertCart", cartDTO );
	}
	
	@Override
	public int updateCart(Map<String, Integer> cartMap) {
		return this.sqlSession.update("updateCart", cartMap);
	}
	
	@Override
	public List<CoffeeCartDTO> getCartList(int member_num) {
		return this.sqlSession.selectList("getCartList", member_num);
	}
	
	// 장바구니 페이지 : 찜 --------------------------------------------------------------------------------
	@Override
	public CoffeeCartDTO inHeart(Map<String, Integer> heartMap) {
		return this.sqlSession.selectOne("heartMap",heartMap);
	}

	@Override
	public void insertHeart(Map<String, Integer> heartMap) {
		this.sqlSession.insert("insertHeart",heartMap);
	}

	@Override
	public void updateHeart(Map<String, Integer> heartMap) {
		this.sqlSession.update("updateHeart",heartMap);
	}
	
	// 장바구니 페이지 : 장바구니 row 삭제 -------------------------------------------------------------------
	@Override
	public int deleteCartRow(int cartNum) {
		return this.sqlSession.delete("deleteCartNum",cartNum);
	}
	
	// 장바구니 페이지 : 수량 수정 --------------------------------------------------------------------------
	@Override
	public int updateCartCnt(Map<String, Integer> cartCntMap) {
		return this.sqlSession.update("updateCartCnt",cartCntMap);
	}

	// 장바구니 페이지 : 그람 수정 --------------------------------------------------------------------------
	@Override
	public int updateCartGram(Map<String, Integer> cartGramMap) {
		return this.sqlSession.update("updateCartGram",cartGramMap);
	}

	// 추천 상품
	@Override
	public List<CoffeeCartDTO> getRecListCart(int member_num) {
		return this.sqlSession.selectList("getRecListCart",member_num);
	}

	@Override
	public List<CoffeeCartDTO> getRecListOrder(int member_num) {
		return this.sqlSession.selectList("getRecListOrder",member_num);
	}


}
