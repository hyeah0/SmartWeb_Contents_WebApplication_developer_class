```
package com.mybatis.model;

import lombok.Data;

// 페이징 처리 작업시 작업할 내용을 설정하는 객체
@Data
public class PageDTO {

	// 페이징 처리 관련 멤버 선언
	private int block = 3; 			// 아래에 보여질 최대 페이지 수
	private int rowsize = 4;		// 한 페이지 당 보여질 게시물의 수
	private int page;				// 현재 페이지
	private int totalRecord; 		// DB상 테이블 전체 레코드(행)의 수
	private int startNo;			// 해당 페이지에서 시작 글 번호
	private int endNo;				// 해당 페이지에서 끝 글 번호
	private int startBlock;			// 해당 페이지의 시작 블럭 번호
	private int endBlock;			// 해당 페이지의 끝 블럭 번호
	private int allPage;			// 전체 페이지 수

	// 검색 관련 멤버 선언
	private String field;
	private String keyword;

	// 기본 생성자
	public PageDTO() {}

	// 인자 생성자
	// 일반 - 페이징 처리 인자 생성자
	public PageDTO(int page, int rowsize, int totalRecord) {
		this.page = page;
		this.rowsize = rowsize;
		this.totalRecord = totalRecord;

		// 기준 - 현재 페이지 기준
		// 시작 글 번호
		this.startNo = (this.page * this.rowsize) - (this.rowsize - 1);

		// 끝 글 번호
		this.endNo = (this.page * this.rowsize);

		// 시작 블럭 번호
		this.startBlock = (((this.page -1 ) / this.block) * this.block) + 1;

		// 끝 블럭 번호
		this.endBlock = (((this.page -1 ) / this.block) * this.block) + this.block;

		// 전체 페이지 가져오기
		this.allPage = (int)Math.ceil(this.totalRecord/ (double) this.rowsize);

		// 전체 페이지 보다 끝 블럭이 큰경우
		if(this.endBlock > this.allPage) {
			this.endBlock = allPage;
		}

	}

	// 검색 - 페이징 처리 인자 생성자
	public PageDTO(int page, int rowsize, int totalRecord, String field, String keyword) {

		// 일반 인자생성자를 부른다.
		this(page,rowsize,totalRecord);

		// field, keyword 값을 저장
		this.field = field;
		this.keyword = keyword;

	}

}
```
