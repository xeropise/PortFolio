package com.mmm.web.event;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mmm.common.CheckAuth;
import com.mmm.common.JavaUtil;
import com.mmm.common.Page;
import com.mmm.common.Search;
import com.mmm.service.board.BoardService;
import com.mmm.service.domain.Blind;
import com.mmm.service.domain.Comment;
import com.mmm.service.domain.Participation;
import com.mmm.service.domain.Payment;
import com.mmm.service.domain.Point;
import com.mmm.service.domain.Preview;
import com.mmm.service.domain.Quiz;
import com.mmm.service.domain.User;
import com.mmm.service.event.EventService;
import com.mmm.service.payment.PaymentService;
import com.mmm.service.user.UserService;

@RestController
@RequestMapping("/event/*")
public class EventRestController {

	@Autowired
	@Qualifier("eventServiceImpl")
	private EventService eventService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	public EventRestController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	
	
//응모자 리스트 가져오기	
	@RequestMapping(value="json/getApplyList/{previewNo}", method=RequestMethod.GET)
	public Map<String, Object> getApplyList(@PathVariable int previewNo) throws Exception {
		
		System.out.println("/event/json/getApplyList : GET");
		
		Map<String,Object> map = eventService.getApplyList(previewNo);
		List<Participation> list = (List<Participation>)map.get("list");
		System.out.println("getApplyList 의 list" + list);

//		이거 나중에 userNo로 바뀌면 getUser(userNo)해서 userName 가져와서 list에 담자
//			System.out.println("userName::::" + userService.getUser(userId));
//		
		
		for(Participation p : list) {
			System.out.println(p.getPartDate());
			if(p.getPartStrDate() instanceof String) {
				System.out.println("partStrDate는 스트링");
			}else if(p.getPartDate() instanceof Timestamp ) {
				System.out.println("partDate는 타임스탬프 이시다 ");
			}
			System.out.println(p.getPartStrDate());

		}
		
		Map<String,Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", list);
		
		return returnMap;
	}
	
	
	
	
	
//당첨자 리스트 가져오기
	@RequestMapping(value="json/getWinnerList/{previewNo}", method=RequestMethod.GET)
	public Map<String, Object> getWinnerList(@PathVariable int previewNo) throws Exception {
		
		System.out.println("/event/json/getWinnerList : GET");
		
		Map<String,Object> map = eventService.getWinnerList(previewNo);
		
		List<Participation> list = (List<Participation>)map.get("list");
		List<User> uList = new ArrayList<User>();
		
		System.out.println("getWinnerList 의 list" + list);
		
		
		for(Participation p : list) {
			System.out.println(p.getPartDate());
			if(p.getPartStrDate() instanceof String) {
				System.out.println("partStrDate는 스트링");
			}else if(p.getPartDate() instanceof Timestamp ) {
				System.out.println("partDate는 타임스탬프 이시다 ");
			}
			System.out.println(p.getPartStrDate());

		
			User user = userService.getUser(p.getUserNo());
			uList.add(user);
		}
		
		Map<String,Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", list);
		returnMap.put("uList", uList);
		
		return returnMap;
	}
	
	
	
	
	
//	@RequestMapping("json/deleteQuiz")
//	public int deleteQuiz(@RequestParam(value = "chbox[]") List<String> chArr, Quiz quiz) throws Exception {
//		 
//		System.out.println("chArrrrrrrrr"+chArr);
//		 
//		 int result = 0;
//		 int quizNo = 0;
//		 
//		  if(chArr!=null) {
//		  
//		   for(String i : chArr) {   
//		   quizNo = Integer.parseInt(i);
//		   System.out.println("삭제할 놈!!" + quizNo);
//		   eventService.deleteQuiz(quizNo);
//		  }   
//		  result = 1;
//		  }
//		  
//	
//		  return result;  
//	
//		}
//	
//	
//	
	
	
//	@RequestMapping(value="json/getPreview", method=RequestMethod.GET)
//	public Map<String,Object> getPreview(@RequestBody Preview preview) throws Exception{
//		
//		System.out.println("/event/json/getPreview : GET");
//		Map<String, Object> map = new HashMap<String,Object>();
//		
//		preview = eventService.getPreview(preview.getPreviewNo());
//		String[] fileArr = preview.getPreviewImage().split(",");
//		
//		map.put("preview", preview);
//		map.put("fileArr", fileArr);
//		
//		return map;
//	}
//	
//	
//	
	

	
//시사회 이벤트 참여	
	@RequestMapping(value="json/checkPart")
	public Map<String, Object> checkPart(@RequestBody Map<String, Object> map) throws Exception{
		
		System.out.println("eventRestController도착!!!");
		
		String userNo= (String)map.get("userNo");
		System.out.println("checkPart의 userNo"+userNo);
		
		if(map.get("previewNo")!=null) {
			int previewNo =  Integer.parseInt((String)map.get("previewNo"));
			System.out.println("checkPart의 previewNo"+previewNo);
			map.put("previewNo", previewNo);
		}else if(map.get("quizNo")!=null){
			int quizNo =  Integer.parseInt((String)map.get("quizNo"));
			System.out.println("checkPart의 quizNo"+quizNo);
			map.put("quizNo", quizNo);

		}
		
		map.put("userNo", userNo);
		System.out.println(map);
		
		int result = (int)eventService.checkPart(map);
		System.out.println("result"+result);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", result);
		
		return returnMap;
		
	}
	
	
	
//퀴즈참여하기	
	@RequestMapping(value="json/checkQuiz")
	public Map<String, Object> checkQuiz(@RequestBody Map<String, Object> map) throws Exception{
		
		System.out.println("eventRestController도착!!!");
		String userNo= (String)map.get("userNo");
		System.out.println("checkQuiz의 userNo"+userNo);
		int choice = Integer.parseInt((String)map.get("choice"));
		int quizNo= Integer.parseInt((String)map.get("quizNo"));
	    System.out.println("###########################"+quizNo);
	    
	    
		map.put("quizNo", quizNo);     //quizNo를 map에 넣는다
		map.put("userNo", userNo);		//참여자를  map에 넣는다
		map.put("choice", choice);       //선택한걸 map에 넣는다
		System.out.println(map);
		
		
		
		int partCnt = (int)eventService.checkQuiz(map);
		int answer = eventService.getQuizAd(quizNo).getAnswer();
		int result = 0;
		
		if(partCnt > 0) { //이미 참여했다?
			result = 2;
		}else if(partCnt == 0){	//아직 참여한 적 없다
			if(answer==choice) { result = 0;} //정답이라면?--> 포인트를...적립하자
			else if(answer!=choice) {result = 1;} //다르다면?
		}
		
		System.out.println("result==>"+result);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", result);
		returnMap.put("partCnt", partCnt);
		
		return returnMap;
		
	}

	
	
//한줄평 등록하기	
	@CheckAuth(role="user,admin")
	@RequestMapping(value="json/addExpectLine")
	public void addExpectLine(@RequestBody Map<String, Object> map) throws Exception {
		
		System.out.println("json/addExpectLine도착");
		String userId = (String)map.get("userId");
		int articleNo = Integer.parseInt((String)map.get("articleNo"));
		int commentType = Integer.parseInt((String)map.get("commentType"));
		String commentContent = (String)map.get("commentContent");
		
		Comment comment = new Comment();
		comment.setUserId(userId);
		comment.setArticleNo(articleNo);
		comment.setCommentType(commentType);
		comment.setCommentContent(commentContent);
		
		boardService.addComment(comment);
		
	}
	
	
	

//기대평 블라인드 처리하기
	@RequestMapping(value="json/addExpectLineBlind")
	public void addExpectLineBlind(@RequestBody Map<String, Object> map) throws Exception {
		
		System.out.println("=========================>json/addExpectLineBlind start");
		int blindReason = Integer.parseInt((String)map.get("blindReason"));
		int commentNo = Integer.parseInt((String)map.get("commentNo")); 
		
		Blind blind = new Blind();
		blind.setBlindReason(blindReason);
		blind.setCommentNo(commentNo);
		
		boardService.addCommentBlind(blind);
		
		System.out.println("=========================>json/addExpectLineBlind end");
	}
	
	
	
	

//시사회 기대평 리스트 가져오기	
	@RequestMapping(value = "json/listExpectLine")
	public Map<String, Object> listExpectLine(@RequestBody Map<String, Object> map) throws Exception {

		System.out.println("/event/json/listExpectLine : GET");
		
		int currentPage = Integer.parseInt((String)map.get("currentPage"));
		int commentType = Integer.parseInt((String)map.get("commentType"));
		int parent = Integer.parseInt((String)map.get("parent"));
		System.out.println("[[[[[[[[[[[currentPage]]]]]]]]]]]]]]]]"+currentPage);
		Search search = new Search();
		if (currentPage == 0) {
			search.setCurrentPage(1);
		}
		search.setCurrentPage(currentPage);
		search.setPageSize(pageSize);
		search.setCommentType(commentType);
		search.setParent(parent);
		
		Map<String, Object> cmtResultMap = boardService.getCommentList(search);
		List<Comment> list = (List<Comment>)cmtResultMap.get("list");
		
		for(Comment cmt: list) {
			cmt.setCommentDate(JavaUtil.convertDateFormat(cmt.getCommentDate()));
		}
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) cmtResultMap.get("totalCount")).intValue(), pageUnit,
				pageSize);
		
		System.out.println(resultPage);

		Map<String, Object> returnMap = new HashMap<String, Object>();

		returnMap.put("list", list);
		returnMap.put("search", search);
		returnMap.put("resultPage", resultPage);
		
		
		return returnMap;
	}
	

	
	
//출첵하기 
	@RequestMapping(value="json/addAttendance")
	public int addAttendance(@RequestBody Map<String, Object> map) throws Exception {
		System.out.println("/event/json/addAttendance");
		
		int userNo = Integer.parseInt((String)map.get("userNo"));
		String pointStatus = (String)map.get("pointStatus");
		int partPoint = Integer.parseInt((String)map.get("partPoint"));
		
		Map<String, Object> returnMap = new HashMap<String,Object>();
		
		int attendanceCnt = paymentService.checkAttedance(userNo);
		System.out.println("[[[[[[attendanceCnt]]]]]]" + attendanceCnt);
		
		if(attendanceCnt==0) {
			System.out.println("출첵할수이써");
			Point point = new Point();
			
			point.setUserNo(userNo);
			point.setPointStatus(pointStatus);
			point.setPartPoint(partPoint);
			
			paymentService.savePoint(point);
		}else if(attendanceCnt==1) {
			System.out.println("출첵할수업써");
		}
		
		return attendanceCnt;
	}
	
	
	//출첵기록 가져오기 
		@RequestMapping(value="json/getAttendanceRecord")
		public List<Point> getAttendanceRecord(HttpSession session) throws Exception {
			
			User user = (User)session.getAttribute("user");
			int userNo = user.getUserNo();
			
			Map<String, Object> returnMap = new HashMap<String,Object>();
			List<Point> checkList = paymentService.checkList(userNo);
			System.out.println("pointList========>"+checkList);
			
			List returnList = new ArrayList();
			
			for(Point p : checkList) {
				Map map = new HashMap();
				
				map.put("title", "출첵완료");
				String startDate = JavaUtil.convertDateFormat(p.getPointDate());
//				String startDate = new SimpleDateFormat("yyyy-MM-dd").format(p.getPointDate());
				map.put("start",startDate);
				map.put("end",startDate);
				map.put("allday","allday");
//				map.put("color","#ffedad");
//				map.put("imageurl", "../resources/image/goodStamp.jpg");
				returnList.add(map);
			}
			
			returnMap.put("checkList",checkList);
			
			
			return returnList;
		}	
		
		@RequestMapping(value="json/getPreviewInfo")
		public List<Preview> getPreviwInfo() throws Exception{
		
			List<Preview> list = eventService.getAllPreview();
			List<Preview> returnList = new ArrayList<Preview>();
			
			for(Preview p: list) {
				
				if(p.getPreviewFlag().equals("1")) {
					//System.out.println("진행중");
					returnList.add(p);
				}
			}
			
			return returnList;
		}
}
