package org.zerock.service;

import java.util.List;

import org.zerock.domain.JsonDTO;
import org.zerock.domain.WordDTO;

import net.sf.json.JSONArray;

public interface WordService {

	public WordDTO createJson(WordDTO word, String userId);
	
	public JSONArray readJson(JSONArray jsonArray, JsonDTO jsonDTO);
	
	public void writeJson(JSONArray jsonArray,List<JsonDTO> oldArray, JsonDTO jsonDTO);
	
	public List<JsonDTO> stringToJson(String result);
}
