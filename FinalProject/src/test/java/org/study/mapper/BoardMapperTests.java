package org.study.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.study.domain.StudyDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private StudyMapper mapper;
	
	
	@Test
	public void testInsert() {
		StudyDTO study = new StudyDTO();
		
		study.setUserId("sdf");
		study.setBookId("11");
		study.setBookTitle("22");	
		
		mapper.insert(study);
		
		log.info(study);
	}
	
	@Test
	public void testGetList() {
			
		mapper.getRecentList("sdf");
		
		log.info(mapper.getRecentList("sdf"));
		
	}
	
	@Test
	public void testDelete() {
		StudyDTO study = new StudyDTO();
		
		study.setUserId("sdf");
		study.setBookId("11");
		study.setBookTitle("22");	
		
		mapper.delete(study);
		
		log.info(study);
	}
	
	@Test
	public int testCheckDup() {
		StudyDTO study = new StudyDTO();
		
		study.setUserId("sdf");
		study.setBookId("sdf");
		study.setBookTitle("숫자");	
		
		return mapper.checkDup(study);
	}

}
