package org.dragon.controller.word;

import java.util.List;

import org.dragon.domain.word.Criteria;
import org.dragon.domain.word.FolderVO;
import org.dragon.domain.word.PageDTO;
import org.dragon.domain.word.WordBookVO;
import org.dragon.service.word.WordBookService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/wordbooks/")
@AllArgsConstructor
public class WordBookController {

	private WordBookService service;
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(
			value="/new",
			consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody WordBookVO vo) {
		log.info("WordBookVO: " + vo);
		int insertCount = 0;
		if(service.get(vo)== null) {
			insertCount = service.register(vo);
			log.info("WordBook INSERT COUNT: " + insertCount);

		}
		
		return insertCount == 1
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>("update", HttpStatus.OK);
	}
	
	//page는 service.getList에서 필요로함
	//특정 페이지의 단어장 목록 확인
	@PreAuthorize("isAuthenticated()")
	@GetMapping(value="/pages/{page}/folders/{folderId}/users/{userId}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<WordBookVO>> getList(
			@PathVariable("page") int page, 
			@PathVariable("folderId") Long folderId, @PathVariable("userId") String userId, Model model){
		log.info("getList............");
		Criteria cri = new Criteria(page, 5);
		cri.setUserId(userId);
		cri.setFolderId(folderId);
		
		log.info("cri : " + cri);
		
		int total = service.getTotal(cri);
		log.info("wordbook total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return new ResponseEntity<>(service.getList(cri), HttpStatus.OK);
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping(value="/user/{userId}/your-sets",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<WordBookVO>> getYourSet(
			@PathVariable("userId") String userId) {
		
		log.info("getYourSet : " + userId);
		return new ResponseEntity<>(service.getYourSet(userId), HttpStatus.OK);
	}
	
	
	 @GetMapping(value = "/{userId}/{wordTitle}", 
			 produces = {
				MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE}) 
	 public ResponseEntity<WordBookVO> get(@PathVariable("userId") String
			 userId, @PathVariable("wordTitle") String wordTitle){
		 log.info("get: " + userId + "," + wordTitle);

		 WordBookVO vo = new WordBookVO();
		 vo.setUserId(userId);
		 vo.setWordTitle(wordTitle);
		 
		 return new ResponseEntity<>(service.get(vo),HttpStatus.OK); 
	 }

	
	@PreAuthorize("isAuthenticated()")
	@DeleteMapping(value="/{bookId}",produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("bookId") Long bookId){
		log.info("remove: " + bookId);
		
		return service.remove(bookId) ==1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value="/{bookId}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody WordBookVO vo, @PathVariable("bookId") Long bookId){
		vo.setBookId(bookId);
		
		log.info("bookId: " + bookId);
		log.info("modify : " + vo);
		
		return service.modify(vo) ==1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value="/modify/wordBook/{bookId}",
			consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modifyFromFolder(@RequestBody WordBookVO vo, @PathVariable("bookId") Long bookId) {
		log.info("bookId: " + bookId);
		log.info("modifyFromFolder: " + vo);
		
		return service.modifyFromFolder(vo) == 1
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
