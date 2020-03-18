package com.mmm.service.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class Point {

	///Field
	private int pointNo;
	private int userNo;
	private String pointStatus;	//포인트의 상태를 알려준다.
								//	S0 : 적립-현금결제	//S1 : 적립-출석체크 //S2 : 적립-영화퀴즈
								//	U0 : 사용 - 포인트결제	
	private int cancelFlag;
	private int paymentNo;		// nullable... 출석체크, 영화퀴즈
	private int partPoint;
	private int totalPoint;
	private String pointDate;
	private String cancelDate;
	
	
	///Constructor
	public Point() {
	}


	public int getPointNo() {
		return pointNo;
	}


	public void setPointNo(int pointNo) {
		this.pointNo = pointNo;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getPointStatus() {
		return pointStatus;
	}


	public void setPointStatus(String pointStatus) {
		this.pointStatus = pointStatus;
	}


	public int getPaymentNo() {
		return paymentNo;
	}


	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}


	public int getPartPoint() {
		return partPoint;
	}


	public void setPartPoint(int partPoint) {
		this.partPoint = partPoint;
	}


	public int getTotalPoint() {
		return totalPoint;
	}


	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}


	public String getPointDate() {
		return pointDate;
	}


	public void setPointDate(String pointDate) {
		this.pointDate = pointDate;
	}


	public String getCancelDate() {
		return cancelDate;
	}


	public void setCancelDate(String cancelDate) {
		this.cancelDate = cancelDate;
	}

	public int getCancelFlag() {
		return cancelFlag;
	}


	public void setCancelFlag(int cancelFlag) {
		this.cancelFlag = cancelFlag;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Point [pointNo=");
		builder.append(pointNo);
		builder.append(", userNo=");
		builder.append(userNo);
		builder.append(", pointStatus=");
		builder.append(pointStatus);
		builder.append(", paymentNo=");
		builder.append(paymentNo);
		builder.append(", partPoint=");
		builder.append(partPoint);
		builder.append(", totalPoint=");
		builder.append(totalPoint);
		builder.append(", pointDate=");
		builder.append(pointDate);
		builder.append(", cancelDate=");
		builder.append(cancelDate);
		builder.append(", cancelFlag=");
		builder.append(cancelFlag);
		builder.append("]");
		return builder.toString();
	}
	
	
	///Getter Setter
	
	
}
