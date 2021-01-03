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
import org.springframework.web.bind.annotation.PostMapping;
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
	//TODO : 한글깨짐 확인
	private LearningService learningservice;
	
	//�븰�뒿�븳 �떒�뼱�옣 以� �떒�뼱�옣 �젣紐�, �븰�뒿瑜� 媛��졇�삤湲�
	@GetMapping(value = "/wordbooks-infomation")
	public List<Map<String, String>> getList(HttpServletRequest request) {
		
		log.info("get wordbooks-infomation........");
		
        List<WordDTO> bookList = new ArrayList<WordDTO>();
        bookList = learningservice.getAllMyWordList();
        List<Map<String, String>> result = new ArrayList<Map<String, String>>();
        
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
	
	//�떒�뼱�옣 �궡�슜�쓽 �닚�꽌瑜� �옖�뜡�븯寃� 諛붽퓭�꽌 媛��졇�삤湲�
	@GetMapping(value = "/wordbooks-contents/random")
	public List<Map<String, String>> getListRandom(HttpServletRequest request) {
		
		log.info("/wordbooks-contents/random........");
		
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
		Collections.shuffle(result);

		return result;
	}
	
	//�떒�뼱�� �쑜 媛��졇�삤湲�
	@GetMapping(value = "/wordbooks-contents")
	public List<Map<String, String>> getWordList(HttpServletRequest request) {
		
		log.info("get wordbooks-contents........");
		
		String bookId = request.getParameter("bookId");
		String bookTitle = request.getParameter("bookTitle");
		
		WordDTO worddto = learningservice.getWordDTO(bookId, bookTitle);
		
		List<Map<String, String>> result = new ArrayList<Map<String, String>>();
		//TODO: 以묐났�릺�뒗 肄붾뱶 �븿�닔濡� �젙由�, getList�� 以묐났
		for(int i=0; i<worddto.getItem().size(); i++) {
			Map<String, String> map = new HashMap<String, String>();
			
			map.put("word", worddto.getItem().get(i).getWord());
			map.put("meaning", worddto.getItem().get(i).getMeaning());
			
			result.add(map);
		}
		return result;
	}
	
	//�븰�뒿瑜� 蹂�寃쏀븯湲�
	@PostMapping(value = "/learning-rate")
	public void modifyLearningRate(HttpServletRequest request) {
		
		log.info("modify learning-rate........");
		
		String userId = request.getParameter("userId");
		String bookTitle = request.getParameter("bookTitle");
		String word = request.getParameter("word");

        learningservice.modifyLearningRate(userId, bookTitle, word);

	}

}

