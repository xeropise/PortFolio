package com.mmm.web.movie;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.mmm.common.CheckAuth;
import com.mmm.common.JavaUtil;
import com.mmm.common.Page;
import com.mmm.common.Search;
import com.mmm.service.board.BoardService;
import com.mmm.service.domain.Comment;
import com.mmm.service.domain.Movie;
import com.mmm.service.domain.User;
import com.mmm.service.domain.WishStarRating;
import com.mmm.service.movie.MovieService;

@RestController
@RequestMapping("/movie/*")
public class MovieRestController {
	
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
		
		//google Key	
		String googleKey = "AIzaSyBQU9Xc7L0Vjs0EVFagqZX3xaocpkBr6r4";	//내꺼
//		String googleKey = "AIzaSyCYkM_LbtXdbyGh6pxT4S3we3c6Lte2A9A";	//지민이꺼
		String urlGoogleSearch ="https://www.googleapis.com/youtube/v3/search?key="+googleKey;
		
		//외부 Http 연결을 용이하게 하기 위한 template
		HttpEntity<?> headers;
		RestTemplate template = new RestTemplate();
		
		

		//Constructor
		public MovieRestController() {
			System.out.println(this.getClass()+"   Constructor Call...");
		}
		
		
//		보고싶어요 활성화 
		@CheckAuth(role="user,admin")
		@RequestMapping(value = "json/addWish", method = RequestMethod.POST )
		public Map<String, Object> addWish(@RequestBody WishStarRating wishStarRating, HttpSession session) throws Exception {
			System.out.println("--- --- /movie/addWish : POST");
			System.out.println("wishStarRating    "+wishStarRating);
			
//			유저정보 넣어주기 ( From session)
			User user = (User) session.getAttribute("user");
			wishStarRating.setUserNo(user.getUserNo());
			
//			BL 수행
			movieService.addWish(wishStarRating);
			
//			getMovie() 준비
			Movie inputMovie = new Movie();
			inputMovie.setMovieNo(wishStarRating.getMovieNo());
			inputMovie.setUserNo(wishStarRating.getUserNo());
			System.out.println("--------------------------inputMovie"+inputMovie);
			
//			 getMovie() 수행
			Movie movie = movieService.getMovieByMovieNo(inputMovie);
			System.out.println("------------------------- movie"  + movie);
			
//			JSON이기 때문에 Map에 담아서 return
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("movie", movie);
			return resultMap;
		}
		
//		보고싶어요 삭제
		@CheckAuth(role="user,admin")
		@RequestMapping(value = "json/deleteWish", method = RequestMethod.POST)
		public Map<String, Object> deleteWish(@RequestBody WishStarRating wishStarRating, HttpSession session) throws Exception{
			System.out.println("--- --- /movie/deleteWish : POST");
			
//			유저정보 넣어주기 ( From session)
			User user = (User) session.getAttribute("user");
			wishStarRating.setUserNo(user.getUserNo());
			
			movieService.deleteWish(wishStarRating);
			
			Movie inputMovie = new Movie();
			inputMovie.setMovieNo(wishStarRating.getMovieNo());
			inputMovie.setUserNo(wishStarRating.getUserNo());
//			System.out.println("--------------------------inputMovie"+inputMovie);
			
			Movie movie = movieService.getMovieByMovieNo(inputMovie);
			System.out.println("------------------------- movie"  + movie);
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("movie", movie);
			return resultMap;
		}
		
//		평점 등록
		@CheckAuth(role="user,admin")
		@RequestMapping(value = "json/addStarRating", method = RequestMethod.POST)
		public Map<String, Object> addStarRating(@RequestBody WishStarRating wishStarRating, HttpSession session)throws Exception{
			System.out.println("--- --- /movie/addStarRating : POST");

//			유저정보 넣어주기 ( From session)
			User user = (User) session.getAttribute("user");
			wishStarRating.setUserNo(user.getUserNo());
			
			movieService.addStarRating(wishStarRating);
			
			Movie inputMovie = new Movie();
			inputMovie.setMovieNo(wishStarRating.getMovieNo());
			inputMovie.setUserNo(wishStarRating.getUserNo());
//			System.out.println("--------------------------inputMovie"+inputMovie);
			
			Movie movie = movieService.getMovieByMovieNo(inputMovie);
			System.out.println("------------------------- movie"  + movie);
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("movie", movie);
			return resultMap;
		}
		
//		평점 수정, 삭제 ( 0 일 경우 삭제... in Dao)
		@CheckAuth(role="user,admin")
		@RequestMapping(value = "json/updateStarRating", method = RequestMethod.POST)
		public Map<String, Object> updateStarRating(@RequestBody WishStarRating wishStarRating, HttpSession session)throws Exception{
			System.out.println("--- --- /movie/updateStarRating : POST");
			
//			유저정보 넣어주기 ( From session)
			User user = (User) session.getAttribute("user");
			wishStarRating.setUserNo(user.getUserNo());
			
			movieService.updateStarRating(wishStarRating);
			
			Movie inputMovie = new Movie();
			inputMovie.setMovieNo(wishStarRating.getMovieNo());
			inputMovie.setUserNo(wishStarRating.getUserNo());
			
			Movie movie = movieService.getMovieByMovieNo(inputMovie);
			System.out.println("------------------------- movie"  + movie);
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("movie", movie);
			return resultMap;
		}
		
		
		@RequestMapping(value = "json/getBoxOfficeList", method = RequestMethod.POST)
		public List<Movie> getBoxOfficeList()throws Exception{
			
//		****BoxOffice 불러오기 ... 그냥 복붙
		Search search = new Search();
		
		if(search.getCurrentPage() ==0 ) {
			search.setCurrentPage(1);
		}
		
//		개봉한 영화 플래그
		search.setOnBoxOfficeFlag(1);
		
//		@Value로 갖고 있는 field pageSize 세팅	--> 10개 고정
		search.setPageSize(10);
		
//		2. Business Logic 수행 ///////////////////////////////////////////////////
		HashMap<String, Object> outputMap = movieService.getBoxOfficeList(search);
		
		List<Movie> list = (List<Movie>) outputMap.get("list");
		System.out.println("-----------list : " + list);
		
		return list;		
		}
		
		@RequestMapping(value = "json/getExpectedMovieList", method = RequestMethod.POST)
		public Map<String, Object> getExpectedMovieList( @RequestBody Search search,
														HttpSession session)throws Exception{
			
//			1. Business Logic Layer의 getBoxOfficeList()의 Parameter 'search' 세팅 작업///////////////////////////// 
//			만일 Get방식으로 처음 접근해서 currentPage가 없는 경우.. currentPage Default 설정
			if(search.getCurrentPage() ==0 ) {
				search.setCurrentPage(1);
			}
			
//			상영예정작 영화 플래그
			search.setOnBoxOfficeFlag(0);
			
			System.out.println("  sessionUser ::" +session.getAttribute("user"));
			
			
//			@Value로 갖고 있는 field pageSize 세팅
			search.setPageSize(pageSize);
			System.out.println("------------search"+ search);
			
//			2. Business Logic 수행 ///////////////////////////////////////////////////
//			List<Object> list, int totlaCnt IN MAP 
			HashMap<String, Object> outputMap = movieService.getBoxOfficeList(search);
			
//			3. return Page로 보낼 model 들 작업 //////////////////////////////////////////
//			페이지 관련  만들어주기
			Page resultPage = new Page(search.getCurrentPage(), ((Integer)outputMap.get("totalCnt")).intValue(),
					pageUnit, pageSize);
			
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("list", outputMap.get("list"));
			returnMap.put("search", search);
			returnMap.put("resultPage", resultPage);
			
			return returnMap;			
		}
		
		@RequestMapping(value="json/getSummary/{movieNo}", method = RequestMethod.GET)
		public Map<String, Object> getSummary(@PathVariable("movieNo") int movieNo)throws Exception{
			
			Movie inputMovie = new Movie();
			inputMovie.setMovieNo(movieNo);
			Movie outputMovie = movieService.getMovieByMovieNo(inputMovie);
			
			
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("movie", outputMovie);
			
			return returnMap;	
		}
		
//		한줄평 등록하는 method
		@CheckAuth(role="user,admin")
		@RequestMapping(value = "json/addOneline", method = RequestMethod.POST)
		public Map<String, Object> addOneline(@RequestBody Comment comment, HttpSession session)throws Exception{
			
			User user = (User) session.getAttribute("user");
			comment.setUserId(user.getUserId());
			comment.setCommentType(2);
			
			System.out.println("--------comment :: " + comment);
			
			boardService.addComment(comment);
			
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("comment", comment);
			
			return returnMap;	
		}
		
		@RequestMapping(value = "json/getOnelineList", method = RequestMethod.POST)
		public Map<String, Object> getOnelineList(@RequestBody Search search)throws Exception{
			
			if (search.getCurrentPage() == 0) {
				search.setCurrentPage(1);
			}
			
			search.setPageSize(pageSize);
			search.setCommentType(2);
			
			Map<String, Object> resultMap = boardService.getCommentList(search);
			
			List<Comment> list = (List<Comment>) resultMap.get("list");
			
			for(Comment cmt: list) {
				cmt.setCommentDate(JavaUtil.convertDateFormat(cmt.getCommentDate()));
				System.err.println("-------- commentt  :" +cmt);
			}
			
			Page resultPage = new Page(search.getCurrentPage(), ((Integer) resultMap.get("totalCount")).intValue(), pageUnit,
					pageSize);
			
			System.out.println(resultPage);
			
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("list", list);
			returnMap.put("search", search);
			returnMap.put("resultPage", resultPage);
			
			return returnMap;	
		}
		
		@RequestMapping(value = "json/getMovie", method = RequestMethod.POST)
		public Movie getMovie(@RequestBody Movie inputMovie)throws Exception{
			
//			System.out.println("movieNo :" + movieNo);
//			Movie inputMovie = new Movie();
//			inputMovie.setMovieNo(movieNo);
			
			System.out.println("------------- inputMovie" + inputMovie);
			
			Movie movie = movieService.getMovieByMovieNo(inputMovie);
			
//			트레일러...youtube API Method 호출 
//			String videoId = getYoutube(movie.getMovieTitle());
//			movie.setTrailer(videoId);	
			
			return movie;
		}

		public String getYoutube(String movieTitle)throws Exception{
//			유튜브 API에서 search 결과로 주는 videoId를 가져오자
			
			ObjectMapper mapper = new ObjectMapper();
			
//			Youtube API 다녀오기/////////////////////////////////////////////////////////////////////////////////////////////
//			header정보 
			MultiValueMap<String, String> headerMap = new LinkedMultiValueMap<>();
			headerMap.add("Content-Type", MediaType.APPLICATION_JSON_VALUE);
			
//			403 Forbidden..해결이 안된다.
//			headerMap.add("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36");
			this.headers = new HttpEntity<>(headerMap);
			
//			url 및 title 세팅
			
			String part = "&part=snippet";		// snippet으로 해야 response JSON에 영상뿐만 아니라 영상에 대한 정보도 같이 온다
			String q = "&q="+movieTitle.trim()+" 예고편 official";	// 검색어
			String order = "&order=relevance";	// 조회 기준 .... relevance(관련성) default
			String safeSearch = "&safeSearch=moderate";	//제한된 컨텐츠 포함 여부 ... 
			String type = "&type=video";				//검색 결과의 타입..  channel, playlist, video..
			String videoDefinition = "&videoDefinition=high";	// 화질종류.. any, high, standard
			String videoDuration = "&videoDuration=short"; 		// 비디오 길이..
//			String videoType = "&videoType=movie";				// 특정 동영상 유형이라는데 ... 안되면 주석처리하자 ^^^^^^
			
//			API url에 파라미터추가 
			String urlYoutube = urlGoogleSearch+part+q+order+safeSearch+type+videoDefinition+videoDuration;
			System.out.println("-------------------urlYoutube"+ urlYoutube);
			
//			google API 다녀오자
			ResponseEntity<String> responseEntity = template.exchange(urlYoutube, HttpMethod.GET, headers, String.class);
			System.out.println("-----------------------responseEntity"+ responseEntity);
			
//			response Data에서 video ID 뽑기..
			HashMap<String, Object> searchResult = mapper.readValue(responseEntity.getBody(), new TypeReference<HashMap<String, Object>>() {});
//			System.out.println("---------------searchResult.get(\"items\") : " + searchResult.get("items"));
			List<Object> items = (List<Object>) searchResult.get("items");
//			System.out.println("----------------items[0]"+ items.get(0));
			Map<String, Object> items1 =  (Map<String, Object>) items.get(0);
//			System.out.println("---------------------idMap   "+items1);
			Map<String, String> idMap = (Map<String, String>) items1.get("id");
			String videoId = idMap.get("videoId");
			System.out.println("--------------videoId  : " + videoId);
			
			return  videoId;
		}
		
}
