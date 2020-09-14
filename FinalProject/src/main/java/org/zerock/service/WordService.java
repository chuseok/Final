package org.zerock.service;

import java.util.List;

import org.zerock.domain.ReadFileDTO;
import org.zerock.domain.WordVO;

import net.sf.json.JSONArray;

public interface WordService {

	public WordVO createJson(WordVO word, String userId);
	
	public JSONArray readJson(JSONArray jsonArray, ReadFileDTO jsonDTO);
	
	public void writeJson(JSONArray jsonArray,List<ReadFileDTO> oldArray, ReadFileDTO jsonDTO);
	
	public List<ReadFileDTO> stringToJson(String result);
}
