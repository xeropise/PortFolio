package com.mmm.service.ticketing.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mmm.common.Search;
import com.mmm.service.datetime.DateTimeDao;
import com.mmm.service.domain.DateTime;
import com.mmm.service.domain.Ticketing;
import com.mmm.service.ticketing.TicketingDao;
import com.mmm.service.ticketing.TicketingService;

@Service("ticketingServiceImpl")
public class TicketingServiceImpl implements TicketingService {

	@Autowired
	private TicketingDao ticketingDao;
	
	@Autowired
	private DateTimeDao dateTimeDao;
	
	public TicketingServiceImpl() {
		System.out.println("::"+getClass()+" default Constructor Call.....");
	}
	
	public void setTicketingDao(TicketingDao ticketingDao) {
		System.out.println("::"+getClass()+".setTicketingDao Call......");
		this.ticketingDao = ticketingDao;
	}
	
	public void setDateTimeDao(DateTimeDao dateTimeDao) {
		System.out.println("::"+getClass()+".setDateTimeDao Call......");
		this.dateTimeDao = dateTimeDao;
	}	

	@Override
	public void addTicketing(Ticketing ticketing) throws Exception {
		
		ticketingDao.addTicketing(ticketing);
		Map<Object,Object> ticketingInfo = new HashMap<Object,Object>();
		
		ticketingInfo.put("dateTimeNo", ticketing.getDateTimeNo());
		ticketingInfo.put("headCount", ticketing.getHeadCount());
		ticketingInfo.put("totalSeat", ticketing.getTotalSeat());
		dateTimeDao.addTicketing(ticketingInfo);
		
	}

	@Override	//티켓팅 취소 시
	public void updateTicketing(Ticketing ticketing) throws Exception {
		//예매정보의 예매관리번호로 예매 정보를 가져오고
		Ticketing cancel =ticketingDao.getTicketing(ticketing.getTicketingNo());
		
		System.out.println("\n"+cancel);
		
		// 예매 정보로 상영일시 정보를 가져온다.
		DateTime dateTime = dateTimeDao.getDateTime(cancel.getDateTimeNo());
		System.out.println("\n"+dateTime);
		System.out.println("list불러오기");
		System.out.println("abcd123 :"+dateTime.getSelectedSeat().split(","));
		List<String> reservedTotal =Arrays.asList(dateTime.getSelectedSeat().split(",")); // 예매된 좌석 전체
		List<String> reserved=Arrays.asList(cancel.getSeatNo().split(",")); // 티켓 정보에서 가지고 있는 좌석 정보
		System.out.println("reservedTotal \n"+reservedTotal);
		System.out.println("reserved \n"+reserved);
		System.out.println("list불러오기 끝");
		//뺀 글자
		List<String> result = new ArrayList<String>();
		// 예매된 좌석 전체에서, 티켓 정보에서 가지고 있는 좌석을 뺀다.
		for(int i=0; i<reservedTotal.size(); i++) {
			//지금 조회하는 글자를 티켓 정보에서 가지고있지 않다면
			if(reserved.indexOf(reservedTotal.get(i))==-1) {
				result.add(reservedTotal.get(i));
			}
		}
		String toString="";
		for(int j=0; j<result.size(); j++) {
			if(j==result.size()-1) {
				toString+=result.get(j);
			}else {
				toString+=result.get(j)+",";
			}
		}
		System.out.println(toString);
		Map<Object,Object> ticketingInfo = new HashMap<Object,Object>();
		ticketingInfo.put("dateTimeNo", cancel.getDateTimeNo());
		ticketingInfo.put("headCount", cancel.getHeadCount());		
		ticketingInfo.put("totalSeat", toString);
		ticketingInfo.put("ticketingStatus", 1);
		
		ticketingDao.updateTicketing(cancel);
		dateTimeDao.cancelTicketing(ticketingInfo);
	}

	@Override
	public void deleteTicketing(String ticketingNo) throws Exception {
		
		ticketingDao.deleteTicketing(ticketingNo);
	}

	@Override
	public Ticketing getTicketing(String ticketingNo) throws Exception {
	
		return ticketingDao.getTicketing(ticketingNo);
	}
	
	@Override
	public Ticketing recentTicketing() throws Exception {
		
		return ticketingDao.recentTicketing();
	}	

	@Override
	public Map<String,Object> getTicketingList(Search search) throws Exception {
		
		
		
		return ticketingDao.getTicketingList(search); 
	}


}
