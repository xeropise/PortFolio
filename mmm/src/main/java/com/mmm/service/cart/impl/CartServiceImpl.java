package com.mmm.service.cart.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mmm.common.Search;
import com.mmm.service.cart.CartDao;
import com.mmm.service.cart.CartService;
import com.mmm.service.domain.Cart;

@Service("cartServiceImpl")
public class CartServiceImpl implements CartService {
	
	@Autowired
	@Qualifier("cartDaoImpl")
	private CartDao cartDao;
	public void setCartDao(CartDao cartDao) {
		this.cartDao = cartDao;
	}
	
	
	public CartServiceImpl() {
		System.out.println(this.getClass());
	}


	@Override
	public void addCart(Cart cart) throws Exception {
		cartDao.addCart(cart);
	}


	@Override
	public Cart getCart(int cartNo) throws Exception {

		return null;
	}


	@Override
	public Map<String, Object> getCartList(Search search) throws Exception {

		return cartDao.getCartList(search);
	}


	@Override
	public void updateCart(Cart cart) throws Exception {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void deleteCart(int cartNo) throws Exception {
		
		cartDao.deleteCart(cartNo);
		
	}




	
}
