package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.AuthVO;
import org.zerock.domain.BoardVO;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	private BoardMapper mapper;
	
	@Override
	public void register(BoardVO board) {  

		log.info("register....."+ board);
    mapper.insert(board); 
	}
	
	
	@Override
	public void register(AuthVO vo) {
		log.info("Auth......."+ vo);
		mapper.insertAuth(vo);
	}
	
	
	@Override
	public BoardVO get(String userId) {
		log.info("get........." + userId);

		return mapper.read(userId);
	}

	 @Override 
	 public List<BoardVO> getList() { 
		 log.info("getList............");
	 
	 return mapper.getList(); 
	 }

	 @Override
	 public int idCheck(BoardVO board){
	 	int result = mapper.idCheck(board);
	 	return result;
	 }

}
