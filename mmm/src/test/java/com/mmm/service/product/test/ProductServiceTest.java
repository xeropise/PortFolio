package com.mmm.service.product.test;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mmm.common.Search;
import com.mmm.service.domain.Product;
import com.mmm.service.product.ProductService;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-aspect.xml",
									"classpath:config/context-common.xml",
									"classpath:config/context-mybatis.xml",
									"classpath:config/context-transaction.xml"})
public class ProductServiceTest {

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Test
	public void testAddProduct() throws Exception{
		
		Product product = new Product();
		
		//product.setProdNo(10003);
		product.setProdName("테스트땅콩팝콘L");
		product.setProdPrice(10000);
		product.setProdDetail("땅콩이다");
		product.setProdImage("AHlbAAAAvetFNwAA.jpg");
		product.setFranType(0);		//CGV
		product.setProdType(1);		//스토어이용권
		
		productService.addProduct(product);
	}
	
	//@Test
	public void testGetProduct() throws Exception{
		
		Product product = new Product();
		
		product = productService.getProduct(10002);
		
		System.out.println(product);
		
	}
	
	//@Test
	public void testUpdateProduct() throws Exception{
		
		Product product = productService.getProduct(10002);
		Assert.assertNotNull(product);
		
		product.setProdName("테스트업데이트");
		product.setProdPrice(20000);
		product.setProdImage("AHlbAAAAFNwAA.jpg");
		product.setFranType(1);
		product.setProdType(0);
		
		productService.updateProduct(product);
		
		System.out.println(product);
	}
	
	//@Test
//	public void testGetProductListAll() throws Exception{
//		
//		Search search = new Search();
//		
//		search.setCurrentPage(1);
//		search.setPageSize(3);
//		Map<String, Object> map = productService.getProductList(product);
//		
//		List<Object> list = (List<Object>)map.get("list");
//		
//		
//		Integer totalCount = (Integer)map.get("totalCount");
//		totalCount = (Integer)map.get("totalCount");
//		System.out.println(totalCount);
//		
//	}
	
	
		//@Test
		public void testDeleteProduct() throws Exception{
			
		Product product = productService.getProduct(10002);
		Assert.assertNotNull(product);
		
		
		productService.deleteProduct(product);
		
		System.out.println(product);
			
		}
}
