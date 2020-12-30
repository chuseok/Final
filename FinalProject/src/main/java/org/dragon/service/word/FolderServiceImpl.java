package org.dragon.service.word;

import java.util.List;

import org.dragon.domain.word.Criteria;
import org.dragon.domain.word.FolderVO;
import org.dragon.mapper.word.FolderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	@Override
	   public List<FolderVO> getListAlp(Criteria cri) {
	      log.info("get List with criteria: " + cri);
	      
	      return mapper.getListWithPagingAlp(cri);
	   }
	
	@Override
    public int FolderCheck(FolderVO folder){
       int result = mapper.FolderCheck(folder);
       return result;
    }

	

	
	
}
