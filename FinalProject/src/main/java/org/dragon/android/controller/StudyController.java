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
	//TODO : 학습 진행 유무에 상관없이 단어장을 불러올 수 있어야 함
	private LearningService learningservice;
	
	//학습한 단어장 중 단어장 제목, 학습률 가져오기
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
	
	//단어장 내용의 순서를 랜덤하게 바꿔서 가져오기
	@GetMapping(value = "/wordbooks-contents/random")
	public List<Map<String, String>> getListRandom(HttpServletRequest request) {
		
		log.info("/wordbooks-contents/random........");
		
		String userId = request.getParameter("userId");
		String bookTitle = request.getParameter("bookTitle");
		log.info(userId + ", " + bookTitle);
		
        List<Map<String, String>> result = new ArrayList<Map<String, String>>();

		WordDTO wordDTO = learningservice.getWordDTO(userId, bookTitle);
		
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
	
	//단어와 뜻 가져오기
	@GetMapping(value = "/wordbooks-contents")
	public List<Map<String, String>> getWordList(HttpServletRequest request) {
		
		log.info("get wordbooks-contents........");
		
		String bookId = request.getParameter("bookId");
		String bookTitle = request.getParameter("bookTitle");
		
		WordDTO worddto = learningservice.getWordDTO(bookId, bookTitle);
		
		List<Map<String, String>> result = new ArrayList<Map<String, String>>();
		//TODO: 중복되는 코드 함수로 정리, getList와 중복
		for(int i=0; i<worddto.getItem().size(); i++) {
			Map<String, String> map = new HashMap<String, String>();
			
			map.put("word", worddto.getItem().get(i).getWord());
			map.put("meaning", worddto.getItem().get(i).getMeaning());
			
			result.add(map);
		}
		return result;
	}
	
	//학습률 변경하기
	@PostMapping(value = "/learning-rate")
	public void modifyLearningRate(HttpServletRequest request) {
		
		log.info("modify learning-rate........");
		
		String userId = request.getParameter("userId");
		String bookTitle = request.getParameter("bookTitle");
		String word = request.getParameter("word");

        learningservice.modifyLearningRate(userId, bookTitle, word);

	}

}

