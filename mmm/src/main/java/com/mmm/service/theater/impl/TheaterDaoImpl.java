package com.mmm.service.theater.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.mmm.common.Search;
import com.mmm.service.domain.Theater;
import com.mmm.service.domain.Ticketing;
import com.mmm.service.theater.TheaterDao;
import com.mmm.service.ticketing.TicketingDao;

@Repository("theaterDaoImpl")
public class TheaterDaoImpl implements TheaterDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;	
	
	public TheaterDaoImpl() {
		System.out.println("::"+getClass()+" default Constructor Call.....");
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("::"+getClass()+".setSqlSession() Call....");
		this.sqlSession = sqlSession;		
		
	}	
	
	public void addTheater(Theater theater) throws Exception {
		
		sqlSession.insert("TheaterMapper.addTheater",theater);
	}
	
	public void updateTheater(Theater theater) throws Exception {
		
		sqlSession.update("TheaterMapper.updateTheater",theater);
	}
	
	public void deleteTheater(String theaterNo) throws Exception {
		
		sqlSession.delete("TheaterMapper.deleteTheater",theaterNo);
	}
	
	public Theater getTheater(String theaterNo) throws Exception {
		
		return sqlSession.selectOne("TheaterMapper.getTheater",theaterNo);
	}
	
	@Override
	public Theater getTheaterByName(String theaterName) throws Exception {
		
		return sqlSession.selectOne("TheaterMapper.getTheaterByName",theaterName);
	}
	
	public String lastTheater() throws Exception {
		
		return sqlSession.selectOne("TheaterMapper.lastTheater");
	}
	
	public List<Theater> getTheaterList(Search search) throws Exception {
		
		return sqlSession.selectList("TheaterMapper.getTheaterList",search);
	}



}
