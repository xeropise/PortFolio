package com.mmm.service.movie;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mmm.common.Search;
import com.mmm.service.domain.Movie;
import com.mmm.service.domain.User;
import com.mmm.service.domain.WishStarRating;

public interface MovieService {

	public void addMovie(HashMap<String, Object> inputData) throws Exception;
	
	public Movie getMovieByMovieNo(Movie movie) throws Exception;
	
	public Movie getMovieByMovieTitle(Movie movie) throws Exception;
	
	public HashMap<String, Object> getBoxOfficeList(Search search)throws Exception;
	
	public List<String> getGenreMovieList(int movieNo) throws Exception;
	
	public Movie getPreferMovie(User user) throws Exception;
	
	public void addWish(WishStarRating wishStarRating) throws Exception;
	
	public void deleteWish(WishStarRating wishStarRating) throws Exception;
	
	public int getWishCnt(int movieNo)throws Exception;
	
	public HashMap<String, Object> getWishMovieList(HashMap<String, Object> inputData)throws Exception;
	
	public void addStarRating(WishStarRating wishStarRating)throws Exception;
	
	public void updateStarRating(WishStarRating wishStarRating)throws Exception;
	
	public WishStarRating getStarByUserNo(WishStarRating wishStarRating)throws Exception;
	
	public int checkExistanceMovieDB(Map<String, Object> inputMap)throws Exception;
	
	public int updateReleasedMovie()throws Exception;
	
	public List<String> getAllofMovieTitle()throws Exception;
	
}
