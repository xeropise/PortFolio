package com.mmm.service.board;

import java.util.List;
import java.util.Map;

import com.mmm.common.Search;
import com.mmm.service.domain.Article;
import com.mmm.service.domain.Blind;
import com.mmm.service.domain.Comment;
import com.mmm.service.domain.Like;

public interface BoardDao {
	
	public void addArtice(Article article) throws Exception;
	
	public Article getArticle(int articleNo) throws Exception;
	
	public Map<String, Object> getArticleList(Search search) throws Exception;
	
	public void updateArticle(Article article) throws Exception;
	
	public void deleteArticle(int articleNo) throws Exception;
	
	public void addComment(Comment comment) throws Exception;
	
	public Map<String, Object> getCommentList(Search search) throws Exception;
	
	public void updateComment(Comment comment) throws Exception;
	
	public void deleteComment(int commentNo) throws Exception;
	
	public void addLike(Like like) throws Exception;
	
	public void deleteLike(Like like) throws Exception;

	public void addArticleBlind(Blind blind) throws Exception;
	
	public void addCommentBlind(Blind blind) throws Exception;
	
	public List<Article> getArtBlindList(Search search) throws Exception;
	
	public Article getReply(int articleNo) throws Exception;
	
	public void updateViewCnt(int articleNo) throws Exception;
	
	
}
