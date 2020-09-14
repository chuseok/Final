package org.zerock.service;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class EmailServiceImpl implements EmailService {

	@Autowired
	private JavaMailSender emailSender;
	@Autowired
	private SimpleMailMessage template;
	
	
	@Override
	public void sendSimpleMessage(String to, String subject, String text) {

		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("90127lucy@gmail.com");
		message.setTo(to);
		message.setSubject(subject);
		message.setText(text);
		emailSender.send(message);
	}

	@Override
	public void sendMessageWithAttachment(String to, String subject, String text, String pathToAttachment) throws MessagingException {
		MimeMessage message = emailSender.createMimeMessage();
	     
	    MimeMessageHelper helper = new MimeMessageHelper(message, true);
	    
		/* helper.setFrom("noreply@baeldung.com"); */
	    helper.setTo(to);
	    helper.setSubject(subject);
	    helper.setText(text);
	        
	    FileSystemResource file 
	      = new FileSystemResource(new File(pathToAttachment));
	    helper.addAttachment("Invoice", file);
	 
	    emailSender.send(message);
		
	}

	@Override
	public void sendTemplateMessage(String to, String subject) {
		String[] templateArgs = {"utf8", "html"};
		String text = String.format(template.getText(), templateArgs);
		log.info("to : " + to + ", " + "subject : " + subject + ", " + "text : " + text); 
		sendSimpleMessage(to, subject, text);
	}
	
	

	
}
