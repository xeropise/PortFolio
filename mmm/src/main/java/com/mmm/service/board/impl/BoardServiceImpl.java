package com.mmm.service.board.impl;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mmm.common.Search;
import com.mmm.service.board.BoardDao;
import com.mmm.service.board.BoardService;
import com.mmm.service.domain.Article;
import com.mmm.service.domain.Blind;
import com.mmm.service.domain.Comment;
import com.mmm.service.domain.Like;


@Service("boardServiceImpl")
public class BoardServiceImpl implements BoardService{

	@Autowired
	@Qualifier("boardDaoImpl") 
	private BoardDao boardDao;
	public void BoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	
	public BoardServiceImpl() {
		System.out.println(this.getClass());
	}


	@Override
	public void addArtice(Article article) throws Exception {
		boardDao.addArtice(article);
	}

	@Override
	public Article getArticle(int articleNo) throws Exception {
		boardDao.updateViewCnt(articleNo);
		return boardDao.getArticle(articleNo);
	}

	@Override
	public Map<String, Object> getArticleList(Search search) throws Exception {
		return boardDao.getArticleList(search);
	}

	@Override
	public void updateArticle(Article article) throws Exception {
		boardDao.updateArticle(article);
		
	}

	@Override
	public void deleteArticle(int articleNo) throws Exception {
		boardDao.deleteArticle(articleNo);
		
	} 

	@Override
	public void addComment(Comment comment) throws Exception {
		boardDao.addComment(comment);
	}

	@Override
	public  Map<String, Object> getCommentList(Search search) throws Exception {
		return boardDao.getCommentList(search);
	}

	@Override
	public void updateComment(Comment comment) throws Exception {
		boardDao.updateComment(comment);
	}

	@Override
	public void deleteComment(int commentNo) throws Exception {
		boardDao.deleteComment(commentNo);
		
	}

	@Override
	public void addLike(Like like) throws Exception {
		boardDao.addLike(like);
	}

	@Override
	public void deleteLike(Like like) throws Exception {
		boardDao.deleteLike(like);
		
	}

	@Override
	public void addArticleBlind(Blind blind) throws Exception {
		boardDao.addArticleBlind(blind);
	}

	@Override
	public void addCommentBlind(Blind blind) throws Exception {
		boardDao.addCommentBlind(blind);
	}

	@Override
	public List<Article> getArtBlindList(Search search) throws Exception {
		return boardDao.getArtBlindList(search);
	}

	@Override
	public String saveImage(MultipartFile file) throws Exception {
		
		String filePath = "C:\\Users\\user\\git\\MainPJTmmm\\mmm\\WebContent\\resources\\image";
		
		String saveName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
		
		File saveFile = new File(filePath, saveName);
		
		try {
			file.transferTo(saveFile);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return saveName;
		
	}

	@Override
	public Article getReply(int articleNo) throws Exception {
		return boardDao.getReply(articleNo);
	}


//	private String saveFile(MultipartFile file) {
//		
//		String filePath = "C:\\Users\\user\\git\\MainPJTmmm\\mmm\\WebContent\\resources\\image";
//		String saveName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
//		File saveFile = new File(filePath, saveName);
//		
//		try {
//			file.transferTo(saveFile);
//		}catch(Exception e) {
//			e.printStackTrace();
//			return null;
//		}
//		
//		return saveName;
//		
//	}

}
