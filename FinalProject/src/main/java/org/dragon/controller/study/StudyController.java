package org.dragon.controller.study;

import java.util.List;
import java.util.Map;

import org.dragon.domain.login.MemberVO;
import org.dragon.domain.study.StudyDTO;
import org.dragon.domain.study.WordDTO;
import org.dragon.service.game.DragonService;
import org.dragon.service.login.MemberService;
import org.dragon.service.study.LearningService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@PreAuthorize("isAuthenticated()")
public class StudyController {
	
	@Autowired
	private LearningService learningservice;
	@Autowired
	private DragonService dragonService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/study")
	public List<WordDTO> getAllWordList(){
		
		log.info("get all list........");

		return learningservice.getAllWordList();		
	}
	
	@RequestMapping("/study/{id}/{title}")
	public WordDTO getWordDTO(@PathVariable String id, @PathVariable String title ) {
		log.info("getWordDTO...");
		log.info(learningservice.getWordDTO(id,title));
		
		return learningservice.getWordDTO(id,title);
	}//test01 read
	
	@RequestMapping(method = RequestMethod.POST,
			value = "/study/uprate",
			consumes="application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE })
	public void upRate(@RequestBody Map<String, Object> param ) {
		String id = param.get("id").toString();
		String title = param.get("title").toString();
		String word = param.get("word").toString();
		
		//肄붿씤媛� 利앷�
		MemberVO user = memberService.get(id);
		user.setCoin(user.getCoin()+100);
		dragonService.updateCoin(user);
		
		learningservice.upRate(id,title,word);
	}
	
	
	@RequestMapping(method = RequestMethod.POST,
			value = "/study/resetrate",
			consumes="application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE })
	public String resetRate(@RequestBody Map<String, Object> param/* , RedirectAttributes rttr */ ) throws Exception {
		String id = param.get("id").toString();
		String title = param.get("title").toString();
		log.info(id+","+title+"initialized.....");
		
		learningservice.resetRate(id,title);
		/*
		 * rttr.addAttribute("id",id); rttr.addAttribute("title",title);
		 */
		
		return "success";
				
	}
	
	@RequestMapping(method = RequestMethod.POST,
			value = "/study/recent",
			consumes="application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE })
	public String addRecent(@RequestBody Map<String, Object> param/* , RedirectAttributes rttr */ ) throws Exception {
		String bookId = param.get("bookId").toString();
		String bookTitle = param.get("bookTitle").toString();
		String userId = param.get("userId").toString();
		log.info(bookId +", "+ bookTitle +", " +userId);
		
		StudyDTO study = new StudyDTO();
		study.setBookId(bookId);
		study.setBookTitle(bookTitle);
		study.setUserId(userId);		
		
		learningservice.addRecentStudy(study);
		
		return "success";
				
	}
	

}
