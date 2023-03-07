package com.keduit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.keduit.domain.BoardVO;
import com.keduit.domain.Criteria;
import com.keduit.domain.PageDTO;
import com.keduit.service.BoardService2;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/board/*")
@RequiredArgsConstructor
public class BoardController2 {

	private final BoardService2 service;

	

	/*
	 * @GetMapping("/list") public void list(Model model) {
	 * log.info("========BoardController_List=====");
	 * model.addAttribute("list",service.getList()); }
	 */
	
	 

	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("=================list : " + cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, 123));

	}

	
	  @GetMapping("/register") public void register() {
	  
	  }
	 

	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("----register----" + board);
		long bno = service.register(board);
		log.info("bno ::::::::::::" + bno);
		// addFlashAttribute 한번쓰고 버려진다
		rttr.addFlashAttribute("result", bno); //1회용 도배방지용

		return "redirect:/board/list";
	}

	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("bno") Long bno, Model model) {
		log.info("/get or /modify");
		model.addAttribute("board", service.get(bno));
	}

	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {
		log.info("------------------------------Controller modify ::::" + board);
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
////////////////////////////////	
	      


	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		log.info("----remove-----" + bno);
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/board/list";
	}
}
