package com.mmm.service.domain;

import java.sql.Timestamp;

public class Participation {


	private int partNo;
	private int userNo;
	private int previewNo;
	private String previewName;
	private int quizNo;
	private int partType;
	private Timestamp partDate;
	private String partStrDate;
	private int winningFlag; //당첨여부
	private int choice; //선택한 답안
	private double totalQuizCount;
	private double winQuizCount;
	
	public String getPartStrDate() {
		return partStrDate;
	}
	public void setPartStrDate(String partStrDate) {
		this.partStrDate = partStrDate;
	}
	public int getPartNo() {
		return partNo;
	}
	public void setPartNo(int partNo) {
		this.partNo = partNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getPreviewNo() {
		return previewNo;
	}
	public void setPreviewNo(int previewNo) {
		this.previewNo = previewNo;
	}
	public int getQuizNo() {
		return quizNo;
	}
	public void setQuizNo(int quizNo) {
		this.quizNo = quizNo;
	}
	public Timestamp getPartDate() {
		return partDate;
	}
	
	public void setPartDate(Timestamp partDate) {
		this.partDate = partDate;
		if(partDate!=null) {
			partStrDate = partDate.toString().substring(0, 16);
		}
	}
	
	public int getWinningFlag() {
		return winningFlag;
	}
	public void setWinningFlag(int winningFlag) {
		this.winningFlag = winningFlag;
	}
	public int getChoice() {
		return choice;
	}
	public void setChoice(int choice) {
		this.choice = choice;
	}
	
	public int getPartType() {
		return partType;
	}
	
	public void setPartType(int partType) {
		this.partType = partType;
	}
	
	public double getTotalQuizCount() {
		return totalQuizCount;
	}
	
	public void setTotalQuizCount(double totalQuizCount) {
		this.totalQuizCount = totalQuizCount;
	}
	
	public double getWinQuizCount() {
		return winQuizCount;
	}
	public void setWinQuizCount(double winQuizCount) {
		this.winQuizCount = winQuizCount;
	}
	
	public String getPreviewName() {
		return previewName;
	}
	public void setPreviewName(String previewName) {
		this.previewName = previewName;
	}
	
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Participation [partNo=");
		builder.append(partNo);
		builder.append(", userNo=");
		builder.append(userNo);
		builder.append(", previewNo=");
		builder.append(previewNo);
		builder.append(", previewName=");
		builder.append(previewName);
		builder.append(", quizNo=");
		builder.append(quizNo);
		builder.append(", partType=");
		builder.append(partType);
		builder.append(", partDate=");
		builder.append(partDate);
		builder.append(", partStrDate=");
		builder.append(partStrDate);
		builder.append(", winningFlag=");
		builder.append(winningFlag);
		builder.append(", choice=");
		builder.append(choice);
		builder.append(", totalQuizCount=");
		builder.append(totalQuizCount);
		builder.append(", winQuizCount=");
		builder.append(winQuizCount);
		builder.append("]");
		return builder.toString();
	}


	

	

}
