package org.login.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dragon.mapper.MainMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	@Setter(onMethod_ = { @Autowired})
	private MainMapper mapper;
	
	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication auth)
	throws IOException, ServletException{

		log.warn("Login Success");
		
		List<String> roleNames = new ArrayList<>();
		
		auth.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		
		String user = auth.getName();
		HttpSession session = request.getSession();
		
		getSessionDate(session, user);
		
		log.warn("ROLE NAMES: " + roleNames);
		
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/sample/admin");
			return;
		}
		if(roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/main");
			return;
		}
		response.sendRedirect("/");
	}
	
	public void getSessionDate(HttpSession session, String userId) {
		
		Date lastConn = mapper.getDate(userId);
		Date now = new Date();
		
		long diff = now.getTime()-lastConn.getTime();
		long sec = diff/1000%60;
		long min = diff/(1000*60)%60;
		long hour = diff/(1000*60*60)%24;
		long day = diff/(1000*60*60*24);
		
		if(sec>0&&hour==0)
<<<<<<< HEAD
			session.setAttribute("text", min+"ºÐ"+sec+"ÃÊ¸¸¿¡ Á¢¼ÓÇÏ¼Ì½À´Ï´Ù");
		else if(hour>0&&day==0)
			session.setAttribute("text", hour+"½Ã"+min+"ºÐ¸¸¿¡ Á¢¼ÓÇÏ¼Ì½À´Ï´Ù.");
		else if(day>0)
			session.setAttribute("text", day+"ÀÏ"+hour+"½Ã¸¸¿¡ Á¢¼ÓÇÏ¼Ì½À´Ï´Ù.");
		else if(sec==0) {
			//session.setAttribute("text", "¸Þ½ÃÁö°¡ ¾ø½À´Ï´Ù.");
=======
			session.setAttribute("text", min+"ë¶„"+sec+"ì´ˆë§Œì— ì ‘ì†í•˜ì…¨ìŠµë‹ˆë‹¤.");
		else if(hour>0&&day==0)
			session.setAttribute("text", hour+"ì‹œ"+min+"ë¶„ë§Œì— ì ‘ì†í•˜ì…¨ìŠµë‹ˆë‹¤.");
		else if(day>0)
			session.setAttribute("text", day+"ì¼"+hour+"ì‹œê°„ë§Œì— ì ‘ì†í•˜ì…¨ìŠµë‹ˆë‹¤.");
		else if(sec==0) {
			//session.setAttribute("text", "ë©”ì‹œì§€ê°€ ì—†ìŠµë‹ˆë‹¤.");
>>>>>>> 011339651da4deb0f2631006f39ed238162daf0c
		}
	}
}
