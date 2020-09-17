package org.study.service;

import java.util.List;

import org.study.domain.WordDTO;
import org.study.domain.WordVO;

import com.google.gson.JsonArray;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public interface LearningService {

	public JSONArray readAllJson();
	
	public List<WordDTO> getAllWordList();
	
	public JSONArray getMyList(String id);
	
	public JSONArray getIdSearchList(String id);
	
	public JSONArray getTitleSearchList(String title);
		
	public JSONArray getWordJsonArray(String id, String title);
		
	public WordDTO getWordDTO(String id, String title);
	
	public void upRate(String id, String title, String word);
	
	public void resetRate(String id, String title);
	
	
}
