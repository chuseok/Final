package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.FolderVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FolderMapperTests {

	@Setter(onMethod_ = @Autowired)
	private FolderMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(folder -> log.info(folder));
	}
	
	@Test
	public void testInsert() {
		FolderVO folder = new FolderVO();
		folder.setFolderTitle("새 폴더1");
		folder.setDescription("임시");
		folder.setLink("ddd");
		
		mapper.insert(folder);
		
		log.info(folder);
	}
	
	@Test
	public void testInsertSelectKey() {
		
		FolderVO folder = new FolderVO();
		folder.setFolderTitle("새 폴더2");
		folder.setDescription("임시");
		folder.setLink("lll");
		
		mapper.insertSelectKey(folder);
		
		log.info(folder);
	}
	
	@Test
	public void testRead() {
		FolderVO folder = mapper.read(2L);
		
		log.info(folder);
	}
	
	@Test
	public void testDelete() {
		log.info("DELETE COUNT: " + mapper.delete(5L));
	}
	
	@Test
	public void testUpdate() {
		FolderVO folder = new FolderVO();
		folder.setFolderId(4L);
		folder.setFolderTitle("새 폴더1수정");
		folder.setDescription("임시 수정");
		
		int count = mapper.update(folder);
		log.info("UPDATE COUNT: " + count);
	}
	
	@Test
	public void testPaging()
	{
		Criteria cri = new Criteria();
		//10개씩 일때 2페이지
		cri.setPageNum(1);
		cri.setAmount(10);
		
		List<FolderVO> list = mapper.getListWithPaging(cri);
		list.forEach(folder -> log.info(folder.getFolderId()));
	}
}
