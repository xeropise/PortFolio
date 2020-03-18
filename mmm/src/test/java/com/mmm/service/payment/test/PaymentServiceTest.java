package com.mmm.service.payment.test;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mmm.common.JavaUtil;
import com.mmm.common.Search;
import com.mmm.service.domain.Payment;
import com.mmm.service.domain.Point;
import com.mmm.service.payment.PaymentService;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)

//metaData를 다양하게 Wiring...
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
		"classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml",
		"classpath:config/context-transaction.xml" })

public class PaymentServiceTest {
	
	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
//	@Test
//	public void testAddPayment() throws Exception{
//		
//		Payment payment =new Payment();
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		
////		Date payDate = dateFormat.parse("2020-01-20");
//		Ticketing ticketing = new Ticketing();
//		ticketing.setTicketingNo("20303");
//		Purchase purchase = new Purchase();
////		purchase.setPurchaseNo(31100);
//		List<Integer> vouchers = new ArrayList<Integer>();
//		vouchers.add(11119999);
////		vouchers.add(11129999);
////		vouchers.add(11139999);
//		
//		
////		payment.setPayDate(payDate);
//		payment.setUserNo(33333);
//		payment.setTicketing(ticketing);
//		payment.setPurchase(purchase);
//		payment.setPayMethod(6);
//		payment.setTotalPrice(25000);
//		payment.setCash(20000);
//		payment.setUsingPoint(2000);
//		payment.setVouchers(vouchers);
//		
//		int savingPoint = payment.getUsingPoint()/100;
//		payment.setSavingPoint(savingPoint);
//		
//		System.out.println("-------------- payment : "+payment.getPayObjectFlag());
//		
//		paymentService.addPayment(payment);
//		
//	}
	
//	@Test
//	public void testGetPayList()throws Exception{
//		
//		Search search = new Search();
//		search.setCurrentPage(1);
//		search.setUserNo(33333);
//		search.setPageSize(pageSize);
//		
//		Map<String, Object> map =  paymentService.getPaymentList(search);
//		List<Payment> list = (List<Payment>) map.get("list");
//		
//		for(Payment pay :  list) {
//			System.out.println("--------------payment :  "+ pay);
//			System.out.println("----------------------------pay.getPayDate()" + pay.getPayDate());
//			System.out.println("----------------------------JavaUtil.convertDateFormat(pay.getPayDate())" + JavaUtil.convertDateFormat(pay.getPayDate()));
//		}
//		
//	}
	
//	@Test
//	public void testCancelPayment()throws Exception{
//		
//		Payment payment = new Payment();
//		payment.setPaymentNo(10001);
//		
//		paymentService.cancelPayment(payment);
//		
//		Assert.assertEquals(1, paymentService.getPayment(payment).getPayStatus());
//		
//	}
	
//	@Test
//	public void testGetPaymentListAd()throws Exception{
//		Search search = new Search();
//		search.setCurrentPage(1);
////		search.setUserNo(33333);
//		search.setPageSize(pageSize);
//		search.setPayObjectFlag("2");
//		
//		Map<String, Object> map = paymentService.getPaymentListAd(search);
//		List<Payment> list =  (List<Payment>)map.get("list");
//		
//		for (Payment pay : list) {
//			System.out.println("--------------- pay  : " + pay);
//		}
//		
//	}
	
//	@Test
//	public void testSavePoint() throws Exception{
//		
//		Point point  = new Point();
//		point.setUserNo(22222);
//		point.setPaymentNo(10001);
//		point.setPointStatus("S0");
//		point.setPartPoint(200);
//		paymentService.savePoint(point);
//		
//		Point point1  = new Point();
//		point1.setUserNo(22222);
//		point1.setPointStatus("S1");
//		point1.setPartPoint(50);
//		paymentService.savePoint(point1);
//		
//		Point point2  = new Point();
//		point2.setUserNo(22222);
//		point2.setPointStatus("S1");
//		point2.setPartPoint(50);
//		paymentService.savePoint(point2);
//		
//		Point point3  = new Point();
//		point3.setUserNo(33333);
//		point3.setPointStatus("S1");
//		point3.setPartPoint(50);
//		paymentService.savePoint(point3);
//		
//		Point point4  = new Point();
//		point4.setUserNo(33333);
//		point4.setPointStatus("U0");
//		point4.setPartPoint(-50);
//		paymentService.savePoint(point4);
//	}

//	@Test
//	public void testGetPointList()throws Exception{
//		
//		Search search = new Search();
//		search.setCurrentPage(1);
//		search.setUserNo(33333);
//		search.setPageSize(pageSize);
//		
//		Map<String, Object> map =  paymentService.getPointList(search);
//		List<Point> list = (List<Point>) map.get("list");
//		
//		for(Point point :  list) {
//			System.out.println("--------------pointDate :  "+ point.getPointDate());
//			System.out.println("---------------------- DATE (TIMESTAMP)  "+point.getPointDate());
//			System.out.println("---------------------- String Date  :"+JavaUtil.convertDateFormat(point.getPointDate()));
//			
//		}
//		
//		
//		
//	}
	
//	@Test
//	public void testCheckAttendance()throws Exception{
//		int userNo = 33333;
//		
//		Assert.assertEquals(1, paymentService.checkAttedance(userNo));
//	}
	
//	@Test
//	public void testgetTotalPoint()throws Exception{
//		int userNo = 10000;
//		 int totalPoint = paymentService.getTotalPoint(userNo);
//		 System.out.println("=======================>    totalPoint   "+totalPoint);
//	}
	
//	@Test
//	public void testGetAccPoint()throws Exception{
//		
//		int userNo = 10003;
//		int accPoint = paymentService.getAccPoint(userNo);
//		
//		System.out.println("=========accPoint  : " + accPoint);
//	}
	
//	@Test
//	public void testGetPayment()throws Exception{
//		
//		int ticketingNo = 10003;
//		int purchaseNo = 10001;
//		
//		Payment pay = paymentService.getPaymentbyTicketingNo(ticketingNo);
//		Payment pay1 = paymentService.getPaymentbyPurchaseNo(purchaseNo);
//		
//		
//		System.out.println("=========pay  : " + pay);
//		System.out.println("=========pay1  : " + pay1);
//	}
	
	@Test
	public void testCancelPoint() throws Exception{
		
		Payment pay = paymentService.getPaymentbyTicketingNo(10163);
		System.out.println( "---pay   : " + pay);
		
		
		paymentService.cancelPayment(pay);
		
	}
	
}
