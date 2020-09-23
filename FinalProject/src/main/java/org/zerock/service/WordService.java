package org.zerock.service;

import java.util.List;

import org.study.domain.WordDTO;
import org.study.domain.WordVO;

import net.sf.json.JSONArray;

public interface WordService {

	public JSONArray readJson(JSONArray jsonArray, WordDTO jsonDTO);
	
	public void writeJson(JSONArray jsonArray,List<WordDTO> oldArray, WordDTO jsonDTO);
	
	public List<WordDTO> stringToJson(String result);
}
