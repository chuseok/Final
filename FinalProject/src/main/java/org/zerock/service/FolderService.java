package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.FolderVO;

public interface FolderService {

	public int register(FolderVO folder);
	
	public FolderVO get(Long folderId);
	
	public boolean modify(FolderVO folder);
	
	public boolean remove(Long folderId);
	
	//public List<FolderVO> getList();
	
	public List<FolderVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
}
