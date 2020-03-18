package com.mmm.service.purchase.test;

import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mmm.service.cart.CartService;
import com.mmm.service.domain.Cart;
import com.mmm.service.domain.Inventory;
import com.mmm.service.domain.Product;
import com.mmm.service.domain.Purchase;
import com.mmm.service.inventory.InventoryService;
import com.mmm.service.product.ProductService;
import com.mmm.service.purchase.PurchaseService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-aspect.xml",
									"classpath:config/context-common.xml",
									"classpath:config/context-mybatis.xml",
									"classpath:config/context-transaction.xml"})
public class PurchaseServiceTest {
	
	
	@Autowired
	PurchaseService purchaseService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	InventoryService inventoryService;
	
	//@Test
	public void testAddPurchase() throws Exception {
		
		Purchase purchase = new Purchase();
		
		purchase.setPurchaseUserNo(10001);
		
		String productNo="10000";
		productNo += ","+"10001";
		productNo += ","+"10002";
		purchase.setPurchaseProductNo(productNo);
		purchase.setPurchasePrice(30000);
		
		String productQuantity = "1,2,3";
		
		purchase.setPurchaseProductQuantity(productQuantity);
		
		List<String> productNos =Arrays.asList( purchase.getPurchaseProductNo().split(",") );
		List<String> prices = Arrays.asList( purchase.getPurchaseProductQuantity().split(","));
		Product product = null;
		int sum = 0;
		for(int i=0; i<productNos.size(); i++) {
			String purchaseNo = productNos.get(i);
			System.out.println(purchaseNo);
			product = productService.getProduct(Integer.parseInt(purchaseNo));
			
			sum += product.getProdPrice() * Integer.parseInt( prices.get(i) );
		}
		
		purchase.setPurchasePrice(sum);
		
		purchase.setPurchaseStatus(0);
		
		purchaseService.addPurchase(purchase);
	}
	
	
	
	//@Test
	public void addCart() throws Exception {
		
		Cart cart = new Cart();
		
		cart.setCartUserNo(10001);
		cart.setCartProdNo(10000);
		cart.setCartProdQuantity(3);
		cart.setCartRegDate(new Timestamp(new Date().getTime()));
		
		cartService.addCart(cart);
		
	}
	
	//@Test
	public void addInventory() throws Exception {
		
		Inventory inventory = new Inventory();
		
		inventory.setInventoryUserNo(10001); //유저번호
		inventory.setInventoryProdNo(10000); //상품번호
		
		String uuid = UUID.randomUUID().toString().substring(0, 23); 
		
		inventory.setInventoryProdPinNo(uuid); // 핀넘버
		
		inventory.setInventoryPurchaseNo(10000);// 상품번호
		
		Purchase purchase =purchaseService.getPurchase(10000);
		System.out.println(purchase);
		inventory.setInventoryRegDate(purchase.getPurchaseDate());//등록날짜는 구입날짜로
		
		inventory.setInventoryStatus("0"); // 0은 미사용, 1은 사용
		
		inventoryService.addInventory(inventory);
	}
	
	//쿠폰 사용 테스트
	//@Test
	public void userVoucher() throws Exception {
		
		Inventory inventory = new Inventory();
		
		inventory.setInventoryNo(10000);
		inventory.setInventoryUserNo(10001);
		inventory.setInventoryUsedDate(new Timestamp(new Date().getTime()));
		inventory.setInventoryStatus("1");
		
		inventoryService.updateInventory(inventory);
	}
}
