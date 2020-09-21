package org.study.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.study.service.LearningService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class SearchController {
	
	private LearningService learningservice;
	
	@GetMapping("/search")
	public void searchList(@RequestParam String keyword, Model model) {
		log.info("search...");
		
		String id = keyword;
		model.addAttribute("idList",learningservice.getIdSearchList(id));
		
		String title = keyword;
		model.addAttribute("titleList",learningservice.getTitleSearchList(title));
		
	}
	
	
	
	
	
	
	
	

}