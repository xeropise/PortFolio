package com.mmm.web.payment;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mmm.common.CheckAuth;
import com.mmm.common.Page;
import com.mmm.common.Search;
import com.mmm.service.domain.Inventory;
import com.mmm.service.domain.Movie;
import com.mmm.service.domain.Payment;
import com.mmm.service.domain.Point;
import com.mmm.service.domain.Product;
import com.mmm.service.domain.Purchase;
import com.mmm.service.domain.Ticketing;
import com.mmm.service.domain.User;
import com.mmm.service.inventory.InventoryService;
import com.mmm.service.movie.MovieService;
import com.mmm.service.payment.PaymentService;
import com.mmm.service.product.ProductService;
import com.mmm.service.purchase.PurchaseService;
import com.mmm.service.ticketing.TicketingService;

@Controller
@RequestMapping("/payment/*")
public class PaymentController {

	
	///Field
	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	@Autowired
	@Qualifier("movieServiceImpl")
	private MovieService movieService;
	
	@Autowired
	@Qualifier("ticketingServiceImpl")
	private TicketingService ticketingService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;

	@Autowired
	@Qualifier("inventoryServiceImpl")
	private InventoryService inventoryService;

	// 페이지네이션 번호 갯수
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	//한 화면에 보이는 페이지 갯수
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value = "/preparePayment", method = RequestMethod.POST)
	public String preparePayment(	@ModelAttribute Ticketing ticketing,
									@ModelAttribute Purchase purchase,
									HttpSession session,
									Model model)throws Exception{
		
//		Tickeing..
		if (ticketing != null && ticketing.getTicketingPrice()>0) {
			
//			Movie poster를 가져오기 위해 ticketing에서 movieTitle 뽑기
			Movie inputMovie = new Movie();
			inputMovie.setMovieTitle(ticketing.getMovieName().trim());
			Movie movie = movieService.getMovieByMovieTitle(inputMovie);
			
			System.out.println(" --------------- movie : "+movie);
			System.out.println(" --------------- ticketing : "+ticketing);
			
			model.addAttribute("movie",movie);
			model.addAttribute("ticketing",ticketing);
		}
		
		
//		Purchase..
		if (purchase != null && purchase.getPurchasePrice()>0) {
			System.out.println(" --------------- purchase : "+purchase);
			
			String[] prodNoArray = purchase.getPurchaseProductNo().split(",");
			String[] prodQuantityArray = purchase.getPurchaseProductQuantity().split(",");
			
			List<Product> list = new ArrayList<Product>();
			for (int i = 0; i < prodNoArray.length; i++) {
				System.out.println("-----"+prodNoArray[i]);
				
				Product product = productService.getProduct(Integer.parseInt(prodNoArray[i]));
				product.setQuantity(Integer.parseInt(prodQuantityArray[i]));
				
				list.add(product);
			}
			
			System.out.println("----------------------------list   : " + list);
			
			model.addAttribute("prodList", list);
			model.addAttribute("purchase", purchase);
		}		
		
//	사용 가능한 포인트 조회하기
		User user = (User)session.getAttribute("user");
		
		int totalPoint = paymentService.getTotalPoint(user.getUserNo());
		System.out.println(" --------------- totalPoint : "+totalPoint);

		model.addAttribute("totalPoint",totalPoint);
//		System.out.println("model:   "+ model);
//		발행한 상품권 중 사용가능한 상품권 리스트도 넣어주어야 한다.
		
//	사용 가능한 voucher 조회하기
		List<Inventory> invenList = inventoryService.getVoucherListInPayment(user.getUserNo());
		System.out.println("------------------- 사용 가능한 vouchers "+invenList);
		
//		Client에서 parsing 하기 편하도록 JSONArray로 변환해서 줄테야!
		JSONArray jsonArray = new JSONArray();
		
		for(Inventory inven : invenList) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("invenNo", inven.getInventoryNo());
			jsonObj.put("invenName", inven.getInventoryName());
			jsonObj.put("invenPrice", inven.getInventoryPrice());
			
			jsonArray.add(jsonObj);
		}
		model.addAttribute("voucherJSONArray",jsonArray);
		
		return "forward:/payment/addPayment.jsp";
	}
	
	@RequestMapping(value = "/addPayment", method = RequestMethod.POST)
	public String addPayent(@ModelAttribute Payment payment,
							@ModelAttribute Ticketing ticketing,
							@ModelAttribute Purchase purchase,
//							@RequestParam(value = "usingVoucherid" , required = false) String usingVoucherid,
//							@RequestParam(value = "ticketingNo" , required = false) String ticketingNo,		//bodyEntity에 넣어서 주는 ticketing 정보
//							@RequestParam(value = "purchaseNo", required = false) String purchaseNo,		//bodyEntity에 넣어서 주는 purchase 정보
//							@RequestParam("impUid") String impUid,
							HttpSession session, Model model)throws Exception{
		
		System.out.println("------------input payment :  "+payment);
		System.out.println("------------input ticketing :  "+ticketing);
		System.out.println("------------input purchase :  "+purchase);
		System.out.println("----------- input impUid  : "+payment.getImpUid());
		
		System.out.println("-------------------payment.getVouchers() : " + payment.getVouchers());
		
//		로그인한 회원 정보 from session
		User user = (User)session.getAttribute("user");
		payment.setUserNo(user.getUserNo());
		System.out.println("----------- user.getUserNo() : "+user.getUserNo());
		
//	1.ticketing setting
		String uuid = UUID.randomUUID().toString().substring(0, 23); //티켓팅 번호
		ticketing.setTicketingPinNo(uuid); 				//핀번호
		ticketing.setTicketingDate(new Timestamp(new java.util.Date().getTime())); //현재 날짜로 삽입
		ticketing.setTicketingStatus(0); 				//상태 0이면 예매완료 1이면 취소
		ticketing.setTicketerPhone(user.getPhone());	//회원,비회원 포함

//	2.purchase setting
		purchase.setPurchaseUserNo(user.getUserNo());
		purchase.setPurchaseStatus(0);
		
//	3.payment setting
//		voucher parsing..
		String vouchers = payment.getVouchers();
		List<String> voucherList = new ArrayList<String>();
		if (vouchers != null && vouchers != "") {
			String[] voucherArray =  vouchers.split(",");
			voucherList = Arrays.asList(voucherArray);
			
			System.out.println("--------------------- voucherList :" + voucherList);
			System.out.println("--------------------- voucherList.size() :" + voucherList.size());
			
			
			if (voucherList.get(0) != null) {
				payment.setUsingVoucherFirst(voucherList.get(0));
			}
			if (voucherList.size()>1 && voucherList.get(1) != null) {
				payment.setUsingVoucherSecond(voucherList.get(1));
			}
			if (voucherList.size()>2 && voucherList.get(2) != null) {
				payment.setUsingVoucherThird(voucherList.get(2));
			}
		}

		System.out.println("------- voucher 확인을 위한 payment" + payment);
		
//		payMethod 나눠주는 Logic..
		String voucherExist ="";
		if (payment.getUsingVoucherFirst() != null) {
			voucherExist += payment.getUsingVoucherFirst();
		}
		if (payment.getUsingVoucherSecond() != null) {
			voucherExist += payment.getUsingVoucherSecond();
		}
		if (payment.getUsingVoucherThird() != null) {
			voucherExist += payment.getUsingVoucherThird();
		}
		System.out.println("----------- vouchExist  : "+voucherExist);
		
		if (payment.getCash() > 0 && payment.getUsingPoint() ==0 && voucherExist.length()==0) {
			System.out.println("==> payMethod  : 0 / only cash");
			payment.setPayMethod(0);
		}else if (payment.getCash() == 0 && payment.getUsingPoint() >0 && voucherExist.length()==0) {
			System.out.println("==> payMethod  : 1 / only point");
			payment.setPayMethod(1);
		}else if (payment.getCash() == 0 && payment.getUsingPoint() ==0 && voucherExist.length()>0) {
			System.out.println("==> payMethod  : 2 / only voucher");
			payment.setPayMethod(2);
		}else if (payment.getCash() > 0 && payment.getUsingPoint() >0 && voucherExist.length()==0) {
			System.out.println("==> payMethod  : 3 / cash+point");
			payment.setPayMethod(3);
		}else if (payment.getCash() > 0 && payment.getUsingPoint() ==0 && voucherExist.length()>0) {
			System.out.println("==> payMethod  : 4 / cash+voucher");
			payment.setPayMethod(4);
		}else if (payment.getCash() == 0 && payment.getUsingPoint() > 0 && voucherExist.length()>0) {
			System.out.println("==> payMethod  : 5 / point+voucher");
			payment.setPayMethod(5);
		}else if (payment.getCash() > 0 && payment.getUsingPoint() > 0 && voucherExist.length()>0) {
			System.out.println("==> payMethod  : 6 / cash+point+voucher");
			payment.setPayMethod(6);
		}
		
//		payObjectFlag 세팅 (0 : ticketing 1: purchase  2:ticketing + purchase)
		if (ticketing.getTicketingPrice() > 0 && purchase.getPurchasePrice() == 0) {
//			1 : 예매만 한경우
			System.out.println("==> PayObjectFlag  : 0 / ticketing");
			payment.setPayObjectFlag(0);
		}else if (ticketing.getTicketingPrice() == 0 && purchase.getPurchasePrice() > 0) {
			System.out.println("==> PayObjectFlag  : 1 / purchase");
//			2 : 구매만 한경우
			payment.setPayObjectFlag(1);
		}else if (ticketing.getTicketingPrice() > 0 && purchase.getPurchasePrice() > 0) {
			System.out.println("==> PayObjectFlag  : 2 / ticketing + purchase(QuickOrder)");
//			3 : 예매 + 구매만 한경우
			payment.setPayObjectFlag(2);
		}
		
//		addPayment()를 위한  parameter 맵
		Map<String, Object> inputMap = new HashMap<String, Object>();	
		
//		결제 안에 예매, 구매 넣기
		payment.setTicketing(ticketing);
		payment.setPurchase(purchase);
		
//	4.Point setting
		Point minusPoint = new Point();
		Point plusPoint = new Point();
		
//		savingPoint 계산.. cash로 결제를 한 경우에만 적립한다.
		if (payment.getPayMethod() == 0 || payment.getPayMethod() == 3 
			|| payment.getPayMethod() == 4 || payment.getPayMethod() == 6) {
			
//			적립 1% ...... properties 처리하자...
			int savingPoint = (int)(payment.getCash()*0.01);
			payment.setSavingPoint(savingPoint);
			
			System.out.println("--------> cash : "+ payment.getCash());
			System.out.println("--------> savingPoint : "+savingPoint);
			
//		적립포인트..
			plusPoint.setUserNo(user.getUserNo());
			plusPoint.setPointStatus("S0");		// 적립-현금결제
			plusPoint.setPartPoint(payment.getSavingPoint());
			
			inputMap.put("plusPoint", plusPoint);
		}
		
//		usingPoint 처리를 위해.. point로 결제를 한 경우에만 차감한다.
		if (payment.getPayMethod() == 1 || payment.getPayMethod() == 3 
				|| payment.getPayMethod() == 5 || payment.getPayMethod() == 6) {
//			사용포인트..
				minusPoint.setUserNo(user.getUserNo());
				minusPoint.setPointStatus("U0");		//사용- 포인트 결제
//				사용 포인트 음수(-) 처리
				minusPoint.setPartPoint(payment.getUsingPoint()*-1);
				
				System.out.println("--------> savingPoint : "+minusPoint.getPartPoint());
				inputMap.put("minusPoint", minusPoint);
		}
		
//		addPayment()  parameter 넣기
		inputMap.put("ticketing", ticketing);
		inputMap.put("purchase", purchase);
		inputMap.put("payment", payment);
		
//		service 호출.. BL 수행
		paymentService.addPayment(inputMap);

		
		model.addAttribute(payment);
		
//		예매 / 구매 / 예매+구매 인지에 따라 다른 model AND view
		if (payment.getPayObjectFlag() == 0) {			// 1: only 예매
			
//			포스터 주기위해..
			Movie inputMovie = new Movie();
			inputMovie.setMovieTitle(ticketing.getMovieName());
			Movie resultMovie = movieService.getMovieByMovieTitle(inputMovie);
			
			model.addAttribute("movie", resultMovie);
			model.addAttribute(ticketing);
			
//			return "forward:/ticketing/completeTicketing.jsp";
			
		}else if (payment.getPayObjectFlag() == 1) {	// 2: only 구매
			model.addAttribute(purchase);
			
			return "forward:/ticketing/completeTicketing.jsp";
			
		}else if (payment.getPayObjectFlag() == 2) {	//3 : 예매 + 구매
			
//			포스터 주기위해..
			Movie inputMovie = new Movie();
			inputMovie.setMovieTitle(ticketing.getMovieName());
			Movie resultMovie = movieService.getMovieByMovieTitle(inputMovie);
			String poster = resultMovie.getPoster();
			System.out.println("--------------> poster : "+poster);
			
			
			model.addAttribute("movie", resultMovie);
			model.addAttribute(ticketing);
			model.addAttribute(purchase);
			
//			return "forward:/ticketing/completeTicketing.jsp";
		}
		
		
		return "forward:/ticketing/completeTicketing.jsp";
	}//end of addPayment()
	
	@RequestMapping(value = "/cancelPayment", method = RequestMethod.POST)
	public String cancelPayment(@RequestParam(value = "ticketingNo", required=false) String ticketingNo,
								@RequestParam(value = "purchaseNo", required=false) String purchaseNostr,
								HttpSession session, Model model)throws Exception{
		
		System.out.println("-----------------------------ticketingNo : "+ticketingNo);
		System.out.println("-----------------------------purchaseNo : "+purchaseNostr);
		
		Payment payment = new Payment();
		
		if (ticketingNo != null) {
			System.out.println("===========> 예매, 예매+구매 취소");
			payment = paymentService.getPaymentbyTicketingNo(Integer.parseInt(ticketingNo));
			paymentService.cancelPayment(payment);
			User user =(User)session.getAttribute("user");
			if(user.getRole().equals("unUser")) {
				return "redirect:/mypage/mypage?condition=22";
			}
			return "redirect:/mypage/mypage?condition=11";
		}else if (purchaseNostr != null) {
			System.out.println("==========> 구매 취소");
			payment = paymentService.getPaymentbyPurchaseNo(Integer.parseInt(purchaseNostr));
			paymentService.cancelPayment(payment);
			return "redirect:/mypage/mypage?condition=12";
		}
		
		
		return "redirect:/mypage/mypage.jsp";
	}// end of cancelPayment()
	
	
	
//	@RequestMapping(value = "/getPointList", method = RequestMethod.GET)
	@RequestMapping(value = "/getPointList")
	public String getPointList( @ModelAttribute(value = "search") Search search,
								HttpSession session, Model model
								)throws Exception{
		
//		로그인한 회원 정보 from session
		User user = (User)session.getAttribute("user");
		System.out.println("----------- user.getUserNo() : "+user.getUserNo());
		search.setUserNo(user.getUserNo());
		
//		search.currentPage setting...
		if(search.getCurrentPage() ==0 ) {
			search.setCurrentPage(1);
		}
//		search.pageSize 세팅
		search.setPageSize(pageSize);
		System.out.println("------------search"+ search);
		
		
		HashMap<String, Object> outputMap = paymentService.getPointList(search);
		
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)outputMap.get("totalCnt")).intValue(),
				pageUnit, pageSize);
		System.out.println("------- resultPage : " + resultPage);
		
//		for(Point point : (List<Point>)outputMap.get("list")) {
//			System.out.println("--------- point : " + point);
//		}
		
		List<Point> list = (List<Point>) outputMap.get("list");
		
//		System.out.println("----- list.size()" + list.size());
		int totalPoint = paymentService.getTotalPoint(user.getUserNo());
		System.out.println("----- totalPoint" + totalPoint);
		int accPoint = paymentService.getAccPoint(user.getUserNo());
		
		
		model.addAttribute("list", list);
		model.addAttribute("totalPoint", totalPoint);
		model.addAttribute("accPoint", accPoint);
		model.addAttribute("search",search);
		model.addAttribute("resultPage",resultPage);
		
		return "forward:/payment/getPointList.jsp";
	}
}
