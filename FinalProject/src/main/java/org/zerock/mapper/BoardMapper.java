package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.AuthVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.WordBookVO;

public interface BoardMapper {
//@Select("select * from mem")
public List<BoardVO> getList();

public void insert(BoardVO board);


public void insertAuth(AuthVO vo);


public BoardVO read(String userId);

public int idCheck(BoardVO board);
}
