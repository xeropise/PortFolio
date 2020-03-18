package com.mmm.web.ticketing;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mmm.service.ticketing.TicketingService;
import com.mmm.common.CheckAuth;
import com.mmm.common.JavaUtil;
import com.mmm.common.Page;
import com.mmm.common.Search;
import com.mmm.service.datetime.DateTimeService;
import com.mmm.service.domain.DateTime;
import com.mmm.service.domain.Preview;
import com.mmm.service.domain.Theater;
import com.mmm.service.domain.Ticketing;
import com.mmm.service.domain.User;
import com.mmm.service.theater.TheaterService;

@Controller
@RequestMapping("/ticketing/*")
public class TicketingController {

	///Field
	@Autowired 
	private TicketingService ticketingService;
	
	@Autowired
	private DateTimeService dateTimeService;
	
	//movieService
	
	//userService
	
	//payService
	
	public TicketingController(){
		System.out.println(this.getClass());
	}	
	
	// 페이지네이션 번호 갯수
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	//한 화면에 보이는 페이지 갯수
	@Value("#{commonProperties['pageSize']}")
	int pageSize;	
	

	@RequestMapping(value="/addTicketing", method=RequestMethod.GET)
	public String addTicketing(Model model, @ModelAttribute("movieName") String movieName) throws Exception {
		
		Search search = new Search();
		
		List<DateTime> movieList =dateTimeService.getMovieList(search);
		List<DateTime> franchiseList = dateTimeService.getFranchiseList(search);
		List<DateTime> theaterNameList = dateTimeService.getTheaterList(search);
		List<DateTime> dateList = dateTimeService.getDateList(search);

		List<Date> yearMonthList = new ArrayList();;
		for(DateTime month : dateList) {
			int year = month.getScreenDate().getYear();
			int mon =month.getScreenDate().getMonth()+1;
			Date utilDate = new Date(year,mon,0);
			if(yearMonthList.indexOf(utilDate)==-1) {
				yearMonthList.add(utilDate);
			}
		}
		
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("franchiseList", franchiseList);
		model.addAttribute("theaterNameList",theaterNameList);
		model.addAttribute("dateList", dateList);
		model.addAttribute("yearMonthList",yearMonthList);
		model.addAttribute("movieName",new String(movieName.getBytes("8859_1"),"UTF-8"));
		
		return "forward:/ticketing/addTicketing.jsp";
	}

	@RequestMapping(value="/addCompareTicketing", method=RequestMethod.GET)
	public String addCompareTicketing(Model model) throws Exception {
		
		Search search = new Search();
		
		List<DateTime> movieList =dateTimeService.getMovieList(search);
		List<DateTime> franchiseList = dateTimeService.getFranchiseList(search);
		List<DateTime> theaterNameList = dateTimeService.getTheaterList(search);
		List<DateTime> dateList = dateTimeService.getDateList(search);
		List<Date> yearMonthList = new ArrayList();;
		for(DateTime month : dateList) {
			int year = month.getScreenDate().getYear();
			int mon =month.getScreenDate().getMonth()+1;
			Date utilDate = new Date(year,mon,0);
			if(yearMonthList.indexOf(utilDate)==-1) {
				yearMonthList.add(utilDate);
			}
		}
		//System.out.println("사이즈는!");
		//System.out.println(yearMonthList.size());
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("franchiseList", franchiseList);
		model.addAttribute("theaterNameList",theaterNameList);
		model.addAttribute("dateList", dateList);
		model.addAttribute("yearMonthList",yearMonthList);
		
		return "forward:/ticketing/addCompareTicketing.jsp";
	}
	@CheckAuth(role="user,admin,unUser")
	@RequestMapping(value="/addSeatSelect")
	public String addSeatSelect(@RequestParam Map<String, Object> map, Model model) throws Exception {
		System.out.println(map);
	
		DateTime dateTime = new DateTime();
		dateTime.setMovieName((String)map.get("movieName"));
		dateTime.setFranchise((String)map.get("franchise"));
		dateTime.setTheaterName((String)map.get("theaterName"));
		dateTime.setScreenDate(JavaUtil.ymdToTimestamp((String)map.get("screenDate")));
		dateTime.setScreenTime(JavaUtil.hmToTimestamp((String)map.get("screenTime")));
		
		DateTime dateTimeB4 =dateTimeService.getSelectedSeat(dateTime);
		//System.out.println(dateTimeB4);
		dateTime.setRating(dateTimeB4.getRating());
		dateTime.setPoster(dateTimeB4.getPoster());
		dateTime.setScreenName(dateTimeB4.getScreenName());
		dateTime.setRemainingSeat(dateTimeB4.getRemainingSeat());
		dateTime.setDateTimeNo(dateTimeB4.getDateTimeNo());
		dateTime.setSelectedSeat(dateTimeB4.getSelectedSeat());
		//System.out.println(dateTime);
		model.addAttribute("dateTime", dateTime);
		
		return "forward:/ticketing/addSeatSelect.jsp";
	}
	
	@RequestMapping(value="/getTicketingList")
	public String getTicketingList(Model model, @ModelAttribute("search") Search search, HttpServletRequest request,@ModelAttribute("alarm") String alarm) throws Exception {
		
		//회원 전용
		
		User user = (User) request.getSession().getAttribute("user");
		search.setTicketerPhone(user.getPhone());
		
		System.out.println(search);
		System.out.println("/ticketing/getTicketingList");
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		try {
			if(search.getSearchCondition()==null) {
				search.setSearchCondition("0");
			}
			
		}catch(NullPointerException e) {
			search.setSearchCondition("0");
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = ticketingService.getTicketingList(search);
		List<Ticketing> list = (List<Ticketing>)map.get("list");
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("ticketingList",list);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("alarm", alarm);				
		return "forward:/ticketing/getTicketingList.jsp";
		
		
	}	
	
	@RequestMapping(value="/completeTicketing", method=RequestMethod.POST)
	public synchronized String ticketingTest(@ModelAttribute Ticketing ticketing, HttpServletRequest request,Model model) throws Exception {
		
		User user = (User) request.getSession().getAttribute("user");
		System.out.println(user);
		System.out.println("ticketing 담긴 정보는 : "+ticketing);
		String uuid = UUID.randomUUID().toString().substring(0, 23); //티켓팅 번호
		ticketing.setTicketingPinNo(uuid); //핀번호
		ticketing.setTicketingDate(new Timestamp(new java.util.Date().getTime())); //현재 날짜로 삽입
		ticketing.setTicketingStatus(0); //상태 0이면 예매완료 1이면 취소
		ticketing.setTicketerPhone(user.getPhone());//회원
		
		ticketingService.addTicketing(ticketing);
		
		model.addAttribute("ticketing", ticketingService.recentTicketing());
		model.addAttribute("dateTime", dateTimeService.getDateTime(ticketing.getDateTimeNo()));

		return "forward:/ticketing/completeTicketing.jsp";
	};
	
	@RequestMapping(value="/cancelTest/{ticketingNo}", method=RequestMethod.POST)
	public String cancelTest(@PathVariable("ticketingNo") String ticketingNo, Model model) throws Exception {
		System.out.println("/cancelTest");
		Ticketing ticketing = new Ticketing();
		ticketing.setTicketingNo(ticketingNo);
		System.out.println("updateTicketing시작");
		ticketingService.updateTicketing(ticketing);
		System.out.println("updateTicketing끝");
		//model.addAttribute(ticketing);
		
		return "redirect:/ticketing/getTicketingList";
	}
	//추후 개발
	@RequestMapping(value="/getTimeTable", method=RequestMethod.GET)
	public String getTimeTable() throws Exception {
		
		return null;
		
	};
	

	
	public String deleteTicket() throws Exception {
		
		return null;
	}
}
