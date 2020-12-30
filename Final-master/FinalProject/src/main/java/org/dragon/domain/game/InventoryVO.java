package org.dragon.domain.game;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;


@Data
@AllArgsConstructor
public class InventoryVO {

	private String inventoryId;
	private String userId;
	private int productId;
	private int amount;
	private Date orderDate;
	
}
