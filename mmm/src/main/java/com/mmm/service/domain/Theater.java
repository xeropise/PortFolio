package com.mmm.service.domain;

public class Theater {
	
	private String theaterNo;
	private String franchise;
	private String theaterName;
	private String theaterPhone;
	private String positionX;
	private String positionY;
	private String address;
	private String roadAddress;
	private String placeUrl;
	private String id;
	
	public String getTheaterNo() {
		return theaterNo;
	}
	public String getFranchise() {
		return franchise;
	}
	public String getTheaterName() {
		return theaterName;
	}
	public String getTheaterPhone() {
		return theaterPhone;
	}
	public String getPositionX() {
		return positionX;
	}
	public String getPositionY() {
		return positionY;
	}
	public String getAddress() {
		return address;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public String getPlaceUrl() {
		return placeUrl;
	}
	public String getId() {
		return id;
	}
	public void setTheaterNo(String theaterNo) {
		this.theaterNo = theaterNo;
	}
	public void setFranchise(String franchise) {
		this.franchise = franchise;
	}
	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}
	public void setTheaterPhone(String theaterPhone) {
		this.theaterPhone = theaterPhone;
	}
	public void setPositionX(String positionX) {
		this.positionX = positionX;
	}
	public void setPositionY(String positionY) {
		this.positionY = positionY;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public void setPlaceUrl(String placeUrl) {
		this.placeUrl = placeUrl;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		return "Theater [theaterNo=" + theaterNo + ", franchise=" + franchise + ", theaterName=" + theaterName
				+ ", theaterPhone=" + theaterPhone + ", positionX=" + positionX + ", positionY=" + positionY
				+ ", address=" + address + ", roadAddress=" + roadAddress + ", placeUrl=" + placeUrl + ", id=" + id
				+ "]";
	}
	

	
	
	
}
