package com.mmm.web.event;

import java.awt.Event;
import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.mmm.common.CheckAuth;
import com.mmm.common.JavaUtil;
import com.mmm.common.Page;
import com.mmm.common.Search;
import com.mmm.service.board.BoardService;
import com.mmm.service.datetime.DateTimeService;
import com.mmm.service.domain.Comment;
import com.mmm.service.domain.Movie;
import com.mmm.service.domain.Participation;
import com.mmm.service.domain.Point;
import com.mmm.service.domain.Preview;
import com.mmm.service.domain.Quiz;
import com.mmm.service.domain.User;
import com.mmm.service.event.EventService;
import com.mmm.service.movie.MovieService;
import com.mmm.service.payment.PaymentService;
import com.mmm.service.user.UserService;

@Controller
@RequestMapping("/event/*")
public class EventController {
	
	//Field
	@Autowired
	@Qualifier("eventServiceImpl")
	private EventService eventService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("dateTimeServiceImpl")
	private DateTimeService dateTimeService;

	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	@Autowired
	@Qualifier("movieServiceImpl")
	private MovieService movieService;
	
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	
	//private PointService pointService;

	public EventController() {
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	//google Key	
	String googleKey = "";	//내꺼
	//String googleKey = "";	//지민이꺼
	String urlGoogleSearch ="https://www.googleapis.com/youtube/v3/search?key="+googleKey;
	
	//외부 Http 연결을 용이하게 하기 위한 template
	HttpEntity<?> headers;
	RestTemplate template = new RestTemplate();
	
	
	

	
//	@RequestMapping(value="attendance", method=RequestMethod.GET)
//	public String attendance() throws Exception{ 
//		System.out.println("/event/attendance : GET");
//		return "redirect:/event/addAttendance.jsp";
//	}

	//시사회이벤트 등록 폼 가져오기
	@RequestMapping(value="addPreviewAd", method=RequestMethod.GET)
	public String addPreviewAdView(Model model, @RequestParam int movieNo, HttpSession session) throws Exception{ 
		
		User user = (User)session.getAttribute("user");
		System.out.println("/event/addPreviewAd:GET");
		Movie movie = new Movie();
		movie.setMovieNo(movieNo);
		movie = movieService.getMovieByMovieNo(movie);
		
		System.out.println("movie를 찍어보자 ====>" + movie);
		
		System.out.println("dateTimeService.getTheaterList(new Search())>>>"+dateTimeService.getTheaterList(new Search())); //영화관을 가져오기 위해
		
		
		
		
		model.addAttribute("user", user);
		model.addAttribute("movie", movie);
		model.addAttribute("getTheaterList", dateTimeService.getTheaterList(new Search()));
		
		return "forward:/event/addPreviewAd.jsp";
	}
	
	//시사회이벤트 등록하기
	@RequestMapping(value="addPreviewAd", method=RequestMethod.POST)
	public String addPreviewAd(@RequestParam Map<String, Object> map, Model model) throws Exception {
		System.out.println("/event/addPreviewAd:POST");
		System.out.println(map);
	
//시사회 사진은 가져다쓴다	
//		String filesName =System.currentTimeMillis()+"";
//		List<String> fn = new ArrayList();
		
		
		Preview preview2 = new Preview();
		
		preview2.setPreviewImage((String)map.get("previewImage"));
		preview2.setPreviewName((String)map.get("previewName"));
		preview2.setPreviewPlace((String)map.get("previewPlace"));
		preview2.setMovieNo(Integer.parseInt((String)map.get("movieNo")));
		
		String previewDate = (String)map.get("previewDate")+" "+(String)map.get("previewHH")+":"+(String)map.get("previewMM");
		preview2.setPreviewDate(JavaUtil.ymdhmToTimestamp(previewDate));
		
		
		//preview2.setPreviewTime(JavaUtil.hmToTimestamp(previewTime));
		
		//preview2.setPreviewImage((String)map.get("previewImage"));
		preview2.setPreviewStartDate(JavaUtil.ymdToTimestamp((String)map.get("previewStartDate")));
		preview2.setPreviewEndDate(JavaUtil.ymdToTimestamp((String)map.get("previewEndDate")));
		preview2.setWinnerDate(JavaUtil.ymdToTimestamp((String)map.get("winnerDate")));
		preview2.setWinnerCount(Integer.parseInt((String)map.get("winnerCount")));
		preview2.setWinnerCount(Integer.parseInt((String)map.get("winnerCount")));
		
//		String saveName = "";
//		if(file!=null) {
//			if(file.length>1) {
//				System.out.println("길이가 1보다 크면 ");
//				for(int i=0; i<file.length; i++) {
//				
//					saveName += saveFile(file[i])+",";
//				}
//			}else if(file.length==1) {
//				System.out.println("길이가 1보다 작으면 ");
//					saveName = saveFile(file[0]);
//			}
//			System.out.println(saveName);
//			preview2.setPreviewImage(saveName);
//		}
//		
//		String[] fileArr = saveName.split(",");
//		
//		model.addAttribute("fileArr", fileArr);
//
		eventService.addPreviewAd(preview2);
		model.addAttribute("preview", preview2);
	
		
		return "forward:/event/getPreviewAd.jsp";
	}
	
//	
//	@RequestMapping(value="getPreviewListAd")
//	public String getPreviewListAd(@ModelAttribute("search") Search search , Model model) throws Exception {
//	
//		System.out.println("/event/getPreviewListAd:GET");
//		//search = new Search();
//		if(search.getCurrentPage()==0) {
//			search.setCurrentPage(1);
//		}
//		//search.setCurrentPage(2);
//		search.setPageSize(pageSize);
//		
//		Map<String, Object> map = eventService.getPreviewListAd(search);
//		List<Preview> list = (List<Preview>)map.get("list");
//		Page resultPage	= 
//				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
//		
//		model.addAttribute("list",list);
//		model.addAttribute("resultPage", resultPage);
//		model.addAttribute("search", search);
//		
//		//String[] fileArr = preview.getPreviewImage();
//		//model.addAttribute("fileArr", fileArr);
//		
//		return "forward:/event/getPreviewListAd.jsp";
//	}
//		
	
	
	
	@RequestMapping(value="getPreviewAd")
	public String getPreviewAd(@RequestParam int previewNo, HttpSession session, Model model) throws Exception{
		
		System.out.println("/event/getPreviewAd:GET");
		
		if(session.getAttribute("user")!=null) {
			User user = (User)session.getAttribute("user");
			model.addAttribute("user", user);
		}
		

		
		Preview preview = eventService.getPreviewAd(previewNo);
		
		
		Movie movie = new Movie();
		movie.setMovieNo(preview.getMovieNo());
		movie = movieService.getMovieByMovieNo(movie);
		System.out.println("movieeeeeeeeeeeeee"+movie);
//		트레일러...youtube API Method 호출 
//		String videoId = getYoutube(movie.getMovieTitle());
//		preview.setTrailer(videoId);
		
		model.addAttribute("preview" , preview);
		
//		String[] fileArr = preview.getPreviewImage().split(",");
//		model.addAttribute("fileArr", fileArr);
		
		return "forward:/event/getPreviewAd.jsp";
	}
	
	
	
	@RequestMapping(value="updatePreviewAd", method=RequestMethod.GET)
	public String updatePreviewAdView(@RequestParam int previewNo, Model model) throws Exception{
		
		System.out.println("/event/updatePreviewAd:GET");
		System.out.println("updatePreviewAd:previewNo>>>" + previewNo);
		
		Preview preview = eventService.getPreviewAd(previewNo);
		
		String hour = preview.getPreviewTime().substring(0, 2);
		String min = preview.getPreviewTime().substring(3, 5);
		String[] fileArr = preview.getPreviewImage().split(",");

		System.out.println("dateTimeService.getTheaterList(new Search())>>>"+dateTimeService.getTheaterList(new Search()));
		
		Movie movie = new Movie();
		movie.setMovieNo(preview.getMovieNo());
		movie = movieService.getMovieByMovieNo(movie);
		System.out.println("movieeeeeeeeeeeeee"+movie);
		
		model.addAttribute("getTheaterList", dateTimeService.getTheaterList(new Search()));
		model.addAttribute("preview" , preview);
		model.addAttribute("movie" , movie);
//		model.addAttribute("fileArr", fileArr);
		model.addAttribute("hour", hour);
		model.addAttribute("min", min);
		
		return "forward:/event/updatePreviewAd.jsp";
	}
	
	
	
	@RequestMapping(value="updatePreviewAd", method=RequestMethod.POST)
	public String updatePreviewAd(@RequestParam Map<String, Object> map,@RequestParam("previewImage") MultipartFile[] file, Model model) throws Exception{
		
		System.out.println("/event/updatePreviewAd:POST");
		System.out.println(map);
	
		
		String filesName =System.currentTimeMillis()+"";
		List<String> fn = new ArrayList();
		
		Preview preview2 = new Preview();
		
		preview2.setPreviewNo(Integer.parseInt((String)map.get("previewNo")));
		preview2.setPreviewName((String)map.get("previewName"));
		preview2.setPreviewPlace((String)map.get("previewPlace"));
		
		
		String previewDate = (String)map.get("previewDate")+" "+(String)map.get("previewHH")+":"+(String)map.get("previewMM");
		preview2.setPreviewDate(JavaUtil.ymdhmToTimestamp(previewDate));
		
		
		//preview2.setPreviewTime(JavaUtil.hmToTimestamp(previewTime));
		//preview2.setPreviewImage((String)map.get("previewImage"));
		preview2.setPreviewStartDate(JavaUtil.ymdToTimestamp((String)map.get("previewStartDate")));
		preview2.setPreviewEndDate(JavaUtil.ymdToTimestamp((String)map.get("previewEndDate")));
		preview2.setWinnerDate(JavaUtil.ymdToTimestamp((String)map.get("winnerDate")));
		preview2.setWinnerCount(Integer.parseInt((String)map.get("winnerCount")));
		
		String saveName = "";
		
		if(file!=null) {
			if(file.length>1) {
				System.out.println("길이가 1보다 크면 ");
				for(int i=0; i<file.length; i++) {
				
					saveName += saveFile(file[i])+",";
				}
			}else if(file.length==1) {
				System.out.println("길이가 1보다 작으면 ");
					saveName = saveFile(file[0]);
			}
			System.out.println(saveName);
			preview2.setPreviewImage(saveName);
		}
		
			String[] fileArr = saveName.split(",");
			model.addAttribute("fileArr", fileArr);

			eventService.updatePreviewAd(preview2);
			model.addAttribute("preview", preview2);
			
		return "forward:/event/getPreview.jsp";
	}
	
	
	
	@RequestMapping(value="getPreviewList")
	public String getPreviewList(@ModelAttribute("search") Search search, Model model, HttpSession session) throws Exception{
		
		User user = (User)session.getAttribute("user");
	
		
		System.out.println("[getPreviewList start]");
		
		String[] fileArr = null;
		
		List<String[]> fileNameArr = new ArrayList<>();
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		System.out.println("search에 flag잘 담겨와??????????"+search);
		
		Map<String, Object> map = eventService.getPreviewList(search);
		List<Preview> list = (List<Preview>)map.get("list");
		
		List<Preview> previewAll = eventService.getAllPreview();
		
		List<Preview> doingList = new ArrayList<>();
		List<Preview> doneList = new ArrayList<>(); 

		for(Preview previeww: previewAll) {
			if(previeww.getPreviewFlag().equals("1")) {
				doingList.add(previeww);
			}else if(previeww.getPreviewFlag().equals("2")) {
				doneList.add(previeww);
			}
		} 
		
		for(Preview p: doneList) {
			System.out.println("=======================>done============>"+p);
		}
		System.out.println(doneList.size());

		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		for(Preview preview : list) {
			 fileArr = preview.getPreviewImage().split(",");
			 fileNameArr.add(fileArr);
		}
		
		System.out.println("fileNameArr>>>>>>>>>>>>>>>"+fileNameArr);
		
		model.addAttribute("fileNameArr", fileNameArr);
		model.addAttribute("doingList",doingList);
		model.addAttribute("doneList",doneList);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("user", user);
		
		System.out.println("[getPreviewList end]");
		return "forward:/event/getPreviewList.jsp";
	}
	
	@RequestMapping(value="getDoneList")
	public String getDoneList(@ModelAttribute("search") Search search, Model model) throws Exception{
		
		System.out.println("[getDoneList start]");
		
		String[] fileArr = null;
		
		List<String[]> fileNameArr = new ArrayList<>();
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		System.out.println("search에 flag잘 담겨와??????????"+search);
		
		Map<String, Object> map = eventService.getPreviewList(search);
		List<Preview> list = (List<Preview>)map.get("list");
		
		List<Preview> previewAll = eventService.getAllPreview();
		
		List<Preview> doneList = new ArrayList<>(); 

		for(Preview previeww: previewAll) {
			if(previeww.getPreviewFlag().equals("2")) {
				doneList.add(previeww);
			}
		} 
		
		for(Preview p: doneList) {
			System.out.println("=======================>done============>"+p);
		}
		System.out.println(doneList.size());

		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		for(Preview preview : list) {
			 fileArr = preview.getPreviewImage().split(",");
			 fileNameArr.add(fileArr);
		}
		
		System.out.println("fileNameArr>>>>>>>>>>>>>>>"+fileNameArr);
		
		model.addAttribute("fileNameArr", fileNameArr);
		model.addAttribute("doneList", doneList);
		model.addAttribute("resultPage", resultPage);
		
		System.out.println("[getDoneList end]");
		
		return "forward:/event/getDonePrev.jsp";
	}
	
	
	@CheckAuth(role="user,admin")
	@RequestMapping(value="getPreview", method=RequestMethod.GET)
	public String getPreview(@RequestParam int previewNo, Model model, HttpSession session) throws Exception{
		
		if(session.getAttribute("user")!=null) {
			User user = (User)session.getAttribute("user");
			model.addAttribute("user", user);
		}
		Preview preview = eventService.getPreviewAd(previewNo);
		
		Movie movie = new Movie();
		movie.setMovieNo(preview.getMovieNo());
		movie = movieService.getMovieByMovieNo(movie);
//		트레일러...youtube API Method 호출 
//		String videoId = getYoutube(movie.getMovieTitle());
//		preview.setTrailer(videoId);
		
		model.addAttribute("preview" , preview);
		model.addAttribute("movie", movie);
		
//		파일업로드가 필요없어졌어
//		String[] fileArr = preview.getPreviewImage().split(",");
//		model.addAttribute("fileArr", fileArr);
		
		
		return "forward:/event/getPreviewAd.jsp";

	}
		
	
	
	//addPartPrev.jsp 응모하기 띄워주는거
	@CheckAuth(role="user,admin")
	@RequestMapping(value="addPartPrev", method=RequestMethod.GET)
	public String addPartPrev(@RequestParam int previewNo, HttpSession session, Model model) throws Exception{
		
		System.out.println("/event/addPartPrev:GET");
		System.out.println("eventController에서 addPartPrev>>>>>>>>>>>previewNo"+previewNo);
		
		Preview preview = eventService.getPreview(previewNo);
		User user = (User)session.getAttribute("user");
		
		String[] fileArr = preview.getPreviewImage().split(",");
		
		model.addAttribute("preview", preview);
		model.addAttribute("user", user);
		model.addAttribute("fileArr", fileArr);
		
		return "forward:/event/addPartPrev.jsp";
	}
	
	
	//응모하기 버튼 눌렀을 시 리얼 데이터 들어가는거
	@RequestMapping(value="addPartPrev", method=RequestMethod.POST)
	public String addPartPrev(@ModelAttribute("participation") Participation participation, Model model) throws Exception{
		
		System.out.println("/event/addPartPrev:POST");
		eventService.addPartPrev(participation);
		participation = eventService.getParticiation(participation.getPartNo());
//		model.addAttribute("participation", participation); 
		return "forward:/event/getPreviewList"; 
	}
	
	
	@RequestMapping(value="deletePreview", method=RequestMethod.POST)
	public String deletePreviewAd(@RequestParam int previewNo) throws Exception{
		System.out.println("/event/deletePreview:POST");
		System.out.println("삭제할 previewNo: " + previewNo);
		eventService.deletePreview(previewNo);
		return "redirect:/event/getListPreviewAd.jsp";
	} 
	

	
	
	
	//getWinnerList
	@RequestMapping(value="getWinnerList", method=RequestMethod.POST)
	public String getWinnerListPost(@RequestParam int previewNo, Model model) throws Exception {
		System.out.println("/event/getWinnerList");
		Map<String, Object> map = eventService.getWinnerList(previewNo);
		Preview preview = eventService.getPreviewAd(previewNo);
		List<Participation> list = (List<Participation>)map.get("list");
		
		//나중에 userServiceImpl 주입받으면 getUser로 유저정보 가져오기
		System.out.println("<<<<<<<getWinnerList>>>>>");
		for(Participation p : list) {
			System.out.println("참여자:::::::"+p.getUserNo());
		}
		
		model.addAttribute("list",list);
		model.addAttribute("preview", preview);
		
		return "forward:/event/getWinnerList.jsp";
	}
	
	
	@RequestMapping(value="addQuizAd", method=RequestMethod.GET)
	public String addQuizAdView() {
		System.out.println("/event/addQuizAd:GET");
		return "forward:/event/addQuizAd.jsp";
	}
	
	
	@RequestMapping(value="addQuizAd", method=RequestMethod.POST)
	public String addQuizAd(@RequestParam Map<String, Object> map, Model model) throws Exception {
		System.out.println("/event/addQuizAd:POST");
		Quiz quiz = new Quiz();
		
		quiz.setQuestion((String)map.get("question"));
		quiz.setOptionFirst((String)map.get("optionFirst"));
		quiz.setOptionSecond((String)map.get("optionSecond"));
		quiz.setOptionThird((String)map.get("optionThird"));
		quiz.setOptionFourth((String)map.get("optionFourth"));
		quiz.setAnswer(Integer.parseInt((String)map.get("answer")));
		quiz.setQuizStartDate(JavaUtil.ymdToTimestamp((String)map.get("quizStartDate")));
		
	
		eventService.addQuizAd(quiz);
		model.addAttribute("quiz", quiz);
		
		return "forward:/event/getQuizAd.jsp";
	}
	
	
	//getQuizListAd
	
	@RequestMapping(value="getQuizListAd")
	public String getQuizListAd(@ModelAttribute("search") Search search, Model model) throws Exception{
		System.out.println("/event/getQuizListAd");
		System.out.println("getQuizListAd의 search>>>>>>>>>>>>>>"+search);
		System.out.println(">>>>>>>>currentPage입니다:"+ search.getCurrentPage());
		//search = new Search();
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = eventService.getQuizListAd(search);
		List<Preview> list = (List<Preview>)map.get("list");
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("resultPage>>>>>>>>>>"+resultPage);
		model.addAttribute("list",list);
		model.addAttribute("resultPage", resultPage);
		
		return "forward:/event/getQuizListAd.jsp";
	}
	
	@CheckAuth(role="user,admin")
	@RequestMapping(value="getQuizList")
	public String getQuizList(@ModelAttribute("search") Search search, HttpSession session ,Model model) throws Exception{
		System.out.println("/event/getQuizList");
		System.out.println("getQuizList의 search>>>>>>>>>>>>>>"+search);
		System.out.println(">>>>>>>>currentPage입니다:"+ search.getCurrentPage());
		
		
		double totalCount = 0;
		double winCount = 0;
		double winRate = 0;
		  
		
		//search = new Search();
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = eventService.getQuizListAd(search);
		List<Quiz> list = (List<Quiz>)map.get("list");
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("resultPage>>>>>>>>>>"+resultPage);
		
		User user = (User)session.getAttribute("user");
		System.out.println(user+">>>>>>>>>>>>>>>>>>>>>>>");
		int userNo = user.getUserNo();
		
		Participation participation = eventService.getQuizRecord(userNo);
		System.out.println(user);
		
		if(participation!=null) {
			 totalCount = participation.getTotalQuizCount();
			 winCount = participation.getWinQuizCount();
			 winRate = (winCount/totalCount)*100;
		}
		
		//참여여부를 알기위해...
				Map<String,Object> partMap = new HashMap<String,Object>();
				List<Quiz> returnList = new ArrayList<Quiz>();
				
		for(Quiz quiz: list) {
			
			partMap.put("userNo", userNo);
			partMap.put("quizNo", quiz.getQuizNo());
			System.out.println("partMap>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+partMap);
			
			
			int partFlag = eventService.checkQuiz(partMap);
			System.out.println("참여했는지???참여했으면1, 아니면0"+ partFlag);
			quiz.setPartFlag(partFlag);
			returnList.add(quiz);
		}
		System.out.println("@@@@@@@@@@@resultPage.getTotalCount()"+resultPage.getTotalCount());
		System.out.println("@@@@@@@@@@@(int)totalCount"+(int)totalCount);
		int leftQuiz= resultPage.getTotalCount()-(int)totalCount;
		System.out.println("파트플래그잘들어갔니????"+returnList);
		model.addAttribute("totalCount", (int)totalCount);
		model.addAttribute("winCount", (int)winCount);
		model.addAttribute("winRate", winRate);
		model.addAttribute("user", user);
		model.addAttribute("list",returnList);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("leftQuiz", leftQuiz);
		
		
		return "forward:/event/getQuizList.jsp";
	}
	
	
	@RequestMapping(value="getQuizAd", method=RequestMethod.GET)
	public String getQuizAd(@ModelAttribute("quiz") Quiz quiz, Model model) throws Exception {
		System.out.println("/event/getQuizAd:GET");
		quiz = eventService.getQuizAd(quiz.getQuizNo());
		model.addAttribute("quiz", quiz);
		return "forward:/event/getQuizAd.jsp";
	}
	
	
	@RequestMapping(value="updateQuizAd", method=RequestMethod.GET)
	public String updateQuizAdView(@RequestParam int quizNo, Model model) throws Exception {
		System.out.println("/event/updateQuizAd:GET");
		System.out.println("quizNo==>"+ quizNo);
		Quiz quiz = eventService.getQuizAd(quizNo);
		model.addAttribute("quiz", quiz);
		return "forward:/event/updateQuizAd.jsp";
	}
	
	
	@RequestMapping(value="updateQuizAd", method=RequestMethod.POST)
	public String updateQuizAd(@RequestParam Map<String, Object> map, Model model) throws Exception {
		System.out.println("/event/updateQuizAd:POST");
		Quiz quiz = new Quiz();
		quiz.setQuizNo(Integer.parseInt((String)map.get("quizNo")));
		quiz.setQuestion((String)map.get("question"));
		quiz.setOptionFirst((String)map.get("optionFirst"));
		quiz.setOptionSecond((String)map.get("optionSecond"));
		quiz.setOptionThird((String)map.get("optionThird"));
		quiz.setOptionFourth((String)map.get("optionFourth"));
		quiz.setAnswer(Integer.parseInt((String)map.get("answer")));
		quiz.setQuizStartDate(JavaUtil.ymdToTimestamp((String)map.get("quizStartDate")));
		
		eventService.updateQuizAd(quiz);
		model.addAttribute("quiz", quiz);
		return "forward:/event/getQuizAd.jsp";
	}

	@RequestMapping(value="addPartQuiz", method=RequestMethod.GET)
	public String addPartQuizView(@RequestParam int quizNo, HttpSession session,  Model model) throws Exception{
		
		System.out.println("/event/addPartQuiz:GET");
		Quiz quiz = eventService.getQuizAd(quizNo);
		System.out.println(">>>>>>>>>>>>>>>>>컨트롤러>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>quiz::::::::::"+quiz);
		
		User user = (User)session.getAttribute("user");
		int userNo = user.getUserNo();
		Participation participation = eventService.getQuizRecord(userNo);
		
		//참여여부를 알기위해...
		Map<String,Object> partMap = new HashMap<String,Object>();
		partMap.put("userNo", userNo);
		partMap.put("quizNo", quiz.getQuizNo());
		System.out.println("partMap>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+partMap);
		
		int partFlag = eventService.checkQuiz(partMap);
		System.out.println("참여했는지???참여했으면1, 아니면0"+ partFlag);
		
		if(participation!=null) {
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>컨트롤러 participation:::"+ participation);
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>컨트롤러>>>>>>>>>user"+user);
		double totalCount = participation.getTotalQuizCount();
		double winCount = participation.getWinQuizCount();
		double winRate = (winCount / totalCount)*100;
		System.out.println("totalCount:"+totalCount+"winCount:"+winCount);
		model.addAttribute("quiz", quiz);
		model.addAttribute("totalCount", (int)totalCount);
		model.addAttribute("winCount", (int)winCount);
		model.addAttribute("winRate", winRate);
		model.addAttribute("user", user);
		model.addAttribute("partFlag", partFlag);
		}else {
			
			model.addAttribute("quiz", quiz);
			model.addAttribute("totalCount", 0);
			model.addAttribute("winCount", 0);
			model.addAttribute("winRate", 0.0);
			model.addAttribute("user", user);
			model.addAttribute("partFlag", partFlag);
		}
		
		
		return "forward:/event/addPartQuiz.jsp";
	}
	
	
	//퀴즈등록
	@RequestMapping(value="addWinQuiz/{quizNo}", method=RequestMethod.GET)
	public String addWinQuiz(@PathVariable(value = "quizNo")int quizNo,  Model model, HttpSession session) throws Exception{
		
		System.out.println("/event/addWinQuiz");
		User user = (User)session.getAttribute("user");
		int userNo = user.getUserNo();
		
		//System.out.println("quizNo::"+participation.getQuizNo());
		//System.out.println("궁금하다고!!!!!!!!!!!!!"+participation.getUserNo());
		Participation participation = new Participation();
		participation.setQuizNo(quizNo);
		participation.setUserNo(userNo);
		eventService.addPartQuiz(participation);
		
		Map<String, Object> updateMap = new HashMap<String,Object>();

		Point point = new Point();
		point.setPointStatus("S2");
		point.setUserNo(userNo);
		point.setPartPoint(5);
		System.out.println("point>>>>>>>>>"+point);

		paymentService.savePoint(point); //포인트 적립
		
//		
		updateMap.put("user", userNo);
		updateMap.put("quizNo", quizNo);
//		
		eventService.updateQuizFlag(updateMap); //퀴즈 정답
//		
		
		model.addAttribute("participation", participation); 
		model.addAttribute("user", user);
		
		return "redirect:/event/getQuizList?userNo="+userNo; 
	}
	
	
	
	
	@RequestMapping(value="addLoseQuiz/{quizNo}", method=RequestMethod.GET)
	public String addLoseQuiz(@PathVariable(value = "quizNo")int quizNo, Model model, HttpSession session) throws Exception{
		
		System.out.println("/event/addLoseQuiz");
		
		User user = (User)session.getAttribute("user");
		int userNo = user.getUserNo();
		
		Participation participation = new Participation();
		participation.setQuizNo(quizNo);
		participation.setUserNo(userNo);
		eventService.addPartQuiz(participation);
		
		Map<String, Object> updateMap = new HashMap<String,Object>();
		
		updateMap.put("user", userNo);
		updateMap.put("quizNo", quizNo);
		
		model.addAttribute("participation", participation); 
		model.addAttribute("user", user);
	
		return "redirect:/event/getQuizList?userNo="+userNo; 
	}

	
	
	@RequestMapping(value="deleteQuizAd", method=RequestMethod.POST)
	public String deleteQuizAd(@ModelAttribute("quiz") Quiz quiz) throws Exception {
		
		System.out.println("/event/deleteQuizAd:POST");
		
		eventService.deleteQuiz(quiz.getQuizNo());
		
		return "redirect:/event/getQuizListAd.jsp";
		
	}
	
	
	
	//Rest를 써버림
	@RequestMapping(value="getApplyList")
	public String getApplyList(@RequestParam int previewNo, Model model) throws Exception{
			
			System.out.println("/event/getApplyList");
			
			Map<String, Object> map = eventService.getApplyList(previewNo);
			List<Participation> list = (List<Participation>)map.get("list");
			
			System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>/event/getApplyList(previewNo)의 list는 ?"+list);
			
			model.addAttribute("list", list);
			
		 return "forward:/event/getApplyList.jsp";
	}
	
	
	@RequestMapping(value="updateWinningFlag")
	public String updateWinningFlag(@RequestParam Map<String, Object> map, Model model) throws Exception{
		
			System.out.println("/event/updateWinningFlag");
			int previewNo = (Integer)map.get("previewNo");
			int userNo = (Integer)map.get("userNo");
	
			System.out.println("updateWinningFlag의previewNo"+previewNo);
			System.out.println("updateWinningFlag의userNo"+userNo);
			
			model.addAttribute("previewNo", previewNo);
			model.addAttribute("userNo", userNo);
			
		 return "forward:/event/getApplyList.jsp";
		 
		 
	}
	
	
	
	//@RequestMapping(value="getWinner")
	public String getWinner(@RequestParam int previewNo) throws Exception{
		
			System.out.println("/event/getWinner");
			randWinner(previewNo);
			return "redirect:/event/getPreviewAd?previewNo="+previewNo;
			
	}
	
	
	
	
	
	
	//(sysdate == 시사회이벤트 시작일자) 애들 플래그를 1로 update시켜준다
	//@Scheduled(cron = "*/10 * * * * *") //매일 12시마다 체크
	public void updateStartPrevFlag() throws Exception{
		
		System.out.println("[updateStartPrevFlag] start.."); 
		
		List<Preview> list = eventService.updateStPrev(); 
		
			for(Preview p: list) {
				System.out.println("["+p.getPreviewName()+"]");
			}
		
		System.out.println("[updateStartPrevFlag] end.."); 
	}
	
	
	
	
	
	
	//(0:시작전, 1:진행중, 2:마감) 추첨하기
	//@Scheduled(cron = "*/10 * * * * *") //매일 12시로 바꾸기
	public void doRandWinner() throws Exception{
		
		System.out.println("[doRandWinner] start..");
		
		List<Preview> list = eventService.getPrepareRand();
		
		//(sysdate == 시사회이벤트 종료일자+1) && (previewFlag가 1) 인 preview  
		System.out.println("[doRandWinner]의 추첨할 대상 list ==? "+list); 
		if(list.size()==0) {
			System.out.println("추첨할 필요 없거든요.........");
			return;
		}
		
		//preview마다 추첨해야하므로 리스트에서 previewNo를 가져온다
		for(Preview p : list) {
			randWinner(p.getPreviewNo());
		}
		
		System.out.println("[doRandWinner] end..");
	}

	
	
	//시사이벤트 기대평 작성
	@RequestMapping(value="addExpectLine")
	public void addExpectLine(Comment comment, HttpSession session) throws Exception {
	
		System.out.println("[addExpectLine] start");
		
		boardService.addComment(comment);
		
		System.out.println("[addExpectLine] end");
		
	}
	
	
	//마이페이지- 내응모목록조회 
	@RequestMapping(value="getPartList")
	public String getPartList(@ModelAttribute("search")Search search, HttpSession session, Model model) throws Exception {
		
		System.out.println("[getPartList] start...");
		
		User user = (User)session.getAttribute("user");
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setUserNo(user.getUserNo());
		Map<String, Object> map = eventService.getPartList(search); 
		
		List<Participation> list = (List<Participation>)map.get("list");
		for(Participation p: list) {
			System.out.println("날짜확인하라~!!"+p.getPartStrDate()); 	
		}
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", list);
		model.addAttribute("user", user);
		model.addAttribute("resultPage", resultPage);
		
		System.out.println("[getPartList] end...");
		
		return "/event/getApplyList.jsp";
	}
	
	
	
	//출첵 페이지로 이동
	@CheckAuth(role="user,admin")
	@RequestMapping(value="addAttendance")
	public String addAttendance(HttpSession session, Model model) throws Exception {
	
		System.out.println("[addAttendance] start");
		User user = (User)session.getAttribute("user");
		
		model.addAttribute("user", user);
		
		System.out.println("[addAttendance] end");
		
		return "/event/addAttendance.jsp";
	}
	
	
	
	//당첨자 추첨하는 메소드(doRandWinner에서 호출된다)
	public void randWinner(int previewNo) throws Exception {

		System.out.println("randWinner() start...");
		
		Map<String, Object> updateMap = new HashMap<String,Object>();


		Map<String,Object> map = eventService.getApplyList(previewNo); //응모자 리스트
		List<Participation> list = (List<Participation>)map.get("list"); //응모자들의 참여VO 리스트
		System.out.println("해당 시사회에  [participation list]" + list);
		
		Preview preview = eventService.getPreviewAd(previewNo); //해당 이벤트의 참여수를 가지고 오기 위함
		int winnerCount = preview.getWinnerCount(); //뽑아야할 당첨자 수 
		System.out.println("해당 시사회에 [뽑아야할 당첨자 수]" + winnerCount);

		List<Integer> applyUserNo = new ArrayList<Integer>(); //응모자 아이디 List를 담을것
		
			for(Participation p: list) { //응모자 아이디 List
				applyUserNo.add((Integer)p.getUserNo()); 
			}
		
		int winner=0;

		ArrayList<Integer> winnerUserNo = new ArrayList<Integer>(); //당첨자 아이디 List를 담을것 
		
		if(applyUserNo.size() < winnerCount) { //뽑을 수보다 덜 지원했다면
			
			System.out.println("[응모자< 당첨자] ==> 모든 응모자가 당첨자");
			
			for(Participation p: list) { //응모자 아이디 List를 winnerUserNo에 넣자
				
				winnerUserNo.add((Integer)p.getUserNo()); 
			}
			
			
		}else if(applyUserNo.size() >= winnerCount) { //더 많이 지원했거나 같다면 (일반적인 경우)
			
			
			while(winnerUserNo.size() < winnerCount) { //당첨자리스트에 담긴 수가 뽑을 사람수보다 적으면 반복해라!
				
				int randomIndex = (int)(Math.random() * applyUserNo.size());
				
				winner = applyUserNo.get(randomIndex);
				
				if(!winnerUserNo.contains(winner)) { //당첨자리스트에 방금 뽑은 애가 들어있지 않은 경우애만
					
					System.out.println("winner??"+ winner);
					winnerUserNo.add(winner); //당첨자리스트에 넣어라
			
				}
				
				System.out.println("winnerUserNo???"+ winnerUserNo);
				
			}
			
		}
		
		System.out.println("winnerUserNo>>>>>>" + winnerUserNo);
		System.out.println("previewNo>>>>>>>" + previewNo);
		
		updateMap.put("userList", winnerUserNo);
		updateMap.put("previewNo", previewNo);

		System.out.println("updateMap>>>>>>>" + updateMap);
		eventService.updateWinningFlag(updateMap);
		
		
		System.out.println("randWinner() end...");
		
	}
	

	//파일 저장하는 메소드
	private String saveFile(MultipartFile file) {
		
		String filePath = "C:\\Users\\user\\git\\MainPJTmmm\\mmm\\WebContent\\resources\\image";
		String saveName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
		File saveFile = new File(filePath, saveName);
		
		try {
			file.transferTo(saveFile);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return saveName;
		
	}
	
	
	public String getYoutube(String movieTitle)throws Exception{
//		유튜브 API에서 search 결과로 주는 videoId를 가져오자
		
		ObjectMapper mapper = new ObjectMapper();
		
//		Youtube API 다녀오기/////////////////////////////////////////////////////////////////////////////////////////////
//		header정보 
		MultiValueMap<String, String> headerMap = new LinkedMultiValueMap<>();
		headerMap.add("Content-Type", MediaType.APPLICATION_JSON_VALUE);
		
//		403 Forbidden..해결이 안된다.
//		headerMap.add("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36");
		this.headers = new HttpEntity<>(headerMap);
		
//		url 및 title 세팅
		
		String part = "&part=snippet";		// snippet으로 해야 response JSON에 영상뿐만 아니라 영상에 대한 정보도 같이 온다
		String q = "&q="+movieTitle.trim()+" 예고편 official";	// 검색어
		String order = "&order=relevance";	// 조회 기준 .... relevance(관련성) default
		String safeSearch = "&safeSearch=moderate";	//제한된 컨텐츠 포함 여부 ... 
		String type = "&type=video";				//검색 결과의 타입..  channel, playlist, video..
		String videoDefinition = "&videoDefinition=high";	// 화질종류.. any, high, standard
		String videoDuration = "&videoDuration=short"; 		// 비디오 길이..
//		String videoType = "&videoType=movie";				// 특정 동영상 유형이라는데 ... 안되면 주석처리하자 ^^^^^^
		
//		API url에 파라미터추가 
		String urlYoutube = urlGoogleSearch+part+q+order+safeSearch+type+videoDefinition+videoDuration;
		System.out.println("-------------------urlYoutube"+ urlYoutube);
		
//		google API 다녀오자
		ResponseEntity<String> responseEntity = template.exchange(urlYoutube, HttpMethod.GET, headers, String.class);
//		System.out.println("-----------------------responseEntity"+ responseEntity);
		
//		response Data에서 video ID 뽑기..
		HashMap<String, Object> searchResult = mapper.readValue(responseEntity.getBody(), new TypeReference<HashMap<String, Object>>() {});
//		System.out.println("---------------searchResult.get(\"items\") : " + searchResult.get("items"));
		List<Object> items = (List<Object>) searchResult.get("items");
//		System.out.println("----------------items[0]"+ items.get(0));
		Map<String, Object> items1 =  (Map<String, Object>) items.get(0);
//		System.out.println("---------------------idMap   "+items1);
		Map<String, String> idMap = (Map<String, String>) items1.get("id");
		String videoId = idMap.get("videoId");
		System.out.println("--------------videoId  : " + videoId);
		
		return  videoId;
	}
	
}