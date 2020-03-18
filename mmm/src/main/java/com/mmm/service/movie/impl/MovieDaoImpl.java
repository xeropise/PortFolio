package com.mmm.service.movie.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.mmm.common.Search;
import com.mmm.service.domain.Movie;
import com.mmm.service.domain.User;
import com.mmm.service.domain.WishStarRating;
import com.mmm.service.movie.MovieDao;

@Repository("movieDaoImpl")
public class MovieDaoImpl implements MovieDao {
	
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	///Setter
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println(">>> "+getClass()+".setSqlSession() Call.....");
		
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public MovieDaoImpl() {
		System.out.println(">>> "+getClass()+"  default Contructor Call.....");
	}
	
	
	///Method
	@Override
	public void addMovie(HashMap<String, Object> inputData) throws Exception {
		
		Movie movie = (Movie)(inputData.get("movie"));
		
//		if(movie.getPoster() != null) {
//			String poster = movie.getPoster().get(0);
//		}
		
		sqlSession.insert("MovieMapper.addMovie", ((Movie)inputData.get("movie")));
	}

	@Override
	public Movie getMovieByMovieNo(Movie movie) throws Exception {
		return sqlSession.selectOne("MovieMapper.getMovieByMovieNo", movie);
	}

	@Override
	public Movie getMovieByMovieTitle(Movie movie) throws Exception {
		return sqlSession.selectOne("MovieMapper.getMovieByMovieTitle", movie);
	}

	@Override
	public HashMap<String, Object> getBoxOfficeList(Search search) throws Exception {
		HashMap<String, Object> outputMap = new HashMap<String, Object>();
		
		outputMap.put("list", sqlSession.selectList("MovieMapper.getBoxOfficeList", search) );
		outputMap.put("totalCnt", sqlSession.selectOne("MovieMapper.getTotalCntBoxOffice", search) );
		
		return outputMap;
	}

	@Override
	public void addMovieGenre(HashMap<String, Object> inputData) throws Exception {
		
		int movieNo = ((Movie)inputData.get("movie")).getMovieNo();
		List<String> genreList = (List<String>) (inputData.get("genreList")); 
		
		for(String str:  genreList) {
			
			HashMap<String, Object> genreMap = new HashMap<String, Object>();
			genreMap.put("movieNo", movieNo);
			genreMap.put("genre", str);
			
			sqlSession.insert("MovieMapper.addMovieGenre",genreMap);
		}
	}

	@Override
	public List<String> getMovieGenreList(int movieNo) throws Exception {
		return sqlSession.selectList("MovieMapper.getMovieGenreList", movieNo);
	}

	@Override
	public Movie getPreferMovie(User user) throws Exception {
		
		Movie movie = new Movie();
		ArrayList<String> genreList = new ArrayList<String>();
		
		if(user.getLikeGenre1() != null) { 
			genreList.add(user.getLikeGenre1());
		}
		if(user.getLikeGenre2() != null) {
			genreList.add(user.getLikeGenre2());
		}
		if(user.getLikeGenre3() != null ) {
			genreList.add(user.getLikeGenre3());
		}
		
		System.out.println("--------------------- user's genreList : "+genreList);
		System.out.println("--------------------- genreList SIZE : "+genreList.size());
		
		Map<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("userNo", user.getUserNo());
		inputMap.put("list", genreList);
		
		
		if(genreList.size() != 0 ) {
			System.out.println("------------선호장르 있는 유저는....");
			movie =  sqlSession.selectOne("MovieMapper.getPreferMovie", inputMap);
		}
		if(genreList.size() == 0 || movie == null) {
			System.out.println("------------선호장르가 없는 유저는? ....");
			movie = sqlSession.selectOne("MovieMapper.getPreferMovieWithoutGenre");
		}
		return movie;
	}
	
	@Override
	public void addWish(WishStarRating wishStarRating) throws Exception {
		sqlSession.insert("MovieMapper.addWish", wishStarRating);
	}

	@Override
	public void deleteWish(WishStarRating wishStarRating) throws Exception {
		sqlSession.delete("MovieMapper.deleteWish", wishStarRating);
	}

	@Override
	public int getWishCnt(int movieNo) throws Exception {
		return sqlSession.selectOne("MovieMapper.getWishCnt", movieNo);
	}

	@Override
	public HashMap<String, Object> getWishMovieList(HashMap<String, Object> inputData) throws Exception {
		 
		 HashMap<String, Object> outPutMap = new HashMap<String, Object>();
		 
		 List<Movie> list =  sqlSession.selectList("MovieMapper.getWishMovieList", inputData);
		 
		 int totalCnt = sqlSession.selectOne("MovieMapper.getTotalCntWish", inputData);
		 
		 outPutMap.put("wishMovieList", list);
		 outPutMap.put("totalCnt", totalCnt);
		 return outPutMap;
	}

	@Override
	public void addStarRating(WishStarRating wishStarRating) throws Exception {
		System.out.println("----------> wishStarRating   "+ wishStarRating );
		sqlSession.insert("MovieMapper.addStarRating", wishStarRating);
	}

	@Override
	public void updateStarRating(WishStarRating wishStarRating) throws Exception {
		if (wishStarRating.getStarByUser() == 0) {
			sqlSession.delete("MovieMapper.deleteStarRating", wishStarRating);
		}else {
			sqlSession.update("MovieMapper.updateStarRating", wishStarRating);
		}
	}

	@Override
	public WishStarRating getStarByUserNo(WishStarRating wishStarRating) throws Exception {
		return sqlSession.selectOne("MovieMapper.getStarByUserNo",wishStarRating);
	}

	@Override
	public int checkExistanceMovieDB(Map<String, Object> inputMap) throws Exception {
		return sqlSession.selectOne("MovieMapper.checkExistanceMovieDB",inputMap);
	}

	@Override
	public int updateReleasedMovie() throws Exception {
		return sqlSession.update("MovieMapper.updateReleasedMovie");
	}

	@Override
	public List<String> getAllofMovieTitle() throws Exception {
		return sqlSession.selectList("MovieMapper.getAllofMovieTitle");
	}
	
	
	
}
