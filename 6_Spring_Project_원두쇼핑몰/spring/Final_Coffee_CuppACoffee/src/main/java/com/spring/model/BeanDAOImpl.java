package com.spring.model;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Repository
public class BeanDAOImpl implements BeanDAO{
	
	@Inject
	private SqlSessionTemplate sqlSession;

	// 원두 전체 목록 리스트 뽑기
	@Override
	public List<CoffeeBeanDTO> getBeanList() {
		
		return this.sqlSession.selectList("list");
	}

	// 원두 전체 수량 뽑기
	@Override
	public String getBeansCount() {
		return this.sqlSession.selectOne("beansCount");
	}

	// 찜 많은 순 리스트
	@Override
	public List<CoffeeBeanDTO> getBeanHeartList() {
		
		return this.sqlSession.selectList("heartlist");
	}
	
	// 가격 낮은 순 리스트
	@Override
	public List<CoffeeBeanDTO> BeanPriceDownList() {
		
		return this.sqlSession.selectList("pricedownlist");
	}	
	
	// 가격 높은 순 리스트
	@Override
	public List<CoffeeBeanDTO> BeanPriceUpList() {
		return this.sqlSession.selectList("priceuplist");
	}	

	// 별점 5점 리스트
	@Override
	public List<CoffeeBeanDTO> BeanStar5List() {
		return this.sqlSession.selectList("star5list");
	}	
	
	// 별점 4점 리스트
	@Override
	public List<CoffeeBeanDTO> BeanStar4List() {
		return this.sqlSession.selectList("star4list");
	}

	// 별점 3점 리스트
	@Override
	public List<CoffeeBeanDTO> BeanStar3List() {
		return this.sqlSession.selectList("star3list");
	}

	// 별점 2점 리스트
	@Override
	public List<CoffeeBeanDTO> BeanStar2List() {
		return this.sqlSession.selectList("star2list");
	}

	// 별점 1점 리스트
	@Override
	public List<CoffeeBeanDTO> BeanStar1List() {
		return this.sqlSession.selectList("star1list");
	}
	
	
	
	
	
	
	// 원두 상세보기 정보
	@Override
	public CoffeeBeanDTO getBeanContent(int num) {
		return this.sqlSession.selectOne("Cont", num);
	}

	// 찜하기 여부 조회
	@Override
	public CoffeeStarDTO seHeart(Map<String, Integer> map) {
		return this.sqlSession.selectOne("heartmap1", map);
	}

	// 찜하기 추가
	@Override
	public void insertHeart(Map<String, Integer> map) {
		this.sqlSession.selectOne("insertHeart1", map);
	}

	// 찜하기 업데이트
	@Override
	public void updateHeart(Map<String, Integer> map) {
		this.sqlSession.selectOne("updateHeart1", map);
	}

	// 후기글 리스트 
	@Override
	public List<CoffeeWriteDTO> getWriteList(int num) {
		return this.sqlSession.selectList("writeList", num);
	}
	
	// 후기글 추가 글
	@Override
	public int seWrite(Map<String, Object> map) {
		return this.sqlSession.insert("insertWrite", map);
	}

	// 후기글 추가 시 별점도 추가
	@Override
	public int insertWriteStar(Map<String, Object> map) {
		return this.sqlSession.insert("writeStar", map);
	}
	
	// 후기글 추가 시 별점도 업데이트
	@Override
	public int updateWriteStar(Map<String, Object> map) {
		return this.sqlSession.update("writeUpdateStar", map);
	}
	
	/* list 페이지에서 상세보기 눌렀을 때 후기글 몇 개 인지 조회하는 메서드. */
	@Override
	public int getWriteCount(int num) {
		return this.sqlSession.selectOne("writeCount", num);
	}

	// 별점 개수?
	@Override
	public int checkWrite(Map<String, Object> map) {
		return this.sqlSession.selectOne("checkWrite", map);
	}

	// 후기글 삭제
	@Override
	public int deleteWrite(int write_num) {
		return this.sqlSession.delete("deleteWrite", write_num);
	}

	// 만약에 이미 하트때문에 추가가 되어있다면 update문으로 별점만 바꿔주기.
	@Override
	public void updateStar(CoffeeStarDTO dto_1) {
		this.sqlSession.update("updateStar", dto_1);
		
	}

	// 그게 아니라면 insert 해주기.
	@Override
	public void insertStar(CoffeeStarDTO dto_1) {
		this.sqlSession.insert("insertStar", dto_1);
	}

	// 후기글 삭제시 별점도 같이 0으로 update
	@Override
	public int deleteStar(Map<String, Integer> map) {
		return this.sqlSession.update("deleteStar", map);
		
	}

	// 후기글 평점 평균
	@Override
	public int starAvg(int num) {
		return this.sqlSession.selectOne("starAvg", num);
	}

	@Override
	public int starCheck(int num) {
		return this.sqlSession.selectOne("starCheck", num);
	}

	@Override
	public int writeCheck(Map<String, Integer> map) {
		return this.sqlSession.selectOne("writeCheck", map);
	}

	@Override
	public int buyCheck(Map<String, Integer> map) {
		return this.sqlSession.selectOne("buyCheck", map);
	}






}
