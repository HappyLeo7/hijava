package com.keduit.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	//페이지번호
	//어마운트
	
	private int pageNum;
	private int amount;
	
	
	//검색기능 관련 필드
	private String type; // T=제목,C=내용,W=사용자,TC,TW,TCE    
	private String keyword; // 
	
	//기본생성자
	public Criteria() {
		this(1,10);
	}

	//페이지 링크를 위한 메서드
	public Criteria(int i, int j) {
		this.pageNum=i;
		this.amount=j;
	}
	
	//검색 키워드 관련 메서드
	public String[] getTypeArr() {
		return type==null ? new String[] {}:type.split(""); // split()?
	}


////////////////////
}
