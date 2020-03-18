package com.mmm.web.product;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mmm.common.CheckAuth;
import com.mmm.common.Page;
import com.mmm.common.Search;
import com.mmm.service.cart.CartService;
import com.mmm.service.domain.Cart;
import com.mmm.service.domain.Product;
import com.mmm.service.domain.Ticketing;
import com.mmm.service.domain.User;
import com.mmm.service.product.ProductService;


//==> 상품관리 Controller
@Controller
@RequestMapping("/product/*")

public class ProductController {
	
	//Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("cartServiceImpl")
	private CartService cartService;

	public ProductController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	//상품등록

	@RequestMapping(value="addProduct" , method=RequestMethod.GET)
	public String addProduct() throws Exception {
		
		System.out.println("/product/addProduct : GET");
		
		System.out.println(" addProdAd.jsp 로 갑니당! ");
		
		return "redirect:/product/addProdAd.jsp";
	}
	
	
	//상품등록완료
	@RequestMapping(value="addProduct" , method=RequestMethod.POST)
	public String addProduct(@RequestParam Map<String, Object> map, @RequestParam("prodImage") MultipartFile[] file,Model model) throws Exception {
		
//		System.out.println("product"+product);
		System.out.println("/product/addProduct : POST");
		System.out.println("map이야->"+map);
		
//		model.addAttribute("product", map);
		
//		String filesName =System.currentTimeMillis()+"";
//		List<String> fn = new ArrayList();
		
		
		System.out.println("1");
		
		Product product = new Product();
		
		product.setProdName((String)map.get("prodName"));
		product.setProdDetail((String)map.get("prodDetail"));
		product.setProdPrice(Integer.parseInt((String) map.get("prodPrice")));
		System.out.println("2");
		product.setFranType(Integer.parseInt((String) map.get("franType")));
		System.out.println("2");
		product.setProdType(Integer.parseInt((String) map.get("prodType")));
		System.out.println(product);
		
		
		String saveName = "";
		if(file!=null) {
			for(int i=0; i<file.length; i++) {
				saveName += saveFile(file[i]);
			}
			System.out.println(saveName);
			product.setProdImage(saveName);
		}
		String[] fileArr = saveName.split(",");
		
		System.out.println("3");
		
		
		
		model.addAttribute("product", fileArr);
		System.out.println("4");
		System.out.println("product1"+product);
		
		
		
		model.addAttribute("product", product);
		productService.addProduct(product);
		
		System.out.println("6");
		System.out.println("product2"+product);
		
		
		fileArr = product.getProdImage().split(",");
		model.addAttribute("fileArr", fileArr);
		
		
		return "redirect:/product/getVoucherList";
		
		
	}
	
	
	//상품 상세
	@CheckAuth(role="user,admin")
	@RequestMapping(value="getProduct" , method=RequestMethod.GET)
	public String getProduct( @RequestParam("prodNo") int prodNo , Model model,  HttpSession session ) throws Exception {
		
		System.out.println("/product/getProduct :: GET");
		
		User user = (User)session.getAttribute("user");
		
		Product product = productService.getProduct(prodNo);
		
		String[] fileArr = product.getProdImage().split(",");
		
		model.addAttribute("product", product);
		model.addAttribute("fileArr", fileArr);
		
		return "forward:/product/getProd.jsp?prodNo="+prodNo;
	}
	
	
	
	//상품 수정 
	@RequestMapping(value="updateProduct" , method=RequestMethod.GET)
	public String updateProduct(@RequestParam("prodNo") int prodNo , Model model ) throws Exception {
		
		System.out.println("/product/updateProduct : GET");
		
		Product product = productService.getProduct(prodNo);
		
		model.addAttribute("product", product);
		
		System.out.println("updateProdAd.jsp로 갑니당!");
		
		
		return "forward:/product/updateProdAd.jsp?prodNo="+prodNo;
	}
	
	
	//상품수정완료
	@RequestMapping(value="updateProduct" , method=RequestMethod.POST)
	public String updateProduct( @ModelAttribute("product") Product product , Model model , HttpServletRequest request) throws Exception {
		
		System.out.println("/product/updateProduct : POST");
		
		productService.updateProduct(product);
		
		
		return "redirect:/product/getVoucherList";
	}
	
	
	//메인상품목록
	@RequestMapping(value="getProductMainList")
	public String getProductMainList(@ModelAttribute("product") Product product , @ModelAttribute("search") Search search ,Model model , HttpServletRequest request) throws Exception {
		
		System.out.println("/product/getProductMainList : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> map = productService.getProductMainList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("search", search);
		
		System.out.println("getProdMainList.jsp.로 갑니당!");
		
//		String[] fileArr = product.getProdImage().split(",");
//		model.addAttribute("fileArr", fileArr);
		
		return "forward:/product/getProdMainList.jsp";
	}
	
	
	
	//상품목록
	@RequestMapping(value="listProduct")
	public String listProduct(@ModelAttribute("product") Product product , @ModelAttribute("search") Search search ,Model model , HttpServletRequest request) throws Exception {
		
		System.out.println("/product/listProduct : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> map = productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("search", search);
		
		System.out.println("getProdList.jsp로 갑니당!");
		

		
		return "forward:/product/getProdList.jsp";
	}
	
	
	
	
//	@RequestMapping(value="getMovieProductList")
//	public String getMovieProductList(@ModelAttribute("product") Product product , @ModelAttribute("search") Search search ,Model model , HttpServletRequest request) throws Exception {
//		
//		System.out.println("/product/getMovieProductList : GET / POST");
//		
//		if(search.getCurrentPage() ==0 ){
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(pageSize);
//		
//		Map<String , Object> map = productService.getMovieProductList(search);
//		
//		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
//		System.out.println(resultPage);
//		
//		model.addAttribute("list", map.get("list"));
//		model.addAttribute("search", search);
//		
//		System.out.println("getProdList.jsp로 갑니당!");
//		
//		
//		return "forward:/product/getProdList.jsp";
//	}
//	
	
//		//상품목록
//		@RequestMapping(value="getMovieProductList")
//		public String getMovieProductList(@ModelAttribute("product") Product product , Model model , HttpServletRequest request) throws Exception {
//			
//			System.out.println("/product/listMovieProduct : GET / POST");
//			
//			
//			Map<String , Object> map = productService.getMovieProductList(product);
//			
//			
//			model.addAttribute("list", map.get("list"));
//			
//			System.out.println("getProdList.jsp로 갑니당!");
//			
//			return "forward:/product/getProdList.jsp";
//		}
		
		
		@RequestMapping(value="getVoucherList")
		public String getVoucherList(@ModelAttribute("product") Product product , Model model , HttpServletRequest request) throws Exception {
			
			System.out.println("/product/getVoucherList : GET / POST");
			
			Map<String , Object> map = productService.getVoucherList(product);
			
			model.addAttribute("list", map.get("list"));
			
			System.out.println("getProdList.jsp로 갑니당!");
			
			
			return "forward:/product/getProdList.jsp";
		}
		
		
		@RequestMapping(value="getSnackProductList")
		public String getSnackProductList(@ModelAttribute("product") Product product , Model model , HttpServletRequest request) throws Exception {
			
			System.out.println("/product/getSnackProductList : GET / POST");
			
			Map<String , Object> map = productService.getSnackProductList(product);
			
			model.addAttribute("list", map.get("list"));
			
			System.out.println("getProdList.jsp로 갑니당!");
			
			
			
			return "forward:/product/getProdList.jsp";
		}
		
		@RequestMapping(value="getQuickOrder", method=RequestMethod.POST)
		public String getQuickOrder(@ModelAttribute() Product product , @ModelAttribute() Ticketing ticketing, Model model , HttpServletRequest request) throws Exception {
			
			System.out.println("/product/getQuickOrder : POST");
			
			System.out.println(ticketing);
			
			Map<String , Object> map = productService.getQuickOrder(product);
			
			model.addAttribute("list", map.get("list"));
			model.addAttribute("ticketing",ticketing);
			System.out.println("getProdList.jsp로 갑니당!");
			
			
			
			return "forward:/product/getQuickOrder.jsp";
		}
		
		
		@RequestMapping(value="deleteProduct" , method=RequestMethod.GET)
		public String deleteProduct(@ModelAttribute("product")Product product ) throws Exception {
			
			System.out.println("/product/deleteProduct : GET");
			
			productService.deleteProduct(product);
			
			System.out.println("addCart.jsp 로 갑니당!");

			
			return "forward:/product/getSnackProductList";
			
		}
		
		@CheckAuth(role="user,admin")
		@RequestMapping(value="getCartList", method=RequestMethod.GET)
		public String getCartList(@ModelAttribute Search search, Model model, HttpServletRequest request) throws Exception {
			
			User user = (User) request.getSession().getAttribute("user");
			search.setCartUserNo(user.getUserNo());
			
			if(search.getCurrentPage()==0) {
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			try {
				if(search.getSearchCondition()==null) {
					search.setSearchCondition("0");
				}
			}catch(NullPointerException e) {
				search.setSearchCondition("0");
			}			
			
			Map<String, Object> map = cartService.getCartList(search);
			List<Ticketing> list = (List<Ticketing>)map.get("list");
			Page resultPage	= 
					new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
			System.out.println(list);
			model.addAttribute("cartList",list);
			model.addAttribute("resultPage", resultPage);
			model.addAttribute("search", search);
			
			return "forward:/product/getCartList.jsp";
		}
		
		
		
		
		private String saveFile(MultipartFile file) {
					
					String filePath = "C:\\Users\\User\\git\\MainPJTmmm\\mmm\\WebContent\\resources\\image";
					String saveName =  file.getOriginalFilename(); //System.currentTimeMillis() + "_" +
					File saveFile = new File(filePath, saveName);
					
					try {
						file.transferTo(saveFile);
					}catch(Exception e) {
						e.printStackTrace();
						return null;
					}
			
							return saveName;
					}
		
		
		
		
	
}
