package com.happyLeo.contrllo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.happyLeo.services.TotoServiceInterface;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller //연결 사이트 링크연결?
@Log4j //log를 사용하기 위해서
@RequestMapping("/tododate/*") // 찾더내 경로를 찾을때 사용 servlet-context.xml에 설정된 /WEB-INF/views/ 경로 + ()안에있는 매핑 + .jsp
@RequiredArgsConstructor
public class TodoDateContrllo {
	
	private final TotoServiceInterface todoService;
	
	//TODO 최초 todolist.jsp연결 매핑
	/*
	@GetMapping("/todolist")
	public void todolist() {
		log.info("================TodoDatecontrllo todolist todolist()==========접속");
	}
	*/
	
	//TODO java spring에 있는  Model타입을 통해서 list 받아오기
	@GetMapping("/todolist")
	public void todolist(Model model) {
		log.info("=======TodoDatecountrllo에서 todolist경로를 통해 list를 받아옴");
		model.addAttribute("AllList", todoService.getAllList());
	}
	

}
