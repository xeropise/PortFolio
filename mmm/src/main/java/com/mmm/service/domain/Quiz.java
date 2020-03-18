package com.mmm.service.domain;

import java.sql.Timestamp;

public class Quiz {
	
	private int quizNo; //퀴즈 관리번호
	private String question; //퀴즈 문제
	private String optionFirst; //보기 1번
	private String optionSecond; //보기 2번
	private String optionThird; //보기 3번
	private String optionFourth; //보기 4번
	private Timestamp quizStartDate; //퀴즈 참여 시작 일자
	private String quizStDate;
	private int answer; //정답 (1번:1, 2번:2 ...)
	private Timestamp quizDate; //퀴즈 등록 일시
	private String qDate;
	private int partFlag; //참여했는지..
	private int quizStatus; //삭제했는지.
	
	
	public int getQuizStatus() {
		return quizStatus;
	}
	public void setQuizStatus(int quizStatus) {
		this.quizStatus = quizStatus;
	}
	public int getPartFlag() {
		return partFlag;
	}
	public void setPartFlag(int partFlag) {
		this.partFlag = partFlag;
	}
	public String getqDate() {
		return qDate;
	}
	public void setqDate(String qDate) {
		this.qDate = qDate;
	}


	private int quizFlag; //퀴즈 상태 (0:진행중 1:마감) 
	
	private int earningPoint; //정답을 맞혔을 시 적립될 포인트 
	public int getQuizNo() {
		return quizNo;
	}
	public void setQuizNo(int quizNo) {
		this.quizNo = quizNo;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getOptionFirst() {
		return optionFirst;
	}
	public void setOptionFirst(String optionFirst) {
		this.optionFirst = optionFirst;
	}
	public String getOptionSecond() {
		return optionSecond;
	}
	public void setOptionSecond(String optionSecond) {
		this.optionSecond = optionSecond;
	}
	public String getOptionThird() {
		return optionThird;
	}
	public void setOptionThird(String optionThird) {
		this.optionThird = optionThird;
	}
	public String getOptionFourth() {
		return optionFourth;
	}
	public void setOptionFourth(String optionFourth) {
		this.optionFourth = optionFourth;
	}
	public Timestamp getQuizStartDate() {
		return quizStartDate;
	}
	public void setQuizStartDate(Timestamp quizStartDate) {
		this.quizStartDate = quizStartDate;
		if(quizStartDate!=null) {
			quizStDate = quizStartDate.toString().substring(0,10);
		}
	}

	public int getAnswer() {
		return answer;
	}
	public void setAnswer(int answer) {
		this.answer = answer;
	}
	public Timestamp getQuizDate() {
		return quizDate;
	}
	public void setQuizDate(Timestamp quizDate) {
		this.quizDate = quizDate;
		if(quizDate!=null) {
			qDate = quizDate.toString().substring(0,16);
		}
	}
	public int getQuizFlag() {
		return quizFlag;
	}
	public void setQuizFlag(int quizFlag) {
		this.quizFlag = quizFlag;
	}
	public int getEarningPoint() {
		return earningPoint;
	}
	public void setEarningPoint(int earningPoint) {
		this.earningPoint = earningPoint;
	}
	
	public String getQuizStDate() {
		return quizStDate;
	}
	public void setQuizStDate(String quizStDate) {
		this.quizStDate = quizStDate;
	}
	
	
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Quiz [quizNo=");
		builder.append(quizNo);
		builder.append(", question=");
		builder.append(question);
		builder.append(", optionFirst=");
		builder.append(optionFirst);
		builder.append(", optionSecond=");
		builder.append(optionSecond);
		builder.append(", optionThird=");
		builder.append(optionThird);
		builder.append(", optionFourth=");
		builder.append(optionFourth);
		builder.append(", quizStartDate=");
		builder.append(quizStartDate);
		builder.append(", quizStDate=");
		builder.append(quizStDate);
		builder.append(", answer=");
		builder.append(answer);
		builder.append(", quizDate=");
		builder.append(quizDate);
		builder.append(", qDate=");
		builder.append(qDate);
		builder.append(", partFlag=");
		builder.append(partFlag);
		builder.append(", quizStatus=");
		builder.append(quizStatus);
		builder.append(", quizFlag=");
		builder.append(quizFlag);
		builder.append(", earningPoint=");
		builder.append(earningPoint);
		builder.append("]");
		return builder.toString();
	}

	
	
}
