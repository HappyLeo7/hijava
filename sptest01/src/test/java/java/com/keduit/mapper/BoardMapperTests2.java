package com.keduit.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.keduit.domain.BoardVO;
import com.keduit.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class BoardMapperTests2 {

@Setter(onMethod_ = @Autowired)
//BoardMapper 인터페이스
private BoardMapper2 mapper;

//페이지 관련 매서드
@Test
public void testPaging() {
	Criteria cri = new Criteria();
	cri.setPageNum(5);
	cri.setAmount(10);
	List<BoardVO> list = mapper.getListWithPaging(cri);
	list.forEach(board->log.info(board));
}

@Test
public void testGetList() {
	mapper.getList().forEach(board -> log.info(board));
}

@Test
public void testread() {
	mapper.read(27L);
}

@Test
public void delete() {
	Long result=mapper.delete(23L);
	log.info("-- delete --");
	log.info("-- delete : "+result+" --");
}


@Test
public void testInsert() {
	BoardVO board=new BoardVO();
	board.setTitle("test작성 글");
	board.setContent("test작성글 내용");
	board.setWriter("사용자01");
	
	mapper.insert(board);
	log.info("-------board------"+board);
}

@Test
public void testInsertSelectKey() {
	BoardVO board=new BoardVO();
	board.setTitle("새로 작성하는 글 select key test");
	board.setContent("글 내용  Content");
	board.setWriter("user99");
	
	//Setter에 지정한 mapper
	mapper.insertSelectKey(board);
	log.info(board);
}

@Test
public void testupdate() {
	BoardVO board=new BoardVO();
	long bno = 1L;
	log.info("board 수정전 : "+mapper.read(bno));
	board.setTitle("제목4");
	board.setContent("내용4");
	board.setWriter("user4");
	board.setBno(bno);
	
	int result=mapper.update(board);
	log.info("---update---");
	log.info("---update 갯수 : "+result+" ---");
	log.info("board 수정후 : "+board);
	
}















@Setter(onMethod_ = @Autowired)
private TimeMapper timeMapper;

@Test
public void testGetTime() {
	log.info("-----gettime");
	log.info(timeMapper.getClass().getName());
	log.info(timeMapper.getTime());
}
}
