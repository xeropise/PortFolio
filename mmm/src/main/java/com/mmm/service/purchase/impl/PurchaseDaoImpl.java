package com.mmm.service.purchase.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.mmm.common.Search;
import com.mmm.service.domain.Cart;
import com.mmm.service.domain.Purchase;
import com.mmm.service.purchase.PurchaseDao;

@Repository("purchaseDaoImpl")
public class PurchaseDaoImpl implements PurchaseDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	@Override
	public void addPurchase(Purchase purchase) throws Exception {
		sqlSession.insert("PurchaseMapper.addPurchase",purchase);
	}


	@Override
	public Purchase getPurchase(int purchaseNo) throws Exception {
		
		return sqlSession.selectOne("PurchaseMapper.getPurchase",purchaseNo);
	}
	
	@Override
	public Purchase recentPurchase() throws Exception {
		
		return sqlSession.selectOne("PurchaseMapper.recentPurchase");
	}


	@Override
	public Map<String,Object> getPurchaseList(Search search) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		
		int totalCount =sqlSession.selectOne("PurchaseMapper.getTotalCount",search);
		List<Purchase> list =sqlSession.selectList("PurchaseMapper.getPurchaseList", search);
		
		map.put("totalCount", totalCount);
		map.put("list", list);
		
		return map;
	}


	@Override
	public void updatePurchase(Purchase purchase) throws Exception {
		
		sqlSession.update("PurchaseMapper.updatePurchase",purchase);
	}


	@Override
	public void DeletePurchase(int purchaseNo) throws Exception {
		// TODO Auto-generated method stub
		
	}



		
	

	
}
