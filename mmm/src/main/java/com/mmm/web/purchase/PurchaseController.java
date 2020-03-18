package com.mmm.web.purchase;


import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mmm.common.Page;
import com.mmm.common.Search;
import com.mmm.service.cart.CartService;
import com.mmm.service.domain.DateTime;
import com.mmm.service.domain.Inventory;
import com.mmm.service.domain.Product;
import com.mmm.service.domain.Purchase;
import com.mmm.service.domain.Ticketing;
import com.mmm.service.domain.User;
import com.mmm.service.inventory.InventoryService;
import com.mmm.service.product.ProductService;
import com.mmm.service.purchase.PurchaseService;
import com.mmm.service.user.UserService;

@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("cartServiceImpl")
	private CartService cartService;
	
	@Autowired
	@Qualifier("inventoryServiceImpl")
	private InventoryService inventoryService;
	
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	//직접 구매 하는 경우
	@RequestMapping(value="addPurchaseOne", method=RequestMethod.POST)
	public String addPurchase(@ModelAttribute("purchase") Purchase purchase, HttpServletRequest request, Model model) throws Exception {
		
		System.out.println("/purchase/addPurchaseOne");
		
		User user = (User) request.getSession().getAttribute("user");
		
		purchase.setPurchaseUserNo(user.getUserNo());
		purchase.setPurchaseDate(new Timestamp(new Date().getTime()));
		
		purchaseService.addPurchase(purchase);
		
		model.addAttribute("purchase",purchase);
		
		return "forward:/purchase/test.jsp";
	}
	
	@RequestMapping(value="addPurchase" , method=RequestMethod.GET)
	public String addPurchase(@ModelAttribute("purchase")Purchase purchase, @RequestParam("quantity")String quantity ,@RequestParam(value="prodNo") int prodNo,  HttpServletRequest request,Model model)throws Exception{
		
		
		System.out.println("/purchase/addPurchase : GET");
		User user = (User) request.getSession().getAttribute("user");
		
		System.out.println(purchase);
		System.out.println("받아온 userNo는? ->"+ user);
		System.out.println("받아온 prodNo는? ->"+ prodNo);
		
		Product product = new Product();
		product = productService.getProduct(prodNo);
		
		purchase.setPurchaseProductQuantity(quantity);
		purchase.setPurchaseUserNo(user.getUserNo());
		
		System.out.println("oioijfowjiofw->"+productService.getProduct(prodNo));
		
		System.out.println("forward:/purchase/addPurchase 로 갑니당!");
		
		return "forward:/purchase/addPurchase.jsp?prodNo="+prodNo;
	}
	// 지행아 이거야..
	@RequestMapping(value="addPurchase" , method=RequestMethod.POST)
	public String addPurchase(@ModelAttribute("purchase")Purchase purchase, @ModelAttribute("ticketing") Ticketing ticketing, HttpServletRequest request, Model model)throws Exception{
		
		System.out.println("예매 정보 전부 넘어왔나요? : \n"+ticketing);
		User user = (User) request.getSession().getAttribute("user");
		
		System.out.println(purchase);
		System.out.println(user.getUserNo());
		purchase.setPurchaseUserNo(user.getUserNo());
		purchase.setPurchaseDate(new Timestamp(new Date().getTime()));
		
		model.addAttribute("purchase",purchase);
		
		 purchaseService.addPurchase(purchase);
		
		return "forward:/purchase/test.jsp";
	}
	
	// 내 구매목록으로
	@RequestMapping(value="getPurchaseList")
	public String getPurchaseList(@ModelAttribute Search search, HttpServletRequest request, Model model,@ModelAttribute("alarm") String alarm) throws Exception{
		
		User user = (User) request.getSession().getAttribute("user");
		search.setUserNo(user.getUserNo());
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		
		Map<String,Object> map =purchaseService.getPurchaseList(search);
		List<Purchase> list = (List<Purchase>)map.get("list");
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		map = new HashMap<String,Object>();
		map.put("PurchaseList",list);
		map.put("resultPage", resultPage);
		map.put("search", search);
		
		model.addAttribute("map",map);
		model.addAttribute("alarm", alarm);	
		model.addAttribute("purchaseStatus",search.getPurchaseStatus());
		return "forward:/purchase/getPurchaseList.jsp";
	}
	
	@RequestMapping(value="/cancelTest/{purchaseNo}", method=RequestMethod.POST)
	public String cancelTest(@PathVariable("purchaseNo") int purchaseNo) throws Exception {
		System.out.println("/cancelTest");
		
		Purchase purchase= new Purchase();
		purchase.setPurchaseStatus(2);
		purchase.setPurchaseNo(purchaseNo);
		System.out.println("updatePurchase시작");
		
		purchase.setCancelDate(new Timestamp(new Date().getTime()));
		purchaseService.updatePurchase(purchase);
		
		System.out.println("updatePurchase끝");
		
		return "redirect:/purchase/getPurchaseList";
	}
	
	// 내 인벤토리 목록으로
	@RequestMapping(value="getInventoryList" , method=RequestMethod.GET)
	public String getInventoryList(@ModelAttribute Search search, HttpServletRequest request, Model model) throws Exception{
		
		User user = (User) request.getSession().getAttribute("user");
		
		search.setInventoryUserNo(user.getUserNo()); // 해당 유저의 모든 인벤토리를 가져온다.
		search.setInventoryStatus(0); // 사용하지 않은 것만
		
		List<Inventory> list = inventoryService.getInventoryList(search); // 리스트로 가져온다.
		List<Integer> productNoList = new ArrayList<Integer>(); // 중복되지 않는 상품 번호 리스트를 가져온다.
		List<Product> productList = new ArrayList<Product>(); // 중복되지 않은 상품 정보
		List<Integer> productQuantityList = new ArrayList<Integer>(); // 중복되지 않은 상품 수량 정보
		//리스트에서 중복되지않는 상품번호만 따로 뺀다.
		for(Inventory iv : list) {
			if(productNoList.indexOf(iv.getInventoryProdNo())==-1) {
				productNoList.add(iv.getInventoryProdNo());
			}
		}
		
		//중복되지 않은 상품 정보를 전부 뽑아온다.
		for(int prodNo : productNoList) {
			search.setInventoryProdNo(prodNo);
			productList.add( productService.getProduct(prodNo) );
			productQuantityList.add( inventoryService.getInventoryCount(search) );
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("productList",productList);
		map.put("productQuantityList",productQuantityList);
		model.addAttribute("map",map);
		return "forward:/purchase/getInventoryList.jsp";
	}
	
}
