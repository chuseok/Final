package org.android.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.script.ScriptException;
import javax.servlet.http.HttpServletRequest;

import org.dragon.controller.game.DragonController;
import org.dragon.controller.game.ProductController;
import org.dragon.domain.game.CollectionVO;
import org.dragon.domain.game.DragonVO;
import org.dragon.domain.game.InventoryVO;
import org.dragon.domain.game.ProductVO;
import org.dragon.domain.login.MemberVO;
import org.dragon.service.game.DragonService;
import org.dragon.service.game.InventoryService;
import org.dragon.service.game.ProductService;
import org.dragon.service.login.MemberService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/android")
@RestController
@Log4j
@AllArgsConstructor
public class DragonListController {

	DragonService service;
	MemberService memberService;
	InventoryService invenService;
	ProductService proService;

	@GetMapping(value = "/dragon/main")
	public List<Map<String, String>> memberRequestAndResponse(HttpServletRequest request) {

		List<MemberVO> MemList = new ArrayList<MemberVO>();
		List<Map<String, String>> result = new ArrayList<Map<String, String>>();

		MemList = memberService.getList();

		for (int i = 0; i < MemList.size(); i++) {
			Map<String, String> map = new HashMap<String, String>();
			String userId = MemList.get(i).getUserId();
			String userPwd = MemList.get(i).getUserPwd();
			String email = MemList.get(i).getEmail();
			String userName = MemList.get(i).getUserName();
			map.put("userId", userId);
			map.put("userPwd", userPwd);
			map.put("email", email);
			map.put("userName", userName);

			result.add(map);
		}

		return result;
	}

	@PostMapping(value = "/dragon/list")
	public List<Map<String, String>> dragonListWithRequestAndResponse(HttpServletRequest request) {

		String userId = request.getParameter("userId");
		List<Map<String, String>> result = new ArrayList<Map<String, String>>();
		List<DragonVO> dragonList = service.getAllDragonByUser(userId);
		for (int i = 0; i < dragonList.size(); i++) {
			DragonVO target = setImg(dragonList.get(i));
			Map<String, String> map = new HashMap<String, String>();
			map.put("dragonImage", target.getImg());
			map.put("hungryValue", target.getFoodValue() + "");
			map.put("dragonId", target.getDragonId() + "");

			result.add(map);
		}

		return result;
	}

	@GetMapping(value = "/dragon/get")
	public Map<String, String> getDragontWithRequestAndResponse(HttpServletRequest request) {

		String userId = request.getParameter("userId");
		int dragonId = Integer.parseInt(request.getParameter("dragonId"));
		Map<String, String> result = new HashMap<String, String>();
		DragonVO userInfo = new DragonVO(userId, dragonId, false);
		DragonVO dragon = service.getDragonByDragonId(userInfo);
		int coin = service.getCoin(userId);
		setImg(dragon);
		result.put("dragonImage", dragon.getImg());
		result.put("hungryValue", dragon.getFoodValue() + "");
		result.put("dragonTotalLevel", dragon.getTotalLevel() + "");
		result.put("dragonLevelValue", dragon.getLevelValue() + "");
		result.put("dragonId", dragon.getDragonId() + "");
		result.put("coin", coin + "");

		return result;
	}

	@GetMapping(value = "/inven/list")
	public List<Map<String, String>> getInvenWithRequestAndResponse(HttpServletRequest request) {

		String userId = request.getParameter("userId");
		List<Map<String, String>> result = new ArrayList<Map<String, String>>();
		List<ProductVO> invenList = invenService.getInventory(userId);

		for (int i = 0; i < invenList.size(); i++) {

			Map<String, String> map = new HashMap<String, String>();
			map.put("productId", invenList.get(i).getProductId() + "");
			map.put("productImage", invenList.get(i).getProductImage());
			map.put("count", invenList.get(i).getCnt() + "");
			if (invenList.get(i).getCategory().equals("item")) {
				result.add(map);
			}
		}
		return result;
	}

	@PostMapping(value = "/inven/use")
	public List<Map<String, String>> useProductWithRequestAndResponse(HttpServletRequest request)
			throws ScriptException {

		String userId = request.getParameter("userId");
		int dragonId = Integer.parseInt(request.getParameter("dragonId"));
		int productId = Integer.parseInt(request.getParameter("productId"));

		List<Map<String, String>> result = new ArrayList<Map<String, String>>();
		int value = invenService.valueSettingByItem(productId, userId, dragonId);
		invenService.use(userId, productId);

		List<ProductVO> invenList = invenService.getInventory(userId);

		for (int i = 0; i < invenList.size(); i++) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("productId", invenList.get(i).getProductId() + "");
			map.put("productImage", invenList.get(i).getProductImage());
			map.put("count", invenList.get(i).getCnt() + "");
			if (invenList.get(i).getCategory().equals("item")) {
				result.add(map);
			}
		}
		Map<String, String> dragonValue = new HashMap<String, String>();
		DragonVO userInfo = new DragonVO(userId, dragonId, false);
		DragonVO dragon = service.getDragonByDragonId(userInfo);
		int coin = service.getCoin(userId);
		setImg(dragon);
		dragonValue.put("dragonImage", dragon.getImg());
		dragonValue.put("hungryValue", dragon.getFoodValue() + "");
		dragonValue.put("dragonTotalLevel", dragon.getTotalLevel() + "");
		dragonValue.put("dragonLevelValue", dragon.getLevelValue() + "");
		dragonValue.put("dragonId", dragon.getDragonId() + "");
		result.add(dragonValue);
		return result;
	}

	@GetMapping(value = "/dragon/revive")
	public Map<String, Integer> reviveDragontWithRequestAndResponse(HttpServletRequest request) {

		String userId = request.getParameter("userId");
		int dragonId = Integer.parseInt(request.getParameter("dragonId"));
		Map<String, Integer> result = new HashMap<String, Integer>();

		MemberVO member = memberService.get(userId);
		if (member.getCoin() < 20000) {
			result.put("checkCoin", -1);
			result.put("coin", -1);
			return result;
		}
		member.setCoin(member.getCoin() - 20000);

		DragonVO userInfo = new DragonVO(userId, dragonId, false);
		DragonVO dragon = service.getDragonByDragonId(userInfo);
		dragon.setFoodValue(100);
		service.updateCoin(member);
		service.updateDragon(dragon);
		result.put("checkCoin", 0);
		result.put("coin", member.getCoin());
		return result;

	}

	@GetMapping(value = "/dragon/collection")
	public List<Map<String, String>> getCollectionWithRequestAndResponse(HttpServletRequest request) {

		String userId = request.getParameter("userId");
		List<CollectionVO> dragonImageList = service.getListByDragonLists();

		List<Map<String, String>> result = new ArrayList<Map<String, String>>();
		List<DragonVO> users = service.getAllDragonByUser(userId);

		for (int i = 0; i < dragonImageList.size(); i++) {
			Map<String, String> map = new HashMap<String, String>();
			for (int j = 0; j < users.size(); j++) {
				log.info("aaaaa : "+users.get(j).getDragonId());
				if (users.get(j).getDragonId() == dragonImageList.get(i).getDragonId()) {
					map.put("procession", "true");
					map.put("dragonLevel", users.get(j).getTotalLevel() + "");
					break;
				} else {
					map.put("procession", "false");
					map.put("dragonLevel", "-1");
				}
			}
			map.put("level1", dragonImageList.get(i).getLevel1());
			map.put("level1Name", service.getLevel1Name(dragonImageList.get(i).getLevel1()));
			map.put("level2", dragonImageList.get(i).getLevel2());
			map.put("level2Name", service.getLevel2Name(dragonImageList.get(i).getLevel2()));
			map.put("level3", dragonImageList.get(i).getLevel3());
			map.put("level3Name", service.getLevel3Name(dragonImageList.get(i).getLevel3()));
			result.add(map);
		}

		return result;

	}

	@GetMapping(value = "/background/collection")
	public List<Map<String, String>> getBackgroundCollectionWithRequestAndResponse(HttpServletRequest request) {

		String userId = request.getParameter("userId");
		List<ProductVO> backgroundList = proService.getProductByCategory("background");

		List<Map<String, String>> result = new ArrayList<Map<String, String>>();
		List<ProductVO> userItemList = invenService.getInventory(userId);

		for (int i = 0; i < backgroundList.size(); i++) {
			Map<String, String> map = new HashMap<String, String>();

			for (int j = 0; j < userItemList.size(); j++) {

				if (userItemList.get(j).getProductId() == backgroundList.get(i).getProductId()) {
					map.put("procession", "true");
					map.put("backgroundImage", backgroundList.get(i).getProductImage());
					map.put("backgroundName", backgroundList.get(i).getProductName());
					break;
				} else {
					map.put("procession", "false");
				}
				map.put("backgroundImage", backgroundList.get(i).getProductImage());
				map.put("backgroundName", backgroundList.get(i).getProductName());
			}
			result.add(map);
		}

		return result;

	}

	@GetMapping(value = "/shop/list")
	public List<Map<String, String>> shopListWithRequestAndResponse(HttpServletRequest request) {

		List<ProductVO> shopList = proService.getList();

		List<Map<String, String>> result = new ArrayList<Map<String, String>>();

		for (int i = 0; i < shopList.size(); i++) {
			Map<String, String> map = new HashMap<String, String>();

			map.put("productId", shopList.get(i).getProductId() + "");
			map.put("productImage", shopList.get(i).getProductImage());
			map.put("productName", shopList.get(i).getProductName());
			map.put("category", shopList.get(i).getCategory());
			map.put("description", shopList.get(i).getDescription());
			map.put("price", shopList.get(i).getPrice() + "");

			result.add(map);
		}

		return result;

	}

	@PostMapping(value = "/shop/buy")
	public void buyWithRequestAndResponse(HttpServletRequest request) {

		String userId = request.getParameter("userId");
		int productId = Integer.parseInt(request.getParameter("productId"));
		int buyAmount = Integer.parseInt(request.getParameter("buyAmount"));
		int coin = service.getCoin(userId);
		int price = proService.getProductById(productId).getPrice();
		if (coin < price * buyAmount) {
			return;
		}
		InventoryVO inventory = new InventoryVO(idGenerater(), userId, productId, buyAmount, null);
		DragonVO dragon = new DragonVO(userId, 1, 0, 100, 71);
		invenService.buy(inventory, dragon);
	}

	@PostMapping(value = "/product/check")
	public Map<String, Integer> checkWithRequestAndResponse(HttpServletRequest request) {

		String userId = request.getParameter("userId");
		int productId = Integer.parseInt(request.getParameter("productId"));
		String category = proService.getProductById(productId).getCategory();
		int coin = service.getCoin(userId);
		
		
		Map<String, Integer> result = new HashMap<String, Integer>();
		
		if(category.equals("egg") || category.equals("background")) {
			List<Integer> dragonIdList = invenService.findNotUsedId(productId, userId);
			if(dragonIdList.isEmpty()) {
				result.put("buyCheck", 1);
				result.put("coin", coin);
				return result;
			}
		}
		result.put("buyCheck", 0);
		result.put("coin", coin);

		return result;
	}

	public DragonVO setImg(DragonVO vo) {// �̹��� ����

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

	private String idGenerater() {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";

		for (int i = 1; i <= 6; i++) {
			subNum += (int) (Math.random() * 10);
		}

		String orderId = ymd + subNum;
		return orderId;
	}
}
