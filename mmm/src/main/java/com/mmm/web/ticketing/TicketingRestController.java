package com.mmm.web.ticketing;


import java.sql.Timestamp;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mmm.common.JavaUtil;
import com.mmm.common.Page;
import com.mmm.common.Search;
import com.mmm.service.datetime.DateTimeService;
import com.mmm.service.domain.DateTime;
import com.mmm.service.domain.Theater;
import com.mmm.service.domain.Ticketing;
import com.mmm.service.domain.User;
import com.mmm.service.theater.TheaterService;
import com.mmm.service.ticketing.TicketingService;




@RestController
@RequestMapping("/ticketing/*")
public class TicketingRestController {

	///Field
	@Autowired
	@Qualifier("ticketingServiceImpl")
	private TicketingService ticketingService;
	
	@Autowired
	@Qualifier("theaterServiceImpl")
	private TheaterService theaterService;
	
	@Autowired
	@Qualifier("dateTimeServiceImpl")
	private DateTimeService dateTimeService;
	
	//movieService
	
	//userService
	
	//payService
	
	public TicketingRestController(){
		System.out.println(this.getClass());
	}
	
	// 페이지네이션 번호 갯수
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	//한 화면에 보이는 페이지 갯수
	@Value("#{commonProperties['pageSize']}")
	int pageSize;	
	
	
	@RequestMapping( value="json/getMovieList", method=RequestMethod.POST)
	public List<DateTime> getMovieList(@RequestBody Map<String, Object> map ) throws Exception {
		
		
		Search search = new Search();
		if(map.get("franchise")!=null) {
			String s = (String)map.get("franchise");
			List<String> strings =Arrays.asList(s.split(","));
			search.setFranchises(strings);
		}
		if(map.get("theaterName")!=null) {
			String t =(String)map.get("theaterName");
			List<String> trings =Arrays.asList(t.split(","));
			search.setTheaterNames(trings);
		}if(map.get("screenDate")!=null) {
			Timestamp timeStamp = JavaUtil.mdToTimestamp((String)map.get("screenDate"));
			System.out.println(timeStamp);
			search.setScreenDate(timeStamp);
		}
		
		
		
		
		return dateTimeService.getMovieList(search);
		
	}
	
	@RequestMapping( value="json/getFranchiseList", method=RequestMethod.POST)
	public List<DateTime> getFranchiseList(@RequestBody Map<String, Object> map) throws Exception {
		
		
		Search search = new Search();
		if(map.get("movieName")!=null) {
			//System.out.println((String)map.get("movieName"));
			search.setMovieName(((String)map.get("movieName")));
		}
		if(map.get("theaterName")!=null) {
			//System.out.println((String)map.get("theaterName"));
			search.setTheaterName(((String)map.get("theaterName")));
		}
		if(map.get("screenDate")!=null) {
			Timestamp timeStamp = JavaUtil.mdToTimestamp((String)map.get("screenDate"));
			System.out.println(timeStamp);
			search.setScreenDate(timeStamp);
		}
		
		return dateTimeService.getFranchiseList(search);
	}
	
	@RequestMapping( value="json/getTheaterList", method=RequestMethod.POST)
	public List<DateTime> getTheaterList(@RequestBody Map<String, Object> map) throws Exception {
		
		Search search = new Search();
		if(map.get("franchise")!=null) {
			String s = (String)map.get("franchise");
			List<String> strings =Arrays.asList(s.split(","));
			search.setFranchises(strings);
		}
		if(map.get("movieName")!=null) {
			//System.out.println((String)map.get("movieName"));
			search.setMovieName(((String)map.get("movieName")));
		}
		if(map.get("screenDate")!=null) {
			Timestamp timeStamp = JavaUtil.mdToTimestamp((String)map.get("screenDate"));
			System.out.println(timeStamp);
			search.setScreenDate(timeStamp);
		}
		
		return dateTimeService.getTheaterList(search);
	}
	
	@RequestMapping( value="json/getTheaterList", method=RequestMethod.GET)
	public List<Theater> getTheaterList(@ModelAttribute Search search) throws Exception {
		
		
		return theaterService.getTheaterList(search);
	}	
	
	@RequestMapping( value="json/getDateList", method=RequestMethod.POST)
	public List<DateTime> getDateList(@RequestBody Map<String, Object> map) throws Exception {

		System.out.println("전송된 map 값은? \n"+map);
		Search search = new Search();
		if(map.get("franchise")!=null) {
			String s = (String)map.get("franchise");
			List<String> strings =Arrays.asList(s.split(","));
			search.setFranchises(strings);
		}
		if(map.get("theaterName")!=null) {
			String t =(String)map.get("theaterName");
			List<String> trings =Arrays.asList(t.split(","));
			search.setTheaterNames(trings);
		}
		if(map.get("movieName")!=null) {
			search.setMovieName(((String)map.get("movieName")));
		}	
		
		return dateTimeService.getDateList(search);
	}
	
	@RequestMapping( value="json/getTimeList", method=RequestMethod.POST)
	public List<DateTime> getTimeList(@RequestBody Map<String, Object> map) throws Exception {

		System.out.println(map);
		Search search = new Search();
		if(map.get("franchise")!=null) {
			//System.out.println((String)map.get("franchise"));
			search.setFranchise((String)map.get("franchise"));
		}
		if(map.get("theaterName")!=null) {
			//System.out.println((String)map.get("theaterName"));
			search.setTheaterName(((String)map.get("theaterName")));
		}
		if(map.get("movieName")!=null) {
			//System.out.println((String)map.get("movieName"));
			search.setMovieName(((String)map.get("movieName")));
		}
		if(map.get("screenDate")!=null) {
			Timestamp timeStamp = JavaUtil.mdToTimestamp((String)map.get("screenDate"));
			System.out.println(timeStamp);
			search.setScreenDate(timeStamp);
		}		
		
		
		return dateTimeService.getTimeList(search);
	}
	
	@RequestMapping( value="json/getSelectedSeat", method=RequestMethod.POST)
	public DateTime getSelectedSeat(@RequestBody Map<String, Object> map) throws Exception{
		
		DateTime dateTime = new DateTime();
		dateTime.setDateTimeNo((String)map.get("dateTimeNo"));
		
		
		return dateTimeService.getSelectedSeat(dateTime);
	}
	@RequestMapping( value="json/getBookedTicketList", method=RequestMethod.POST)
	public Map<String,Object> getBookedTicketList(@RequestBody Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		User user = (User)request.getSession().getAttribute("user");
		System.out.println("/ticketing/getTicketingList");
		System.out.println(map);
		Search search = new Search();
		if((boolean)map.get("currentPage").equals("0")) {
			search.setCurrentPage(1);
		}else {
			search.setCurrentPage(Integer.parseInt((String)map.get("currentPage")));
		}
		search.setSearchCondition((String)map.get("searchCondition"));
		search.setPageSize(pageSize);
		search.setTicketerPhone(user.getPhone()); //회원
		map = ticketingService.getTicketingList(search);
		List<Ticketing> list = (List<Ticketing>)map.get("list");
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		map.put("ticketingList", list);
		map.put("resultPage", resultPage);
		map.put("search", search);
		
		return map;
		
	}
	
	@RequestMapping( value="json/getDateTime/{dateTimeNo}", method=RequestMethod.POST)
	public DateTime getDateTime(@PathVariable String dateTimeNo ) throws Exception {	
		

		return dateTimeService.getDateTime(dateTimeNo);
	}
	
	@RequestMapping( value="json/getDateTimeByMovieName/{movieName}", method=RequestMethod.GET)
	public DateTime getDateTimeByMovieName(@PathVariable String movieName ) throws Exception {	

		movieName = new String(movieName.getBytes("8859_1"),"UTF-8").replace("+", " ");
		return dateTimeService.getDateTimeByMovieName(movieName);
	}	
	
	@RequestMapping( value="json/getTicket/{ticketingNo}", method=RequestMethod.POST)
	public Ticketing getTicket(@PathVariable String ticketingNo ) throws Exception {
		
		
		System.out.println(ticketingNo);
		
		return ticketingService.getTicketing(ticketingNo);
	}
	
	@RequestMapping( value="json/getTheaterByName/{theaterName}", method=RequestMethod.GET)
    public Theater getTheaterByName(@PathVariable String theaterName ) throws Exception {
		
		theaterName =new String(theaterName.getBytes("8859_1"),"UTF-8").replace("+", " ");
		return theaterService.getTheaterByName(theaterName);
	}
	
}
