package com.mmm.service.ticketing.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.mmm.common.Search;
import com.mmm.service.domain.Ticketing;
import com.mmm.service.ticketing.TicketingDao;

@Repository("ticketingDaoImpl")
public class TicketingDaoImpl implements TicketingDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;	
	
	public TicketingDaoImpl() {
		System.out.println("::"+getClass()+" default Constructor Call.....");
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("::"+getClass()+".setSqlSession() Call....");
		this.sqlSession = sqlSession;		
		
	}	
	
	public void addTicketing(Ticketing ticketing) throws Exception {
		
		sqlSession.insert("TicketingMapper.addTicketing",ticketing);
	}
	
	public void updateTicketing(Ticketing ticketing) throws Exception {
		
		sqlSession.update("TicketingMapper.updateTicketing",ticketing);
	}
	
	public void deleteTicketing(String ticketingNo) throws Exception {
		
		sqlSession.delete("TicketingeMapper.deleteTicketing",ticketingNo);
	}
	
	public Ticketing getTicketing(String ticketingNo) throws Exception {
		
		return sqlSession.selectOne("TicketingMapper.getTicketing",ticketingNo);
	}
	
	public Ticketing recentTicketing() throws Exception {
		
		return sqlSession.selectOne("TicketingMapper.recentTicketing");
	}	
	
	public Map<String,Object> getTicketingList(Search search) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		List<Ticketing> ticketing= sqlSession.selectList("TicketingMapper.getTicketingList",search);
		int totalCount = sqlSession.selectOne("TicketingMapper.getTotalCount",search);
		
		 map.put("list", ticketing);
		 map.put("totalCount", totalCount);
		 
		return map;
	}





}
