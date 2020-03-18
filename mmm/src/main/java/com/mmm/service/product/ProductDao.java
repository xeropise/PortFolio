package com.mmm.service.product;

import java.util.List;

import com.mmm.common.Search;
import com.mmm.service.domain.Product;

public interface ProductDao {
	
	
	public void addProduct(Product product) throws Exception;
	
	public Product getProduct(int prodNo) throws Exception;
	
	public List<Product> getProductMainList(Search search) throws Exception;
	
	public List<Product> getProductList(Search search) throws Exception;
	
	public List<Product> getVoucherList(Product product) throws Exception;
	
//	public List<Product> getStoreProductList(Product product) throws Exception;
	
	public List<Product> getSnackProductList(Product product) throws Exception;
	
	public List<Product> getQuickOrder(Product product) throws Exception;
	
	public void updateProduct(Product product) throws Exception;
	
	public void deleteProduct(Product product) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
	

}
