package com.mmm.service.domain;


public class Comment {
	
	private int commentNo;
	private int commentType;	// 0 : 댓글,  2: 한줄평
	private String userId;
	private int userNo;
	private int supCommentNo;
	private int movieNo;
	private String movieTitle;
	private int articleNo;
	private String commentContent;
	private String commentDate;
	private int likeCount;
	private int commentCount;
	private int blindStatus;
	
	
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getCommentType() {
		return commentType;
	}
	public void setCommentType(int commentType) {
		this.commentType = commentType;
	}
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getSupCommentNo() {
		return supCommentNo;
	}
	public void setSupCommentNo(int supCommentNo) {
		this.supCommentNo = supCommentNo;
	}
	public int getArticleNo() {
		return articleNo;
	}
	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}
	
	public String getMovieTitle() {
		return movieTitle;
	}
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public int getBlindStatus() {
		return blindStatus;
	}
	public void setBlindStatus(int blindStatus) {
		this.blindStatus = blindStatus;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Comment [commentNo=");
		builder.append(commentNo);
		builder.append(", commentType=");
		builder.append(commentType);
		builder.append(", userId=");
		builder.append(userId);
		builder.append(", userNo=");
		builder.append(userNo);
		builder.append(", supCommentNo=");
		builder.append(supCommentNo);
		builder.append(", movieNo=");
		builder.append(movieNo);
		builder.append(", movieTitle=");
		builder.append(movieTitle);
		builder.append(", articleNo=");
		builder.append(articleNo);
		builder.append(", commentContent=");
		builder.append(commentContent);
		builder.append(", commentDate=");
		builder.append(commentDate);
		builder.append(", likeCount=");
		builder.append(likeCount);
		builder.append(", commentCount=");
		builder.append(commentCount);
		builder.append(", blindStatus=");
		builder.append(blindStatus);
		builder.append("]");
		return builder.toString();
	} 
	
	
}
