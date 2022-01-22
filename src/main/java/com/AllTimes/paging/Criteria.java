package com.AllTimes.paging;

import lombok.Getter;
import lombok.ToString;


public class Criteria {
	//현재 페이지 번호
	private int pageNo;
	//페이지당 출력 데이터 개수
	private int amount;
	//건너뛸 게시물 수
	private int skip; 

	//기본 세팅
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNo, int amount) {
		this.pageNo = pageNo;
		this.amount = amount;
		this.skip = (pageNo-1)*amount;
	}

	public void setPageNo(int pageNo) {
		this.skip = (pageNo-1)*this.amount;
		this.pageNo = pageNo;
	}

	public void setAmount(int amount) {
		this.skip = (this.pageNo-1)*amount;
		this.amount = amount;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}

	public int getPageNo() {
		return pageNo;
	}

	public int getAmount() {
		return amount;
	}

	public int getSkip() {
		return skip;
	}

	@Override
	public String toString() {
		return "Criteria [pageNo=" + pageNo + ", amount=" + amount + ", skip=" + skip + "]";
	}


}
