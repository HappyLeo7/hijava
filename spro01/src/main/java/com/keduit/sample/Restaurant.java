package com.keduit.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Setter;

@Component
@Data
public class Restaurant {
	@Setter(onMethod_ = @Autowired)
//(onMethod=@_({@AmmotationGoHere})) 1.8버전
	private Chef chef;
	
	public void setChef(Chef chef) {
		this.chef =chef;
	}
	
	
}
