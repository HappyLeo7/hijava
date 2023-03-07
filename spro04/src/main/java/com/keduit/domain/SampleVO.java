package com.keduit.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//에노테이션
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SampleVO {
	private Integer mno;
	private String frostName;
	private String lastName;
	
}
