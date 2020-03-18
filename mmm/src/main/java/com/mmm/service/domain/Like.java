package com.mmm.service.domain;

public class Like {
	
	private int likeNo;
	private String userId;
	private int articleNo;
	private int commentNo;
//	private int onelineNo; //필요없어..
	private String likeDate;
	private int userNo;
	
	
	
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getArticleNo() {
		return articleNo;
	}
	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
//	public int getOnelineNo() {
//		return onelineNo;
//	}
//	public void setOnelineNo(int onelineNo) {
//		this.onelineNo = onelineNo;
//	}
	
	public String getLikeDate() {
		return likeDate;
	}
	public void setLikeDate(String likeDate) {
		this.likeDate = likeDate;
	}
	
	@Override
	public String toString() {
		return "Like [userId=" + userId + ", articleNo=" + articleNo + ", commentNo=" + commentNo + ", onelineNo="
				+ "]";
	}
	
	
}
