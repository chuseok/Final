package org.dragon.android.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.study.domain.WordDTO;
import org.study.domain.WordVO;
import org.study.service.LearningService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@RequestMapping("/android/study")
@RestController("android.controller.StudyController")
@Log4j
@AllArgsConstructor
public class StudyController {

	private LearningService learningservice;
	
	@GetMapping(value = "/getList")
	public List<Map<String, String>> get(HttpServletRequest request) {
		
		log.info("get all list........");
		
        List<WordDTO> WordList = new ArrayList<WordDTO>();
        List<Map<String, String>> result = new ArrayList<Map<String, String>>();
        JSONArray itemArray = new JSONArray();
        List<Integer> learningRateList = new ArrayList<>();
        
        
        WordList = learningservice.getAllWordList();
		
        
        for(int i=0;i<WordList.size();i++) {
        	Map<String, String> map = new HashMap<String, String>();
        	String userId = WordList.get(i).getId();
        	String wordTitle = WordList.get(i).getTitle();
        	
        	int count = 0;
        	int percent = 0;
        	int size = 0;
        	
        	WordDTO wordDTO = WordList.get(i);
        	
        	for (WordVO item : wordDTO.getItem()) {
        		size++;
        		if(item.getLearningRate() == 2) {
        			count++;
        		}
               
			}
        	percent = Math.round((float)count/size*100);
     		
        	map.put("userId", userId);
        	map.put("wordTitle", wordTitle);
        	map.put("learningRate", Integer.toString(percent));
        	
        	result.add(map);
        }
		
		return result;
		
	}
	
	
	@GetMapping(value = "/getWordList")
	public List<Map<String, String>> getWordList(HttpServletRequest request) {
		
		log.info("get my list........");
		
		String bookId = request.getParameter("bookId");
		String bookTitle = request.getParameter("bookTitle");
		
		WordDTO worddto = learningservice.getWordDTO(bookId, bookTitle);
		List<WordVO> wordvo = new ArrayList<WordVO>();
		
		List<Map<String, String>> result = new ArrayList<Map<String, String>>();
		
		for(int i=0; i<worddto.getItem().size(); i++) {
			Map<String, String> map = new HashMap<String, String>();
			
			map.put("word", worddto.getItem().get(i).getWord());
			map.put("meaning", worddto.getItem().get(i).getMeaning());
			
			result.add(map);
		}
		
		return result;
		
	}
}
