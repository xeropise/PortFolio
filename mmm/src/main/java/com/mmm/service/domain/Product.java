package com.mmm.service.domain;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Product {
	
	private int prodNo;						// 상품 관리 번호
	private String prodName;				// 상품명
	private Timestamp prodDate;				// 상품 등록 날짜
	private int prodPrice;					// 상품 가격
	private String prodDetail;				// 상품 구성
	private String prodImage;
	private List<MultipartFile> file;		// 상품 이미지
	private int franType;					
	private int prodType;					// 상품 종류   flag -> 0:영관 1:스권 2:스낵
	private int quantity;
	
	
	public Product() {
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public Timestamp getProdDate() {
		return prodDate;
	}

	public void setProdDate(Timestamp prodDate) {
		this.prodDate = prodDate;
	}

	public int getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}

	public String getProdImage() {
		return prodImage;
	}
	
	
	
	public List<MultipartFile> getFile() {
		return file;
	}

	public void setFile(List<MultipartFile> file) {
		this.file = file;
	}

	public void setProdImage(String prodImage) {
		this.prodImage = prodImage;
	}

	public int getFranType() {
		return franType;
	}

	public void setFranType(int franType) {
		this.franType = franType;
	}

	public int getProdType() {
		return prodType;
	}

	public void setProdType(int prodType) {
		this.prodType = prodType;
	}

	public String getProdDetail() {
		return prodDetail;
	}

	public void setProdDetail(String prodDetail) {
		this.prodDetail = prodDetail;
	}

	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "Product [prodNo=" + prodNo + ", prodName=" + prodName + ", prodDate=" + prodDate + ", prodPrice="
				+ prodPrice + ", prodDetail=" + prodDetail + ", prodImage=" + prodImage + ", file=" + file
				+ ", franType=" + franType + ", prodType=" + prodType + ", quantity=" + quantity + "]";
	}


	
	
	
}
