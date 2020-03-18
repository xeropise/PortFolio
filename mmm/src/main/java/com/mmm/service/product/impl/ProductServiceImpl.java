package com.mmm.service.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mmm.common.Search;
import com.mmm.service.domain.Product;
import com.mmm.service.product.ProductDao;
import com.mmm.service.product.ProductService;


@Service("productServiceImpl")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	@Qualifier("productDaoImpl")
	private ProductDao productDao;
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	public ProductServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addProduct(Product product) throws Exception {
		productDao.addProduct(product);
		
	}

	@Override
	public Product getProduct(int prodNo) throws Exception {
		return productDao.getProduct(prodNo);
	}

	@Override
	public Map<String,Object> getProductMainList(Search search) throws Exception {
		List<Product> list = productDao.getProductMainList(search);
		int totalCount = productDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount" , new Integer(totalCount));
		
		return map;
	}

	
	@Override
	public Map<String,Object> getProductList(Search search) throws Exception {
		List<Product> list = productDao.getProductList(search);
		int totalCount = productDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list" , list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	
//	@Override
//	public Map<String,Object> getMovieProductList(Search search) throws Exception {
//		List<Product> list = productDao.getMovieProductList(search);
//		
//		int totalCount = productDao.getTotalCount(search);
//		
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("list" , list);
//		map.put("totalCount" , new Integer(totalCount));
//		
//		
//		return map;
//	}
	
	@Override
	public Map<String,Object> getVoucherList(Product product) throws Exception {
		List<Product> list = productDao.getVoucherList(product);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list" , list);
		
		return map;
	}
	
	@Override
	public Map<String,Object> getSnackProductList(Product product) throws Exception {
		List<Product> list = productDao.getSnackProductList(product);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list" , list);
		
		return map;
	}
	
	@Override
	public Map<String,Object> getQuickOrder(Product product) throws Exception {
		List<Product> list = productDao.getQuickOrder(product);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list" , list);
		
		return map;
	}
	
	@Override
	public void updateProduct(Product product) throws Exception {
		productDao.updateProduct(product);
	}
	
	@Override
	public void deleteProduct(Product product) throws Exception {
		productDao.deleteProduct(product);
	}
}
