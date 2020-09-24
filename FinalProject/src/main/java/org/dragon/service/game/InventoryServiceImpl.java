package org.dragon.service.game;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

import org.dragon.domain.game.DragonVO;
import org.dragon.domain.game.InventoryVO;
import org.dragon.domain.game.ProductVO;
import org.dragon.domain.login.MemberVO;
import org.dragon.mapper.game.DragonMapper;
import org.dragon.mapper.game.InventoryMapper;
import org.dragon.mapper.game.ProductMapper;
import org.dragon.mapper.login.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class InventoryServiceImpl implements InventoryService{
	
	@Setter(onMethod_ = @Autowired)
	private InventoryMapper mapper;
	@Setter(onMethod_ = @Autowired)
	private DragonMapper dragonMapper;
	@Setter(onMethod_ = @Autowired) 
	private ProductMapper proMapper;
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	
	@Transactional
	@Override
	public boolean buy(InventoryVO vo, DragonVO dragonVO) {
		log.info("buy service : "+vo);
		List<InventoryVO> inventory = mapper.findById(dragonVO.getUserId());
		InventoryVO background = new InventoryVO(idGenerater(), dragonVO.getUserId(), dragonVO.getBackgroundId(), 1, null);
		ProductVO product = proMapper.getById(vo.getProductId());
		boolean checkName = false; 
		List<DragonVO> userList = dragonMapper.getAll(dragonVO.getUserId());
		
		if(product.getCategory().equals("egg")) {
			List<Integer> dragonIdList = mapper.findNotUsedId(vo.getProductId());
			if(dragonIdList.isEmpty()) {
				return false;
			}else {
				dragonVO.setDragonId(dragonIdList.get(0));
				dragonMapper.create(dragonVO);
				mapper.insert(vo);
				if(mapper.get(background)==null) {
					mapper.insert(background);
				}
				
			}
			
		}else {
			for(InventoryVO i : inventory) {
				if(i.getProductId()==vo.getProductId()) {
					i.setAmount(i.getAmount()+vo.getAmount());
					mapper.update(i);
					checkName =true;
				}
			}
			if(!checkName){
				mapper.insert(vo);	
			}
		}
		int balance = dragonMapper.getCoin(dragonVO.getUserId()) - product.getPrice()*vo.getAmount();
		if(userList.size()==0) {
			dragonVO.setEquip(true);
			dragonMapper.updateEqiup(dragonVO);
		}
		MemberVO user = memberMapper.read(vo.getUserId());
		user.setCoin(balance);
		dragonMapper.updateCoin(user);
		return true;
	}

	@Override
	public ProductVO use(String userId, int selected) {
		int amount = -1;
		ProductVO usedProduct = new ProductVO();
		List<InventoryVO> inventory = mapper.findById(userId);
		for(InventoryVO i : inventory) {
			if(i.getProductId()==selected) {
				i.setAmount(i.getAmount()-1);
				amount = i.getAmount();
				if(amount==0) {
					mapper.delete(i.getInventoryId());
				}
				else {
					mapper.update(i);
				}
				
				usedProduct = proMapper.getById(i.getProductId());
				usedProduct.setCnt(amount);
			}
		}
		return usedProduct;
		
	}

	@Override
	public List<ProductVO> getInventory(String userId) {
		List<InventoryVO> invenData = mapper.findById(userId);
		List<ProductVO> inventory = new ArrayList<ProductVO>();
		invenData.forEach(action ->{
			ProductVO buyProduct = proMapper.getById(action.getProductId());
			buyProduct.setCnt(action.getAmount());
			inventory.add(buyProduct);
		});
		return inventory;
	}
	public List<InventoryVO> orderList(String userId) {
		log.info("get list");
		
		return mapper.findById(userId);
	}

	@Override
	public void refresh(InventoryVO vo) {
		mapper.update(vo);
	}

	@Override
	public InventoryVO get(InventoryVO vo) {
		log.info("get product : "+vo);
		return mapper.get(vo);
	}

	

	@Override
	public boolean check(String userId, int productId) {
		List<InventoryVO> orderList = orderList(userId);
		for(InventoryVO i : orderList) {
			if(i.getProductId()==productId) {
				return true;
			}
		}
		return false;
		
	}

	@Override
	public int valueSettingByItem(int productId, String userId, int dragonId) throws ScriptException {// for android
		
		ScriptEngine engine = new ScriptEngineManager().getEngineByName("js");
		String[] strArray = proMapper.getById(productId).getDescription().split(" ");
		DragonVO dragonVO = new DragonVO(userId, dragonId, false);
		DragonVO targetDragon = dragonMapper.getById(dragonVO);
		Integer result = -1;
		switch (strArray[0]) {
		case "������":
			int value = targetDragon.getFoodValue();
			String foo = value+strArray[1];
			result = (Integer)engine.eval(foo);
			if(result>=100) {
				result=100;
			}
			targetDragon.setFoodValue(result);
			dragonMapper.update(targetDragon);
			break;
		case "����ġ":
			value = dragonMapper.get(userId).getLevelValue();
			foo = value+strArray[1];
			result = (Integer)engine.eval(foo);
			if(result>=100) {
				result=0;
				targetDragon.setTotalLevel(targetDragon.getTotalLevel()+1);
			}
			targetDragon.setLevelValue(result);
			dragonMapper.update(targetDragon);
			break;
		default:
			result=-1;
			break;
		}
		
		
		return result;
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
