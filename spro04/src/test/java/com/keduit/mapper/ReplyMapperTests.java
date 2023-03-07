package com.keduit.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.keduit.domain.Criteria;
import com.keduit.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class ReplyMapperTests {

	@Setter(onMethod_ = @Autowired )
	private ReplyMapper mapper;

	private Long[] bnoArr= {371L,372L,373L,374L,375L};
	
	//댓글 테스트
	@Test
	public void testMapper() {
		log.info("!!!테스트!!!"+mapper);
	}
	////////////////////////
	
	@Test
	public void testCreate() {
		IntStream.rangeClosed(1,10).forEach( i-> {
			ReplyVO vo= new ReplyVO();
			vo.setBno(bnoArr[i%5]);
			vo.setReply("댓글내용"+i);
			vo.setReplyer("댓글만드는중"+i);
			mapper.insert(vo);
		});
		log.info("====testCreate====");
		
	}
	
	@Test
	public void testRead() {
		Long targetRno = 9L;
		
		ReplyVO vo = mapper.read(targetRno);
		log.info(vo);
	}
	
	@Test
	public void testDelete() {
		int  result= mapper.delete(6L);
		log.info("///////delete ===>"+result);
	}
	
	@Test
	public void testUpdate() {
		ReplyVO vo =mapper.read(7L);
		vo.setReply("댓글 수정 테스트중12");
		log.info("===댓글이 수정되었습니다===");
	}
	
	@Test
	public void testList() {
		Criteria cri = new Criteria();
		List<ReplyVO> replylist = mapper.getListWithPaging(cri, bnoArr[0]);
		log.info("*******댓글 불러오기********"+replylist);
	}
	
	 //댓글
	@Test
	public void testList2(){
		Criteria cri = new Criteria(1,5);
		List<ReplyVO> replies =mapper.getListWithPaging(cri, 373L);
		replies.forEach(reply -> log.info(replies));
	}
	
	////////
}
