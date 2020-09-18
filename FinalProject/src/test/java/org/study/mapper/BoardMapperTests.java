package org.study.mapper;

import java.util.List;

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

}
