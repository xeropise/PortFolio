package com.mmm.service.event.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.mmm.common.Search;
import com.mmm.service.domain.Participation;
import com.mmm.service.domain.Point;
import com.mmm.service.domain.Preview;
import com.mmm.service.domain.Quiz;
import com.mmm.service.event.EventDao;
import com.mmm.service.event.EventService;

@Repository("eventDaoImpl")
public class EventDaoImpl implements EventDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public EventDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addPreviewAd(Preview preview) throws Exception {
		sqlSession.insert("EventMapper.addPreview", preview);
	}

	@Override
	public Preview getPreviewAd(int previewNo) throws Exception {
		return sqlSession.selectOne("EventMapper.getPreviewAd", previewNo);
	}

	@Override
	public Map<String, Object> getPreviewListAd(Search search) throws Exception {
		System.out.println(">>>>>>>>>>>>>>>EventDaoImpl:getPreviewListAd():search" + search);
		 Map<String, Object> map = new HashMap<String, Object>();
		 
		 List<Preview> list = sqlSession.selectList("EventMapper.getPreviewListAd", search);
		 int totalCount = sqlSession.selectOne("EventMapper.getTotalPrev", search);
		 map.put("list", list);
		 map.put("totalCount", totalCount);
		 
		 return map;
	}

	@Override
	public void updatePreviewAd(Preview preview) throws Exception {
		System.out.println(">>>>>>>>EventDaoImpl:updatePreviewAd()");
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>Preview" + preview);
		sqlSession.update("EventMapper.updatePreview", preview);
	}

	@Override
	public Map<String, Object> getPreviewList(Search search) throws Exception {
		System.out.println(">>>>>>>>EventDaoImpl:getPreviewListAd()");
		Map<String, Object> map = new HashMap<String, Object>();
		 
		 List<Preview> list = sqlSession.selectList("EventMapper.getPreviewListAd", search);
		 int totalCount = sqlSession.selectOne("EventMapper.getTotalPrev", search);
		
		 map.put("list", list);
		 map.put("totalCount", totalCount);
		 
		 return map;
	
	}

	@Override
	public Preview getPreview(int previewNo) throws Exception {
		return sqlSession.selectOne("EventMapper.getPreviewAd", previewNo);
	}

	
	@Override
	public void addPartPrev(Participation participation) throws Exception {
		System.out.println("participation"+participation);
		sqlSession.insert("EventMapper.addPartPrev", participation);
	}

	
	
	@Override
	public Map<String, Object> getWinnerList(int previewNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Participation> list = sqlSession.selectList("EventMapper.getWinnerList", previewNo);
	
		//Preview prv = sqlSession.selectOne("EventMapper.getPreviewAd", previewNo);
		//System.out.println("<<<<<<<<<<"+prv.getPreviewName()+"에 당첨된 회원 목록>>>>>>>");
		
//		for(Participation p : list) {
//			System.out.println(p.getUserNo()+" 회원이 당첨되었습니다");
//		}
		//System.out.println("userNo를 뽑아보자>>>>>>>>>>>>>"+list.get(0).getUserNo());
		//나중에 userServiceImpl에서 getUser(userNo)로 가져오자 
		map.put("list", list);
		
		return map;
	}
  
	@Override
	public void addQuizAd(Quiz quiz) throws Exception {
		sqlSession.insert("EventMapper.addQuiz", quiz);
	}

	@Override
	public Map<String, Object> getQuizListAd(Search search) throws Exception {
		
		System.out.println(">>>>>>>>EventDaoImpl:getQuizListAd() start...");
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Quiz> list = sqlSession.selectList("EventMapper.getQuizListAd", search);
		int totalCount = sqlSession.selectOne("EventMapper.getTotalQuiz", search);
		
		//System.out.println(">>>>>>>>>EventDaoImpl:getQuizListAd():list ? "+ list);
		//System.out.println(">>>>>>>>>EventDaoImpl:getQuizListAd():totalCount ? "+ totalCount);

		map.put("list", list);
		map.put("totalCount", totalCount);
		
		System.out.println("EventDaoImpl:getQuizListAd() end...");
	
		return map;
	}

	@Override
	public Quiz getQuizAd(int quizNo) throws Exception {
		return sqlSession.selectOne("EventMapper.getQuizAd", quizNo);
	}

	@Override
	public void updateQuizAd(Quiz quiz) throws Exception {
		sqlSession.update("EventMapper.updateQuiz", quiz);
	}

	@Override
	public void addPartQuiz(Participation participation) throws Exception {
		sqlSession.insert("EventMapper.addPartQuiz", participation);
	}


	@Override
	public List<Point> getAttendanceList(String userNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteQuiz(int quizNo) throws Exception {
		sqlSession.update("EventMapper.deleteQuiz", quizNo);
	}

	@Override
	public void deletePreview(int previewNo) throws Exception {
		sqlSession.delete("EventMapper.deletePreview", previewNo);
	}

	@Override
	public Participation getPartByUserNo(int userNo) throws Exception {
		return sqlSession.selectOne("EventMapper.getPartByUserNo", userNo);
	}

	@Override
	public void updateWinningFlag(Map<String,Object> map) throws Exception {
		System.out.println(">>>>>>>>>>>>>>>>>>>updateWinningFlag에서 찍어본 map이야"+map);
		sqlSession.update("EventMapper.updateWinningFlag", map);
	}

	@Override
	public Map<String, Object> getApplyList(int previewNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Participation> list = sqlSession.selectList("EventMapper.getApplyList", previewNo);
		System.out.println("EventDaoImpl:getApplyList()>>>>>>>>>list"+list);
		System.out.println();
		
		Preview prv = sqlSession.selectOne("EventMapper.getPreviewAd", previewNo);
		System.out.println("<<<<<<<<<<"+prv.getPreviewName()+"에 응모한 회원 목록>>>>>>>");
		
		for(Participation p : list) {
			System.out.println(p.getUserNo()+" 회원이 "+p.getPartDate()+"에 참여하였습니다! 당첨여부는..."+p.getWinningFlag()+"입니다!");
		}
		
		//System.out.println("EventDaoImpl:getApplyList()>>>>>>>>>list.get(0)"+list.get(0));
		//System.out.println("userNo를 뽑아보자>>>>>>>>>>>>>"+list.get(0).getUserNo());
		//나중에 userServiceImpl에서 getUser(userNo)로 가져오자 
		map.put("list", list);
		
		return map;
	}

	@Override
	public Map<String, Object> getPartList(Search search) throws Exception {
		System.out.println("dao에서 search를 찍어볼게.."+ search);
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Participation> list = sqlSession.selectList("EventMapper.getPartList", search);
		int totalCount = sqlSession.selectOne("EventMapper.getTotalPartList", search);
		
		for(Participation p: list) {
			System.out.println(p);
		}
		
		System.out.println(totalCount);
		
//		List<Participation> list = sqlSession.selectList("EventMapper.getPartList", userNo);
//		System.out.println("<<<<<<<<"+userNo+"님이 참여한 이벤트 목록>>>>>>>>>");
//		for(Participation p: list) {
//			if(p.getQuizNo()!=0) {
//				System.out.println("이것은 퀴즈==퀴즈번호==>"+p.getQuizNo());
//				Quiz quiz = sqlSession.selectOne("EventMapper.getQuizAd",p.getQuizNo());
//				System.out.println("이 문제에 참여했어==>" + quiz.getQuestion());
//			}else if(p.getPreviewNo()!=0) {
//				System.out.println("이것은 응모이벤트==시사회번호==>"+p.getPreviewNo());
//				Preview prev = sqlSession.selectOne("EventMapper.getPreviewAd",p.getPreviewNo());
//				System.out.println("이 시사회에 참여했어==>" + prev.getPreviewName());
//
//			}
//		}
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public Participation getParticiation(int partNo) throws Exception {
		return sqlSession.selectOne("EventMapper.getParticipation", partNo);
	}

	@Override
	public Participation getQuizRecord(int userNo) throws Exception {
		return sqlSession.selectOne("EventMapper.getQuizRecord", userNo);
	}

	@Override
	public int checkPart(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne("EventMapper.checkPart", map);
	}

	@Override
	public int checkQuiz(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne("EventMapper.checkQuiz", map);
	}

	@Override
	public void updateQuizFlag(Map<String, Object> map) throws Exception {
		sqlSession.update("EventMapper.updateQuizFlag", map);
	}

	@Override
	public List<Preview> getRandList() throws Exception {
		return sqlSession.selectList("EventMapper.getRandList");
	}

	@Override
	public void updatePrevStatus(int previewNo) throws Exception {
		
		sqlSession.update("EventMapper.updatePrevStatus", previewNo);
	}

	@Override
	public List<Preview> getAllPreview() throws Exception {
		return sqlSession.selectList("EventMapper.getAllPreview");
	}

	@Override
	public List<Preview> updateStPrev() throws Exception {
		return sqlSession.selectList("EventMapper.getStartPrevList");
	}


}
