package org.zerock.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.MailDTO;
import org.zerock.domain.WordBookVO;
import org.zerock.service.EmailService;
import org.zerock.service.FolderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mail/")
@AllArgsConstructor
public class MailController {

	private EmailService service;
	
	@PostMapping(value="/send",
			consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> sendMail(@RequestBody MailDTO mail) { 
		log.info("send controller: " + mail);

		service.sendTemplateMessage(mail.getTo(), mail.getSubject(), mail.getText());
		boolean result = true;
		return result
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
//	@PostMapping(value="/new",
//			consumes="application/json",
//			produces= {MediaType.TEXT_PLAIN_VALUE})
//	public ResponseEntity<String> create(@RequestBody WordBookVO vo) {
//		log.info("WordBookVO: " + vo);
//		
//		int insertCount = service.register(vo);
//		log.info("WordBook INSERT COUNT: " + insertCount);
//		
//		return insertCount == 1
//		? new ResponseEntity<>("success", HttpStatus.OK)
//		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
	
}
