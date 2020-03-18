package com.mmm.service.event.test;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mmm.common.Search;
import com.mmm.service.domain.Participation;
import com.mmm.service.domain.Preview;
import com.mmm.service.domain.Quiz;
import com.mmm.service.event.EventService;
import com.mmm.common.Page;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-aspect.xml",
									"classpath:config/context-common.xml",
									"classpath:config/context-mybatis.xml",
									"classpath:config/context-transaction.xml"})
public class EventServiceTest {

	@Autowired
	@Qualifier("eventServiceImpl")
	private EventService eventService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	//@Test
	public void testAddPreview() throws Exception {
		
		Preview preview = new Preview();
		
		preview.setPreviewName("<비트캠프>시사회");
		preview.setPreviewPlace("CGV랄라");
		SimpleDateFormat calendar = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		java.util.Date preDate = calendar.parse("2020-02-20 17:17");
		Timestamp pd = new Timestamp(preDate.getTime());
		System.out.println("preDate>>>"+pd);
		preview.setPreviewDate(pd);
		preview.setPreviewImage("ddddddddd.jpg");
		java.util.Date startDate =calendar.parse("2020-01-28 12:30");
		//System.out.println(startDate);
		//System.out.println(startDate.getTime());
		Timestamp sd = new Timestamp(startDate.getTime());
		System.out.println("startDate>>>"+sd);
		preview.setPreviewStartDate(sd);
		java.util.Date endDate = calendar.parse("2030-03-15 15:30");
		Timestamp ed = new Timestamp(endDate.getTime());
		preview.setPreviewEndDate(ed);
		System.out.println("endDate>>>"+ed);
		preview.setWinnerCount(30);
		preview.setWinnerDate(sd);
//		preview.setPreviewFlag(1);
		
		eventService.addPreviewAd(preview);
		System.out.println("preview>>>" + preview);
	}
	
	
		//@Test
		public void testgetPreviewAd() throws Exception {
		
		Preview preview = eventService.getPreviewAd(10000);
		System.out.println("testgetPreview():preview>>>" + preview);
	
		}

		
		//@Test
		public void testUpdatePreviewAd() throws Exception{
			
			Preview preview = eventService.getPreviewAd(10000);
			Assert.assertNotNull(preview);
			
			preview.setPreviewName("<수정된>시사회이름");
			preview.setPreviewPlace("우리집");
			eventService.updatePreviewAd(preview);
			
			Assert.assertEquals("<수정된>시사회이름", preview.getPreviewName());
			Assert.assertEquals("우리집", preview.getPreviewPlace());
			
		}

		//@Test
		public void testDeletePreviewAd() throws Exception{
			
			Preview preview = eventService.getPreviewAd(10001);
			Assert.assertNotNull(preview);
			
			eventService.deletePreview(preview.getPreviewNo());
			
		}
		
//		//@Test
//		public void testAddQuizAd() throws Exception {
//			
//			Quiz quiz = new Quiz();
//			quiz.setQuestion("내가 좋아하는 동물은?");
//			quiz.setOptionFirst("강아지");
//			quiz.setOptionSecond("박쥐");
//			quiz.setOptionThird("박쥐");
//			quiz.setOptionFourth("쥐");
//			quiz.setAnswer(1);
//			quiz.setQuizFlag(0);
//			
//			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd hh:mm");
//			java.util.Date quizStart = fmt.parse("2020-02-02 13:30");
//			Timestamp qs = new Timestamp(quizStart.getTime());
//			quiz.setQuizStartDate(qs);
//			
//			java.util.Date quizEnd = fmt.parse("2020-02-19 13:30");
//			Timestamp qe = new Timestamp(quizEnd.getTime());
//			quiz.setQuizEndDate(qe);
//			
//			eventService.addQuizAd(quiz);
//			System.out.println("testAddQuiz():quiz>>"+ quiz);
//			
//		}
		
		//@Test
		public void testGetQuizAd() throws Exception{
			
			Quiz quiz = eventService.getQuizAd(10000);
			Assert.assertNotNull(quiz);

		}

		//@Test
		public void testUpdateQuizAd() throws Exception{
			
			Quiz quiz = eventService.getQuizAd(10002);
			Assert.assertNotNull(quiz);
			
			quiz.setOptionSecond("고양이");
			quiz.setOptionThird("사자");
			quiz.setOptionFourth("호랑이");
			eventService.updateQuizAd(quiz);
			
			Quiz updateResult = eventService.getQuizAd(10002);
			Assert.assertEquals("고양이", updateResult.getOptionSecond());
			Assert.assertEquals("사자", updateResult.getOptionThird());
			Assert.assertEquals("호랑이", updateResult.getOptionFourth());
			
		}
		
		
		//@Test
		public void testDeleteQuizAd() throws Exception{
			
			Quiz quiz = eventService.getQuizAd(10000);
			Assert.assertNotNull(quiz);
			eventService.deleteQuiz(10000);
			
		}
		
		//@Test
		public void testGetPreviewListAd() throws Exception{
			
			Search search = new Search();
			if (search.getCurrentPage() == 0) {
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
	
			//시사회 이름으로 검색
			//search.setSearchCondition("0"); //previewName
			//search.setSearchKeyword("<인셉션>시사회"); 

			//이벤트 진행 상태로 검색
			//search.setSearchCondition("1"); //previewFlag
			//search.setSearchKeyword("0"); //응모가 끝난 시사회 
			Map<String, Object> map = eventService.getPreviewListAd(search);
			Page resultPage	= 
					new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		  	
			System.out.println(">>>>>>resultPage:"+resultPage);
			System.out.println(">>>>>>testGetPreviewListAd():map>>"+map);
		}
		
//		@Test
		public void testGetPreviewList() throws Exception{
			
			Search search = new Search();
//			if (search.getCurrentPage() == 0) {
//				search.setCurrentPage(1);
//			}
			search.setCurrentPage(2);
			search.setPageSize(pageSize);
	
			//시사회 이름으로 검색
			//search.setSearchCondition("0"); //previewName
			//search.setSearchKeyword("<인셉션>시사회"); 

			//이벤트 진행 상태로 검색
			//search.setSearchCondition("1"); //previewFlag
			//search.setSearchKeyword("0"); //응모가 끝난 시사회 
			Map<String, Object> map = eventService.getPreviewList(search);
			Page resultPage	= 
					new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		  	
			System.out.println(">>>>>>resultPage:"+resultPage);
			List<Preview> list = (List<Preview>)map.get("list");
			
			System.out.println(">>>>>>>>>>>>>>>list"+list);
			//System.out.println(">>>>>>testGetPreviewListAd():map>>"+map);
		}
		
		
		
		
		//@Test
		public void testGetQuizListAd() throws Exception{
			
			Search search = new Search();
//			if(search.getCurrentPage() == 0) {
//				search.setCurrentPage(1);
//			}
			search.setCurrentPage(2);
			search.setPageSize(pageSize);
			
			Map<String, Object> map = eventService.getQuizListAd(search);
			List<Quiz> list = (List<Quiz>)map.get("list");
			Page resultPage	= 
					new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
			
			System.out.println(">>>>>>resultPage:"+resultPage);
			System.out.println(">>>>>>>>>>>>>>>list"+list);
			//System.out.println(">>>>>>testGetQuizListAd():map>>"+map);
			
		}
		
		//@Test
		public void testAddPartPrev() throws Exception {
			
			Participation participation = new Participation();
			participation.setPreviewNo(10004);
			participation.setUserNo(10003);
			System.out.println("testAddPartPrev()"+participation);
			
			eventService.addPartPrev(participation);
			
		}
		
		//@Test
		public void testAddPartQuiz() throws Exception {
			
			Participation participation = new Participation();
			participation.setQuizNo(10002);
			participation.setUserNo(10003);
			System.out.println("testAddPartPrev()"+participation);
			eventService.addPartQuiz(participation);
			
		}
		
		//@Test
		public void testUpdateWinningFlag() throws Exception {
			Map<String, Object> map = new HashMap<String, Object>();
			Participation participation = eventService.getParticiation(10008);
			eventService.updateWinningFlag(map);
			
			Assert.assertEquals(1, participation.getWinningFlag()); //뭐야이것?
			
		}
		
		
		//@Test
		public void testGetWinnerList() throws Exception {
			
			Map<String, Object> map = eventService.getWinnerList(10005);
			List<Participation> list = (List<Participation>)map.get("list");
			Assert.assertEquals(1, list.size());
			
		}
		
		//@Test
		public void testGetApplyList() throws Exception {
			
			Map<String,Object> map = eventService.getApplyList(10005);
			List<Participation> list = (List<Participation>)map.get("list");
			Assert.assertEquals(3, list.size());
			
			for(Participation p : list) {
				System.out.print("userNo:"+ p.getUserNo());
				if(p.getWinningFlag()==0) {
					System.out.println("미당첨");
				}else if(p.getWinningFlag()==1) {
					System.out.println("당첨 ! 축하합니다 !");
				}
			}
		}
		
		@Test
		public void testGetPartList() throws Exception{
			System.out.println("시작작작작작");
			Search search = new Search();
			
			search.setPageSize(pageSize);
			search.setCurrentPage(1);
			search.setUserNo(10005);
			
			Map<String, Object> map = eventService.getPartList(search); //userNo이얌 
			
			List<Participation> list = (List<Participation>)map.get("list");
			Page resultPage	= 
					new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
			
			
			System.out.println(list.size());
			
			for(Participation p: list) {
				System.out.println(p);
			}
			
		}
		
		//@Test
		public void testGetParticipation() throws Exception {
			Participation participation = eventService.getParticiation(10008);
			Assert.assertNotNull(participation);
			
			Assert.assertEquals(10004, participation.getPreviewNo());
			Assert.assertEquals(10003, participation.getUserNo());
			Assert.assertEquals(1, participation.getPartType());
			Assert.assertEquals(0, participation.getWinningFlag());
		}
		
		
		//@Test
		public void testquizRecord() throws Exception  {
			Participation participation = eventService.getQuizRecord(10005);
			Assert.assertNotNull(participation);
			
			Assert.assertEquals(2.0, participation.getTotalQuizCount());
			Assert.assertEquals(1.0, participation.getWinQuizCount());
			int rate = (int)(participation.getWinQuizCount()/participation.getTotalQuizCount()*100);
			System.out.println("당신의 정답률은..?" + rate + "%");
		}
		
		
		//@Test
		public void getPreparedRandTest() throws Exception  {
			
			List<Preview> list = eventService.getPrepareRand();
			
			System.out.println(list.size());
			for (Preview p : list) {
				System.out.println("pppppppppppppp>>>>>>>>>>>>>>>>>>>>"+p);
			}
		}
		
		//@Test
		public void getAllt() throws Exception  {
			
			List<Preview> list = eventService.getAllPreview();
			
			System.out.println(list.size());
			for (Preview p : list) {
				System.out.println("pppppppppppppp>>>>>>>>>>>>>>>>>>>>"+p);
			}
		}
		
		
		//@Test
				public void getStUpdateList() throws Exception  {
					
					List<Preview> list = eventService.updateStPrev();
					
					System.out.println(list.size());
					for (Preview p : list) {
						System.out.println("pppppppppppppp>>>>>>>>>>>>>>>>>>>>"+p);
					}
				}
}
