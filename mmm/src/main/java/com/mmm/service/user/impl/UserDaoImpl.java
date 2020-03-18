package com.mmm.service.user.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.mmm.common.Search;
import com.mmm.service.domain.User;
import com.mmm.service.user.UserDao;


//==> 회원관리 DAO CRUD 구현
@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao {
	
	///Field
	@Autowired
	//@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlsession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public UserDaoImpl() {
		System.out.println(this.getClass());
	}
	
	///Method 
	
	
	public void addUser(User user) throws Exception {
		sqlSession.insert("UserMapper.addUser",user);
	}
	
	public void extraAddUser(User user) throws Exception {
		sqlSession.insert("UserMapper.extraAddUser",user);
	}

	public User getUser(int userNo) throws Exception {
		return sqlSession.selectOne("UserMapper.getUser", userNo);
	}
	
	public User getUserIdDupl(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.getUserIdDupl", userId);
	}
	
	public User getPhoneDupl(String phone) throws Exception {
		return sqlSession.selectOne("UserMapper.getPhoneDupl", phone);
	}
	
	public User getEmailDupl(String email) throws Exception {
		return sqlSession.selectOne("UserMapper.getEmailDupl", email);
	}
	
	public User getUserId(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.getUserId", userId);
	}
	
	public User getPhone(String phone) throws Exception {
		return sqlSession.selectOne("UserMapper.getPhone", phone);
	}
	
	public User getEmail(String email) throws Exception {
		return sqlSession.selectOne("UserMapper.getEmail", email);
	}

	public List<User> getUserList(Search search) throws Exception {
		return sqlSession.selectList("UserMapper.getUserList",search);
	}

	
	public void updateUser(User user) throws Exception {
		sqlSession.update("UserMapper.updateUser",user);
	}

	
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("UserMapper.getTotalCount",search);
	}

	
	  @Override
	  public void updateUserStatus(User user) throws Exception {
		  sqlSession.update("UserMapper.updateUserStatus",user);
	  
	  }

	@Override
	public List<Map<String, Object>> getSeenMovieList(Search search) throws Exception {
		return sqlSession.selectList("UserMapper.getSeenMovieList", search);
	}

	@Override
	public int getSeenMovieCnt(String phone) throws Exception {
		return sqlSession.selectOne("UserMapper.getSeenMovieCnt", phone);
	}
	 

}
