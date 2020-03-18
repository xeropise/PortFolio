package com.mmm.service.product;

import java.util.Map;

import com.mmm.common.Search;
import com.mmm.service.domain.Product;

public interface ProductService {
	
	public void addProduct(Product product) throws Exception;
	
	public Product getProduct(int prodNo) throws Exception;
	
	public Map<String,Object> getProductMainList(Search search) throws Exception;
	
	public Map<String,Object> getProductList(Search search) throws Exception;
	
//	public Map<String,Object> getMovieProductList(Search search) throws Exception;
	
	public Map<String,Object> getVoucherList(Product product) throws Exception;
	
	public Map<String,Object> getSnackProductList(Product product) throws Exception;
	
	public Map<String,Object> getQuickOrder(Product product) throws Exception;
	
	public void updateProduct(Product product) throws Exception;
	
	public void deleteProduct(Product product) throws Exception;
	
}
