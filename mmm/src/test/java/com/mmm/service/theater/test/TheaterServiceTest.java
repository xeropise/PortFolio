package com.mmm.service.theater.test;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mmm.common.KakaoAPI;
import com.mmm.common.Search;
import com.mmm.service.datetime.DateTimeService;
import com.mmm.service.domain.DateTime;
import com.mmm.service.domain.Theater;
import com.mmm.service.theater.TheaterService;
import com.mmm.service.ticketing.TicketingService;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-aspect.xml",
									"classpath:config/context-common.xml",
									"classpath:config/context-mybatis.xml",
									"classpath:config/context-transaction.xml"})
public class TheaterServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	private DateTimeService dateTimeService;

	@Autowired
	private TheaterService theaterService;
	
	@Autowired
	private TicketingService ticketingService;	
	
	private Theater theater;
	
	@Test
	public void testAddTheater() throws Exception {
		 
		
		
		KakaoAPI api = new KakaoAPI();
		
		JSONArray theaterArray =api.postHttpClient("http://127.0.0.1:8080/ticketing/json/getTheaterList",new HashMap<String,Object>());
		System.out.println(theaterArray);
		Iterator it =theaterArray.listIterator();
		DateTime dateTime = null;
		JSONObject jsonObject = null;
		JSONArray jsonArray = null;
		String keyword = null;
		Theater theater = new Theater();
		while(it.hasNext()) {
			jsonObject =(JSONObject) it.next();
			keyword = (String) jsonObject.get("theaterName");
			System.out.println("검색어는? : "+keyword);
			if(keyword.equals("롯데시네마 가양관")) {
				keyword ="롯데시네마 가양";
			}else if(keyword.equals("롯데시네마 수락산관")) {
				keyword ="롯데시네마 수락산";
			}else if(keyword.equals("롯데시네마 신도림(디큐브)")) {
				keyword ="롯데시네마 신도림";
			}
			jsonObject = api.searchPlaceByKeyword(keyword);
			jsonArray = (JSONArray)jsonObject.get("documents");
			jsonObject = (JSONObject) jsonArray.get(0);
			//System.out.println(jsonObject);
			
			if(keyword.contains("CGV")) {
				theater.setFranchise("CGV");
			}else if(keyword.contains("롯데시네마")) {
				theater.setFranchise("롯데시네마");
			}else if(keyword.contains("메가박스")) {
				theater.setFranchise("메가박스");
			}
			
			theater.setTheaterName(keyword);
			theater.setTheaterPhone((String)jsonObject.get("phone"));
			theater.setPositionX((String)jsonObject.get("x"));
			theater.setPositionY((String)jsonObject.get("y"));
			theater.setAddress((String)jsonObject.get("address_name"));
			theater.setRoadAddress((String)jsonObject.get("road_address_name"));
			theater.setPlaceUrl((String)jsonObject.get("place_url"));
			theater.setId((String)jsonObject.get("id"));
			
			theaterService.addTheater(theater);
		}//end of while
		

		
		
	}	

}
