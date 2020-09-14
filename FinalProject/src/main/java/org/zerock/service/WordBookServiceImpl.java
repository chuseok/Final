package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.WordBookVO;
import org.zerock.mapper.WordBookMapper;

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
	public WordBookVO get(Long bookId) {
		log.info("get......." + bookId);

		return mapper.read(bookId);
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
	public List<WordBookVO> getList(Criteria cri, Long folderId) {
		log.info("get WordBook List of a Folder " + folderId);
		
		return mapper.getListWithPaging(cri, folderId);
	}

	@Override
	public List<WordBookVO> getYourSet(String wordId) {
		log.info("get WordBook List of Your set " + wordId);
		
		return mapper.readYourSet(wordId);
	}

}
