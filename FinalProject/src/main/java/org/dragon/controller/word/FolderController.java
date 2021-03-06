package org.dragon.controller.word;


import java.security.Principal;
import java.util.List;

import org.dragon.domain.game.DragonVO;
import org.dragon.domain.game.RankVO;
import org.dragon.domain.word.Criteria;
import org.dragon.domain.word.FolderVO;
import org.dragon.domain.word.PageDTO;
import org.dragon.service.game.DragonService;
import org.dragon.service.game.RankService;
import org.dragon.service.word.FolderService;
import org.dragon.service.word.WordBookService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Controller
@Log4j
@RequestMapping("/folders/*")
@AllArgsConstructor
public class FolderController {
	
	private FolderService service;
	private RankService rankService;
	private DragonService dragonService;
	private WordBookService wordBookService;

	//post
	@PreAuthorize("isAuthenticated()")
	@PostMapping(
			value="/new",
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
	public void list(Principal principal,Criteria cri, Model model) { 
		log.info("list: " + cri);
		cri.setUserId(principal.getName());
		model.addAttribute("list", service.getList(cri));
      log.info("listAlp: " + cri);
      model.addAttribute("listAlp", service.getListAlp(cri));

		int total = service.getTotal(cri);
		log.info("total: " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		String userId = principal.getName();
		
		DragonVO vo = dragonService.getDragonByUser(userId);
		if(vo==null) {
			model.addAttribute("profile", -1);
		}else {
			List<RankVO> rankingList = rankService.getRankList();
			RankVO userInfo = rankService.getUserRank(userId);
			model.addAttribute("rank", rankingList);
			model.addAttribute("userInfo", userInfo);
			model.addAttribute("profile", userInfo.getImg());
			
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/FolderCheck", method = RequestMethod.POST)
	public int FolderChk(FolderVO folder) throws Exception {
		int result = service.FolderCheck(folder);
	    return result;
	}

	@GetMapping("/get")
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
	
	@PutMapping("/modify")
	public String modify(FolderVO folder, RedirectAttributes rttr) {
		log.info("modify: " + folder);
		
		if (service.modify(folder)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/folders/list";
	}

	@DeleteMapping(value = "/{folderId}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("folderId") Long folderId) {
		log.info("remove: " + folderId);
		/*
		 * rttr.addAttribute("pageNum", cri.getPageNum()); rttr.addAttribute("amount",
		 * cri.getAmount()); rttr.addAttribute("type", cri.getType());
		 * rttr.addAttribute("keyword", cri.getKeyword());
		 */
		return service.remove(folderId)
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
