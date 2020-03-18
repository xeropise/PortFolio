package com.mmm.web.customer;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.mmm.common.CheckAuth;
import com.mmm.common.JavaUtil;
import com.mmm.common.Page;
import com.mmm.common.Search;
import com.mmm.service.board.BoardService;
import com.mmm.service.domain.Article;
import com.mmm.service.domain.Preview;
import com.mmm.service.domain.User;
import com.mmm.service.user.UserService;

@Controller
@RequestMapping("/customer/*")
public class CustomerController {
	
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public CustomerController() {}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	
	
	//공지사항===========================================================================
	
	@RequestMapping(value="addNoticeAd", method=RequestMethod.GET)
	public String getAddNoticeAd(HttpSession session) {
		System.out.println("/customer/addNoticeAd : GET");
		User user = (User)session.getAttribute("user");
		System.out.println("session user를 찍어본다.." + user);
		return "forward:/customer/addNoticeAd.jsp";
	}
	
	
	@RequestMapping(value="addNoticeAd", method=RequestMethod.POST)
	public String PostAddNoticeAd(@ModelAttribute("Article") Article article, HttpSession session, Model model) throws Exception {
		
		System.out.println("/customer/addNoticeAd : POST");
		
		User user = (User)session.getAttribute("user"); 
		article.setUserId(user.getUserId()); //공지사항은 어드민이 글쓴이
		article.setArticleType(2); // 공지사항
		System.out.println("addNoticeAd에서 article>>" + article);
		boardService.addArtice(article);
		
		model.addAttribute("article", article);
		
		return "forward:/customer/getNotice.jsp";
	}
	
	@RequestMapping(value="deleteNotice", method=RequestMethod.GET)
	public String deleteNotice(@RequestParam int articleNo, HttpSession session, Model model) throws Exception {
		
		System.out.println("/customer/deleteContact : GET");
		
		User user = (User)session.getAttribute("user"); 
		
		model.addAttribute("user", user);
		System.out.println("삭제할 글번호????????????" + articleNo);
		boardService.deleteArticle(articleNo); 
		//List위한 처리
		Search search = new Search();
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setArticleType(2);
		
		// 1:일대일문의 2:공지사항 3:자주찾는질문 4:리뷰
		Map<String, Object> map = boardService.getArticleList(search);
		List<Article> list = (List<Article>)map.get("list");
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		for(Article article2:list) {
		 String date2 = JavaUtil.convertDateFormat(article2.getArticleDate());	
		 System.out.println(date2);
		 article2.setArticleDate(date2);
		}
		
		System.out.println(list);
		System.out.println("resultPage>>>>>>>>>>>>>>>>>>>>>>>>>"+resultPage);
		model.addAttribute("list",list);
		model.addAttribute("resultPage", resultPage);
		return "forward:/customer/getNoticeList.jsp";
	}
	
	
	@RequestMapping(value="getNotice", method=RequestMethod.GET)
	public String getNotice(@RequestParam int articleNo, HttpSession session, Model model) throws Exception {
		
		System.out.println("/customer/getNotice : GET");
		User user = (User)session.getAttribute("user");
		
		System.out.println("[getNotice] session user >>" + user);
		Article article = boardService.getArticle(articleNo);
		
		String date = JavaUtil.convertDateFormat(article.getArticleDate());	
		System.out.println(date);
		article.setArticleDate(date);
		
		
		model.addAttribute("article", article);
		
		return "forward:/customer/getNotice.jsp";
	}
	
	
	@RequestMapping(value="getNoticeList")
	public String getNoticeList(@ModelAttribute("search") Search search, Model model) throws Exception {
		
		System.out.println("/customer/getNoticeList:GET");

		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setArticleType(2);
		
		
		
		System.out.println("sssssssssssssseeeeeeeeeeeeeeeeaaaaaaaaaaaaaaaaarrrrrrrrrrch"+search);
		
		// 1:일대일문의 2:공지사항 3:자주찾는질문 4:리뷰
		Map<String, Object> map = boardService.getArticleList(search);
		List<Article> list = (List<Article>)map.get("list");
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		for(Article article:list) {
		 String date = JavaUtil.convertDateFormat(article.getArticleDate());	
		 System.out.println(date);
		 article.setArticleDate(date);
		}
		
		System.out.println(list);
		System.out.println("resultPage>>>>>>>>>>>>>>>>>>>>>>>>>"+resultPage);
		model.addAttribute("list",list);
		model.addAttribute("resultPage", resultPage);
		
		return "forward:/customer/getNoticeList.jsp";
	}
	
	//===========================================================================공지사항 끝
	
	//일대일문의===========================================================================
	
	@CheckAuth(role="user,admin")
	@RequestMapping(value="addContact", method=RequestMethod.GET)
	public String getAddContact(HttpSession session, Model model) {
		System.out.println("/customer/addContactAd : GET");
		User user = (User)session.getAttribute("user");
		System.out.println("session user를 찍어본다.." + user);
		model.addAttribute("user", user);
		
		return "forward:/customer/addContact.jsp";
	}
	
	
	
	@RequestMapping(value="addContact", method=RequestMethod.POST)
	public String PostAddContact(@ModelAttribute("Article") Article article, HttpSession session, Model model) throws Exception {
		
		System.out.println("/customer/addContact : POST");
		
		User user = (User)session.getAttribute("user"); 
		article.setUserId(user.getUserId()); 
		article.setArticleType(1); // 
		System.out.println("addContact에서 article>>" + article);
		boardService.addArtice(article);
	
		System.out.println("아티클 넘버가 찍히냐!!!!!addContact에서 article>>" + article);
		
		Article returnArticle = boardService.getArticle(article.getArticleNo());
		
		returnArticle.setArticleDate(JavaUtil.convertDateFormat(returnArticle.getArticleDate()));
		String writerId = article.getUserId();
		User writer = userService.getUserId(writerId);
		
		model.addAttribute("article", returnArticle);
		model.addAttribute("writer", writer);
		
		return "forward:/customer/getContact.jsp";
	}
	
	
	@RequestMapping(value="addReContact", method=RequestMethod.POST)
	public String PostAddReContact(@ModelAttribute("Article") Article article, HttpSession session, Model model) throws Exception {
		
		System.out.println("/customer/addReContact : POST");
		System.out.println("/도오오오오오착##################################");
		
		int supArticleNo = article.getSupArticleNo();
		System.out.println("supArtNo????????????????????"+supArticleNo);
		
		User user = (User)session.getAttribute("user"); 
		article.setUserId(user.getUserId()); 
		article.setArticleType(5);  //articleType 5 => 1:1문의글의 답변 , articleType 1 => 1:1문의글의 질문
	
		Article supArticle = boardService.getArticle(supArticleNo);
        supArticle.setArticleDate(JavaUtil.convertDateFormat(supArticle.getArticleDate()));	
		supArticle.setQnaStatus(1);
		boardService.updateArticle(supArticle);
		
		
		System.out.println("addReContact에서 article>>" + article);
		boardService.addArtice(article);
		
		User writer =userService.getUserId(supArticle.getUserId());
		
				model.addAttribute("article", supArticle);
				System.out.println("슈퍼아티클.....#####################333"+ supArticle);
				model.addAttribute("writer", writer);
				System.out.println("글쓴이.....#####################333"+ writer);
				model.addAttribute("reArticle", article);
				System.out.println("답변아티클.....#####################333"+ article);
				
		
		return "forward:/customer/getContact.jsp";
	}
	
	
	@RequestMapping(value="deleteContact", method=RequestMethod.GET)
	public String deleteContact(@RequestParam int articleNo, HttpSession session, Model model) throws Exception {
		
		System.out.println("/customer/deleteContact : GET");
		
		User user = (User)session.getAttribute("user"); 
		
		model.addAttribute("user", user);
		System.out.println("삭제할 글번호????????????" + articleNo);
		boardService.deleteArticle(articleNo); 
		//List위한 처리
		Search search = new Search();
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setArticleType(1);
		
		// 1:일대일문의 2:공지사항 3:자주찾는질문 4:리뷰
		Map<String, Object> map = boardService.getArticleList(search);
		List<Article> list = (List<Article>)map.get("list");
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		for(Article article2:list) {
		 String date2 = JavaUtil.convertDateFormat(article2.getArticleDate());	
		 System.out.println(date2);
		 article2.setArticleDate(date2);
		}
		
		System.out.println(list);
		System.out.println("resultPage>>>>>>>>>>>>>>>>>>>>>>>>>"+resultPage);
		model.addAttribute("list",list);
		model.addAttribute("resultPage", resultPage);
		return "forward:/mypage/mypage?condition=10";
	}
	
	@RequestMapping(value="getContact", method=RequestMethod.GET)
	public String getContact(@RequestParam int articleNo, HttpSession session, Model model) throws Exception {
		
		System.out.println("/customer/getContact : GET");
		User user = (User)session.getAttribute("user");
		
		System.out.println("[getContact] session user >>" + user);
		Article article = boardService.getArticle(articleNo);
		
		String writerId = article.getUserId();
		User writer = userService.getUserId(writerId);
		
		String date = JavaUtil.convertDateFormat(article.getArticleDate());	 //질문글 등록일시 포맷 바꾸기
		System.out.println(date);
		article.setArticleDate(date);
		
		System.out.println(">>>>>>>>>article"+article);
		
		Article reArticle = boardService.getReply(article.getArticleNo()); 	//답변글 가져오기
	
		if(reArticle!=null) {
			String reDate2 = JavaUtil.convertDateFormat(reArticle.getArticleDate()); //답변글 등록일시 포맷 바꾸기
			reArticle.setArticleDate(reDate2);
			System.out.println("답변 글 !!!!!!!!!!!!!!!!!!!!!!!!!!>>>>>>"+reArticle);
			model.addAttribute("reArticle", reArticle);
		}
		
		model.addAttribute("article", article);
		model.addAttribute("writer", writer);
		model.addAttribute("user",user);
		
		return "forward:/customer/getContact.jsp";
	}
	
	
	@RequestMapping(value="getContactList")
	public String getContactList(@ModelAttribute("search") Search search, Model model, HttpSession session) throws Exception {
		
		User user = (User)session.getAttribute("user");
		String returnPage = "";
		System.out.println("/customer/getContactList");

		
		System.out.println("search>>>>>>>>>>>>>>>>>>"+search);
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setArticleType(1);
		
		if(!user.getUserId().equals("admin")) {   //admin이 아니면 search조건에 userId를 set해준다
			search.setUserId(user.getUserId());	
			returnPage = "forward:/customer/getContactList.jsp";   //나의 문의내역 페이지로 이동한다
		}else {
			returnPage = "forward:/customer/getContactListAd.jsp";    //관리자 문의내역 페이지로 이동한다
		}
		
		System.out.println("search>>>>>>>>>>>>>>>>>>>>>>에 userId찍히냐?"+search);
		
		
		Map<String, Object> map = boardService.getArticleList(search);
		List<Article> list = (List<Article>)map.get("list");
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		for(Article article:list) {
		 String date = JavaUtil.convertDateFormat(article.getArticleDate());	
		 System.out.println(date);
		 article.setArticleDate(date);
		}
		
		System.out.println(list);
		System.out.println("resultPage>>>>>>>>>>>>>>>>>>>>>>>>>"+resultPage);
		model.addAttribute("list",list);
		model.addAttribute("resultPage", resultPage);
		
		return returnPage;
	}
	
	//===========================================================================일대일문의 끝
	//자주찾는질문===========================================================================

	@RequestMapping(value="addAskAd", method=RequestMethod.GET)
	public String getAddAskAd(HttpSession session) {
		System.out.println("/customer/addAskAd : GET");
		User user = (User)session.getAttribute("user");
		System.out.println("session user를 찍어본다.." + user);
		return "forward:/customer/addAskAd.jsp";
	}
	
	
	
	@RequestMapping(value="addAskAd", method=RequestMethod.POST)
	public String PostAddAskAd(@ModelAttribute("Article") Article article, HttpSession session, Model model) throws Exception {
		
		System.out.println("/customer/addNoticeAd : POST");
		
		User user = (User)session.getAttribute("user"); 
		article.setUserId(user.getUserId()); //공지사항은 어드민이 글쓴이
		article.setArticleType(3); // 
		System.out.println("addNoticeAd에서 article>>" + article);
		boardService.addArtice(article);
		
		model.addAttribute("article", article);
		
		return "forward:/customer/getAsk.jsp";
	}
	
	@RequestMapping(value="deleteAsk", method=RequestMethod.GET)
	public String deleteAsk(@RequestParam int articleNo, HttpSession session, Model model) throws Exception {
		
		System.out.println("/customer/deleteAsk : GET");
		
		User user = (User)session.getAttribute("user"); 
		
		model.addAttribute("user", user);
		System.out.println("삭제할 글번호????????????" + articleNo);
		boardService.deleteArticle(articleNo); 
		//List위한 처리
		Search search = new Search();
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setArticleType(3);
		
		// 1:일대일문의 2:공지사항 3:자주찾는질문 4:리뷰
		Map<String, Object> map = boardService.getArticleList(search);
		List<Article> list = (List<Article>)map.get("list");
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		for(Article article2:list) {
		 String date2 = JavaUtil.convertDateFormat(article2.getArticleDate());	
		 System.out.println(date2);
		 article2.setArticleDate(date2);
		}
		
		System.out.println(list);
		System.out.println("resultPage>>>>>>>>>>>>>>>>>>>>>>>>>"+resultPage);
		model.addAttribute("list",list);
		model.addAttribute("resultPage", resultPage);
		return "forward:/customer/getAskList.jsp";
	}
	
	@RequestMapping(value="getAsk", method=RequestMethod.GET)
	public String getAsk(@RequestParam int articleNo, HttpSession session, Model model) throws Exception {
		
		System.out.println("/customer/getAsk : GET");
		User user = (User)session.getAttribute("user");
		
		System.out.println("[getAsk] session user >>" + user);
		Article article = boardService.getArticle(articleNo);
		
		String date = JavaUtil.convertDateFormat(article.getArticleDate());	
		System.out.println(date);
		article.setArticleDate(date);
		
		model.addAttribute("article", article);
		
		return "forward:/customer/getAsk.jsp";
	}
	
	
	@RequestMapping(value="getAskList")
	public String getAskList(@ModelAttribute("search") Search search, Model model) throws Exception {
		
		System.out.println("/customer/getAskList");

		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setArticleType(3);
		
		// 1:일대일문의 2:공지사항 3:자주찾는질문 4:리뷰
		Map<String, Object> map = boardService.getArticleList(search);
		List<Article> list = (List<Article>)map.get("list");
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		for(Article article:list) {
		 String date = JavaUtil.convertDateFormat(article.getArticleDate());	
		 System.out.println(date);
		 article.setArticleDate(date);
		}
		
		System.out.println(list);
		System.out.println("resultPage>>>>>>>>>>>>>>>>>>>>>>>>>"+resultPage);
		model.addAttribute("list",list);
		model.addAttribute("resultPage", resultPage);
		
		return "forward:/customer/getAskList.jsp";
	}
	
	//==========================================================================자주찾는질문 끝

}
