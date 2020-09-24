package org.dragon.mapper.study;

import java.util.List;

import org.dragon.domain.study.StudyDTO;

public interface StudyMapper {	
	
	public List<StudyDTO> getRecentList(String userId);
	
	public int checkDup(StudyDTO study);
	
	public void insert(StudyDTO study);
	
	public void delete(StudyDTO study);
}
