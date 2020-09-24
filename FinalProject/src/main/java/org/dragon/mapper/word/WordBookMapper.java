package org.dragon.mapper.word;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.dragon.domain.word.Criteria;
import org.dragon.domain.word.WordBookVO;

public interface WordBookMapper {

	public int insert(WordBookVO vo);
	
	public WordBookVO read(Long bookId);
	
	public int delete(Long bookId);
	
	public int update(WordBookVO vo);
	
	public int updateFromFolder(WordBookVO vo);
	
	public List<WordBookVO> getListWithPaging(Criteria cri);
	//Ư�� �Խù��� ������ �����´�.
	
	public List<WordBookVO> readYourSet(String userId);
	
	public int getTotalCount(Criteria cri);

}
