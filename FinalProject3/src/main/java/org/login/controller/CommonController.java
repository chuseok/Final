package org.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.tst.NaverLoginBO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {

	@GetMapping("/accessError")
	public void accessDenined(Authentication auth, Model model) {
		log.info("Access Denied : " + auth);
		
		model.addAttribute("msg", "Access Denied");
	}
	
	
	@GetMapping("/customLogout")
	public void logoutGET() {
		log.info("custom logout");
	}
	
	@RequestMapping(value="/customLogin", method = { RequestMethod.GET, RequestMethod.POST })
	   public void loginInput(String error, String logout, Model model,HttpSession session) {
	      log.info("error: " + error);
	      log.info("logout: " + logout);
	      
	      if(error!=null) {
	         model.addAttribute("error", "아이디 또는 비밀번호 오류입니다!");
	      }
	      if(logout!=null) {
	         model.addAttribute("logout", "로그아웃 하였습니다!");
	      }
	      String naverAuthUrl = NaverLoginBO.getAuthorizationUrl(session);
	        
	         
	        System.out.println("네이버:" + naverAuthUrl);
	      model.addAttribute("url", naverAuthUrl);
	   }
	
	
}
