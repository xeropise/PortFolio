package com.mmm.service.domain;


import java.sql.Timestamp;

public class DateTime {
	
	private String dateTimeNo;
	private String movieName; //기생충
	private String poster; //포스터 
	private String rating; //등급
	private String franchise;
	private String theaterName; //CGV 강남
	private String screenName; //1관
	private Timestamp screenDate; //01-26
	private Timestamp screenTime;  // 07:30
	private int remainingSeat; //130
	private String selectedSeat; //A3,A4
	
	public String getDateTimeNo() {
		return dateTimeNo;
	}
	public String getMovieName() {
		return movieName;
	}
	public String getPoster() {
		return poster;
	}
	public String getRating() {
		return rating;
	}
	public String getFranchise() {
		return franchise;
	}
	public String getTheaterName() {
		return theaterName;
	}
	public String getScreenName() {
		return screenName;
	}
	public Timestamp getScreenDate() {
		return screenDate;
	}
	public Timestamp getScreenTime() {
		return screenTime;
	}
	public int getRemainingSeat() {
		return remainingSeat;
	}
	public String getSelectedSeat() {
		return selectedSeat;
	}
	public void setDateTimeNo(String dateTimeNo) {
		this.dateTimeNo = dateTimeNo;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public void setFranchise(String franchise) {
		this.franchise = franchise;
	}
	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}
	public void setScreenName(String screenName) {
		this.screenName = screenName;
	}
	public void setScreenDate(Timestamp screenDate) {
		this.screenDate = screenDate;
	}
	public void setScreenTime(Timestamp screenTime) {
		this.screenTime = screenTime;
	}
	public void setRemainingSeat(int remainingSeat) {
		this.remainingSeat = remainingSeat;
	}
	public void setSelectedSeat(String selectedSeat) {
		this.selectedSeat = selectedSeat;
	}
	
	@Override
	public String toString() {
		return "DateTime [dateTimeNo=" + dateTimeNo + ", movieName=" + movieName + ", poster=" + poster + ", rating="
				+ rating + ", franchise=" + franchise + ", theaterName=" + theaterName + ", screenName=" + screenName
				+ ", screenDate=" + screenDate + ", screenTime=" + screenTime + ", remainingSeat=" + remainingSeat
				+ ", selectedSeat=" + selectedSeat + "]";
	}
	

	

	
	

	

	
	
}
