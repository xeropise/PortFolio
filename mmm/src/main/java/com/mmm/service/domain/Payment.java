package com.mmm.service.domain;

import java.util.Date;
import java.util.List;

public class Payment {

//	Field
	private int paymentNo;
	private int userNo;
	private int payStatus;
	private Ticketing ticketing;
	private Purchase purchase;
	private String payDate;
	private String cancelDate;
	private int cash;
	private int usingPoint;
	private int savingPoint;
	private int payMethod;	// 0: cash	1: point	2: voucher	3: cash+point
							// 4: cash+voucher		5: point+voucher	6: cash+point+voucher
//	private List<Integer> mVoucherNo;	//영화 관람권 핀 번호
//	private List<Integer> pVoucherNo;	// 스토어 이용권 핀 번호
	private String vouchers;
	private String usingVoucherFirst;
	private String usingVoucherSecond;
	private String usingVoucherThird;
	private int totalPrice;
	
	private String impUid;		// 아이엠포트에서 각 결제별 식별성을 띄는 코드
	private int payObjectFlag;		//0 : ticketing 1: purchase  2:ticketing + purchase

	
//	Getter Setter
	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(int payStatus) {
		this.payStatus = payStatus;
	}

	public Ticketing getTicketing() {
		return ticketing;
	}

	public void setTicketing(Ticketing ticketing) {
		this.ticketing = ticketing;
	}

	public Purchase getPurchase() {
		return purchase;
	}

	public void setPurchase(Purchase purchase) {
		this.purchase = purchase;
	}

	public String getPayDate() {
		return payDate;
	}

	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}

	public String getCancelDate() {
		return cancelDate;
	}

	public void setCancelDate(String cancelDate) {
		this.cancelDate = cancelDate;
	}

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}

	public int getUsingPoint() {
		return usingPoint;
	}

	public void setUsingPoint(int usingPoint) {
		this.usingPoint = usingPoint;
	}

	public int getSavingPoint() {
		return savingPoint;
	}

	public void setSavingPoint(int savingPoint) {
		this.savingPoint = savingPoint;
	}

	public int getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(int payMethod) {
		this.payMethod = payMethod;
	}

//	public List<Integer> getmVoucherNo() {
//		return mVoucherNo;
//	}
//
//	public void setmVoucherNo(List<Integer> mVoucherNo) {
//		this.mVoucherNo = mVoucherNo;
//	}
//
//	public List<Integer> getpVoucherNo() {
//		return pVoucherNo;
//	}
//
//	public void setpVoucherNo(List<Integer> pVoucherNo) {
//		this.pVoucherNo = pVoucherNo;
//	}


	public String getUsingVoucherFirst() {
		return usingVoucherFirst;
	}

	public String getVouchers() {
		return vouchers;
	}

	public void setVouchers(String vouchers) {
		this.vouchers = vouchers;
	}

	public void setUsingVoucherFirst(String usingVoucherFirst) {
		this.usingVoucherFirst = usingVoucherFirst;
	}

	public String getUsingVoucherSecond() {
		return usingVoucherSecond;
	}

	public void setUsingVoucherSecond(String usingVoucherSecond) {
		this.usingVoucherSecond = usingVoucherSecond;
	}

	public String getUsingVoucherThird() {
		return usingVoucherThird;
	}

	public void setUsingVoucherThird(String usingVoucherThird) {
		this.usingVoucherThird = usingVoucherThird;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}


	public int getPayObjectFlag() {
		return payObjectFlag;
	}

	public void setPayObjectFlag(int payObjectFlag) {
		this.payObjectFlag = payObjectFlag;
	}

	public String getImpUid() {
		return impUid;
	}

	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Payment [paymentNo=");
		builder.append(paymentNo);
		builder.append(", userNo=");
		builder.append(userNo);
		builder.append(", payStatus=");
		builder.append(payStatus);
		builder.append(", ticketing=");
		builder.append(ticketing);
		builder.append(", purchase=");
		builder.append(purchase);
		builder.append(", payDate=");
		builder.append(payDate);
		builder.append(", cancelDate=");
		builder.append(cancelDate);
		builder.append(", cash=");
		builder.append(cash);
		builder.append(", usingPoint=");
		builder.append(usingPoint);
		builder.append(", savingPoint=");
		builder.append(savingPoint);
		builder.append(", payMethod=");
		builder.append(payMethod);
		builder.append(", vouchers=");
		builder.append(vouchers);
		builder.append(", usingVoucherFirst=");
		builder.append(usingVoucherFirst);
		builder.append(", usingVoucherSecond=");
		builder.append(usingVoucherSecond);
		builder.append(", usingVoucherThird=");
		builder.append(usingVoucherThird);
		builder.append(", totalPrice=");
		builder.append(totalPrice);
		builder.append(", impUid=");
		builder.append(impUid);
		builder.append(", payObjectFlag=");
		builder.append(payObjectFlag);
		builder.append("]");
		return builder.toString();
	}
	
	
}
