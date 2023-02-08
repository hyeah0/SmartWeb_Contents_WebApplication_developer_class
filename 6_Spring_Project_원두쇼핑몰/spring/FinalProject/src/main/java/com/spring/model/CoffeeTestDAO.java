package com.spring.model;

import java.util.List;
import java.util.Map;

public interface CoffeeTestDAO {

	// 테스트 1: 커피 브루(커피 내리는 방식)
	List<Map<String, Object>> getBrewTest();
	
	// 테스트 2 : 커피 첨가물
	List<Map<String, Object>> getAddTest();
	
	// 테스트 3 : 커피 디카페인
	List<Map<String, Object>> getDecafTest();
	
	// 테스트 4 : 커피 산미
	List<Map<String, Object>> getAcidTest();
	
	// 테스트 5 : 커피 맛
	List<Map<String, Object>> getTasteTest();
	
	// 테스트 6 : 커피 갈기
	List<Map<String, Object>> getGrindTest();
	
	// 결과 testNum 가져오기 
	List<Map<String, Object>> getTestResultTypeNum(Map<String, Integer> testChooseMap);
	
	// 결과값 final_member 테이블에 저장하기
	int updateTestResultTypeNum(Map<String, Integer> testResultTypeMap);
}
