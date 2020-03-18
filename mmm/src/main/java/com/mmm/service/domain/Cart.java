package com.mmm.service.domain;

import java.sql.Timestamp;
import java.util.List;

public class Cart {

		private int cartNo;							// 장바구니 관리번호
		private int	cartUserNo;						// 회원관리번호 
		private int cartProdNo;						// 상품관리번호
		private int cartProdQuantity;	  		    // 상품구매수량
		private Timestamp cartRegDate;				// 카트 등록 날짜
		
		public int getCartNo() {
			return cartNo;
		}
		public int getCartUserNo() {
			return cartUserNo;
		}
		public int getCartProdNo() {
			return cartProdNo;
		}
		public int getCartProdQuantity() {
			return cartProdQuantity;
		}
		public Timestamp getCartRegDate() {
			return cartRegDate;
		}
		public void setCartNo(int cartNo) {
			this.cartNo = cartNo;
		}
		public void setCartUserNo(int cartUserNo) {
			this.cartUserNo = cartUserNo;
		}
		public void setCartProdNo(int cartProdNo) {
			this.cartProdNo = cartProdNo;
		}
		public void setCartProdQuantity(int cartProdQuantity) {
			this.cartProdQuantity = cartProdQuantity;
		}
		public void setCartRegDate(Timestamp cartRegDate) {
			this.cartRegDate = cartRegDate;
		}
		
		@Override
		public String toString() {
			return "Cart [cartNo=" + cartNo + ", cartUserNo=" + cartUserNo + ", cartProdNo=" + cartProdNo
					+ ", cartProdQuantity=" + cartProdQuantity + ", cartRegDate=" + cartRegDate + "]";
		}
		

		

		

	
		
		
}
