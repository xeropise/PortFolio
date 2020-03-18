package com.mmm.service.main.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mmm.service.main.MainDao;
import com.mmm.service.main.MainService;
import com.mmm.service.movie.MovieDao;

@Service("mainServiceImpl")
public class MainServiceImpl implements MainService{

	///Field
	@Autowired
	@Qualifier("mainDaoImpl")
	private MainDao mainDao;
	
	///Setter
	public void setMainDao(MainDao mainDao) {
		System.out.println(">>> "+getClass()+".setMainDao() Call.....");
		this.mainDao = mainDao;
	}	

	@Override
	public void MainPage() throws Exception {
		// TODO Auto-generated method stub
		
	}
}
