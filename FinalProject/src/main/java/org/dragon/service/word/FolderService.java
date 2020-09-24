package org.dragon.service.word;

import java.util.List;

import org.dragon.domain.word.Criteria;
import org.dragon.domain.word.FolderVO;

public interface FolderService {

	public int register(FolderVO folder);
	
	public FolderVO get(Long folderId);
	
	public boolean modify(FolderVO folder);
	
	public boolean remove(Long folderId);
	
	//public List<FolderVO> getList();
	
	public List<FolderVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
}
