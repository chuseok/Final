package org.dragon.controller.study;


import org.dragon.mapper.study.StudyMapper;
import org.dragon.service.study.LearningService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.sf.json.JSONArray;

@Controller
@Log4j
@RequestMapping("/learn/*")
@AllArgsConstructor
@PreAuthorize("isAuthenticated()")
public class LearningController {
	
	private LearningService learningservice;
	
	@GetMapping("/read")
	public JSONArray getAllWordDTO() {
		
		log.info("get all list....");
		log.info(learningservice.readAllJson());
		return learningservice.readAllJson();
	}
	
	
	@GetMapping("/list")
	public void list(@RequestParam("id") String id, Model model) {
		
		log.info("get my list........");
		
		log.info(learningservice.getMyList(id));
		
		model.addAttribute("myList", learningservice.getMyList(id));
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("id") String id, @RequestParam("title") String title, Model model) {
		
		log.info("get word List..");
		
		learningservice.copyWordList(id, title);
		
		log.info("copy word List...");
		log.info(learningservice.getWordJsonArray(id, title));
		
		model.addAttribute("WordDTO", learningservice.getWordJsonArray(id, title));		
		
	}
	
	@GetMapping("/subjective")
	public void moveSubjective(@RequestParam("id") String id, @RequestParam("title") String title, Model model) {
		
		log.info("get Array " + title + " for subjective quiz.....");
		
		model.addAttribute("WordDTO", learningservice.getWordJsonArray(id, title));
	}
	
	@GetMapping("/study")
	public void moveStudy(@RequestParam("id") String id, @RequestParam("title") String title, Model model) {
		
		log.info("get Array " + title + " for study.....");
		
		log.info(learningservice.getLastWordJsonArray(id, title));
		
		model.addAttribute("WordDTO", learningservice.getLastWordJsonArray(id, title));
	}
	
	@GetMapping("/test")
	public void moveTest(@RequestParam("id") String id, @RequestParam("title") String title, Model model) {
		
		log.info("get Array " + title + " for test.....");
		
		model.addAttribute("WordDTO", learningservice.getWordJsonArray(id, title));
	}
	
	@GetMapping("/search")
	public void searchList(@RequestParam String keyword, Model model) {
		log.info("search...");
		
		String id = keyword;
		model.addAttribute("idList",learningservice.getIdSearchList(id));
		
		String title = keyword;
		model.addAttribute("titleList",learningservice.getTitleSearchList(title));
		
	}	
	

}
