package com.mmm.service.datetime;

import java.util.List;
import java.util.Map;

import com.mmm.common.Search;
import com.mmm.service.domain.DateTime;
import com.mmm.service.domain.Ticketing;

public interface DateTimeService {

	public void addDateTime(DateTime dateTime) throws Exception;
	
	public void updateDateTime(DateTime dateTime) throws Exception;
	
	public void deleteDateTime(String dateTimeNo) throws Exception;
	
	public DateTime getDateTime(String dateTimeNo) throws Exception;
	
	public DateTime getDateTimeByMovieName(String movieName) throws Exception;
	
	public List<DateTime> getDateTimeList(Search search) throws Exception;
	
	public List<DateTime> getMovieList(Search search) throws Exception;
	
	public List<DateTime> getFranchiseList(Search search) throws Exception;
	
	public List<DateTime> getTheaterList(Search search) throws Exception;
	
	public List<DateTime> getDateList(Search search) throws Exception;
	
	public List<DateTime> getTimeList(Search search) throws Exception;
	
	public DateTime getSelectedSeat(DateTime dateTime) throws Exception;
	
	public void addTicketing(Map<Object,Object> ticketingInfo) throws Exception;
	
	public void cancelTicketing(Map<Object,Object> ticketingInfo) throws Exception;
	
	
}
