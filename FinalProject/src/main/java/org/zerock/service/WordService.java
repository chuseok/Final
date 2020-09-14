package org.zerock.service;

import java.util.List;

import org.zerock.domain.JsonDTO;
import org.zerock.domain.WordDTO;

import net.sf.json.JSONArray;

public interface WordService {

	public WordDTO createJson(WordDTO word);
	
	public JSONArray readJson(JSONArray jsonArray, String wordTitle);
	
	public void writeJson(JSONArray jsonArray,List<JsonDTO> oldArray, String wordTitle);
	
	public List<JsonDTO> stringToJson(String result);
}
