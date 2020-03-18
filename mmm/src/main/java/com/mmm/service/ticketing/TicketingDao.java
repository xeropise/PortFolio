package com.mmm.service.ticketing;

import java.util.List;
import java.util.Map;

import com.mmm.common.Search;
import com.mmm.service.domain.Ticketing;

public interface TicketingDao {

	public void addTicketing(Ticketing ticketing) throws Exception;
	
	public void updateTicketing(Ticketing ticketing) throws Exception;
	
	public void deleteTicketing(String ticketingNo) throws Exception;
	
	public Ticketing getTicketing(String ticketingNo) throws Exception;
	
	public Ticketing recentTicketing() throws Exception;
	
	public Map<String,Object> getTicketingList(Search search) throws Exception;
	
	
	
}
