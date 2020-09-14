package org.zerock.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Criteria;
import org.zerock.domain.FolderVO;
import org.zerock.domain.PageDTO;
import org.zerock.domain.WordBookVO;
import org.zerock.service.WordBookService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/wordbooks/")
@AllArgsConstructor
public class WordBookController {

	private WordBookService service;
	
	@PostMapping(value="/new",
			consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody WordBookVO vo) {
		log.info("WordBookVO: " + vo);
		
		int insertCount = service.register(vo);
		log.info("WordBook INSERT COUNT: " + insertCount);
		
		return insertCount == 1
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/pages/{folderId}/{page}/{userId}",
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
	
	@GetMapping(value="/add/user/{userId}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<WordBookVO>> getYourSet(
			@PathVariable("userId") String userId) {
		
		log.info("getYourSet : " + userId);
		return new ResponseEntity<>(service.getYourSet(userId), HttpStatus.OK);
	}
	
	@GetMapping(value = "/{bookId}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<WordBookVO> get(@PathVariable("bookId") Long bookId){
		
		log.info("get: " + bookId);
		
		return new ResponseEntity<>(service.get(bookId),HttpStatus.OK);
	}
	
	
	
	@DeleteMapping(value="/{bookId}",produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("bookId") Long bookId){
		log.info("remove: " + bookId);
		
		return service.remove(bookId) ==1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value="/{bookId}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
			@RequestBody WordBookVO vo,
			@PathVariable("bookId") Long bookId){
		vo.setBookId(bookId);
		
		log.info("bookId: " + bookId);
		log.info("modify : " + vo);
		
		return service.modify(vo) ==1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value="/modify/wordBook/{bookId}",
			consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modifyFromFolder(
			@RequestBody WordBookVO vo,
			@PathVariable("bookId") Long bookId) {
		log.info("bookId: " + bookId);
		log.info("modifyFromFolder: " + vo);
		
		return service.modifyFromFolder(vo) == 1
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
