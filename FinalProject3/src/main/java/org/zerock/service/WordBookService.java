package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.WordBookVO;

public interface WordBookService {
	public int register(WordBookVO vo);
	
	public WordBookVO get(Long bookId);
	
	public int modify(WordBookVO vo);
	
	public int modifyFromFolder(WordBookVO vo);
	
	public int remove(Long bookId);
	
	public List<WordBookVO> getList(Criteria cri);
	
	public List<WordBookVO> getYourSet(String userId);
	
	public int getTotal(Criteria cri);

}
