package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.FolderVO;
import org.zerock.domain.WordBookVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class WordBookMapperTests {
	
	@Setter(onMethod_=@Autowired)
	private WordBookMapper mapper;
	
	@Test
	public void testCreate() {
		WordBookVO vo = new WordBookVO();
		
		vo.setFolderId(3L);
		vo.setUserId("hansol");
		vo.setWordTitle("단어장4");
		
		mapper.insert(vo);
	}
	
	@Test
	public void testRead() {
		
		Long targetBookId = 4L;
		WordBookVO vo = mapper.read(targetBookId);
		log.info(vo);
	}
	
	@Test
	public void testReadYourSet() {
		String targetWordId = "hansol";
		mapper.readYourSet(targetWordId).forEach(wordBook -> log.info(wordBook));
	}
	
	@Test
	public void testDelete() {
		Long targetBookId = 4L;
		mapper.delete(targetBookId);
	}
	
	@Test
	public void testUpdate() {
		Long targetBookId = 5L;
		WordBookVO vo = mapper.read(targetBookId);
		vo.setWordTitle("단어장4수정");
		int count = mapper.update(vo);
		
		log.info("UPDATE COUNT : " + count);
	}
	
	@Test
	public void testList() {
		Criteria cri =new Criteria();
		
		List<WordBookVO> wordBooks = mapper.getListWithPaging(cri);
	}
}
