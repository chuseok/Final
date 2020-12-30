package org.dragon.controller.word;

import org.dragon.domain.word.MailDTO;
import org.dragon.service.word.EmailService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@ResponseBody
@Log4j
@AllArgsConstructor
public class MailController {
	
	private EmailService service;
	
	@RequestMapping(value="/mail", method = {RequestMethod.POST},
			consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> sendMail(@RequestBody MailDTO mail) { 
		log.info("send controller: " + mail);

		service.sendSimpleMessage(mail.getTo(), mail.getSubject(), mail.getText());
		boolean result = true;
		return result
		? new ResponseEntity<>("send mail.", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
//90127lucy@gmail.com
