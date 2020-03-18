package com.mmm.service.cart;

import java.util.List;
import java.util.Map;

import com.mmm.common.Search;
import com.mmm.service.domain.Cart;

public interface CartDao {
	
	
	
	public void addCart(Cart cart) throws Exception;
	
	public Cart getCart(int cartNo) throws Exception;
	
	public Map<String,Object> getCartList(Search search) throws Exception;
	
	public void updateCart(Cart cart) throws Exception;
	
	public void deleteCart(int cartNo) throws Exception;
	
	
}
