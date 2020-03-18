package com.mmm.service.theater.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mmm.common.Search;
import com.mmm.service.domain.Theater;
import com.mmm.service.domain.Ticketing;
import com.mmm.service.theater.TheaterDao;
import com.mmm.service.theater.TheaterService;
import com.mmm.service.ticketing.TicketingDao;
import com.mmm.service.ticketing.TicketingService;

@Service("theaterServiceImpl")
public class TheaterServiceImpl implements TheaterService {

	@Autowired
	private TheaterDao theaterDao;
	
	public TheaterServiceImpl() {
		System.out.println("::"+getClass()+" default Constructor Call.....");
	}
	
	public void setTheaterDao(TheaterDao theaterDao) {
		System.out.println("::"+getClass()+".setProductDao Call......");
		this.theaterDao = theaterDao;
	}

	@Override
	public void addTheater(Theater theater) throws Exception {
		
		theaterDao.addTheater(theater);
		
	}

	@Override
	public void updateTheater(Theater theater) throws Exception {
		
		theaterDao.updateTheater(theater);
	}

	@Override
	public void deleteTheater(String theaterNo) throws Exception {
		
		theaterDao.deleteTheater(theaterNo);
	}

	@Override
	public Theater getTheater(String theaterNo) throws Exception {
	
		return theaterDao.getTheater(theaterNo);
	}
	
	@Override
	public Theater getTheaterByName(String theaterName) throws Exception {
		
		return theaterDao.getTheaterByName(theaterName);
	}
	
	@Override
	public String lastTheater() throws Exception {
		
		return theaterDao.lastTheater();
	}

	@Override
	public List<Theater> getTheaterList(Search search) throws Exception {
		
		return theaterDao.getTheaterList(search);
	}


}
