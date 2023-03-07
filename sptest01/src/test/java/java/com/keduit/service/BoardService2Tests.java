package com.keduit.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.keduit.domain.BoardVO;
import com.keduit.domain.Criteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardService2Tests {

	
	@Autowired  //필드주입
	private BoardService2 service;
	
	@Test
	public void testExist() {
		log.info("서비스 : "+ service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		BoardVO board = new BoardVO();
		board.setTitle("test register에서 등록한 제목");
		board.setContent("test register에서 등록한 내용");
		board.setWriter("test register user00");
		
		long bno = service.register(board);
		log.info("생성된 게시물 번호 ===> "+bno);
		
	}
	
	@Test
	public void testGetList() {
		//service.getList().forEach(board->log.info(board));
		service.getList(new Criteria(5,10)).forEach(board->log.info(board));
	}
	
	@Test
	public void testGetread() {
		log.info(service.get(44L));
		
	}
	
	@Test
	public void testUpdate() {
		BoardVO board = service.get(44L);
		if (board==null) {
			return;
		}
		board.setTitle("modify한 제목");
		log.info("----------Modify result -------> "+service.modify(board));
	}
	
	@Test
	public void testDelete() {
		log.info("Remove result : "+service.remove(26L));
	}
	
	
	
}
