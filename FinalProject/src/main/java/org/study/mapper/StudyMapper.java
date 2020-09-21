package org.study.mapper;

import java.util.List;

import org.study.domain.StudyDTO;

public interface StudyMapper {	
	
	public List<StudyDTO> getRecentList(String userId);
	
	public int checkDup(StudyDTO study);
	
	public void insert(StudyDTO study);
	
	public void delete(StudyDTO study);
}
