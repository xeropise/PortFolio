package com.mmm.service.movie.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mmm.common.Search;
import com.mmm.service.domain.Movie;
import com.mmm.service.domain.User;
import com.mmm.service.domain.WishStarRating;
import com.mmm.service.movie.MovieDao;
import com.mmm.service.movie.MovieService;

@Service("movieServiceImpl")
public class MovieServiceImpl implements MovieService {
	
	///Field
	@Autowired
	@Qualifier("movieDaoImpl")
	private MovieDao movieDao;
	
	///Setter
	public void setMovieDao(MovieDao movieDao) {
		System.out.println(">>> "+getClass()+".setMovieDao() Call.....");
		this.movieDao = movieDao;
	}
	
	
	///Constructor
	public MovieServiceImpl() {
		System.out.println(">>> "+getClass()+"  default Contructor Call.....");
	}


	///Method
	@Override
	public void addMovie(HashMap<String, Object> inputData) throws Exception {
		movieDao.addMovie(inputData);
		movieDao.addMovieGenre(inputData);
	}


	@Override
	public Movie getMovieByMovieNo(Movie movie) throws Exception {
		return movieDao.getMovieByMovieNo(movie);
	}

	@Override
	public Movie getMovieByMovieTitle(Movie movie) throws Exception {
		return movieDao.getMovieByMovieTitle(movie);
	}
	
	@Override
	public HashMap<String, Object> getBoxOfficeList(Search search) throws Exception {
		return movieDao.getBoxOfficeList(search);
	}

	@Override
	public List<String> getGenreMovieList(int movieNo) throws Exception {
		return movieDao.getMovieGenreList(movieNo);
	}
	
	@Override
	public Movie getPreferMovie(User user) throws Exception {
		
		Movie movie = movieDao.getPreferMovie(user);
		System.out.println("---------------movie : "+ movie);
		System.out.println("---------------movie.setUserNo(user.getUserNo())  : "+ user.getUserNo());
		movie.setUserNo(user.getUserNo());
		Movie outPutMovie = movieDao.getMovieByMovieNo(movie);
		
		return outPutMovie;
	}

	@Override
	public void addWish(WishStarRating wishStarRating) throws Exception {
		movieDao.addWish(wishStarRating);
	}

	@Override
	public void deleteWish(WishStarRating wishStarRating) throws Exception {
		movieDao.deleteWish(wishStarRating);
	}

	@Override
	public int getWishCnt(int movieNo) throws Exception {
		return movieDao.getWishCnt(movieNo);
	}

	@Override
	public HashMap<String, Object> getWishMovieList(HashMap<String, Object> inputData) throws Exception {
		return movieDao.getWishMovieList(inputData);
	}

	@Override
	public void addStarRating(WishStarRating wishStarRating) throws Exception {
		movieDao.addStarRating(wishStarRating);
	}

	@Override
	public void updateStarRating(WishStarRating wishStarRating) throws Exception {
		movieDao.updateStarRating(wishStarRating);
	}

	@Override
	public WishStarRating getStarByUserNo(WishStarRating wishStarRating) throws Exception {
		return movieDao.getStarByUserNo(wishStarRating);
	}

	@Override
	public int checkExistanceMovieDB(Map<String, Object> inputMap) throws Exception {
		return movieDao.checkExistanceMovieDB(inputMap);
	}

	@Override
	public int updateReleasedMovie() throws Exception {
		return movieDao.updateReleasedMovie();
	}


	@Override
	public List<String> getAllofMovieTitle() throws Exception {
		return movieDao.getAllofMovieTitle();
	}
	
	

	
	
}
