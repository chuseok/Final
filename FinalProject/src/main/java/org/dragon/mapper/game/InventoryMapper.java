package org.dragon.mapper.game;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.dragon.domain.game.InventoryVO;

public interface InventoryMapper {

	public void insert(InventoryVO vo);
	public void delete(String inventoryId);
	public List<InventoryVO> findById(String userId);
	public void update(InventoryVO vo);
	public InventoryVO get(InventoryVO vo);
	public void deleteCostume(int productId);
	public List<Integer> findNotUsedId(@Param("eggId")int eggId, @Param("userId") String userId);
}
