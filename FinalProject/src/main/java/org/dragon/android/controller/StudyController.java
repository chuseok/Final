package org.dragon.android.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.dragon.domain.study.WordDTO;
import org.dragon.domain.study.WordVO;
import org.dragon.service.study.LearningService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
		
        List<WordDTO> bookList = new ArrayList<WordDTO>();
        List<Map<String, String>> result = new ArrayList<Map<String, String>>();
        
        bookList = learningservice.getAllMyWordList();
		
        
        for(int i=0;i<bookList.size();i++) {
        	Map<String, String> map = new HashMap<String, String>();
        	String userId = bookList.get(i).getId();
        	String wordTitle = bookList.get(i).getTitle();
        	
        	int count = 0;
        	int percent = 0;
        	int size = 0;
        	
        	WordDTO wordDTO = bookList.get(i);
        	
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
		
		List<Map<String, String>> result = new ArrayList<Map<String, String>>();
		
		for(int i=0; i<worddto.getItem().size(); i++) {
			Map<String, String> map = new HashMap<String, String>();
			
			map.put("word", worddto.getItem().get(i).getWord());
			map.put("meaning", worddto.getItem().get(i).getMeaning());
			
			result.add(map);
		}
		
		return result;
		
	}
	
	@GetMapping(value = "/get")
	public List<Map<String, String>> getWord(HttpServletRequest request) {
		
		log.info("단어장 가져오기");
		
		String id = request.getParameter("userId");
		String title = request.getParameter("wordTitle");
		
        List<WordDTO> WordList = new ArrayList<WordDTO>();
        List<Map<String, String>> result = new ArrayList<Map<String, String>>();
		
		//learningservice.copyWordList(id, title);//test02 write
		
		log.info("copy word List...");
		log.info(learningservice.getWordJsonArray(id, title));
		
		learningservice.getWordJsonArray(id, title);//test01 read
		
		return result;
		
	}
	@GetMapping(value = "/get/LearnedWordBook")
	public List<Map<String, String>> getLearnedWordBook(HttpServletRequest request) {
		
		log.info("get Learned Word Book........");
		
		String userId = request.getParameter("userId");
		String bookTitle = request.getParameter("bookTitle");
		
        List<Map<String, String>> result = new ArrayList<Map<String, String>>();

		WordDTO wordDTO = learningservice.getMyWordDTO(userId, bookTitle);
		
        for(WordVO w : wordDTO.getItem()) {
        	Map<String, String> map = new HashMap<String, String>();
    		map.put("userId", wordDTO.getId());
    		map.put("bookTitle", wordDTO.getTitle());
    		map.put("word", w.getWord());
    		map.put("meaning", w.getMeaning());
    		map.put("learningRate", Integer.toString(w.getLearningRate()));
        	
        	result.add(map);
    		
        }
        log.info(result);
        //random ����
		Collections.shuffle(result);
//    	log.info(learningservice.getLastWordJsonArray(userId, bookTitle));
//    	
//    	learningservice.getLastWordJsonArray(userId, bookTitle);
    	
		return result;
		
	}
	
	@GetMapping(value = "/modify/RateFromQuestion")
	public void modifyRateFromQuestion(HttpServletRequest request) {
		
		log.info("modify/RateFromQuestion........");
		
		String userId = request.getParameter("userId");
		String bookTitle = request.getParameter("bookTitle");
		String word = request.getParameter("word");

        learningservice.updateRateFromQuestion(userId, bookTitle, word);

	}

}

