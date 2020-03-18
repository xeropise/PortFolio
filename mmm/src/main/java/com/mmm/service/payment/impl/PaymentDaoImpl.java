package com.mmm.service.payment.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.mmm.common.JavaUtil;
import com.mmm.common.Search;
import com.mmm.service.domain.Payment;
import com.mmm.service.domain.Point;
import com.mmm.service.payment.PaymentDao;

@Repository("paymentDaoImpl")
public class PaymentDaoImpl implements PaymentDao {
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	
	///Setter
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println(">>> "+getClass()+".setSqlSession() Call.....");
		
		this.sqlSession = sqlSession;		
	}
	
	///Constructor
	public PaymentDaoImpl() {
		System.out.println(">>> "+getClass()+"  default Contructor Call.....");
	}

	///Method
	@Override
	public void addPayment(Payment payment) throws Exception {
		sqlSession.insert("PaymentMapper.addPayment", payment);
		
	}

	@Override
	public HashMap<String, Object> getPaymentList(Search search) throws Exception {
		
		HashMap<String, Object> outputMap = new HashMap<String, Object>();
		outputMap.put("list", sqlSession.selectList("PaymentMapper.getPaymentList", search));
		outputMap.put("totalCnt", sqlSession.selectOne("PaymentMapper.getTotalCntPaymentList", search));
		
//		System.out.println("------------------------- "+ sqlSession.selectList("PaymentMapper.getPaymentList", search));
		return outputMap;
	}

	@Override
	public Payment getPayment(int paymentNo) throws Exception {
		return sqlSession.selectOne("PaymentMapper.getPayment", paymentNo);
	}
	
	@Override
	public void cancelPayment(Payment payment) throws Exception {
		
		// Payment table 플래그 바꾸기
		sqlSession.update("PaymentMapper.cancelPayment" ,payment);
		

		
	}

	@Override
	public HashMap<String, Object> getPaymentListAd(Search search) throws Exception {

		HashMap<String, Object> outputMap = new HashMap<String, Object>();
		outputMap.put("list", sqlSession.selectList("PaymentMapper.getPaymentListAd", search));
		outputMap.put("totalCnt", sqlSession.selectOne("PaymentMapper.getTotalCntPaymentListAd", search));
		
//		System.out.println("------------------------- "+ sqlSession.selectList("PaymentMapper.getPaymentList", search));
		return outputMap;
		
	}

	@Override
	public void addPoint(Point point) throws Exception {
		sqlSession.insert("PointMapper.addPoint", point);
		
	}

	@Override
	public HashMap<String, Object> getPointList(Search search) throws Exception {
		
		HashMap<String, Object> outputMap = new HashMap<String, Object>();
		
		List<Point> list = sqlSession.selectList("PointMapper.getPointList", search);
		
//		날짜포맷 바꾸기, PointStatus 세
		for(Point pnt : list) {
			pnt.setPointDate(JavaUtil.convertDateFormat(pnt.getPointDate()));
			
			switch(pnt.getPointStatus()) {
				case "S0" :
					pnt.setPointStatus("적립 - 현금 결제");
					break;
				case "S1" :
					pnt.setPointStatus("적립 - 출석 체크");
					break;
				case "S2" :
					pnt.setPointStatus("적립 - 영화 퀴즈");
					break;
				case "U0" :
					pnt.setPointStatus("사용 - 포인트 결제");
					break;
			}
		}

		outputMap.put("list", list);
		outputMap.put("totalCnt", sqlSession.selectOne("PointMapper.getTotalCntPointList", search));
		
		return outputMap;
	}
	
	@Override
	public Map<String, Point> getPoints(int paymentNo) throws Exception {
		
		Map<String, Point> resultMap = new HashMap<String, Point>();
		resultMap.put("savingPoint", sqlSession.selectOne("PointMapper.getSavingPoint", paymentNo));
		resultMap.put("usingPoint", sqlSession.selectOne("PointMapper.getUsingPoint", paymentNo));
		
		return resultMap;
	}

	@Override
	public int checkAttedance(int userNo) throws Exception {
		return sqlSession.selectOne("PointMapper.checkAttendance", userNo);
	}

	@Override
	public int getTotalPoint(int userNo) throws Exception {
		if (sqlSession.selectOne("PointMapper.getTotalPoint", userNo) == null) {
			return 0;
		}
		return sqlSession.selectOne("PointMapper.getTotalPoint", userNo);
	}

	@Override
	public List<Point> checkList(int userNo) throws Exception {
		return sqlSession.selectList("PointMapper.checkList", userNo);
	}
	
	public int getAccPoint(int userNo) throws Exception {
		
		if (sqlSession.selectOne("PointMapper.getAccPoint", userNo) == null) {
			return 0;
		} 
		
		return sqlSession.selectOne("PointMapper.getAccPoint", userNo);
	}

	@Override
	public Payment getPaymentbyTicketingNo(int ticketingNo) throws Exception {
		return sqlSession.selectOne("PaymentMapper.getPaymentbyTicketingNo", ticketingNo);
	}

	@Override
	public Payment getPaymentbyPurchaseNo(int purchaseNo) throws Exception {
		return sqlSession.selectOne("PaymentMapper.getPaymentbyPurchaseNo", purchaseNo);
	}

	@Override
	public void cancelPoint(int pointNo) throws Exception {
		sqlSession.update("PointMapper.cancelPoint", pointNo);
	}

	
	
}
