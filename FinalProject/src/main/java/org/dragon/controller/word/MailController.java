package org.dragon.controller.word;

import org.dragon.domain.word.MailDTO;
import org.dragon.domain.word.WordBookVO;
import org.dragon.service.word.EmailService;
import org.dragon.service.word.FolderService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

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
