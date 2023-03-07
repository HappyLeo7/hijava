package com.keduit.sample;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Component

@ToString

@Getter

//위에껄 합친게 @Data


// Hotel생성자를 대신해주는 역할
@AllArgsConstructor
//	public Hotel(Chef chef) {
//this.chef=chef;
//}
///////////////////////////////


public class Hotel {
//@NonNull    -> final대신 넣어도됨
	private final Chef chef;

	
//	//생성자
//	public Hotel(Chef chef) {
//		this.chef=chef;
//	}
}
