package org.zerock.controller;


import java.security.Principal;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.FolderVO;
import org.zerock.domain.PageDTO;
import org.zerock.domain.WordBookVO;
import org.zerock.service.FolderService;
import org.zerock.service.WordBookService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Controller
@Log4j
@RequestMapping("/folder/*")
@AllArgsConstructor
public class FolderController {
	
	private FolderService service;
	private WordBookService wordBookService;

	
	@PostMapping(value="/new",
			consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody FolderVO vo) {
		log.info("FolderVO: " + vo);
		
		int insertCount = service.register(vo);
		log.info("Folder INSERT COUNT: " + insertCount);
		
		return insertCount == 1
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/list") 
	public void list(Criteria cri, Model model) { 
		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		int total = service.getTotal(cri);
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	 
	
//	@GetMapping("/list")
//	public void list(Model model) {
//		log.info("list: " + cri);
//		model.addAttribute("list", service.getList(cri));
//		//model.addAttribute("pageMaker",new PageDTO(cri, 24));
//		
//		int total = service.getTotal(cri);
//		log.info("total: " + total);
//		model.addAttribute("pageMaker", new PageDTO(cri, total));
//	}
	
	@PostMapping("/register") //db에 자료가 insert
	public String register(FolderVO folder, RedirectAttributes rttr) {
		
		log.info("register: " + folder);
		
		service.register(folder);
		
		rttr.addFlashAttribute("result",folder.getFolderId());
		
		return "redirect:/folder/list";
	}
	
	
	@GetMapping({"/modify", "/get"})
	public void get(@RequestParam("folderId") Long folderId, @RequestParam("userId") String userId, Model model) {
		Criteria cri = new Criteria(1, 5);
		cri.setUserId(userId);
		cri.setFolderId(folderId);
		
		log.info("cri : " + cri);
		
		int total = wordBookService.getTotal(cri);
		log.info("folder total: " + total);
		
		log.info("/get or /modify");
		model.addAttribute("folder", service.get(folderId));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}
	
	@PostMapping("/modify")
	public String modify(FolderVO folder, RedirectAttributes rttr) {
		log.info("modify: " + folder);
		
		if (service.modify(folder)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/folder/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("folderId") Long folderId, RedirectAttributes rttr) {
		
		log.info("remove...." + folderId);
		if(service.remove(folderId)) {
	
			rttr.addFlashAttribute("result", "success");
		}
		 
		/*
		 * rttr.addAttribute("pageNum", cri.getPageNum()); rttr.addAttribute("amount",
		 * cri.getAmount()); rttr.addAttribute("type", cri.getType());
		 * rttr.addAttribute("keyword", cri.getKeyword());
		 */
		 		
		return "redirect:/folder/list";
	}
}
