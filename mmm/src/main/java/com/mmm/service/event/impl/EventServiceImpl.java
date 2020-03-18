 package com.mmm.service.event.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mmm.common.Search;
import com.mmm.service.domain.Participation;
import com.mmm.service.domain.Point;
import com.mmm.service.domain.Preview;
import com.mmm.service.domain.Quiz;
import com.mmm.service.event.EventDao;
import com.mmm.service.event.EventService;



@Service("eventServiceImpl")
public class EventServiceImpl implements EventService {

	@Autowired
	@Qualifier("eventDaoImpl")
	private EventDao eventDao;
	public void setEventDao(EventDao eventDao) {
		this.eventDao = eventDao;
	}
	
	
	public EventServiceImpl() {
		System.out.println(this.getClass());
	}


	@Override
	public void addPreviewAd(Preview preview) throws Exception {
		eventDao.addPreviewAd(preview);
	}

	@Override
	public Preview getPreviewAd(int previewNo) throws Exception {
		return eventDao.getPreviewAd(previewNo);
	}

	@Override
	public Map<String, Object> getPreviewListAd(Search search) throws Exception {
	
		System.out.println(">>>>>>>>>>>>>>>EventServiceImpl:getPreviewListAd():search" + search);
		
		return eventDao.getPreviewListAd(search);
	}

	@Override
	public void updatePreviewAd(Preview preview) throws Exception {
		System.out.println(">>>>>>>>>>>>>>>EventServiceImpl:updatePreviewAd");
		eventDao.updatePreviewAd(preview);
	}

	@Override
	public Map<String, Object> getPreviewList(Search search) throws Exception {
		System.out.println(">>>>>>>>>>>>>>EventServiceImpl:getPreviewList");
		return eventDao.getPreviewList(search);
	}

	@Override
	public Preview getPreview(int previewNo) throws Exception {
		System.out.println(">>>>>>>>>>>>EventServiceImpl:getPreview");
		return eventDao.getPreview(previewNo);
	}

	
	@Override
	public void addPartPrev(Participation participation) throws Exception {
		eventDao.addPartPrev(participation);
	}

	@Override
	public Map<String, Object> getWinnerList(int previewNo) throws Exception {
		return eventDao.getWinnerList(previewNo);
	}

	@Override
	public void addQuizAd(Quiz quiz) throws Exception {
		eventDao.addQuizAd(quiz);
	}

	@Override
	public Map<String, Object> getQuizListAd(Search search) throws Exception {
		System.out.println(">>>>>>>>>>EventServiceImpl:getQuizListAd() start...");
		return eventDao.getQuizListAd(search);
	}

	@Override
	public Quiz getQuizAd(int quizNo) throws Exception {
		return eventDao.getQuizAd(quizNo);
	}

	@Override
	public void updateQuizAd(Quiz quiz) throws Exception {
		eventDao.updateQuizAd(quiz);

	}

	@Override
	public void addPartQuiz(Participation participation) throws Exception {
		eventDao.addPartQuiz(participation);
	}    


	@Override
	public List<Point> getAttendanceList(String userNo) throws Exception {
		return null;
	}

	@Override
	public void deleteQuiz(int quizNo) throws Exception {
		eventDao.deleteQuiz(quizNo);
		
	}


	@Override
	public void deletePreview(int previewNo) throws Exception {
		eventDao.deletePreview(previewNo);
		
	}


	@Override
	public Participation getPartByUserNo(int userNo) throws Exception {
		return eventDao.getPartByUserNo(userNo);
	}


	@Override
	public void updateWinningFlag(Map<String,Object> map) throws Exception {
		eventDao.updateWinningFlag(map);
		
	}


	@Override
	public Map<String, Object> getApplyList(int previewNo) throws Exception {
		 return eventDao.getApplyList(previewNo);
	}


	@Override
	public Map<String, Object> getPartList(Search search) throws Exception {
		return eventDao.getPartList(search);
	}


	@Override
	public Participation getParticiation(int partNo) throws Exception {
		return eventDao.getParticiation(partNo);
	}


	@Override
	public Participation getQuizRecord(int userNo) throws Exception {
		return eventDao.getQuizRecord(userNo);
	}


	@Override
	public int checkPart(Map<String, Object> map) throws Exception {
		return eventDao.checkPart(map);
	}


	@Override
	public int checkQuiz(Map<String, Object> map) throws Exception {
		return eventDao.checkQuiz(map);
	}


	@Override
	public void updateQuizFlag(Map<String, Object> map) throws Exception {
		 eventDao.updateQuizFlag(map);
		
	}


	@Override
	public List<Preview> getPrepareRand() throws Exception {
		
		List<Preview> list = eventDao.getRandList();
		
		for(Preview p : list) {
			System.out.println(p.getPreviewNo());
			eventDao.updatePrevStatus(p.getPreviewNo()); 
		}
		
		return list;
	}


	@Override
	public List<Preview> getAllPreview() throws Exception {
		return eventDao.getAllPreview();
	}


	@Override
	public List<Preview> updateStPrev()  throws Exception {
		
		List<Preview> list = eventDao.updateStPrev();
		
		for(Preview p:list) {
			System.out.println(p.getPreviewNo());
			eventDao.updatePrevStatus(p.getPreviewNo()); 
		}
		
		return list;
	}



}
