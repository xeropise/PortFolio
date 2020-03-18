package com.mmm.service.inventory;

import java.util.List;
import java.util.Map;

import com.mmm.common.Search;
import com.mmm.service.domain.Cart;
import com.mmm.service.domain.Inventory;

public interface InventoryDao {
	
	
	
	public void addInventory(Inventory inventory) throws Exception;
	
	public Inventory getInventory(Search search) throws Exception;
	
	public int getInventoryCount(Search search) throws Exception;
	
	public List<Inventory> getInventoryList(Search search) throws Exception;
	
	public void updateInventory(Inventory inventory) throws Exception;
	
	public void deleteInventory(int inventoryNo) throws Exception;
	
	public List<Inventory> getVoucherListInPayment(int userNo)throws Exception;
	
	public Inventory getInventoryForPay(int inventoryNo)throws Exception;
	
	
}
