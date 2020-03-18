package com.mmm.service.main.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.mmm.service.main.MainDao;

@Repository("mainDaoImpl")
public class MainDaoImpl implements MainDao {

	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	///Setter
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println(">>> "+getClass()+".setSqlSession() Call.....");
		
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public MainDaoImpl() {
		System.out.println(">>> "+getClass()+"  default Contructor Call.....");
	}

	@Override
	public void MainPage() throws Exception {
		// TODO Auto-generated method stub
		
	}
}
