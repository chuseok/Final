package org.dragon.service.word;

import java.util.List;

import org.dragon.domain.word.Criteria;
import org.dragon.domain.word.WordBookVO;

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
