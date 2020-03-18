package com.mmm.service.board.test;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mmm.common.Search;
import com.mmm.service.board.BoardService;
import com.mmm.service.domain.Article;
import com.mmm.service.domain.Blind;
import com.mmm.service.domain.Comment;
import com.mmm.service.domain.Like;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-aspect.xml",
									"classpath:config/context-common.xml",
									"classpath:config/context-mybatis.xml",
									"classpath:config/context-transaction.xml"})
public class BoardServiceTest {
	
	
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	
	
	//@Test
	public void testAddArticle() throws Exception{
		
		Article article = new Article(); 
		
		article.setArticleType(4); 
		article.setUserId("user03");
		
		article.setArticleTitle("자유한국당!");
		article.setSupArticleNo(10001);
		
		boardService.addArtice(article);

	}
	
	
	
	//@Test
	public void testgetArticle() throws Exception{
		
		int articleNo = 10001;
		
		Article article = boardService.getArticle(articleNo);
		
		Assert.assertEquals(2, article.getArticleType());
		Assert.assertEquals("공지사항입니다", article.getArticleTitle());

	}
	
//	
//	//@Test
//	public void testgetArticleList() throws Exception{
//		
//		Search search = new Search();
//		List<Article> list = boardService.getArticleList(search);
//		
//		Assert.assertEquals(2, list.size());
//
//	}
	
	//@Test
	public void testUpdateArticle() throws Exception{
		
		Article article = new Article(); 
		article.setArticleNo(10001);

		article.setArticleType(2); 
		article.setUserId("admin");
		
		article.setArticleTitle("수정된 공지사항입니다");
		article.setContent("수정된 공지사항 내용입니다");
		
		boardService.updateArticle(article);

	}
	
	//@Test
	public void testDeleteArticle() throws Exception{
		
		int articleNo = 10004;
		
		Article article = boardService.getArticle(articleNo);
		Assert.assertNotNull(article);
		
		Assert.assertEquals(1, article.getArticleType());

		
		boardService.deleteArticle(articleNo);
	}
	
	
	//@Test
	public void testAddComment() throws Exception{
		
		Comment comment = new Comment();
		
		comment.setUserId("user03");
		comment.setCommentContent("안녕하세요 대댓 답니다");
		comment.setCommentType(1);
		comment.setArticleNo(10001);
		
		boardService.addComment(comment);
	}
	
	
//	//@Test
//	public void testgetCommentList() throws Exception{
//		
//		Search search = new Search();
//		List<Comment> list = boardService.getCommentList(search);
//		System.out.println(list);
//		Assert.assertEquals(3, list.size());
//
//	}
//	
	
	//@Test
	public void testUpdateCmt() throws Exception{
		
		Comment comment = new Comment();
		int commentNo = 10000;
		
		comment.setCommentNo(commentNo);
		comment.setCommentContent("댓글 수정할게염");
		
		boardService.updateComment(comment);
		
		Assert.assertEquals("댓글 수정할게염", comment.getCommentContent());

	}
	
	
	//@Test
	public void testDeleteCmt() throws Exception{
		
		int commentNo = 10000;
		boardService.deleteComment(commentNo);

	}
	
	
	//@Test
	public void testAddLike() throws Exception {
		
		Like like = new Like();
		like.setUserId("user04");
		like.setCommentNo(10002);
		
		boardService.addLike(like);
	}
	
	
	
	//@Test
	public void testDeleteLike() throws Exception {
		
		Like like = new Like();
		like.setUserId("user04");
		like.setCommentNo(10002);
		
		boardService.deleteLike(like);
		
	}
	
	
	//@Test
	public void testArtBlind() throws Exception {
		int articleNo = 10005;
		
		Article article = boardService.getArticle(articleNo);
		Assert.assertNotNull(article);
		
		Blind blind = new Blind();
		blind.setArticleNo(articleNo);
		blind.setBlindReason(2); //2는 비방 및 명예후ㅔ손...
		
		boardService.addArticleBlind(blind);
		
		Assert.assertEquals(2, article.getBlindReason());
		
	}
	
	
	  //@Test 
	  public void testCmtBlind() throws Exception { 
		  
		  int commentNo = 10001;
		  Blind blind = new Blind();
		  blind.setCommentNo(commentNo);
		  blind.setBlindReason(3); //3는 도배성 게시글...
		  
		  boardService.addCommentBlind(blind);
	 
	  }

	 // @Test
	  public void testArtList() throws Exception {
		  
		  Search search = new Search();
		  List<Article> list = boardService.getArtBlindList(search);
		  System.out.println(list);
	  }
	  
	  
	 // @Test
	  public void testGetReply() throws Exception {
		  
		  int articleNo = 10042;
		  Article article = boardService.getReply(articleNo);
		  
		  Assert.assertNotNull(article);
		  System.out.println(">>>>>>>>>>>>>>>>>>>>>>>"+article);
	  }
	  
	  @Test
	  public void testCmtList() throws Exception {
		  
		  Search search = new Search();
		  search.setParent(10001);
		  search.setCommentType(0);
		  search.setPageSize(pageSize);
		  if(search.getCurrentPage()==0) {
			  
			  search.setCurrentPage(1);
		  }
		  
		  Map<String, Object> map = boardService.getCommentList(search);
		  List<Comment> list = (List<Comment>)map.get("list");
		  
		  System.out.println(list.size());
		  
		  for(Comment cmt: list) {
			  System.out.println(""+cmt.getCommentContent());
		  }
		  
		  
	  }
	  
	 }
