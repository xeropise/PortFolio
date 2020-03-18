package com.mmm.web.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mmm.common.CheckAuth;
import com.mmm.common.Search;
import com.mmm.service.board.BoardService;
import com.mmm.service.datetime.DateTimeService;
import com.mmm.service.domain.Comment;
import com.mmm.service.domain.User;
import com.mmm.service.movie.MovieService;
import com.mmm.service.payment.PaymentService;
import com.mmm.service.user.UserService;

//==>마이페이지 Controller
@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	///Field 
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method 구현 하지않음
	
	@Autowired
	private PaymentService paymentService;
	
	
	@Autowired
	private DateTimeService dateTimeService;
	
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private BoardService boardService;
	
	///Constructor
	public MypageController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@CheckAuth(role="user,admin,unUser")
	@RequestMapping(value ="mypage")
	public String mypage(@ModelAttribute("condition") String condition, Model model) throws Exception{
		
		System.out.println("/mypage/mypage : GET ");
		
		System.out.println("condition  값은 ?+ \n :"+condition);
		model.addAttribute("condition",condition);
		return "forward:/mypage/mypage.jsp";
	}
	
	
	@RequestMapping(value ="mypageUser", method = RequestMethod.GET)
	public String mypageUser(Model model,HttpSession session) throws Exception{
		
		System.out.println("/mypage/mypageUser : GET ");
		
		User user = (User)session.getAttribute("user");
		
		System.out.println("세션에서 가져온 acc 포인트"+user.getAccPoint()+"세션에서 가져온 total 포인트"+user.getTotalPoint());
		
		user.setTotalPoint(paymentService.getTotalPoint(user.getUserNo()));
		user.setAccPoint(paymentService.getAccPoint(user.getUserNo()));
		userService.updateUser(user);
		
		System.out.println("업데이트 acc 포인트"+user.getAccPoint()+"업데이트 total 포인트"+user.getTotalPoint());
		
		session.setAttribute("user", userService.getUser(user.getUserNo()));
		model.addAttribute("getTheaterList",dateTimeService.getTheaterList(new Search()));
		model.addAttribute("mySeeMovieCnt", mySeeMovieCnt(user.getPhone()));
		model.addAttribute("wishMovieCnt", wishMovieCnt(user.getUserNo()));
		model.addAttribute("commentCnt", commentCnt(user.getUserId()));
		
		return "forward:/mypage/mypageUser.jsp";
	}
	
	@CheckAuth(role="user,admin")
	@RequestMapping(value ="mySeenMovieList", method = RequestMethod.GET)
	public String myMovieList() throws Exception{
		
		System.out.println("/mypage/mySeenMovieList : GET ");
		
		return "forward:/mypage/mySeenMovieList.jsp";
	}
	
	@CheckAuth(role="user,admin")
	@RequestMapping(value ="wishList", method = RequestMethod.GET)
	public String wishList() throws Exception{
		
		System.out.println("/mypage/wishList : GET ");
		
		return "forward:/mypage/wishList.jsp";
	}
	
	// 한줄평 개수 가져오기
	public int commentCnt(String userId) {
		
		int commentCnt = 0;
		
		try {
			Search search = new Search();
			search.setStartRowNum(1);
			search.setCurrentPage(1);
			search.setPageSize(10);
			search.setCommentType(3);
			search.setUserId(userId);
		
			Map<String, Object> resultMap = boardService.getCommentList(search);
			
			System.out.println("commentCnt : "+resultMap);
			
			if(resultMap != null) {
				List<Comment> list = (List<Comment>) resultMap.get("list");
				commentCnt = (int)resultMap.get("totalCount");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		return commentCnt;
		
	}
	
	// 위시리스트 개수 가져오기
	public int wishMovieCnt(int userNo) {
		
		int wishMovieCnt = 0;
		
		try {
			Search search = new Search();
			search.setStartRowNum(1);
			search.setCurrentPage(1);
			search.setPageSize(10);
			
			HashMap<String, Object> inputData = new HashMap<String, Object>();
			inputData.put("userNo", userNo);
			inputData.put("search", search);
			
			HashMap<String, Object> result = movieService.getWishMovieList(inputData);
			
			System.out.println(result);
			
			if(result != null) {
				wishMovieCnt = (int) result.get("totalCnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		return wishMovieCnt;
	}
	
	// 내가 본 영화 개수 가져오기
	public int mySeeMovieCnt(String phone) {
		
		int mySeeMovieCnt = 0;
		
		try {		
			mySeeMovieCnt = userService.getSeenMovieCnt(phone);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mySeeMovieCnt;
		
	}
	
	@CheckAuth(role="user,admin")
	@RequestMapping(value ="mySeenMovie", method = RequestMethod.GET)
	public String mySeenMovie(Model model) throws Exception{
		System.out.println("/mypage/mySeenMovie : GET ");
		return "forward:/mypage/mySeenMovieList.jsp";
	}

}
