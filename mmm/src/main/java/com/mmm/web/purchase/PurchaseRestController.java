package com.mmm.web.purchase;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mmm.common.Search;
import com.mmm.service.domain.Inventory;
import com.mmm.service.domain.Purchase;
import com.mmm.service.domain.User;
import com.mmm.service.inventory.InventoryService;
import com.mmm.service.purchase.PurchaseService;

@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {

	
	@Autowired
	@Qualifier("inventoryServiceImpl")
	InventoryService inventoryService;
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	PurchaseService purchaseService;
	// 페이지네이션 번호 갯수
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	//한 화면에 보이는 페이지 갯수
	@Value("#{commonProperties['pageSize']}")
	int pageSize;	
	
	@RequestMapping(value="json/getPurchaseList", method=RequestMethod.POST)
	public Map<String,Object> getPurchaseList(@RequestBody Map<String, Object> map, @ModelAttribute Search search, HttpServletRequest request) throws Exception {
		
		User user = (User) request.getSession().getAttribute("user");
		
		if( search.getCurrentPage()==0 ) {
			search.setCurrentPage(1);
		}
		search.setUserNo(user.getUserNo());
		search.setPageSize(pageSize);
		search.setSearchCondition("0");
		
		return purchaseService.getPurchaseList(search);
	}
	@RequestMapping(value="/json/getInventoryCount/{inventoryProdNo}", method=RequestMethod.GET)
	public int getInventoryCount(@PathVariable int inventoryProdNo, @ModelAttribute Search search, HttpServletRequest request) throws Exception {
		
		User user = (User) request.getSession().getAttribute("user");
		search.setInventoryProdNo(inventoryProdNo);
		search.setInventoryUserNo(user.getUserNo());
		
		return inventoryService.getInventoryCount(search); 
	}
	
	@RequestMapping(value="/json/getInventoryList/", method=RequestMethod.POST)
	public List<Inventory> getInventoryList(@RequestBody Map<String, Object> map, @ModelAttribute Search search, HttpServletRequest request) throws Exception {
		User user= (User) request.getSession().getAttribute("user");
		System.out.println(map);
		int inventoryProdNo = Integer.parseInt( (String)map.get("inventoryProdNo"));
		int inventoryStatus = Integer.parseInt( (String)map.get("inventoryStatus"));
		int inventoryPurchaseNo = Integer.parseInt( (String)map.get("inventoryPurchaseNo"));
		search.setInventoryUserNo(user.getUserNo());
		search.setInventoryProdNo(inventoryProdNo);
		search.setInventoryStatus(inventoryStatus);
		search.setInventoryPurchaseNo(inventoryPurchaseNo);
		return inventoryService.getInventoryList(search);
	}
}
