package org.zerock.service;

import java.util.List;

import org.zerock.domain.AuthVO;
import org.zerock.domain.BoardVO;

public interface BoardService {

	public void register(BoardVO board);
	
	
	
	public void register(AuthVO vo);
	
	

	public BoardVO get(String userId);

	public List<BoardVO> getList();
	
	public int idCheck(BoardVO board);
}
