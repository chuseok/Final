package org.dragon.web.controller;


import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.dragon.domain.login.AuthVO;
import org.dragon.domain.login.MemberVO;
import org.dragon.service.login.MemberService;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.tst.NaverLoginBO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class MemberController {

	private MemberService service;
	

	//join
	@PostMapping("/main/join")
	public String register(@ModelAttribute("mem") MemberVO mem,@ModelAttribute("vo") AuthVO vo, RedirectAttributes rttr) {
		log.info("join: " + mem);
		log.info("auth...."+vo);
		
		int result = service.idCheck(mem);
		int result2 = service.nameCheck(mem);
		
		try {
			if(result ==1 && result2 ==1) {
				return "/home";
			}else if(result == 0) {
				service.register(mem);
				service.register(vo);			
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		
		
		rttr.addFlashAttribute("result",mem.getUserId());
		rttr.addFlashAttribute("result",vo.getUserId());
		
		return "redirect:/home";
	}
	@GetMapping("/main/join")
	public void join() {
		
	}
	// get
	@RequestMapping(value="/withdrawal", method = RequestMethod.GET)
	public String withdrawalView(){
		return "/withdrawal";
	}
	
	// post
	@RequestMapping(value = "/withdrawal", method = RequestMethod.POST)
public String withdrawal(@ModelAttribute("mem") MemberVO mem,@ModelAttribute("vo") AuthVO vo,HttpSession session,
		Model model, RedirectAttributes rttr){
		log.info("withdrawal: " + mem);
		log.info("removeauth...."+vo);
		
		int result = service.PwdCheck(mem);
		try {
			if(result ==1) {
				
				service.withdrawal(vo);
				service.withdrawal(mem);
				
			}else if(result == 0) {
				return "redirect:/home";
			}
			
		} catch (Exception e) {
			throw new RuntimeException();
		}
		
		
		rttr.addFlashAttribute("result",mem.getUserId());
		rttr.addFlashAttribute("result",vo.getUserId());
		
		
		return "redirect:/home";
	}
		
	
	@GetMapping("/main/update")
	public void updateView() {
		
	}
	
	@RequestMapping(value = "/main/update", method = RequestMethod.POST)
	public String updateView(@ModelAttribute("mem") MemberVO mem, RedirectAttributes rttr){
			log.info("updateView: " + mem);
			
			
			
			int result = service.PwdCheck(mem);
			try {
				if(result ==1) {
					return "redirect:/main/updateFrm";
					
				}else if(result == 0) {
					return "redirect:/main/update";
				}
				
			} catch (Exception e) {
				throw new RuntimeException();
			}
			rttr.addFlashAttribute("result",mem.getUserId());

			return "/";
		}
	@GetMapping("/main/updateFrm")
	public void update() {
		
	}
	//�땳�꽕�엫 蹂�寃�
	@PostMapping("/main/updateFrm")
	public String update(@ModelAttribute("mem") MemberVO mem, RedirectAttributes rttr) {
		log.info("update userName: " + mem);
		
		int result = service.nameCheck(mem);
		
		try {
			if(result ==1) {
				return "/main/updateFrm";
			}else if(result == 0) {
				service.modify(mem);
			}
			
		} catch (Exception e) {
			throw new RuntimeException();
		}
		
		setPrincipal();
		
		rttr.addFlashAttribute("result",mem.getUserId());
		
		
		return "redirect:/main";
	}
	@GetMapping("/main/updateFrm2")
	public void update2() {
		
	}
	//鍮꾨�踰덊샇 蹂�寃�
	@PostMapping("/main/updateFrm2")
	public String update2(@ModelAttribute("mem") MemberVO mem, RedirectAttributes rttr) {
		log.info("update password: " + mem);
		
				service.modify2(mem);
				
				setPrincipal();
				
		rttr.addFlashAttribute("result",mem.getUserId());
		
		
		
		return "redirect:/main";
	}
	//�빖�뱶�룿 踰덊샇 蹂�寃�
	@GetMapping("/main/updateFrm3")
	public void update3() {
		
	}
	//�빖�뱶�룿 踰덊샇 蹂�寃�
	@PostMapping("/main/updateFrm3")
	public String update3(@ModelAttribute("mem") MemberVO mem, RedirectAttributes rttr) {
		log.info("update phoneNo: " + mem);
		
				service.modify3(mem);
				
				setPrincipal();
				
		rttr.addFlashAttribute("result",mem.getUserId());
		
		
		return "redirect:/main";
	}
	//�씠硫붿씪二쇱냼 蹂�寃�
		@GetMapping("/main/updateFrm4")
		public void update4() {
			
		}
		//�빖�뱶�룿 踰덊샇 蹂�寃�
		@PostMapping("/main/updateFrm4")
		public String update4(@ModelAttribute("mem") MemberVO mem, RedirectAttributes rttr) {
			log.info("update email: " + mem);
			
					service.modify4(mem);
					
					setPrincipal();
					
			rttr.addFlashAttribute("result",mem.getUserId());
			
			
			return "redirect:/main";
		}
    //�쉶�썝媛��엯 泥댄겕
	@ResponseBody
	@RequestMapping(value="/main/idCheck", method = RequestMethod.POST)
	public int idChk(MemberVO mem) throws Exception {
		int result = service.idCheck(mem);
		return result;
	}
	@ResponseBody
	@RequestMapping(value="/main/nameCheck", method = RequestMethod.POST)
	public int nameCheck(MemberVO mem) throws Exception {
		log.info("hello");
		int result = service.nameCheck(mem);
		return result;
	}
	
	
	//�쉶�썝�깉�눜,�젙蹂대�寃쎌떆 �븘�슂�븳 鍮꾨�踰덊샇泥댄겕
	@ResponseBody
	@RequestMapping(value="/main/PwdCheck", method = RequestMethod.POST)
	public int PwdChk(MemberVO mem) throws Exception {
		int result = service.PwdCheck(mem);
		return result;
	}
	
	private void setPrincipal() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Authentication authentication = new UsernamePasswordAuthenticationToken(auth.getPrincipal(), auth.getCredentials());
		SecurityContextHolder.getContext().setAuthentication(authentication);
	}

	
	
}
