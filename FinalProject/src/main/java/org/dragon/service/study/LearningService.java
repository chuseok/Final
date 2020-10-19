package org.dragon.service.study;

import java.util.List;

import org.dragon.domain.study.StudyDTO;
import org.dragon.domain.study.WordDTO;

import net.sf.json.JSONArray;

public interface LearningService {

	//json01
	public JSONArray readAllJson();
	
	//json01
	public List<WordDTO> getAllWordList();	
	//json02
	public List<WordDTO> getAllMyWordList();
	
	
	public JSONArray getMyList(String id);
	
	public JSONArray getMyRecentList(String id);
	
	
	public JSONArray getIdSearchList(String id);
	
	public JSONArray getTitleSearchList(String title);
	
		
	public JSONArray getWordJsonArray(String id, String title);
	
	public JSONArray getLastWordJsonArray(String id, String title);
	
			
	public WordDTO getWordDTO(String id, String title);	
	
	public WordDTO getMyWordDTO(String id, String title); //json02
	
	
	public void upRate(String id, String title, String word);
	
	public void updateRateFromQuestion(String id, String title, String word);
	
	public void resetRate(String id, String title);
	
	public void addRecentStudy(StudyDTO study);
	
	public void copyWordList(String id, String title);
	
	
}
