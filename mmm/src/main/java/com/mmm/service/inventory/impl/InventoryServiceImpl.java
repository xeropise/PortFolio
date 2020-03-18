package com.mmm.service.inventory.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mmm.common.Search;
import com.mmm.service.cart.CartService;
import com.mmm.service.domain.Cart;
import com.mmm.service.domain.Inventory;
import com.mmm.service.inventory.InventoryDao;
import com.mmm.service.inventory.InventoryService;

@Service("inventoryServiceImpl")
public class InventoryServiceImpl implements InventoryService {
	
	@Autowired
	private InventoryDao inventoryDao;
	
	public void setInventoryDao(InventoryDao inventoryDao) {
		this.inventoryDao = inventoryDao;
	}
	
	
	public InventoryServiceImpl() {
		System.out.println(this.getClass());
	}


	@Override
	public void addInventory(Inventory inventory) throws Exception {
		
		inventoryDao.addInventory(inventory);
		
	}


	@Override
	public Inventory getInventory(Search search) throws Exception {
	
		return inventoryDao.getInventory(search);
	}
	
	@Override
	public int getInventoryCount(Search search) throws Exception {
	
		return inventoryDao.getInventoryCount(search);
	}	


	@Override
	public List<Inventory> getInventoryList(Search search) throws Exception {
		
		return inventoryDao.getInventoryList(search);
	}


	@Override
	public void updateInventory(Inventory inventory) throws Exception {
		
		inventoryDao.updateInventory(inventory);
	}


	@Override
	public void deleteInventory(int inventoryNo) throws Exception {
		
		inventoryDao.deleteInventory(inventoryNo);
	}


	@Override
	public List<Inventory> getVoucherListInPayment(int userNo) throws Exception {
		return inventoryDao.getVoucherListInPayment(userNo);
	}


	
}
