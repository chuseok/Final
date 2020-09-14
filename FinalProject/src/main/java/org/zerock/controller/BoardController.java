package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.AuthVO;
import org.zerock.domain.BoardVO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class BoardController {

	private BoardService service;
	
	@GetMapping("/main/home1")
	public void list(Model model) {
		log.info("home1");
		
		model.addAttribute("home1", service.getList());
	}
	@PostMapping("/main/join")
	public String register(BoardVO board,AuthVO vo, RedirectAttributes rttr) {
		log.info("join: " + board);
		log.info("auth...."+vo);
		log.info("log확인....");
		System.out.println("log2확인.........");
		
		int result = service.idCheck(board);
		try {
			if(result ==1) {
				System.out.println("議댁옱");
				return "/main";
			}else if(result == 0) {
				service.register(board);
				service.register(vo);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		
		
		rttr.addFlashAttribute("result",board.getUserId());
		rttr.addFlashAttribute("result",vo.getUserId());
		
		
		return "redirect:/main";
	}
	@GetMapping("/main/join")
	public void join() {
		
	}
	
	@GetMapping("/main/get")
	public void get(@RequestParam("userId") String userId, Model model) {
		log.info("/get");
		model.addAttribute("main", service.get(userId));
	}

	@ResponseBody
	@RequestMapping(value="/main/idCheck", method = RequestMethod.POST)
	public int idChk(BoardVO board) throws Exception {
		int result = service.idCheck(board);
		return result;
	}

}
