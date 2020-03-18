package com.mmm.service.purchase;

import java.util.List;
import java.util.Map;

import com.mmm.common.Search;
import com.mmm.service.domain.Purchase;

public interface PurchaseService {
	
	
	public void addPurchase(Purchase purchase) throws Exception;

	public Purchase getPurchase(int purchaseNo) throws Exception;
	
	public Purchase recentPurchase() throws Exception;
	
	public Map<String,Object> getPurchaseList(Search search) throws Exception;
	
	public void updatePurchase(Purchase purchase) throws Exception;
	
	public void DeletePurchase(int purchaseNo) throws Exception;
	
}
