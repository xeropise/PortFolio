package com.mmm.web.product;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.mmm.service.cart.CartService;
import com.mmm.service.domain.Cart;
import com.mmm.service.domain.Product;
import com.mmm.service.product.ProductService;

@RestController
@RequestMapping("/product/*")
public class ProductRestController {

	@Autowired
	@Qualifier("cartServiceImpl")
	CartService cartService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	ProductService productService;
	
	public ProductRestController(){
		System.out.println(this.getClass());
	}	
	
	// 페이지네이션 번호 갯수
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	//한 화면에 보이는 페이지 갯수
	@Value("#{commonProperties['pageSize']}")
	int pageSize;	
	
	@RequestMapping( value="json/addCart", method=RequestMethod.POST)
	public void addCart(@RequestBody Map<String, Object> map, @ModelAttribute Cart cart ) throws Exception {
		System.out.println("장바구니 추가 시작");
		System.out.println(map);
		String cartUserNo =  (String) map.get("cartUserNo"); 
		String cartProdNo =  (String) map.get("cartProdNo");
		Integer carProdQuantity = (Integer) map.get("cartProdQuantity");
		Long time = (Long) map.get("cartRegDate");
		
		cart.setCartUserNo(Integer.parseInt(cartUserNo));
		cart.setCartProdNo(Integer.parseInt(cartProdNo));
		cart.setCartProdQuantity(carProdQuantity.intValue());
		cart.setCartRegDate(new Timestamp(time));
		
		cartService.addCart(cart);
	}
	
	@RequestMapping( value="json/removeCart/{cartNo}", method=RequestMethod.GET)
	public void removeCart(@PathVariable int cartNo) throws Exception {
		System.out.println("장바구니 삭제 시작");
		
		cartService.deleteCart(cartNo);
	}
	
	@RequestMapping( value="json/getCartList", method=RequestMethod.POST)
	public Map<String,Object> getCartList(@RequestBody Map<String, Object> map) throws Exception {
		//System.out.println(map);
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		System.out.println(search);
		search.setCartUserNo( Integer.parseInt((String) map.get("cartUserNo")));
		map =cartService.getCartList(search);
		
		return map;
	}
	
	@RequestMapping( value = "json/getProduct/{prodNo}", method=RequestMethod.GET)
	public Map<String, Object> getProduct(@PathVariable int prodNo ) throws Exception {
		
		System.out.println("/json/getProduct : GET");
		System.out.println("prodNo : "+prodNo);
		
		//Business Logic
		Product product = productService.getProduct(prodNo);
		
		// Model 과 View 연결
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product", product);
		
		return map;
	}
	
}
