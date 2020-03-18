package com.mmm.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.mmm.common.Search;
import com.mmm.service.domain.User;
import com.mmm.service.user.UserDao;
import com.mmm.service.user.UserService;

//==> 회원관리 서비스 구현
@Service("userServiceImpl")
public class UserServiceImpl implements UserService {
	
	///Field
	@Autowired
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	
	///Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}


	///Method
	@Override
	public void addUser(User user) throws Exception {
		 userDao.addUser(user); 
		
	}
	
	@Override
	public void extraAddUser(User user) throws Exception {
		 userDao.extraAddUser(user); 
		
	}

	@Override
	public boolean idCheckDupl(String userId) throws Exception {
		boolean result = true;
		User user = userDao.getUserIdDupl(userId);
		//user 정보가 있으면 false
		if(user != null) {
			result= false;
		}
		return result;
	}
	
	@Override
	public boolean phoneCheckDupl(String phone) throws Exception {
		boolean result = true;
		User user = userDao.getPhoneDupl(phone);
		//user 정보가 있으면 false
		if(user != null) {
			result= false;
		}
		return result;
	}
	
	@Override
	public boolean emailCheckDupl(String email) throws Exception {
		boolean result = true;
		User user = userDao.getEmailDupl(email);
		//user 정보가 있으면 false
		if(user != null) {
			result= false;
		}
		return result;
	}

	@Override
	public User getUser(int userNo) throws Exception {
		return userDao.getUser(userNo);
	}
	
	@Override
	public User getUserId(String userId) throws Exception {
		return userDao.getUserId(userId);
	}
	
	@Override
	public User getPhone(String phone) throws Exception {
		return userDao.getPhone(phone);
	}
	
	@Override
	public User getEmail(String email) throws Exception {
		return userDao.getEmail(email);
	}

	@Override
	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
				
	}

	public Map<String,Object> getUserList(Search search) throws Exception {
		List<User> list = userDao.getUserList(search);
		int totalCount = userDao.getTotalCount(search);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list",list);
		map.put("totalCount", new Integer(totalCount));

		return map;
	}

	@Override
	public void updateUserStatus(User user) throws Exception {
		userDao.updateUserStatus(user);
		
	}

	@Override
	public List<Map<String, Object>> getSeenMovieList(Search search) throws Exception {
		return userDao.getSeenMovieList(search);
	}


	@Override
	public int getSeenMovieCnt(String phone) throws Exception {
		return userDao.getSeenMovieCnt(phone);
	}

	

}
