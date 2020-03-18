package com.mmm.service.domain;

import java.sql.Timestamp;

public class WishStarRating {
	
	private int wishNo;
	private int starRatingNo;
	private int userNo;
	private int movieNo;
	private int starByUser;
	private Timestamp wishDate;
	private Timestamp ratingDate;
	
	
	public int getWishNo() {
		return wishNo;
	}
	public void setWishNo(int wishNo) {
		this.wishNo = wishNo;
	}
	public int getStarRatingNo() {
		return starRatingNo;
	}
	public void setStarRatingNo(int starRatingNo) {
		this.starRatingNo = starRatingNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public int getStarByUser() {
		return starByUser;
	}
	public void setStarByUser(int starByUser) {
		this.starByUser = starByUser;
	}
	public Timestamp getWishDate() {
		return wishDate;
	}
	public void setWishDate(Timestamp wishDate) {
		this.wishDate = wishDate;
	}
	public Timestamp getRatingDate() {
		return ratingDate;
	}
	public void setRatingDate(Timestamp ratingDate) {
		this.ratingDate = ratingDate;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("WishStarRating [wishNo=");
		builder.append(wishNo);
		builder.append(", starRatingNo=");
		builder.append(starRatingNo);
		builder.append(", userNo=");
		builder.append(userNo);
		builder.append(", movieNo=");
		builder.append(movieNo);
		builder.append(", starByUser=");
		builder.append(starByUser);
		builder.append(", wishDate=");
		builder.append(wishDate);
		builder.append(", ratingDate=");
		builder.append(ratingDate);
		builder.append("]");
		return builder.toString();
	}
	
	
	
	
	
	
	
	
}
