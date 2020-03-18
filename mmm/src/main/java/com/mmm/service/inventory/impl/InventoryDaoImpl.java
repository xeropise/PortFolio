package com.mmm.service.inventory.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.mmm.common.Search;
import com.mmm.service.cart.CartDao;
import com.mmm.service.domain.Cart;
import com.mmm.service.domain.Inventory;
import com.mmm.service.inventory.InventoryDao;

@Repository("inventoryDaoImpl")
public class InventoryDaoImpl implements InventoryDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public InventoryDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addInventory(Inventory inventory) throws Exception {
		
		System.out.println("---------------------- addInvend() inven "+ inventory );
		
		sqlSession.insert("InventoryMapper.addInventory",inventory);
		
	}

	@Override
	public Inventory getInventory(Search search) throws Exception {
		
		return sqlSession.selectOne("InventoryMapper.getInventory",search);
	}
	
	@Override
	public int getInventoryCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("InventoryMapper.getInventoryCount",search);
	}

	@Override
	public List<Inventory> getInventoryList(Search search) throws Exception {
		
		return sqlSession.selectList("InventoryMapper.getInventoryList",search);
	}

	@Override
	public void updateInventory(Inventory inventory) throws Exception {
		
		sqlSession.update("InventoryMapper.updateInventory",inventory);
	}

	@Override
	public void deleteInventory(int inventoryNo) throws Exception {
		
		sqlSession.delete("InventoryMapper.deleteInventory",inventoryNo);
	}

	public List<Inventory> getVoucherListInPayment(int userNo)throws Exception{
		
		return sqlSession.selectList("InventoryMapper.getVoucherListInPayment", userNo);
	}

	@Override
	public Inventory getInventoryForPay(int inventoryNo) throws Exception {
		return sqlSession.selectOne("InventoryMapper.getInventoryForPay", inventoryNo);
	}
	

	
	

	
}
