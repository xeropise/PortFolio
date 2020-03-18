package com.mmm.service.product.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.mmm.common.Search;
import com.mmm.service.domain.Product;
import com.mmm.service.product.ProductDao;

@Repository("productDaoImpl")
public class ProductDaoImpl implements ProductDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	@Override
	public void addProduct(Product product) throws Exception {
		sqlSession.insert("ProductMapper.addProduct",product);
	}

	@Override
	public Product getProduct(int prodNo) throws Exception {
		return sqlSession.selectOne("ProductMapper.getProduct", prodNo);
	}

	@Override
	public List<Product> getProductMainList(Search search) throws Exception {
		return sqlSession.selectList("ProductMapper.getProductMainList", search);
	}

	@Override
	public List<Product> getProductList(Search search) throws Exception {
		return sqlSession.selectList("ProductMapper.getProductList", search);
	}
	
//	@Override
//	public List<Product> getMovieProductList(Search search) throws Exception {
//		return sqlSession.selectList("ProductMapper.getMovieProductList", search);
//	}
//	
	@Override
	public List<Product> getVoucherList(Product product) throws Exception {
		return sqlSession.selectList("ProductMapper.getVoucherList", product);
	}
	
	@Override
	public List<Product> getSnackProductList(Product product) throws Exception {
		return sqlSession.selectList("ProductMapper.getSnackProductList", product);
	}
	
	@Override
	public List<Product> getQuickOrder(Product product) throws Exception {
		return sqlSession.selectList("ProductMapper.getQuickOrder", product);
	}

	@Override
	public void updateProduct(Product product) throws Exception {
		sqlSession.update("ProductMapper.updateProduct", product);
	}
	
	@Override
	public void deleteProduct(Product product) throws Exception {
		sqlSession.delete("ProductMapper.deleteProduct", product);
	}
	
	
	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("ProductMapper.getTotalCount", search);
	}
	
	

}
