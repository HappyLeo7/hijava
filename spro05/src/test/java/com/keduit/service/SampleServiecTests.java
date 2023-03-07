package com.keduit.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
//controller test를 위해
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class SampleServiecTests {
	
	
				@Test
				public void testClass() {
					
				}
				
				@Test
				public void testAdd() throws Exeption{
					log.info(service.doAdd("123","5687"));
				}
}
