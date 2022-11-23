package com.book.model;

public class Page {
	int startPage;
	int endPage;
	boolean prev = true; boolean next = true;
	
	int startPoint;
	int endPoint;
	
//	int onePage;
	int pageNum;
//	int amount;
//	int total;
//	
	public Page(int pageNum,int total,int onePage,int amount) {
		this.pageNum = pageNum;
//		this.total = total;
//		
//		this.onePage = onePage;
//		this.amount = amount;
//		
		startPage = (int)((pageNum-1)/onePage)*onePage+1;
		if(startPage == 1) {
			prev = false;
		}
		endPage = startPage-1+onePage;
		if(endPage >= (int)((total-1)/amount)+1 || endPage == 1) {
			endPage = (int)((total-1)/amount)+1;
			next = false;
		}
		System.out.println(total);
		System.out.println(amount);
		System.out.println("==============");
		System.out.println(endPage);
		startPoint = amount*(pageNum-1)+1;
		endPoint = amount*pageNum;
		
		
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getStartPoint() {
		return startPoint;
	}

	public void setStartPoint(int startPoint) {
		this.startPoint = startPoint;
	}

	public int getEndPoint() {
		return endPoint;
	}

	public void setEndPoint(int endPoint) {
		this.endPoint = endPoint;
	}

//	public int getOnePage() {
//		return onePage;
//	}
//
//	public void setOnePage(int onePage) {
//		this.onePage = onePage;
//	}
//
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
//
//	public int getAmount() {
//		return amount;
//	}
//
//	public void setAmount(int amount) {
//		this.amount = amount;
//	}
//
//	public int getTotal() {
//		return total;
//	}
//
//	public void setTotal(int total) {
//		this.total = total;
//	}
	
	
	
}
