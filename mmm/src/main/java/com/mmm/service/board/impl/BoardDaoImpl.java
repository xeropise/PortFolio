package com.mmm.service.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.mmm.common.Search;
import com.mmm.service.board.BoardDao;
import com.mmm.service.domain.Article;
import com.mmm.service.domain.Blind;
import com.mmm.service.domain.Comment;
import com.mmm.service.domain.Like;


@Repository("boardDaoImpl")
public class BoardDaoImpl implements BoardDao{

	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	@Override
	public void addArtice(Article article) throws Exception {
		sqlSession.insert("BoardMapper.addArticle", article);
		System.out.println("addArticleDao에서 ............."+ article);
	}

	@Override
	public Article getArticle(int articleNo) throws Exception {
		return sqlSession.selectOne("BoardMapper.getArticle", articleNo);
	}

	@Override
	public Map<String, Object> getArticleList(Search search) throws Exception {
		
		 List<Article> list = sqlSession.selectList("BoardMapper.getArticleList", search);
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("list", list);
		 
		 int totalCount = sqlSession.selectOne("BoardMapper.article_count", search);
		 map.put("totalCount", totalCount);
		 
		 System.out.println("map>>>>>>>>>>>>>>>>>>>>>"+map);
		return map;
	}

	@Override
	public void updateArticle(Article article) throws Exception {
		sqlSession.update("BoardMapper.updateArticle", article);
		
	}

	@Override
	public void deleteArticle(int articleNo) throws Exception {
		sqlSession.update("BoardMapper.deleteArticle", articleNo);
		
	}

	@Override
	public void addComment(Comment comment) throws Exception {
		sqlSession.insert("BoardMapper.addComment", comment);
	}

	@Override
	public  Map<String, Object> getCommentList(Search search) throws Exception {
		
		List<Comment> list =  sqlSession.selectList("BoardMapper.getCommentList", search);
		int totalCount = sqlSession.selectOne("BoardMapper.getCmtCount", search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public void updateComment(Comment comment) throws Exception {
		sqlSession.update("BoardMapper.updateComment", comment);
	}

	@Override
	public void deleteComment(int commentNo) throws Exception {
		sqlSession.update("BoardMapper.deleteComment", commentNo);
	}
	
	@Override
	public void addLike(Like like) throws Exception {
		sqlSession.insert("BoardMapper.addLike", like);
	}
	
	
	@Override
	public void deleteLike(Like like) throws Exception {
		sqlSession.delete("BoardMapper.deleteLike", like);
	}

	@Override
	public void addArticleBlind(Blind blind) throws Exception {
		sqlSession.update("BoardMapper.articleBlind", blind);
	}

	
	@Override
	public void addCommentBlind(Blind blind) throws Exception {
		sqlSession.update("BoardMapper.commentBlind", blind);
	}
	
	@Override
	public List<Article> getArtBlindList(Search search) throws Exception {
		return sqlSession.selectList("BoardMapper.getArtBlindList", search);
	}


	@Override
	public Article getReply(int articleNo) throws Exception {
		return sqlSession.selectOne("BoardMapper.getReArticle", articleNo);
	}


	@Override
	public void updateViewCnt(int articleNo) throws Exception {
		sqlSession.update("BoardMapper.updateViewCnt", articleNo);
	}
	

}
