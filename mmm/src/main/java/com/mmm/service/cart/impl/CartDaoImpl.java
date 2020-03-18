package com.mmm.service.cart.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.mmm.common.Search;
import com.mmm.service.cart.CartDao;
import com.mmm.service.domain.Cart;

@Repository("cartDaoImpl")
public class CartDaoImpl implements CartDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public CartDaoImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public void addCart(Cart cart) throws Exception {
		sqlSession.insert("CartMapper.addCart", cart);
	}

	@Override
	public Cart getCart(int cartNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getCartList(Search search) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		
		List<Cart> list = sqlSession.selectList("CartMapper.getCartList",search);
		int totalCount = sqlSession.selectOne("CartMapper.getTotalCount",search);
		
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public void updateCart(Cart cart) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCart(int cartNo) throws Exception {
		
		sqlSession.delete("CartMapper.deleteCart",cartNo);
		
	}
	
	

	
}
