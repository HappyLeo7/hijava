package com.keduit.domain;

import lombok.Getter;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Getter
@ToString
@Log4j
public class PageDTO {

	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
	private Criteria cri;

	// TODO 안녕하세요
	// TODO 바보
	// TODO 하이
	// TODO 바보
	// TODO 바보
	// TODO 바보
	
	/*
	 * jhhhj 
	 */
	// TODO 검색기능
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;

		// 끝페이지 계산 //ceil올림
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		int realPage = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		// 조건?

		if (realPage < this.endPage) {
			this.endPage = realPage;
		}

		this.prev = this.startPage > 1;
		this.next = this.endPage < realPage;

	}
}
