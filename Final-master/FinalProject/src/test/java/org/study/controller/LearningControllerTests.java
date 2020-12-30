package org.study.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class LearningControllerTests {
	
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	
	@Before()
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception {
		
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/learn/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
		
	}
	
	@Test
	public void tesGetAllList() throws Exception {
		
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/study/getList"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
		
	}
	
	@Test
	public void testGetWordList() throws Exception {
		
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/learn/get")
						.param("id", "hansol")
						.param("title", "단어장"))
						.andReturn()
						.getModelAndView().getModelMap());
		
	}
	
	@Test
	public void testToSubjective() throws Exception {
		
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.post("/learn/subjective")
						.param("id", "hansol")
						.param("title", "�ܾ���"))
						.andReturn()
						.getModelAndView().getModelMap());		
	}
	
	@Test
	public void testAddRecent() throws Exception {
		
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.post("/study/recent")
						.param("bookId", "sdf")
						.param("bookTitle", "테스트")
						.param("userId", "sdf"))
						.andReturn()
						.getModelAndView().getModelMap());		
	}
	
	
	@Test
	public void testGetWordLists() throws Exception {
		
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.post("/study/getWordList")
						.param("id", "sdf")
						.param("title", "색"))
						.andReturn()
						.getModelAndView().getModelMap());		
	}
	
	

}