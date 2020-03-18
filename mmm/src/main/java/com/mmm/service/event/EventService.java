package com.mmm.service.event;

import java.util.List;
import java.util.Map;

import com.mmm.common.Search;
import com.mmm.service.domain.Participation;
import com.mmm.service.domain.Point;
import com.mmm.service.domain.Preview;
import com.mmm.service.domain.Quiz;

public interface EventService {

	public void addPreviewAd(Preview preview) throws Exception;
	
	public Preview getPreviewAd(int previewNo) throws Exception;
	
	public Map<String, Object> getPreviewListAd(Search search) throws Exception;
	
	public void updatePreviewAd(Preview preview) throws Exception;
	
	public Map<String, Object> getPreviewList(Search search) throws Exception;
	
	public Preview getPreview(int previewNo) throws Exception;
	
	public void addPartPrev(Participation participation) throws Exception;
	
	public void deletePreview(int previewNo) throws Exception;
	//previewNo, User
	public Map<String, Object> getWinnerList(int previewNo) throws Exception;
	
	public Map<String, Object> getApplyList(int previewNo) throws Exception;
	
	public Map<String, Object> getPartList(Search search) throws Exception;
	
	public Participation getParticiation(int partNo) throws Exception;
	
	public void addQuizAd(Quiz quiz) throws Exception;
	
	public Map<String, Object> getQuizListAd(Search search) throws Exception;
	
	public Quiz getQuizAd(int quizNo) throws Exception;
	
	public void updateQuizAd(Quiz quiz) throws Exception;
	
	public void addPartQuiz(Participation participation) throws Exception;
	
	
	public List<Point> getAttendanceList(String userNo) throws Exception; //출석체크리스트
	
	public void deleteQuiz(int quizNo) throws Exception;
	
	public Participation getPartByUserNo(int userNo) throws Exception;
	
	public void updateWinningFlag(Map<String,Object> map) throws Exception;
	public void updateQuizFlag(Map<String,Object> map) throws Exception;

	public Participation getQuizRecord(int userNo) throws Exception;
	
	public int checkPart(Map<String, Object> map) throws Exception; 
	public int checkQuiz(Map<String, Object> map) throws Exception; 

	public List<Preview> getPrepareRand() throws Exception;
	
	public List<Preview> getAllPreview() throws Exception;
	
	public List<Preview> updateStPrev() throws Exception;
}
