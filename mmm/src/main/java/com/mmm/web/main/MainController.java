package com.mmm.web.main;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mmm.common.Search;
import com.mmm.service.datetime.DateTimeService;
import com.mmm.service.domain.Movie;
import com.mmm.service.inventory.InventoryService;
import com.mmm.service.movie.MovieService;
import com.mmm.service.product.ProductService;

@Controller
public class MainController {

	///Field
	@Autowired
	@Qualifier("movieServiceImpl")
	private MovieService movieService; 
	 
	@Autowired
	@Qualifier("dateTimeServiceImpl")
	private DateTimeService dateTimeService; 	
	
	@Autowired
	@Qualifier("inventoryServiceImpl")
	private InventoryService inventoryService; 		
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService; 	
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;	
	
	@RequestMapping(value="/", method=RequestMethod.GET) 
	public String mainPage(@ModelAttribute("alarm") String alarm, @ModelAttribute("status") String status,  Model model) throws Exception {
		model.addAttribute("alarm",alarm);
		model.addAttribute("status", status);
		return "forward:/main/main.jsp";
	}
}
