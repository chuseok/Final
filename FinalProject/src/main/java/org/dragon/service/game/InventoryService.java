package org.dragon.service.game;

import java.util.List;

import javax.script.ScriptException;

import org.dragon.domain.game.DragonVO;
import org.dragon.domain.game.InventoryVO;
import org.dragon.domain.game.ProductVO;

public interface InventoryService {

	public boolean buy(InventoryVO vo, DragonVO dragonVO);
	public ProductVO use(String userId, int selected);
	public List<InventoryVO> orderList(String userId);
	public List<ProductVO> getInventory(String userId);
	public void refresh(InventoryVO vo);
	public InventoryVO get(InventoryVO vo);
	public boolean check(String userId, int productId);
	public int valueSettingByItem(int productId, String userId, int dragonId) throws ScriptException;
	public List<Integer> findNotUsedId(int productId, String userId);
	
}
