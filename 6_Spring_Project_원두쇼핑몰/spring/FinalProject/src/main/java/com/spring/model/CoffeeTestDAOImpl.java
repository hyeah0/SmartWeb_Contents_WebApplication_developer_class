package com.spring.model;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CoffeeTestDAOImpl implements CoffeeTestDAO{
	
	@Inject
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, Object>> getBrewTest() {
		return this.sqlSession.selectList("getBrewTest");
	}

	@Override
	public List<Map<String, Object>> getAddTest() {
		return this.sqlSession.selectList("getAddTest");
	}

	@Override
	public List<Map<String, Object>> getDecafTest() {
		return this.sqlSession.selectList("getDecafTest");
	}

	@Override
	public List<Map<String, Object>> getAcidTest() {
		return this.sqlSession.selectList("getAcidTest");
	}

	@Override
	public List<Map<String, Object>> getTasteTest() {
		return this.sqlSession.selectList("getTasteTest");
	}

	@Override
	public List<Map<String, Object>> getGrindTest() {
		return this.sqlSession.selectList("getGrindTest");
	}
	
	@Override
	public List<Map<String, Object>> getTestResultTypeNum(Map<String, Integer> testChooseMap) {
		return this.sqlSession.selectList("getTestResultTypeNum", testChooseMap);
	}

	@Override
	public int updateTestResultTypeNum(Map<String, Integer> testResultTypeMap) {
		return this.sqlSession.update("updateTestResultTypeNum", testResultTypeMap);
	}

	
	
}
