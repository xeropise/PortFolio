package com.mmm.service.payment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mmm.common.Search;
import com.mmm.service.domain.Payment;
import com.mmm.service.domain.Point;

public interface PaymentService {

//	public void addPayment(Payment payment)throws Exception;
	public void addPayment(Map<String, Object> inputMap)throws Exception;
	
	public HashMap<String, Object> getPaymentList(Search search)throws Exception;
	
	public Payment getPayment(int paymentNo)throws Exception;
	
	public Payment getPaymentbyTicketingNo(int ticketingNo)throws Exception;
	
	public Payment getPaymentbyPurchaseNo(int purchaseNo)throws Exception;
	
	public void cancelPayment(Payment payment)throws Exception;
	
	public HashMap<String, Object> getPaymentListAd(Search search)throws Exception;
	
	public int getTotalPoint(int userNo)throws Exception;
	
	public int getAccPoint(int userNo)throws Exception;
	
	public HashMap<String, Object> getPointList(Search search)throws Exception;
	
	public void savePoint(Point point)throws Exception;
	
	public int checkAttedance(int userNo)throws Exception;
	
	public List<Point> checkList(int userNo) throws Exception;
}
