package com.mmm.service.domain;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Article {
	
	private int articleNo; 
	private int replyNo;
	
	private String userId;
	private int userNo;
	private int articleStatus;
	private int articleType;
	private int category;
	private String articleTitle;
	private String content; 
	private List<String> files;
	private String articleDate;
	private String deleteDate;
	private int viewCount;
	private int likeCount;
	private int commentCount;
	private int movieNo;
	private int blindStatus;
	private int blindReason;
	private String blindDate;
	private int supArticleNo;
	private int qnaStatus; //1:1문의글 답변 상태
	private List<MultipartFile> file; //이미지 파일   
	private String previewImage; //시사회 이미지 URI
	
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public String getPreviewImage() {
		return previewImage;
	}
	public void setPreviewImage(String previewImage) {
		this.previewImage = previewImage;
	}
	public List<MultipartFile> getFile() {
		return file;
	}
	public void setFile(List<MultipartFile> file) {
		this.file = file;
	}
	public String getBlindDate() {
		return blindDate;
	}
	public void setBlindDate(String blindDate) {
		this.blindDate = blindDate;
	}
	public int getBlindReason() {
		return blindReason;
	}
	public void setBlindReason(int blindReason) {
		this.blindReason = blindReason;
	}
	public String getDeleteDate() {
		return deleteDate;
	}
	public void setDeleteDate(String deleteDate) {
		this.deleteDate = deleteDate;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getArticleStatus() {
		return articleStatus;
	}
	public void setArticleStatus(int articleStatus) {
		this.articleStatus = articleStatus;
	}
	public int getArticleNo() {
		return articleNo;
	}
	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getArticleType() {
		return articleType;
	}
	public void setArticleType(int articleType) {
		this.articleType = articleType;
	}
	public String getArticleTitle() {
		return articleTitle;
	}
	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public List<String> getFiles() {
		return files;
	}
	public void setFiles(List<String> files) {
		this.files = files;
	}
	public String getArticleDate() {
		return articleDate;
	}
	public void setArticleDate(String articleDate) {
		this.articleDate = articleDate;
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
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public int getBlindStatus() {
		return blindStatus;
	}
	public void setBlindStatus(int blindStatus) {
		this.blindStatus = blindStatus;
	}
	public int getSupArticleNo() {
		return supArticleNo;
	}
	public void setSupArticleNo(int supArticleNo) {
		this.supArticleNo = supArticleNo;
	}
	public int getQnaStatus() {
		return qnaStatus;
	}
	public void setQnaStatus(int qnaStatus) {
		this.qnaStatus = qnaStatus;
	}
	
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Article [articleNo=");
		builder.append(articleNo);
		builder.append(", replyNo=");
		builder.append(replyNo);
		builder.append(", userId=");
		builder.append(userId);
		builder.append(", userNo=");
		builder.append(userNo);
		builder.append(", articleStatus=");
		builder.append(articleStatus);
		builder.append(", articleType=");
		builder.append(articleType);
		builder.append(", category=");
		builder.append(category);
		builder.append(", articleTitle=");
		builder.append(articleTitle);
		builder.append(", content=");
		builder.append(content);
		builder.append(", files=");
		builder.append(files);
		builder.append(", articleDate=");
		builder.append(articleDate);
		builder.append(", deleteDate=");
		builder.append(deleteDate);
		builder.append(", viewCount=");
		builder.append(viewCount);
		builder.append(", likeCount=");
		builder.append(likeCount);
		builder.append(", commentCount=");
		builder.append(commentCount);
		builder.append(", movieNo=");
		builder.append(movieNo);
		builder.append(", blindStatus=");
		builder.append(blindStatus);
		builder.append(", blindReason=");
		builder.append(blindReason);
		builder.append(", blindDate=");
		builder.append(blindDate);
		builder.append(", supArticleNo=");
		builder.append(supArticleNo);
		builder.append(", qnaStatus=");
		builder.append(qnaStatus);
		builder.append(", file=");
		builder.append(file);
		builder.append(", previewImage=");
		builder.append(previewImage);
		builder.append("]");
		return builder.toString();
	}
	
	
	

	
}
