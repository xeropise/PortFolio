package com.mmm.service.domain;


public class Blind {
	
	private int articleNo;
	private int commentNo;
	private int onelineNo;
	private int blindReason;
	private String blindDate;
	
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
	public int getOnelineNo() {
		return onelineNo;
	}
	public void setOnelineNo(int onelineNo) {
		this.onelineNo = onelineNo;
	}
	public int getBlindReason() {
		return blindReason;
	}
	public void setBlindReason(int blindReason) {
		this.blindReason = blindReason;
	}
	public String getBlindDate() {
		return blindDate;
	}
	public void setBlindDate(String blindDate) {
		this.blindDate = blindDate;
	}
	
	@Override
	public String toString() {
		return "Blind [articleNo=" + articleNo + ", commentNo=" + commentNo + ", onelineNo=" + onelineNo
				+ ", blindReason=" + blindReason + ", blindDate=" + blindDate + "]";
	}

	
	
}
