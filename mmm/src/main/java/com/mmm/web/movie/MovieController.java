package com.mmm.web.movie;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
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
import org.springframework.web.client.RestTemplate;

import com.mmm.common.JavaUtil;
import com.mmm.common.Page;
import com.mmm.common.Search;
import com.mmm.service.board.BoardService;
import com.mmm.service.domain.Comment;
import com.mmm.service.domain.Movie;
import com.mmm.service.domain.Point;
import com.mmm.service.domain.User;
import com.mmm.service.movie.MovieService;

@Controller
@RequestMapping("/movie/*")
public class MovieController {
     
	///Field
	@Autowired
	@Qualifier("movieServiceImpl")
	private MovieService movieService; //DI 받자
	
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	//Field for Other API ---------------------------------------------------------
	//영화진흥원 Kobis 인증Key 와 lib
	
//	@Value("#{movieProperties['kobisKeyFirst']}")
//	String kobisKeyFirst; 		//1ee4215b28fff482b9c603b630164550
//	
//	@Value("#{movieProperties['kobisKeySecond']}")
//	String kobisKeySecond;		//69714ef584a7abf49f89833c0372e1d0
	
//	String kobisKey ="1ee4215b28fff482b9c603b630164550";
	
//	하루 한도 3000개라서 위에 key 번갈아서 쓰자
//	KobisOpenAPIRestService kobisService = new KobisOpenAPIRestService("69714ef584a7abf49f89833c0372e1d0");
	
	//네이버 API key & Secret Key
//	private String naverClientId = "yRckAK42WkKwESUtSenf";
//	private String naverClientSecret = "cSbBOgvfac";
	
	//KMDB 인증 Key
	private String kmdbKey = "VE61R22GGTP493E028O6";
//	private String kmdbKey = "3R3N86K61455468O57JN";
//	private String kmdbKey = "07T082A3EZW65K7IZS2D";
	
	//Kmdb 접근 url
	String urlKmdb = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&detail=Y&ServiceKey="+kmdbKey;
	
	//google Key	
	String googleKey = "AIzaSyBQU9Xc7L0Vjs0EVFagqZX3xaocpkBr6r4";	//내꺼
//	String googleKey = "AIzaSyCYkM_LbtXdbyGh6pxT4S3we3c6Lte2A9A";	//지민이꺼
	String urlGoogleSearch ="https://www.googleapis.com/youtube/v3/search?key="+googleKey;
	
	//외부 Http 연결을 용이하게 하기 위한 template
	HttpEntity<?> headers;
	RestTemplate template = new RestTemplate();
	
	//날짜 포맷 변환
	SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
	
	///Constructor------------------------------------------------------------------
	public MovieController() {
		System.out.println(this.getClass()+"   Constructor Call...");
	}
	
	
	///Method---------------------------------------------------------------------
	
	
//	하루에 한번씩 실행되는 메소드...
//	@Scheduled(cron = "*/20 * * * * *")	//매 10초마다 실행
	public void addMovieAndUpdateReleasedMovie()throws Exception{
		this.addMovie();			//다음에서 상영예정작 크롤링하고, JMDB API에서 해당 영화의 정보를 긁어와서 DB에 추가
		this.updateReleasedMovie();	//개봉일이 지난 영화들 onBoxOfficeFlagfmf 0--> 1변경
	}
	
	
//	다음 상영예정작에서 영화제목, 개봉일 긁어오고 KMDB에서 상세정보 가져오는 Method
	public void addMovie()throws Exception{
		
//		1. 크롤링---------------------------------------------------------------------
		System.setProperty("webdriver.chrome.driver", "C:\\chromedriver.exe");
//		System.setProperty("webdriver.chrome.driver", "/Users/Jee-hang/chromedriver/chromedriver");	// for Mac chrome version 80
		
		//Browser 안띄우기
		ChromeOptions options = new ChromeOptions();
//		options.setHeadless(true);	// 브라우저 보이지 않기..
		
		// 셀레니움의 코어
		WebDriver webDriver = new ChromeDriver();
		
//		크롤링할 페이지 수 2개로 고정
		for (int i = 0; i < 2; i++) {
			//웹페이지 설정하기(자동화된 어쩌구 저쩌구..*************************************************************************************************
			webDriver.get("https://movie.daum.net/premovie/scheduled?opt=release&page="+(i+1));	//상영 예정작
//			webDriver.get("https://movie.daum.net/premovie/released?opt=release&page="+(i+1));	//현재 상영작
			
	//		Css Selector로 Element 요소 잡아오기 1 ____영화제목
			List<WebElement> list = webDriver.findElements(By.cssSelector("#mArticle > ul.list_movie.\\#movie > li> div.wrap_movie > div > a"));
			
//			밑에 rlsDateEl 의 n번째 자식 나타내는 변수
			int j = 1;
			for(WebElement el : list) {
				
				//영화 제목 변수
				String movieTitleRaw = el.getText();
				String movieTitleInput =  movieTitleRaw.replaceAll(" ","");
				System.out.println("----- 제목(Raw) : "+ movieTitleRaw);
				System.out.println("----- 제목(replaceAll) : "+ movieTitleInput);
				
//				Css Selector로 Element 요소 잡아오기  ____개봉일 처리
				WebElement rlsDateEl =  webDriver.findElement(By.cssSelector("#mArticle > ul.list_movie.\\#movie > li:nth-child("+j+") > div.wrap_movie > span.info_state"));
//				WebElement rlsDateEl =  webDriver.findElement(By.cssSelector("#mArticle > ul.list_movie.\\#movie > li:nth-child("+j+") > div.wrap_movie > span.info_state"));
				String date = rlsDateEl.getText().replaceAll(" ", "");
//				System.out.println("----- 개봉일 : "+date);

				
				String rating="";
				if (webDriver.findElements(By.cssSelector("#mArticle > ul.list_movie.\\#movie > li:nth-child("+j+") > div.wrap_movie > div > em")).size() != 0) {
	//				Css Selector로 Element 요소 잡아오기  ____관람등급 처리
						WebElement ratingEl =  webDriver.findElement(By.cssSelector("#mArticle > ul.list_movie.\\#movie > li:nth-child("+j+") > div.wrap_movie > div > em"));
						rating = ratingEl.getText().replaceAll(" ", "");
						System.out.println("----- 관람등급 : "+rating);
				}
				
//				parsing...
//				개봉일자 변수
				String dateAfterFormat = "";
				if(date.indexOf("재")!= -1) {
					dateAfterFormat = date.substring(0, rlsDateEl.getText().replaceAll(" ", "").indexOf("재"));
				}else {
					dateAfterFormat = date.substring(0, rlsDateEl.getText().replaceAll(" ", "").indexOf("개"));
				}
				
				System.out.println("----- 개봉일 : "+ dateAfterFormat);
				System.out.println("----- 개봉일 글자수 갯수 : "+ dateAfterFormat.length());
				
//				8개 넘어가면 포문 종료_ 다음영화로..
				if(dateAfterFormat.length()!=8) {
					System.out.println("====> Break!  갯수 : "+ j );
					break;
				}
				
//				우리 DB에 있는 영화인지 확인하는 sql.. 0이면 DB에 없고, 1이면 DB에 존재
				Map<String, Object> inputMap = new HashMap<String, Object>();
				inputMap.put("movieTitleInput", movieTitleInput);
				inputMap.put("dateAfterFormat", dateAfterFormat);
				int resultExistance = movieService.checkExistanceMovieDB(inputMap);
				System.out.println("------------- checkExistanceMovieDB  : "+movieService.checkExistanceMovieDB(inputMap));
				
//				DB에 있다면 포문 종료..다음영화로..
				if (resultExistance == 1) {
					j++;
					break;
				}
				
////				2. KMDB에서 영화 정보 긁어오기
//				KMDB query문에 yyyyMMdd형식으로 변환
				String releaseDate = JavaUtil.convertDateFormatforKMDB(dateAfterFormat);
				System.out.println("----- 개봉일 : "+ releaseDate);
				
//				KMDB에 다녀올 Movie 
				Movie inputMovie = new Movie();
				inputMovie.setMovieTitle(movieTitleInput);
				inputMovie.setReleaseDate(releaseDate);
				System.out.println("--------------------- inputMovie : "+inputMovie);
				
				Movie movieFromKMDB = getMovieInfoFromKmdb(inputMovie);
				
//				만약 해당 영화가 KmDB에 있는 애들만.. 추가
				if (movieFromKMDB != null) {
//					띄워쓰기 한 영화제목이 들어가도록....(movieTitleRaw..)
					movieFromKMDB.setMovieTitle(movieTitleRaw);
					if (!rating.equals("")) {
						movieFromKMDB.setMovieRating(rating);
					}
					
					movieFromKMDB.setReleaseDate(JavaUtil.convertDateFormatforDB(dateAfterFormat));
					
					HashMap<String, Object> inputData = new HashMap<String, Object>();
					inputData.put("movie", movieFromKMDB);
					inputData.put("genreList", movieFromKMDB.getGenreList());
					System.out.println("=============> DB에 들어가는 영화 : ["+j+" ] :: "+movieFromKMDB);
					
////				addMovie().... DB에 넣기
					movieService.addMovie(inputData);
					
				}else {
					System.out.println("==========> KMDB에 "+movieTitleInput+" / "+dateAfterFormat +"   영화는 없어....");
				}
				j++;
			}
		}	//out for

	}//end of addMovie() method
	
	
	
	
//	개봉일이 오늘보다 이전이거나 같은 영화들의 onBoxOfficeFlag를 1로 변경해주는 Method
	public void updateReleasedMovie()throws Exception{
		movieService.updateReleasedMovie();
	}
	
	@RequestMapping(value = "getBoxOfficeList")
	public String getBoxOfficeList(@ModelAttribute("search")  Search search,
									Model model,
									HttpSession session
									)throws Exception {
		
//		1. Business Logic Layer의 getBoxOfficeList()의 Parameter 'search' 세팅 작업///////////////////////////// 
//		만일 Get방식으로 처음 접근해서 currentPage가 없는 경우.. currentPage Default 설정
		if(search.getCurrentPage() ==0 ) {
			search.setCurrentPage(1);
		}
		
//		개봉한 영화 플래그
		search.setOnBoxOfficeFlag(1);
		
		System.out.println("  sessionUser ::" +session.getAttribute("user"));
		
//		세션에서 유저 정보 가져오기
		if(session.getAttribute("user") != null) {
			User user = (User) session.getAttribute("user");
			System.out.println("-----------user : "+ user);
			
			search.setUserNo(user.getUserNo());
			
		}
		
//		@Value로 갖고 있는 field pageSize 세팅	--> 12개 고정
		search.setPageSize(11);
		System.out.println("------------search"+ search);
		
//		2. Business Logic 수행 ///////////////////////////////////////////////////
//		List<Object> list, int totlaCnt IN MAP 
		HashMap<String, Object> outputMap = movieService.getBoxOfficeList(search);
		
		if (session.getAttribute("user") != null) {
	//		선호장르 영화 추천.. 및 장르 리스트 조회
				Movie preferMovie = movieService.getPreferMovie((User)session.getAttribute("user"));
				List<String> genreList = movieService.getGenreMovieList(preferMovie.getMovieNo());
	//		System.out.println("--------------------------preferMovie  : "+preferMovie);
	//		System.out.println("----------------------genreList   : "+genreList);
				
				model.addAttribute("preferMovie", preferMovie);
				model.addAttribute("genreList",genreList);
			
		}
		
		
//		3. return Page로 보낼 model 들 작업 //////////////////////////////////////////
//		페이지 관련  만들어주기
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)outputMap.get("totalCnt")).intValue(),
									pageUnit, pageSize);
//		박스오피스 영화 목록 꺼내기
		List<Movie> list = (List<Movie>) outputMap.get("list");
		
//		for(Movie mov : list) {
//			System.out.println("--------------- 박스오피스 영화 : "+ mov);
//		}
		
		model.addAttribute("list",list);
		model.addAttribute("search",search);
		model.addAttribute("resultPage",resultPage);
		
		System.out.println("------------ model "+ model);
		
		return "forward:/movie/boxOfficeList.jsp";
	}
	
	
	@RequestMapping(value = "getExpectedMovieList")
	public String getExpectedMovieList(@ModelAttribute("search")  Search search,
									Model model,
									HttpSession session
//									,@RequestParam("userNo") int userNo
									)throws Exception {
		System.out.println("--- --- /movie/getBoxOfficeList : GET, POST");
		
//		1. Business Logic Layer의 getBoxOfficeList()의 Parameter 'search' 세팅 작업///////////////////////////// 
//		만일 Get방식으로 처음 접근해서 currentPage가 없는 경우.. currentPage Default 설정
		if(search.getCurrentPage() ==0 ) {
			search.setCurrentPage(1);
		}
		
//		상영예정작 플래그 
		search.setOnBoxOfficeFlag(0);
		
		System.out.println("  sessionUser ::" +session.getAttribute("user"));
		
//		세션에서 유저 정보 가져오기
		
		User user;
		if(session.getAttribute("user") != null) {
			user = (User) session.getAttribute("user");
			System.out.println("-----------user : "+ user);
			
//		Test용..(위에 RequestParam userNo 도 지워야한다.)
			search.setUserNo(user.getUserNo());
			
		}
		
////		Test용 User .model..model..model preferMovie
//		User user = new User();
//		user.setUserNo(userNo);
//		user.setLikeGenre1("드라마");
//		user.setLikeGenre2("스릴러");
//		user.setLikeGenre3("애니메이션");

//		@Value로 갖고 있는 field pageSize 세팅
		search.setPageSize(pageSize);
		System.out.println("------------search"+ search);
		
//		2. Business Logic 수행 ///////////////////////////////////////////////////
//		List<Object> list, int totlaCnt IN MAP 
		HashMap<String, Object> outputMap = movieService.getBoxOfficeList(search);
		
		
		if (session.getAttribute("user") != null) {
	//		선호장르 영화 추천.. 및 장르 리스트 조회
				Movie preferMovie = movieService.getPreferMovie((User)session.getAttribute("user"));
				List<String> genreList = movieService.getGenreMovieList(preferMovie.getMovieNo());
	//		System.out.println("--------------------------preferMovie  : "+preferMovie);
	//		System.out.println("----------------------genreList   : "+genreList);
				
				model.addAttribute("preferMovie", preferMovie);
				model.addAttribute("genreList",genreList);
			
		}

		
//		3. return Page로 보낼 model 들 작업 //////////////////////////////////////////
//		페이지 관련  만들어주기
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)outputMap.get("totalCnt")).intValue(),
									pageUnit, pageSize);
//		박스오피스 영화 목록 꺼내기
		List<Movie> list = (List<Movie>) outputMap.get("list");
		
//		for(Movie mov : list) {
//			System.out.println("--------------- 박스오피스 영화 : "+ mov);
//		}
		
		model.addAttribute("list",list);
		model.addAttribute("search",search);
		model.addAttribute("resultPage",resultPage);
		
		System.out.println("------------ model "+ model);
		
		return "forward:/movie/getExpectedMovieList.jsp";
	}
	
	@RequestMapping(value = "/getMovie/{movieNo}", method = RequestMethod.GET)
	public String getMovie(@PathVariable("movieNo") int movieNo,
							HttpSession session,
							Model model)throws Exception{
		System.out.println("--- --- /movie/getMovie : GET");
		
		Movie inputMovie = new Movie();
		inputMovie.setMovieNo(movieNo);
		
//		유저 정보 넣어주기
		if (session.getAttribute("user") != null) {
			User user = (User)session.getAttribute("user");
			inputMovie.setUserNo(user.getUserNo());
		}
		
//		우리 DB 다녀오기
		Movie movie = movieService.getMovieByMovieNo(inputMovie);
		
//		kMDB 다녀오기
		Movie movieFromKmdb = this.getMovieInfoFromKmdb(movie);
		
//		장르 넣기위한 준비
		List<String> genreList =  movieService.getGenreMovieList(movieNo);
		String genreString = "";
		for (int i = 0; i < genreList.size(); i++) {
			genreString += genreList.get(i);
			
			if (i != genreList.size()-1) {
				genreString += " ,";
			}
		}
		
//		트레일러...youtube API Method 호출 
//		String videoId = getYoutube(movie.getMovieTitle());
		
//		VO에 값 세팅
		movieFromKmdb.setMovieNo(movie.getMovieNo());
		movieFromKmdb.setUserNo(movie.getUserNo());
		movieFromKmdb.setMovieTitle(movie.getMovieTitle());
		movieFromKmdb.setMovieRating(movie.getMovieRating());
		movieFromKmdb.setReleaseDate(movie.getReleaseDate());
		movieFromKmdb.setOnBoxOfficeFlag(movie.getOnBoxOfficeFlag());
		movieFromKmdb.setStarRating(movie.getStarRating());
		movieFromKmdb.setWishCnt(movie.getWishCnt());
		movieFromKmdb.setWishUserFlag(movie.getWishUserFlag());
		movieFromKmdb.setGenreString(genreString);
		movieFromKmdb.setStarByUser(movie.getStarByUser());
		movieFromKmdb.setStarUserFlag(movie.getStarUserFlag());
		movieFromKmdb.setTicketingRate(movie.getTicketingRate());
//		movieFromKmdb.setTrailer(videoId);						///////////  youtube API 한도......T.T
		
		System.out.println("---------------movieFromKmdb  : " + movieFromKmdb);

		
//	2. 한줄평 목록 주기
		Search search = new Search();
		search.setMovieNo(movieNo);
		Map<String, Object> resultCmtMap = getOnelineList(search);
		
		model.addAttribute("resultCmtMap", resultCmtMap);
		model.addAttribute("movie", movieFromKmdb);
		
		return "forward:/movie/getMovie.jsp";
	}
	
	@RequestMapping(value = "/getOnelineListByUserId")
	public String getOnelineListByUserId(@ModelAttribute(value = "search") Search search,
										HttpSession session, Model model)throws Exception{
		
		
//		로그인한 회원 정보 from session
		User user = (User)session.getAttribute("user");
		System.out.println("----------- user.getUserNo() : "+user.getUserNo());
		search.setUserId(user.getUserId());		

//		search.currentPage setting...
		if(search.getCurrentPage() ==0 ) {
			search.setCurrentPage(1);
		}
//		search.pageSize 세팅
		search.setPageSize(pageSize);
		
		search.setCommentType(3);
		System.out.println("------------search"+ search);
		
		HashMap<String, Object> outputMap = (HashMap<String, Object>) boardService.getCommentList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)outputMap.get("totalCount")).intValue(),
				pageUnit, pageSize);
		System.out.println("------- resultPage : " + resultPage);
		
		for(Comment cmt : (List<Comment>)outputMap.get("list")) {
			
//			System.out.println("--------- cmt : " + cmt);
			cmt.setCommentDate(JavaUtil.convertDateFormat(cmt.getCommentDate()));
		}
		
		List<Comment> list = (List<Comment>) outputMap.get("list");
		
		System.out.println("------------------list.size() : " + list.size());
		
		
		model.addAttribute("list", list);
		model.addAttribute("search",search);
		model.addAttribute("resultPage",resultPage);
		
		return "forward:/movie/getOnelineListByUserId.jsp";
	}
	
	

	
	
////	Kobis를 다녀오기 위한 Method--------------------------------------------------------------------------------------
//	public Movie getMovieInfoFromKobis(Movie movie )throws Exception {
//		
//		Movie movieKobis = new Movie();
//		
//		if(mapper == null) {
//			ObjectMapper mapper = new ObjectMapper();
//		}
//		
////		개별 영화의 상세정보 조회...from Kobis
//		HashMap<String, Object> movieInfoResponse = mapper.readValue(kobisService.getMovieInfo(true, movie.getKobisCd()), HashMap.class);
//		HashMap<String, Object> movieInfoResult = (HashMap<String, Object>)movieInfoResponse.get("movieInfoResult");
//		HashMap<String, Object> movieInfo = (HashMap<String, Object>)movieInfoResult.get("movieInfo");
//		
//		
//		return movieKobis;
//	}
	
	
	
//	KMDB를 다녀오기 위한 Method--------------------------------------------------------------------------------------
	public Movie getMovieInfoFromKmdb(Movie movie)throws Exception {
		
		String query="";
		Movie movieKmdb = new Movie();
		ObjectMapper mapper = new ObjectMapper();
		
		
//		Kmdb 다녀오기/////////////////////////////////////////////////////////////////////////////////////////////
//		header정보 
		MultiValueMap<String, String> headerMap = new LinkedMultiValueMap<>();
		headerMap.add("Content-Type", MediaType.APPLICATION_JSON_VALUE);
		this.headers = new HttpEntity<>(headerMap);
		
//		url 및 title 세팅
//		개봉연도 받아주는 변수
		String releaseDts =movie.getReleaseDate();   //YYYYMMDD 형식 문자열로 넣어줘야..
		
//		if (movie.getKmdbCd() != null) {
//			//// Kmdb 관리번호 + 개봉일자로 찾기... 
//			System.out.println("___개봉일자로 검색");
//			query = "&movieSeq="+movie.getKmdbCd()+"&releasDts="+releaseDts;
//		} else {
			//// 관리번호가 없을 때 어쩔 수 없이 제목과 개봉연도로 찾기..
			query = "&title="+movie.getMovieTitle().trim()+"&releaseDts="+releaseDts;
			System.out.println("---------------------query"+ query);
//		}
		
		ResponseEntity<String> responseEntity = template.exchange(urlKmdb+query, HttpMethod.GET, headers, String.class);
		
		HashMap<String, Object> searchResult = mapper.readValue(responseEntity.getBody(), new TypeReference<HashMap<String, Object>>() {});
//		System.out.println("----------------------searchResult : "+searchResult);
		
		System.out.println("---------------totalCnt : "+searchResult.get("TotalCount"));
//		검색결과 갯수가 '0'인 경우 null return
		if (((Integer)searchResult.get("TotalCount")).intValue() == 0) {
			return null;
		}
		
		ArrayList<HashMap<String, Object>> kmdbList = (ArrayList<HashMap<String, Object>>) searchResult.get("Data");
		ArrayList<HashMap<String, Object>> kmdbListResult = (ArrayList<HashMap<String, Object>>) kmdbList.get(0).get("Result");
		System.out.println("-------- kmdbListResult : " + kmdbListResult);
		HashMap<String, Object> movieInfoFromKmdb = kmdbListResult.get(0);
		System.out.println("-------- movieInfoFromKmdb : " + movieInfoFromKmdb);
		
		movieKmdb.setKmdbCd(movieInfoFromKmdb.get("movieSeq").toString());	//KMDB 영화 관리번호 넣기
//		System.out.println("------------- plots   : "+movieInfoFromKmdb.get("plots"));	
		HashMap<String, ArrayList<HashMap<String, Object>>>  plots = (HashMap<String, ArrayList<HashMap<String, Object>>>) movieInfoFromKmdb.get("plots");
		
		System.out.println("-------------------- plotText "+plots.get("plot").get(0).get("plotText"));
		movieKmdb.setSummary(plots.get("plot").get(0).get("plotText").toString()); 	//KMDB 줄거리 넣기
		
		System.out.println("-------- movieInfoFromKmdb.get(\"runtime\" : " + movieInfoFromKmdb.get("runtime"));
		
//		런닝타임을 넣기 위한.....
//		검색결과에 러닝타임이 있는 영화면 런닝타임 세팅.. 
		if (!movieInfoFromKmdb.get("runtime").toString().equals("")) {
			movieKmdb.setRunningTime(Integer.parseInt((String)(movieInfoFromKmdb.get("runtime"))));
		}
		
//		영어제목을 넣기 위한 ....
		System.out.println("--------------------titleEng : " + movieInfoFromKmdb.get("titleEng").toString());
		movieKmdb.setMovieTitleEng(movieInfoFromKmdb.get("titleEng").toString());
		
//		장르 넣기
		System.out.println("------------------ genre: " + movieInfoFromKmdb.get("genre"));
		String[] genreArr = movieInfoFromKmdb.get("genre").toString().split(",");
		List<String> genreList = new ArrayList<String>(Arrays.asList(genreArr));
		movieKmdb.setGenreList(genreList);
		
//		for(String str : genreList) {
//			System.out.println("------------------ genreList: " + str);
//		}
		
//		키워드 넣기
		System.out.println("------------------ keywords: " + movieInfoFromKmdb.get("keywords"));
		String[] keywordsArr = movieInfoFromKmdb.get("keywords").toString().split(",");
		List<String> keywordList = new ArrayList<String>(Arrays.asList(keywordsArr));
		movieKmdb.setKeywordList(keywordList);
		
//		for(String str : keywordsList) {
//			System.out.println("------------------ keywordsList: " + str);
//		}
		
		
//		감독 넣기 위한 ...
//		System.out.println(movieInfoFromKmdb.get("director"));
		HashMap<String, ArrayList<HashMap<String, Object>>>  directors = (HashMap<String, ArrayList<HashMap<String, Object>>>) movieInfoFromKmdb.get("directors");
		ArrayList<HashMap<String, Object>> directorList = directors.get("director");
//		System.out.println("------------- directorList : "+ directorList);
		
		String director = "";
		
		for (int i = 0; i < directorList.size(); i++) {
			director += directorList.get(i).get("directorNm");
			if (i != directorList.size()-1) {
				director += ", ";
			}
		}
		
//		System.out.println("----------------- director  : "+ director);
		movieKmdb.setDirector(director);		//감독 넣기
		
//		배우 넣기 위한 ...
		HashMap<String, ArrayList<HashMap<String, Object>>>  actors = (HashMap<String, ArrayList<HashMap<String, Object>>>) movieInfoFromKmdb.get("actors");
		ArrayList<HashMap<String, Object>> actorList = actors.get("actor");
		
		String actor = "";
		
		for (int i = 0; i < actorList.size(); i++) {
			actor += actorList.get(i).get("actorNm");
			if (i != actorList.size()-1) {
				actor += ", ";
			}
		}
		System.out.println("----------------- actor  : "+ actor);
		movieKmdb.setActor(actor);		//배우 넣기
		
		
		//포스터 넣기
//		통째로 포스터 String으로 넣는다.
		System.out.println("------------------- movieInfoFromKmdb.get(\"posters\")" + movieInfoFromKmdb.get("posters"));
		
		String[] posters = (movieInfoFromKmdb.get("posters").toString()).split("\\|");
		movieKmdb.setPoster(posters[0]);
		
		System.out.println("-----------------------------------  movieInfoFromKmdb : " + movieInfoFromKmdb);
		
		
		
		return movieKmdb;
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
		System.out.println("-----------------------responseEntity"+ responseEntity);
		
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
	
	public Map<String, Object> getOnelineList(Search search)throws Exception{
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		search.setCommentType(2);
		
		System.out.println("------ search : " + search);
		
		Map<String, Object> resultMap = boardService.getCommentList(search);
		
		List<Comment> list = (List<Comment>) resultMap.get("list");
		
		for(Comment cmt: list) {
			cmt.setCommentDate(JavaUtil.convertDateFormat(cmt.getCommentDate()));
			System.err.println("-------- commentt  :" +cmt);
		}
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) resultMap.get("totalCount")).intValue(), pageUnit,
				pageSize);
		
		System.out.println(resultPage);
		
		Map<String, Object> returnCmtMap = new HashMap<String, Object>();
		returnCmtMap.put("list", list);
		returnCmtMap.put("search", search);
		returnCmtMap.put("resultPage", resultPage);
		
		return returnCmtMap;	
	}
	
	
//	//	테스트용.. kobis꺼 가져오는 ... 이젠 안쓴다 ..
//	//	@Scheduled(cron = "*/10 * * * * *")	//매 10초마다 실행
//		public void addTestMovie(){	
//		try {
//			System.out.println("-------addMovie() Call.. start-------" + new Date());
//			System.out.println("-------Using key-------" + kobisKeySecond);
//			
//			String itemPerPage = "10"; 	// 결과 Row의 갯수 지정	( default = 10)
//			String multiMovieYn = "N"; 	// 다양성 영화 = y /  상업영화 = n ( default = All)
//			String repNationCd = "";	// 한국영화 = K	/ 외국영화 = F (default = ALL)
//			String wideAreaCd = "";		//	상영지역별로 조회할 수 있으며, 지역코드는 공통코드 조회 서비스에서 “0105000000” 로서 조회된 지역코드. (default : 전체)
//			
//			SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMdd");
//			String targetDt =  new SimpleDateFormat ( "yyyyMMdd").format(System.currentTimeMillis()- 1000 * 60 * 60 * 24 );
//			
//			//서비스 메소드로 조회하고 JsonStirng 형태로 return 받는다.
//			String dailyBoxOfficeResponse = kobisService.getDailyBoxOffice(true, targetDt, itemPerPage, multiMovieYn, repNationCd, wideAreaCd);
//			
//			System.out.println("--------------------dailyBoxOfficeResponse  : " + dailyBoxOfficeResponse);
//			
//			//Json Data를 다루기 위해 jacksonJson lib의 objectMapper 선언 및 생성
//			ObjectMapper mapper = new ObjectMapper();
//			JSONParser parser = new JSONParser();
//			
//			//Json from String to Object(HashMap.class)
//	//		Map 속에 Map 이 또 있는 구조라.. 일단 이렇게 해보았다..
//			HashMap<String, Object> resultMap = mapper.readValue(dailyBoxOfficeResponse, HashMap.class);
//			HashMap<String, Object> boxOfficeResult= (HashMap<String, Object>) resultMap.get("boxOfficeResult");
//	//		System.out.println("----------- resultMap : " + resultMap);
//	//		System.out.println("----------- boxOfficeResult : " + boxOfficeResult);
//			
//	//		이렇게 하면 Json을 Collection에 넣지 못한다..그냥 String 일뿐, 실제 JsonArray가 아니다
//	//		ArrayList<String> boxOfficeList= mapper.readValue(dailyBoxOfficeResponse, ArrayList.class);
//	//		List<HashMap<String, String>> boxOfficeList= (ArrayList<HashMap<String, String>>)resultMap;
//			
//	//		json 을 list로 다루기 위해 변환 ..Generic으로 Map을 받는다.
//			ArrayList<HashMap<String, String>> boxOfficeList=(ArrayList<HashMap<String, String>>)boxOfficeResult.get("dailyBoxOfficeList");
//			
//	//		각각 하나의 영화를 다루기 위한 Loop 
//			for(HashMap<String, String> mov : boxOfficeList) {
//				
//	//			해당 영화의 데이터를 담을 Movie VO 생성
//				Movie movie = new Movie();
//				List<String> genreList = new ArrayList<String>();
//	
//	//			개별 영화의 상세정보 조회...from Kobis
//				HashMap<String, Object> movieInfoResponse = mapper.readValue(kobisService.getMovieInfo(true, mov.get("movieCd")), HashMap.class);
//				HashMap<String, Object> movieInfoResult = (HashMap<String, Object>)movieInfoResponse.get("movieInfoResult");
//				HashMap<String, Object> movieInfo = (HashMap<String, Object>)movieInfoResult.get("movieInfo");
//				
//	//			영화의 관련 Data 넣기
//				movie.setMovieTitle(mov.get("movieNm"));	// 영화 제목 넣기
//	//			Date releaseDate = new SimpleDateFormat("yyyy-MM-dd").parse(mov.get("openDt"));	//String to Date..
//				movie.setReleaseDate(mov.get("openDt"));			// 개봉일자
//				
//				ArrayList<HashMap<String, String>> audits = (ArrayList<HashMap<String, String>>)movieInfo.get("audits");
//				movie.setMovieRating(audits.get(0).get("watchGradeNm"));	//관람물 등급
//				movie.setRunningTime( Integer.parseInt((String)(movieInfo.get("showTm"))));	// 런닝타임
//				
//	//			장르만 따로 List에 넣기
//				ArrayList<HashMap<String, String>> genres = (ArrayList<HashMap<String, String>>)movieInfo.get("genres");
//				for(HashMap<String, String> map : genres) {
//	//				System.out.println("--------------------- genreNm"+map.get("genreNm"));
//					genreList.add(map.get("genreNm"));
//				}
//				
//	//			Service의 Parameter인 Map으로 포장하기
//				HashMap<String, Object> inputData = new HashMap<String, Object>();
//				inputData.put("movie", movie);
//				inputData.put("genreList", genreList);
//				
//	//			KMDB 다녀오기.....
//				Movie movieFromAPI = this.getMovieInfoFromKmdb(movie);
//				
//				movie.setKmdbCd(movieFromAPI.getKmdbCd());
//				movie.setDirector(movieFromAPI.getDirector());
//				movie.setActor(movieFromAPI.getActor());
//				movie.setPoster(movieFromAPI.getPoster());
//				movie.setSummary(movieFromAPI.getSummary());
//				
//				System.out.println("----------------------- movie: " + movie);
//				
//	//			addMovie().... DB에 넣기
//				movieService.addMovie(inputData);
//			}
//			
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//	}//end of test addMovie() method
	
	
}