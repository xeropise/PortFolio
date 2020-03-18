package com.mmm.service.domain;

import java.sql.Timestamp;

public class Inventory {
	
	private int inventoryNo;				// 보관함관리번호
	private int inventoryUserNo;			// 유저관리번호
	private int inventoryProdNo;			// 상품관리번호
	private int inventoryPurchaseNo;		// 구매관리번호
	private String inventoryProdPinNo;		// 상품 핀 번호	
	private Timestamp inventoryRegDate;		// 생성일자
	private Timestamp inventoryUsedDate;	// 사용일자
	private String inventoryStatus;			// 0:미사용, 1:사용
	
	private int inventoryPrice;
	private String inventoryName;
	
	public int getInventoryNo() {
		return inventoryNo;
	}
	public int getInventoryUserNo() {
		return inventoryUserNo;
	}
	public int getInventoryProdNo() {
		return inventoryProdNo;
	}
	public String getInventoryProdPinNo() {
		return inventoryProdPinNo;
	}
	public int getInventoryPurchaseNo() {
		return inventoryPurchaseNo;
	}
	public Timestamp getInventoryRegDate() {
		return inventoryRegDate;
	}
	public Timestamp getInventoryUsedDate() {
		return inventoryUsedDate;
	}
	public String getInventoryStatus() {
		return inventoryStatus;
	}
	public void setInventoryNo(int inventoryNo) {
		this.inventoryNo = inventoryNo;
	}
	public void setInventoryUserNo(int inventoryUserNo) {
		this.inventoryUserNo = inventoryUserNo;
	}
	public void setInventoryProdNo(int inventoryProdNo) {
		this.inventoryProdNo = inventoryProdNo;
	}
	public void setInventoryProdPinNo(String inventoryProdPinNo) {
		this.inventoryProdPinNo = inventoryProdPinNo;
	}
	public void setInventoryPurchaseNo(int inventoryPurchaseNo) {
		this.inventoryPurchaseNo = inventoryPurchaseNo;
	}
	public void setInventoryRegDate(Timestamp inventoryRegDate) {
		this.inventoryRegDate = inventoryRegDate;
	}
	public void setInventoryUsedDate(Timestamp inventoryUsedDate) {
		this.inventoryUsedDate = inventoryUsedDate;
	}
	public void setInventoryStatus(String inventoryStatus) {
		this.inventoryStatus = inventoryStatus;
	}
	
	public int getInventoryPrice() {
		return inventoryPrice;
	}
	public void setInventoryPrice(int inventoryPrice) {
		this.inventoryPrice = inventoryPrice;
	}
	public String getInventoryName() {
		return inventoryName;
	}
	public void setInventoryName(String inventoryName) {
		this.inventoryName = inventoryName;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Inventory [inventoryNo=");
		builder.append(inventoryNo);
		builder.append(", inventoryUserNo=");
		builder.append(inventoryUserNo);
		builder.append(", inventoryProdNo=");
		builder.append(inventoryProdNo);
		builder.append(", inventoryPurchaseNo=");
		builder.append(inventoryPurchaseNo);
		builder.append(", inventoryProdPinNo=");
		builder.append(inventoryProdPinNo);
		builder.append(", inventoryRegDate=");
		builder.append(inventoryRegDate);
		builder.append(", inventoryUsedDate=");
		builder.append(inventoryUsedDate);
		builder.append(", inventoryStatus=");
		builder.append(inventoryStatus);
		builder.append(", inventoryPrice=");
		builder.append(inventoryPrice);
		builder.append(", inventoryName=");
		builder.append(inventoryName);
		builder.append("]");
		return builder.toString();
	}
	



	

	
}
