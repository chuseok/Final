package org.dragon.mapper.word;

import java.util.List;

import org.dragon.domain.word.Criteria;
import org.dragon.domain.word.FolderVO;

public interface FolderMapper {

	public List<FolderVO> getList();
	
	public List<FolderVO> getListWithPaging(Criteria cri);
	
	public List<FolderVO> getListWithPagingAlp(Criteria cri);
	
	public void insert(FolderVO folder);
	
	public int insertSelectKey(FolderVO folder);
	
	public FolderVO read(Long folderId);
	
	public int delete(Long folderId);
	
	public int update(FolderVO folder);
	
	public int getTotalCount(Criteria cri);
	
	public int FolderCheck(FolderVO folder);

}
