package com.spring.model;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;


public interface BeanDAO {

	List<CoffeeBeanDTO> getBeanList();
	
	String getBeansCount();
	
	List<CoffeeBeanDTO> getBeanHeartList();
	
	List<CoffeeBeanDTO> BeanPriceDownList();
	
	List<CoffeeBeanDTO> BeanPriceUpList();
	
	List<CoffeeBeanDTO> BeanStar5List();
	List<CoffeeBeanDTO> BeanStar4List();
	List<CoffeeBeanDTO> BeanStar3List();
	List<CoffeeBeanDTO> BeanStar2List();
	List<CoffeeBeanDTO> BeanStar1List();
	
	
	CoffeeStarDTO seHeart(Map<String, Integer> map);
	void insertHeart(Map<String, Integer> map);
	void updateHeart(Map<String, Integer> map);
	
//	void beanHeartUp(Map<String, Integer> map);
//	void beanHeartDown(Map<String, Integer> map);
	
	CoffeeBeanDTO getBeanContent(int num);
	
	int getWriteCount(int num);
	
	List<CoffeeWriteDTO> getWriteList(int num);
	/* List<CoffeeWriteDTO> getWriteListStar(int num); */

	int starAvg(int num);
	int starCheck(int num);
	
	int writeCheck(Map<String, Integer> map);
	
	int seWrite(Map<String, Object> map);
	int insertWriteStar(Map<String, Object> map);
	int updateWriteStar(Map<String, Object> map);
	
	int checkWrite(Map<String, Object> map);
	
	int buyCheck(Map<String, Integer> map);
	
	
	// 후기글 삭제
	int deleteWrite(int write_num);
	// 후기글 삭제시 star도 삭제
	int deleteStar(Map<String, Integer> map);
	
	
	
	// 후기글 별점 업데이트
	void updateStar(CoffeeStarDTO dto_1);
	
	// 후기글 별점 insert
	void insertStar(CoffeeStarDTO dto_1);
	
	
	
}
