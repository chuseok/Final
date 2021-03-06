package org.dragon.controller.game;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.dragon.domain.game.DragonVO;
import org.dragon.domain.game.InventoryVO;
import org.dragon.domain.game.ProductVO;
import org.dragon.service.game.DragonService;
import org.dragon.service.game.InventoryService;
import org.dragon.service.game.ProductService;
import org.dragon.service.login.MemberService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/dragon/*")
@AllArgsConstructor
@PreAuthorize("isAuthenticated()")
public class DragonController {

	private DragonService service;
	private InventoryService invenService;
	private ProductService proService;
	private MemberService userService;

	@GetMapping("/dragonPanel")
	public void dragonPanel(Principal principal, Model model) {
		if (principal == null) {
			model.addAttribute("alert", true);
			model.addAttribute("noDragon", false);
			return;
		}
		String userId = principal.getName();
		DragonVO dragon = service.getDragonByUser(userId);
		System.out.println(dragon);

		if (dragon == null) {
			model.addAttribute("noDragon", true);
			model.addAttribute("item", null);
			model.addAttribute("values", null);
			model.addAttribute("selectedEgg", 0);
			model.addAttribute("dragonList", null);
			model.addAttribute("background", null);
		} else {
			List<ProductVO> inventory = invenService.getInventory(userId);
			if (dragon != null) {
				setImg(dragon);
			}

			
			List<DragonVO> dragonList = service.getAllDragonByUser(userId);
			dragonList.forEach(vo -> {
				setImg(vo);
			});
			ProductVO background = proService.getProductById(dragon.getBackgroundId());

			model.addAttribute("item", inventory);
			model.addAttribute("values", dragon);
			model.addAttribute("selectedEgg", dragon.getDragonId());
			model.addAttribute("dragonList", dragonList);
			model.addAttribute("background", background);
			model.addAttribute("noDragon", false);
			model.addAttribute("coin", service.getCoin(userId));
		}

	}

	@RequestMapping(value = "/dragonPanel", method = RequestMethod.POST, produces = {
			MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE })
	@ResponseBody
	public ResponseEntity<DragonVO> dragonUpdate(@ModelAttribute DragonVO vo, Model model) {
		if (vo.getFoodValue() >= 100) {
			vo.setFoodValue(100);
		} else if (vo.getLevelValue() >= 100) {
			vo.setLevelValue(100);
		}
		service.updateDragon(vo);
		System.out.print(vo);
		setImg(vo);
		model.addAttribute("dragonList", vo);

		return new ResponseEntity<DragonVO>(vo, HttpStatus.OK);
	}

	@RequestMapping(value = "/equip", method = RequestMethod.POST, produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	@ResponseBody
	public ResponseEntity<ProductVO> equip(@RequestParam("dragonId") String dragonId,
			@RequestParam("lastId") String lastId, Principal principal, Model model) {
		String userId = principal.getName();
		service.updateEquip(new DragonVO(userId, Integer.parseInt(lastId), false));
		service.updateEquip(new DragonVO(userId, Integer.parseInt(dragonId), true));
		ProductVO vo = proService.getProductById(service.getEgg(userId)); 
		return new ResponseEntity<ProductVO>(vo, HttpStatus.OK);
	}

	@RequestMapping(value = "/equip/background", method = RequestMethod.POST, produces = {
			MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE })
	@ResponseBody
	public ResponseEntity<ProductVO> equipBackground(@RequestBody DragonVO vo, Principal principal, Model model) {
		String userId = principal.getName();
		service.updateBackground(new DragonVO(userId, vo.getDragonId(), vo.getBackgroundId()));
																								
		ProductVO background = proService.getProductById(vo.getBackgroundId());
		return new ResponseEntity<ProductVO>(background, HttpStatus.OK);
	}

	@GetMapping("/delete")
	public String delete(@RequestParam("chooseDragon") int chooseDragon, Principal principal) {
		
		System.out.println("delete dragon : " + chooseDragon);
		String userId = principal.getName();
		DragonVO deleteDragon = service.getDragonByUser(userId);
		service.delete(deleteDragon);
		List<DragonVO> dragonList = service.getAllDragonByUser(userId);
		dragonList.forEach(vo -> { 
			if (vo.getDragonId() == chooseDragon) {
				vo.setEquip(true); 
				service.updateEquip(vo);
			}

		});
		return "redirect:../dragon/dragonPanel";
	}

	@GetMapping("/revive")
	public String revive(Principal principal) {
		if (principal == null) {
			return "redirect:../main";
		}
		String userId = principal.getName();
		service.reviveDragon(userId);
		return "redirect:../dragon/dragonPanel";
	}
	
	

	public DragonVO setImg(DragonVO vo) {// 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占썲래占쏙옙 占싱뱄옙占쏙옙 占쏙옙占쏙옙
		
		int level = vo.getTotalLevel();
		HashMap<String, String> dragonList = service.getImageByLevel(vo.getDragonId());
		if (dragonList != null) {
			if (level < 10) {
				vo.setImg(dragonList.get("level0"));
			} else if (level >= 10 && level < 20) {
				vo.setImg(dragonList.get("level1"));
			} else if (level >= 20 && level < 30) {
				vo.setImg(dragonList.get("level2"));
			} else if (level >= 30) {
				vo.setImg(dragonList.get("level3"));
			}
		}
		return vo;
	}

}
