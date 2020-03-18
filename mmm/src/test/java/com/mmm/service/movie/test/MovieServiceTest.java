package com.mmm.service.movie.test;

import java.util.HashMap;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mmm.common.Search;
import com.mmm.service.domain.Movie;
import com.mmm.service.domain.User;
import com.mmm.service.domain.WishStarRating;
import com.mmm.service.movie.MovieService;


@RunWith(SpringJUnit4ClassRunner.class)

//metaData를 다양하게 Wiring...
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
		"classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml",
		"classpath:config/context-transaction.xml" })

public class MovieServiceTest {

	@Autowired
	@Qualifier("movieServiceImpl")
	private MovieService movieService;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	
//	@Test
//	public void testAddMovie() throws Exception{
//		
//		Movie movie = new Movie();
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		
//		Date date = dateFormat.parse("2020-01-20");
//		
//		movie.setMovieTitle("연습용 영화의 제목이시다");
//		movie.setReleaseDate(date);
//		movie.setKobisCd("1111");
//		
//		List genreList = new ArrayList<String>();
//		genreList.add("드라마");
//		genreList.add("호러");
//		genreList.add("가족");
//		genreList.add("서부극");
//	
//		HashMap<String, Object> inputData = new HashMap<String, Object>();
//		inputData.put("movie", movie);
//		inputData.put("genreList", genreList);
//		
//		movieService.addMovie(inputData);
//		
//		movie = movieService.getMovieByMovieNo(10000);
//		Movie movie02 = movieService.getMovieByMovieTitle("연습용영화의제목이시     다");
//		
//		System.out.println("------------------- movie : "+ movie);
//		System.out.println("------------------- movie02 : "+ movie02);
//		System.out.println("--------------------movie03 : "+ movieService.getMovieByMovieNo(10005));
//		Assert.assertEquals("시험용 영화제목", movie.getMovieTitle());
//		Assert.assertEquals("연습용 영화의 제목이시다", movie02.getMovieTitle());
//	};
	
//	@Test
//	public void testGetMovieGenreList() throws Exception{
//		
//		int movieNo = 10000;
//		
//		List<String> list =  movieService.getGenreMovieList(movieNo);
//		
//		Assert.assertEquals(3,list.size());
//	}
	
//	@Test
//	public void testGetPreferMovie() throws Exception{
//		User user = new User();
//		user.setLikeGenre1("드라마");
//		user.setLikeGenre2("액션");
//		user.setLikeGenre3("뮤지컬");
//		
//		Movie movie = movieService.getPreferMovie(user);
//		
//		System.out.println(" --------------------------- movie  ::" + movie);
//		Assert.assertEquals(10002, movie.getMovieNo());
//		
//		
//		User user02 = new User();
//		Movie movie02 = movieService.getPreferMovie(user02);
//		
//		System.out.println(" --------------------------- movie02  ::" + movie02);
//		Assert.assertEquals("시험용 영화제목03", movie02.getMovieTitle());
//	}
	
//	@Test
//	public void testAddWish() throws Exception{
//		
//		User user = new User();
//		user.setUserNo(10101);
//		
//		Movie movie = movieService.getMovieByMovieTitle("시험용 영화제목");
//		
//		
//		WishStarRating wishStarRating = new WishStarRating();
//		wishStarRating.setMovieNo(movie.getMovieNo());
//		wishStarRating.setUserNo(user.getUserNo());
//		
////		HashMap<String, Object> input = new HashMap<String, Object>();
////		input.put("userNo", user.getUserNo());
////		input.put("movieNo", movie.getMovieNo());
//		
//		System.out.println("-----------movie WishCnt "+ movieService.getWishCnt(movie.getMovieNo()));
//		
//		movieService.addWish(wishStarRating);
//		
//		System.out.println("-----------movie WishCnt1 "+ movieService.getWishCnt(movie.getMovieNo()));
//		Assert.assertEquals(5, movieService.getWishCnt(movie.getMovieNo()));
//		
//		
//		movieService.deleteWish(wishStarRating);
//		
//		System.out.println("-----------movie WishCnt3 "+movieService.getWishCnt(movie.getMovieNo()));
//		Assert.assertEquals(4, movieService.getWishCnt(movie.getMovieNo()));
//				
//	}
	
//	@Test
//	public void testGetWishMovieList()throws Exception{
//		User user = new User();
//		user.setUserNo(33333);
//		
//		Search search = new Search();
//		search.setCurrentPage(1);
//		search.setPageSize(6);
////		search.setSearchCondition("2");
//		
//
//	
//		HashMap<String, Object> inputData = new HashMap<String, Object>();
//		inputData.put("search", search);
//		inputData.put("userNo", user.getUserNo());
//		
//		
//		HashMap<String, Object> map =  movieService.getWishMovieList(inputData);
//		
//		ArrayList<Movie> list  = (ArrayList<Movie>) map.get("wishMovieList");
//		
//		for(Movie mv : list) {
//			
//			System.out.println("---------------------"+mv);
//			
//		}
//		Assert.assertEquals(3, map.get("totalCnt")); 
//		
//		Assert.assertEquals(3, list.size());
//	}
	
//	@Test
//	public void testAddStarRating()throws Exception{
//		
//		User user = new User();
//		user.setUserNo(11111);
//		
//		Movie movie = new Movie();
//		movie.setMovieNo(10005);
//		
//		WishStarRating wishStarRating = new WishStarRating();
//		
//		wishStarRating.setUserNo(user.getUserNo());
//		wishStarRating.setMovieNo(movie.getMovieNo());
//		wishStarRating.setStarRate(10);
//		
//		movieService.addStarRating(wishStarRating);
//		
//		System.out.println("------------movieService.getStarByUserNo(wishStarRating) : " + movieService.getStarByUserNo(wishStarRating));
//		Assert.assertEquals(10, movieService.getStarByUserNo(wishStarRating).getStarRate());
//		
//		wishStarRating.setStarRate(3);
//		movieService.updateStarRating(wishStarRating);
//		System.out.println("------------movieService.getStarByUserNo(wishStarRating) : " + movieService.getStarByUserNo(wishStarRating));
//		Assert.assertEquals(3, movieService.getStarByUserNo(wishStarRating).getStarRate());
//		
//		wishStarRating.setStarRate(0);
//		movieService.updateStarRating(wishStarRating);
////		Assert.assertEquals(null, movieService.getStarByUserNo(wishStarRating).getStarRate());
//	}
	
//	@Test
//	public void testGetBoxOfficeList()throws Exception{
//		
//		Search search = new Search();
//		search.setCurrentPage(1);
//		search.setPageSize(6);
////		search.setSearchCondition("2");
//		
//		HashMap<String, Object> result = movieService.getBoxOfficeList(search);
//		List<Movie> list = (List<Movie>)result.get("BoxOfficeList");
//		System.out.println("-------- totalCnt"+result.get("totalCnt"));
//		
//		for(Movie mov : list) {
//			System.out.println("--------list ::"+ mov);
//		}
//	}
	
//	@Test
	public void testGetAllofMovieTitle()throws Exception{
		
		List<String> mtList = movieService.getAllofMovieTitle();
		
		int cnt =0;
		for(String mt : mtList) {
			System.out.println(mt);
			cnt ++;
		}
		System.out.println("------ cnt : "+ cnt);
	}
	
	@Test
	public void testSummary()throws Exception{
		String summmary = "벽장 문이 열리고, 아이가 사라졌다!갑작스러운 사고로 아내를 잃은 상원(하정우)과 그의 딸 이나(허율)상원은 소원해진 이나와의 관계를 회복하기 위해 새집으로 이사를 간다.상원은 이나와 가까워지기 위해 노력하지만 어긋난 사이는 좀처럼 회복되지 않는다.그러던 어느 날 이나가 새로운 친구가 생겼다며 웃기 시작한다.하지만 평온도 잠시39503925295u";
		String summarySub = summmary.substring(0, 183);
		summarySub += "...";
		
		System.out.println("==============>"+summmary);
		System.out.println("==============>"+summarySub);
	}
	
}
