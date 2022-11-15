```
package com.spring.di02;

public class ServiceImpl {

	private DAO dao;

	// 기본생성자
	public ServiceImpl() {

	}

	// 인자생성자
	public ServiceImpl(DAO dao) {
		this.dao = dao;
	}

	// 메서드
	public DAO getDao() {
		return dao;
	}

	public void setDao(DAO dao) {
		this.dao = dao;
	}

	// 비지니스 로직
	public void biz() {
		this.dao.add();
	}

}

```
