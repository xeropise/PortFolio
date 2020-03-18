package com.mmm.service.theater;

import java.util.List;

import com.mmm.common.Search;
import com.mmm.service.domain.Theater;
import com.mmm.service.domain.Ticketing;

public interface TheaterDao {

	public void addTheater(Theater theater) throws Exception;
	
	public void updateTheater(Theater theater) throws Exception;
	
	public void deleteTheater(String theaterNo) throws Exception;
	
	public Theater getTheater(String theaterNo) throws Exception;
	
	public Theater getTheaterByName(String theaterName) throws Exception;
	
	public String lastTheater() throws Exception;
	
	public List<Theater> getTheaterList(Search search) throws Exception;
	
	 
	
}
