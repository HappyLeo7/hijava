package com.happyLeo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TodoDateVO {
//필드

	private int bno;  //등록번호
	private String content; //일정 내용
	private String completion; // 진행여부
	private Date regDate; //등록일
	private Date upDatedate; //수정일

	
	//@Data코드를 쓰면 lombok을 통해서 get(), set(), toString() 매서드가 자동 생성되어 가져다 쓸 수 있다.
}
