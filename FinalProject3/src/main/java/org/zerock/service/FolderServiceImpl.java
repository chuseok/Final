package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.FolderVO;
import org.zerock.mapper.FolderMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class FolderServiceImpl implements FolderService {

	@Setter(onMethod_ = @Autowired)
	private FolderMapper mapper;
	
	
	@Override
	public int register(FolderVO folder) {
		log.info("register.........." + folder);

		return mapper.insertSelectKey(folder);
	}

	@Override
	public FolderVO get(Long folderId) {
		log.info("get......." + folderId);
		
		return mapper.read(folderId);
	}

	@Override
	public boolean modify(FolderVO folder) {
		log.info("modify........" + folder);
		
		return mapper.update(folder) == 1;
	}

	@Override
	public boolean remove(Long folderId) {
		log.info("remove........." + folderId);
		
		return mapper.delete(folderId) == 1;
	}

	@Override
	public List<FolderVO> getList(Criteria cri) {
		log.info("get List with criteria: " + cri);
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {

		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	

	
	
}
