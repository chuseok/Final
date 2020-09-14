package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.zerock.domain.Criteria;
import org.zerock.domain.FolderVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FolderServiceTests {

	@Setter(onMethod_= {@Autowired})
	private FolderService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		FolderVO folder = new FolderVO();
		folder.setFolderTitle("새 폴더2");
		folder.setDescription("임시");
		folder.setLink("eee");
		
		service.register(folder);
		
		log.info("생성된 게시물의 번호: " + folder.getFolderId());
	}
	
	@Test
	public void testGetList() {
//		service.getList().forEach(folder -> log.info(folder));
		service.getList(new Criteria(2, 10)).forEach(folder -> log.info(folder));
	}
	
	@Test
	public void testGet() {
		
		log.info(service.get(1L));
	}
	
	@Test
	public void testDelete() {
		log.info("REMOVE RESULT: " + service.remove(6L));
	}
	
	@Test
	public void testUpdate() {
		FolderVO folder = service.get(6L);
		
		if(folder == null) {
			return;
		}
		
		folder.setFolderTitle("수정");
		log.info("MODIFY RESULT: " + service.modify(folder));
	}
	

}
