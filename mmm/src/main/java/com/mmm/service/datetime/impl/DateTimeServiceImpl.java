package com.mmm.service.datetime.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mmm.common.Search;
import com.mmm.service.datetime.DateTimeDao;
import com.mmm.service.datetime.DateTimeService;
import com.mmm.service.domain.DateTime;
import com.mmm.service.domain.Ticketing;
import com.mmm.service.ticketing.TicketingDao;
import com.mmm.service.ticketing.TicketingService;

@Service("dateTimeServiceImpl")
public class DateTimeServiceImpl implements DateTimeService {

	@Autowired
	private DateTimeDao dateTimeDao;
	
	public DateTimeServiceImpl() {
		System.out.println("::"+getClass()+" default Constructor Call.....");
	}
	
	public void setDateTimeDao(DateTimeDao dateTimeDao) {
		System.out.println("::"+getClass()+".setProductDao Call......");
		this.dateTimeDao = dateTimeDao;
	}

	@Override
	public void addDateTime(DateTime dateTime) throws Exception {
		
		dateTimeDao.addDateTime(dateTime);
		
	}

	@Override
	public void updateDateTime(DateTime dateTime) throws Exception {
		
		dateTimeDao.updateDateTime(dateTime);
	}

	@Override
	public void deleteDateTime(String dateTimeNo) throws Exception {
		
		dateTimeDao.deleteDateTime(dateTimeNo);
	}

	@Override
	public DateTime getDateTime(String dateTimeNo) throws Exception {
	
		return dateTimeDao.getDateTime(dateTimeNo);
	}

	@Override
	public DateTime getDateTimeByMovieName(String movieName) throws Exception {
		// TODO Auto-generated method stub
		return dateTimeDao.getDateTimeByMovieName(movieName);
	}
	
	@Override
	public List<DateTime> getDateTimeList(Search search) throws Exception {
		
		return dateTimeDao.getDateTimeList(search);
	}
	
	@Override
	public List<DateTime> getMovieList(Search search) throws Exception {
		
		return dateTimeDao.getMovieList(search);
	}	
	
	@Override
	public List<DateTime> getFranchiseList(Search search) throws Exception {
		
		return dateTimeDao.getFranchiseList(search);
	}
	
	@Override
	public List<DateTime> getTheaterList(Search search) throws Exception {
		
		return dateTimeDao.getTheaterList(search);
	}
	
	@Override
	public List<DateTime> getDateList(Search search) throws Exception {
		
		return dateTimeDao.getDateList(search);
	}
	
	@Override
	public List<DateTime> getTimeList(Search search) throws Exception {
		
		return dateTimeDao.getTimeList(search);
	}
	
	@Override
	public DateTime getSelectedSeat(DateTime dateTime) throws Exception {
		
		return dateTimeDao.getSelectedSeat(dateTime);
	}

	@Override
	public void addTicketing(Map<Object, Object> ticketingInfo) throws Exception {
		
		dateTimeDao.addTicketing(ticketingInfo);
		
	}

	@Override
	public void cancelTicketing(Map<Object, Object> ticketingInfo) throws Exception {
		
		dateTimeDao.cancelTicketing(ticketingInfo);
	}








}
