package com.mmm.service.domain;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public class Ticketing {

	//Field
	private String ticketingNo;
	private String movieName;	
	private String theaterName;
	private String dateTimeNo;
	private String screenTime;
	private String audienceType;
	private String seatType;
	private String seatNo;
	private String totalSeat;
	private int headCount;
	private int ticketingPrice;
	private String ticketingPinNo;
	private String ticketerPhone;
	private Timestamp ticketingDate;
	private Timestamp cancelDate;
	private int ticketingStatus;
	
	public String getTicketingNo() {
		return ticketingNo;
	}
	public String getMovieName() {
		return movieName;
	}
	public String getTheaterName() {
		return theaterName;
	}
	public String getDateTimeNo() {
		return dateTimeNo;
	}
	public String getScreenTime() {
		return screenTime;
	}
	public String getAudienceType() {
		return audienceType;
	}
	public String getSeatType() {
		return seatType;
	}
	public String getSeatNo() {
		return seatNo;
	}
	public String getTotalSeat() {
		return totalSeat;
	}
	public int getHeadCount() {
		return headCount;
	}
	public int getTicketingPrice() {
		return ticketingPrice;
	}
	public String getTicketingPinNo() {
		return ticketingPinNo;
	}
	public String getTicketerPhone() {
		return ticketerPhone;
	}
	public Timestamp getTicketingDate() {
		return ticketingDate;
	}
	public Timestamp getCancelDate() {
		return cancelDate;
	}
	public int getTicketingStatus() {
		return ticketingStatus;
	}
	public void setTicketingNo(String ticketingNo) {
		this.ticketingNo = ticketingNo;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}
	public void setDateTimeNo(String dateTimeNo) {
		this.dateTimeNo = dateTimeNo;
	}
	public void setScreenTime(String screenTime) {
		this.screenTime = screenTime;
	}
	public void setAudienceType(String audienceType) {
		this.audienceType = audienceType;
	}
	public void setSeatType(String seatType) {
		this.seatType = seatType;
	}
	public void setSeatNo(String seatNo) {
		this.seatNo = seatNo;
	}
	public void setTotalSeat(String totalSeat) {
		this.totalSeat = totalSeat;
	}
	public void setHeadCount(int headCount) {
		this.headCount = headCount;
	}
	public void setTicketingPrice(int ticketingPrice) {
		this.ticketingPrice = ticketingPrice;
	}
	public void setTicketingPinNo(String ticketingPinNo) {
		this.ticketingPinNo = ticketingPinNo;
	}
	public void setTicketerPhone(String ticketerPhone) {
		this.ticketerPhone = ticketerPhone;
	}
	public void setTicketingDate(Timestamp ticketingDate) {
		this.ticketingDate = ticketingDate;
	}
	public void setCancelDate(Timestamp cancelDate) {
		this.cancelDate = cancelDate;
	}
	public void setTicketingStatus(int ticketingStatus) {
		this.ticketingStatus = ticketingStatus;
	}
	@Override
	public String toString() {
		return "Ticketing [ticketingNo=" + ticketingNo + ", movieName=" + movieName + ", theaterName=" + theaterName
				+ ", dateTimeNo=" + dateTimeNo + ", screenTime=" + screenTime + ", audienceType=" + audienceType
				+ ", seatType=" + seatType + ", seatNo=" + seatNo + ", totalSeat=" + totalSeat + ", headCount="
				+ headCount + ", ticketingPrice=" + ticketingPrice + ", ticketingPinNo=" + ticketingPinNo
				+ ", ticketerPhone=" + ticketerPhone + ", ticketingDate=" + ticketingDate + ", cancelDate=" + cancelDate
				+ ", ticketingStatus=" + ticketingStatus + "]";
	}
	
	
	


	


	
	

	
	
}
