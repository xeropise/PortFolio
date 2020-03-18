package com.mmm.service.domain;

import java.sql.Date;

public class Oneline {

	private int onelineNo;
	private int movieNo;
	private String userId;
	private String onelineContent;
	private String onelineDate;
	private int likeCount;
	private int blindStatus;
	
	public int getOnelineNo() {
		return onelineNo;
	}
	public void setOnelineNo(int onelineNo) {
		this.onelineNo = onelineNo;
	}
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOnelineContent() {
		return onelineContent;
	}
	public void setOnelineContent(String onelineContent) {
		this.onelineContent = onelineContent;
	}
	public String getOnelineDate() {
		return onelineDate;
	}
	public void setOnelineDate(String onelineDate) {
		this.onelineDate = onelineDate;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public int getBlindStatus() {
		return blindStatus;
	}
	public void setBlindStatus(int blindStatus) {
		this.blindStatus = blindStatus;
	}
	
	@Override
	public String toString() {
		return "Oneline [onelineNo=" + onelineNo + ", movieNo=" + movieNo + ", userId=" + userId + ", onelineContent="
				+ onelineContent + ", onelineDate=" + onelineDate + ", likeCount=" + likeCount + ", blindStatus="
				+ blindStatus + "]";
	}
	
}
