package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.zerock.domain.Criteria;
import org.zerock.domain.FolderVO;

public interface FolderMapper {

	public List<FolderVO> getList();
	
	public List<FolderVO> getListWithPaging(Criteria cri);
	
	public void insert(FolderVO folder);
	
	public int insertSelectKey(FolderVO folder);
	
	public FolderVO read(Long folderId);
	
	public int delete(Long folderId);
	
	public int update(FolderVO folder);
	
	public int getTotalCount(Criteria cri);
}
