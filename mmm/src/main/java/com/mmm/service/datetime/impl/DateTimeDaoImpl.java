package com.mmm.service.datetime.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.mmm.common.Search;
import com.mmm.service.datetime.DateTimeDao;
import com.mmm.service.domain.DateTime;
import com.mmm.service.domain.Ticketing;
import com.mmm.service.ticketing.TicketingDao;

@Repository("dateTimeDaoImpl")
public class DateTimeDaoImpl implements DateTimeDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;	
	
	public DateTimeDaoImpl() {
		System.out.println("::"+getClass()+" default Constructor Call.....");
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("::"+getClass()+".setSqlSession() Call....");
		this.sqlSession = sqlSession;		
		
	}	
	
	public void addDateTime(DateTime dateTime) throws Exception {
		
		sqlSession.insert("DateTimeMapper.addDateTime",dateTime);
	}
	
	public void updateDateTime(DateTime dateTime) throws Exception {
		
		sqlSession.update("DateTimeMapper.updateDateTime",dateTime);
	}
	
	public void deleteDateTime(String dateTimeNo) throws Exception {
		
		sqlSession.delete("DateTimeMapper.deleteDateTime",dateTimeNo);
	}
	
	public DateTime getDateTime(String dateTimeNo) throws Exception {
		
		return sqlSession.selectOne("DateTimeMapper.getDateTime",dateTimeNo);
	}
	
	@Override
	public DateTime getDateTimeByMovieName(String movieName) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("DateTimeMapper.getDateTimeByMovieName",movieName);
	}
	
	public List<DateTime> getDateTimeList(Search search) throws Exception {
		
		return sqlSession.selectList("DateTimeMapper.getDateTimeList",search);
	}
	
	@Override
	public List<DateTime> getMovieList(Search search) throws Exception {
		
		return sqlSession.selectList("DateTimeMapper.getMovieList",search);
	}
	
	@Override
	public List<DateTime> getFranchiseList(Search search) throws Exception {
		
		return sqlSession.selectList("DateTimeMapper.getFranchiseList",search);
	}
	
	@Override
	public List<DateTime> getTheaterList(Search search) throws Exception {
		
		return sqlSession.selectList("DateTimeMapper.getTheaterList",search);
	}
	
	@Override
	public List<DateTime> getDateList(Search search) throws Exception {
		
		return sqlSession.selectList("DateTimeMapper.getDateList",search);
	}
	
	@Override
	public List<DateTime> getTimeList(Search search) throws Exception {
		
		return sqlSession.selectList("DateTimeMapper.getTimeList",search);
	}
	
	@Override
	public DateTime getSelectedSeat(DateTime dateTime) throws Exception {
		
		return sqlSession.selectOne("DateTimeMapper.getSelectedSeat",dateTime);
	}

	@Override
	public void addTicketing(Map<Object, Object> ticketingInfo) throws Exception {
		
		sqlSession.update("DateTimeMapper.addTicketing", ticketingInfo);
	}

	@Override
	public void cancelTicketing(Map<Object, Object> ticketingInfo) throws Exception {
		
		sqlSession.update("DateTimeMapper.cancelTicketing", ticketingInfo);
	}











}
