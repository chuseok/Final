package org.dragon.service.word;

import java.util.List;

import org.dragon.domain.word.Criteria;
import org.dragon.domain.word.WordBookVO;
import org.dragon.mapper.word.WordBookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class WordBookServiceImpl implements WordBookService {

	@Setter(onMethod_ = @Autowired)
	private WordBookMapper mapper;
	
	@Override
	public int register(WordBookVO vo) {
		log.info("register.........." + vo);
		
		return mapper.insert(vo);
	}

	@Override
	public WordBookVO get(WordBookVO vo) {
		log.info("get......." + vo);

		return mapper.read(vo);
	}

	@Override
	public int modify(WordBookVO vo) {
		log.info("modify........" + vo);
		
		return mapper.update(vo);
	}
	
	@Override
	public int modifyFromFolder(WordBookVO vo) {
		log.info("modifyFromFolder.........." + vo);

		return mapper.updateFromFolder(vo);
	}

	@Override
	public int remove(Long bookId) {
		log.info("remove........." + bookId);
		
		return mapper.delete(bookId);
	}

	@Override
	public List<WordBookVO> getList(Criteria cri) {
		log.info("get WordBook List of a Folder ");
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public List<WordBookVO> getYourSet(String userId) {
		log.info("get WordBook List of Your set " + userId);
		
		return mapper.readYourSet(userId);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("wordBook total count");
		return mapper.getTotalCount(cri);
	}
	
	

}
