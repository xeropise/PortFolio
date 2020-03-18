package com.mmm.service.purchase.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mmm.common.Search;
import com.mmm.service.domain.Inventory;
import com.mmm.service.domain.Product;
import com.mmm.service.domain.Purchase;
import com.mmm.service.inventory.InventoryDao;
import com.mmm.service.product.ProductDao;
import com.mmm.service.purchase.PurchaseDao;
import com.mmm.service.purchase.PurchaseService;

@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService {
	
	@Autowired
	@Qualifier("purchaseDaoImpl")
	private PurchaseDao purchaseDao;
	
	@Autowired
	private InventoryDao inventoryDao;
	
	@Autowired
	private ProductDao productDao;
	
	public void setPurchaseDao(PurchaseDao purchaseDao) {
		this.purchaseDao = purchaseDao;
	}
	
	public PurchaseServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addPurchase(Purchase purchase) throws Exception {
		//구매 테이블에 들어감
		purchaseDao.addPurchase(purchase);
		
		//테이블에 들어가자마자 최근 값을 구매관리번호로 가져온다
		purchase= purchaseDao.recentPurchase();
		
		//내 인벤토리에 들어가야함, 이때.. 상품번호들과 수량들.. 그리고 구입할시 시간을 같게해줘야하므로 purchase에서 뺌.. 결제시까지 고려는 아직안함
		List<String> prodNo =Arrays.asList( purchase.getPurchaseProductNo().split(",") );
		List<String> prodQuantity = Arrays.asList( purchase.getPurchaseProductQuantity().split(","));
		
		Inventory inventory = new Inventory();
		String uuid=null;
		inventory.setInventoryUserNo(purchase.getPurchaseUserNo()); // 1. 인벤토리에 유저 정보 삽입
		inventory.setInventoryPurchaseNo( purchase.getPurchaseNo());// 2. 인벤토리에 구매 정보 삽입
		inventory.setInventoryRegDate(purchase.getPurchaseDate());  // 3. 인벤토리에 구매 날짜 정보 삽입.. 동일하게
		

		
		
		// 4. 상품 번호와 수량을 각각 돌려 넣어준다.  5. 그러면서 핀번호도 생성하는것을 잊지말것
		// 최종적으로 인벤토리에는 상품 3,5,4 개 있엇다면 12번의 로그가 들어가는셈이 된다.
		for(int i=0; i<prodNo.size(); i++) {
			
			inventory.setInventoryProdNo( Integer.parseInt( prodNo.get(i)) );
			
			for(int j=0; j<Integer.parseInt(prodQuantity.get(i)); j++){
				uuid = UUID.randomUUID().toString().substring(0, 23);
				inventory.setInventoryProdPinNo(uuid); // 2. 핀 정보 삽입 				
				inventory.setInventoryStatus("0");
				inventoryDao.addInventory(inventory);
				
				System.out.println("------------------ inven" + j +"   --   " + inventory );
			}
		}
		
	}

	@Override
	public Purchase getPurchase(int purchaseNo) throws Exception {
		
		return purchaseDao.getPurchase(purchaseNo);
	}

	@Override
	public Map<String,Object> getPurchaseList(Search search) throws Exception {
		
		return purchaseDao.getPurchaseList(search);
	}

	@Override
	public void updatePurchase(Purchase purchase) throws Exception {
		
		Search search = new Search();
		
		search.setInventoryPurchaseNo(purchase.getPurchaseNo());
		
		List<Inventory> inventoryList= inventoryDao.getInventoryList(search);
		
		for(Inventory iv : inventoryList) {
			
			inventoryDao.deleteInventory(iv.getInventoryNo());
		}
		
		purchaseDao.updatePurchase(purchase);
		
		
	}

	@Override
	public void DeletePurchase(int purchaseNo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Purchase recentPurchase() throws Exception {
		return purchaseDao.recentPurchase();
	}
	

}
