package com.mmm.service.ticketing.test;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mmm.common.Search;
import com.mmm.service.datetime.DateTimeService;
import com.mmm.service.domain.Ticketing;
import com.mmm.service.theater.TheaterService;
import com.mmm.service.ticketing.TicketingService;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-aspect.xml",
									"classpath:config/context-common.xml",
									"classpath:config/context-mybatis.xml",
									"classpath:config/context-transaction.xml"})
public class TicketingServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	private DateTimeService dateTimeService;

	@Autowired
	private TheaterService theaterService;
	
	@Autowired
	private TicketingService ticketingService;	
	
	private Ticketing ticketing;
	
	//@Test
	public void testAddTicketing() throws Exception {
		
		ticketing = new Ticketing();
		
		ticketing.setMovieName("기생충2");
		ticketing.setTheaterName("CGV 강남");
		ticketing.setDateTimeNo("10000");

		
		ticketing.setAudienceType("일반,일반,청소년,청소년,우대,우대");
		ticketing.setSeatType("standard,standard,standard,standard,standard");
		ticketing.setSeatNo("A1,A2,B3,B4,C5,C6");
		ticketing.setHeadCount(6);
		ticketing.setTicketingPrice(42000);
		
		 String uuid = UUID.randomUUID().toString();

		ticketing.setTicketingPinNo(uuid.substring(0, 23));
		ticketing.setTicketerPhone("010-9551-8074");
		//
		Date sqlDate = new java.sql.Date(System.currentTimeMillis());
		//ticketing.setTicketingDate(sqlDate);
		ticketing.setTicketingStatus(0);
		
		ticketingService.addTicketing(ticketing);
	}	
	
	@Test
	public void testGetTicketing() throws Exception {
		

		ticketing = ticketingService.getTicketing("10011");
		//==> API 확인
		System.out.println(ticketing);
		System.out.println(ticketing.getTicketingDate());
		System.out.println(new java.util.Date(ticketing.getTicketingDate().getTime()));
		Assert.assertEquals("기생충2", ticketing.getMovieName());
		Assert.assertEquals("CGV 강남", ticketing.getTheaterName());
		Assert.assertEquals("10000", ticketing.getDateTimeNo());
		Assert.assertEquals("일반,일반,청소년,청소년,우대,우대", ticketing.getAudienceType());
		Assert.assertEquals("standard,standard,standard,standard,standard", ticketing.getSeatType());
		Assert.assertEquals("A1,A2,B3,B4,C5,C6", ticketing.getSeatNo());
		Assert.assertEquals(6, ticketing.getHeadCount());
		Assert.assertEquals(42000, ticketing.getTicketingPrice());
		Assert.assertEquals("35b1669f-3542-4404-bbc1", ticketing.getTicketingPinNo());
		Assert.assertEquals("010-9551-8074", ticketing.getTicketerPhone());
		Assert.assertEquals(0, ticketing.getTicketingStatus());
		
	}
	
	//@Test
	 public void testUpdateTicketing() throws Exception{
		
		
		ticketing = ticketingService.getTicketing("10002");
		Assert.assertNotNull(ticketing);
		
		ticketing.setTicketingNo("10002");
		ticketing.setCancelDate(new Timestamp(new java.util.Date().getTime()));
		ticketing.setTicketingStatus(1);
		
		
		ticketingService.updateTicketing(ticketing);
		
	 }
	 
	

	 //@Test
	 public void testGetProductListAll() throws Exception{
		 
		
	 	Search search = new Search();
	 	search.setSearchCondition("0");
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	Map<String,Object> returnMap =ticketingService.getTicketingList(search);
	 	
	 	
	 	//Assert.assertEquals(2, list.size());
	 	
		
	 	
	 }	

}
