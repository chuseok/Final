package org.dragon.service.word;

import java.util.List;

import org.dragon.domain.study.WordDTO;
import org.dragon.domain.study.WordVO;

import net.sf.json.JSONArray;

public interface WordService {

	public JSONArray readJson(JSONArray jsonArray, WordDTO jsonDTO);
	
	public void writeJson(JSONArray jsonArray,List<WordDTO> oldArray, WordDTO jsonDTO);
	
	public List<WordDTO> stringToJson(String result);
}
