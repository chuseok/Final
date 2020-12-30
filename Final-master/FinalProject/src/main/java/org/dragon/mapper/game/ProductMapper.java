package org.dragon.mapper.game;

import java.util.List;

import org.dragon.domain.game.ProductVO;

public interface ProductMapper {

	public List<ProductVO> getList();
	public ProductVO get(String proname);
	public List<ProductVO> getListByCategory(String category);
	public ProductVO getById(int productId);
}
