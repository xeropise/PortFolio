package com.mmm.web.customer;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.mmm.common.Page;
import com.mmm.common.Search;
import com.mmm.service.board.BoardService;
import com.mmm.service.domain.Article;
import com.mmm.service.domain.Quiz;
import com.mmm.service.domain.User;

@RestController
@RequestMapping("/customer/*")
public class CustomerRestController {

	

	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	

	public CustomerRestController(){
		System.out.println(this.getClass());
	}
	

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	@RequestMapping(value="json/uploadImage")
	public String uploadImage(@RequestParam("file") MultipartFile file) {
			
		String fileName="";
		String url="";
		
		try {
			
			fileName = boardService.saveImage(file);
			
			url = "C:\\Users\\user\\git\\MainPJTmmm\\mmm\\WebContent\\resources\\image" + fileName;
			
		}catch(Exception e) {
				e.printStackTrace();
			}
		
		return fileName;
	}
	
	
	@RequestMapping(value="json/getAskList", method=RequestMethod.POST)
	public Map<String,Object> getAskList(@RequestBody Map<String, Object> map, HttpSession session) throws Exception {
		
		System.out.println("customer/json/getAskList");
		User user = (User)session.getAttribute("user");
		
		Search search = new Search();
		if((boolean)map.get("currentPage").equals("0")) {
			search.setCurrentPage(1);
		}else {
			search.setCurrentPage(Integer.parseInt((String)map.get("currentPage")));
		}
		
		search.setCategory(Integer.parseInt((String)map.get("category"))); 
		search.setPageSize(pageSize);
		search.setArticleType(3);
		
		map =boardService.getArticleList(search);
		List<Article> list =  (List<Article>)map.get("list");
		
		Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		map.put("askList", list);
		map.put("resultPage", resultPage);
		map.put("search", search);
		
		return map;
	}
	
	@RequestMapping(value="json/getAsk", method=RequestMethod.POST)
	public Map<String,Object> getAsk(@RequestBody Map<String, Object> map, HttpSession session) throws Exception {
		
		System.out.println("customer/json/getAsk");
		User user = (User)session.getAttribute("user");
		
		int articleNo = Integer.parseInt((String)map.get("articleNo"));
		System.out.println("restController에서의 articleNo====>>>>>"+articleNo);
		Article article = boardService.getArticle(articleNo);
		System.out.println("restController에서의 article====>>>>>"+article);
		
		
		map.put("article", article);
		return map;
		
	}
	

	@RequestMapping("json/deleteContact")
	public int deleteQuiz(@RequestParam(value = "chbox[]") List<String> chArr, Quiz quiz) throws Exception {
		 
		System.out.println("chArrrrrrrrr"+chArr);
		 
		 int result = 0;
		 int articleNo = 0;
		 
//		 quiz.setQuizNo(quizNo);
		  if(chArr!=null) {
		  
		   for(String i : chArr) {   
		   articleNo = Integer.parseInt(i);
		   System.out.println("삭제할 놈!!" + articleNo);
		   boardService.deleteArticle(articleNo);
		  }   
		  result = 1;
		  }
		  
	return result;  
	
		}
}
