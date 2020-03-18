package com.mmm.service.user;

import java.util.List;
import java.util.Map;

import com.mmm.common.Search;
import com.mmm.service.domain.User;

public interface UserDao {
	
	//INSERT
	public void addUser(User user) throws Exception;
	
	//INSERT
	public void extraAddUser(User user) throws Exception;
	
	//SELECT ONE
	public User getUser(int userNo)throws Exception;
	
	//SELECT ONE(ID) 
	public User getUserId(String userId)throws Exception;
	
	//SELECT ONE(ID) getPhone
	public User getPhone(String phone)throws Exception;
	
	//SELECT ONE(ID) getEmail
	public User getEmail(String email)throws Exception;
	
	//ID Duplication
	public User getUserIdDupl(String userId)throws Exception;
	
	//Phone Duplication
	public User getPhoneDupl(String phone)throws Exception;
	
	//email Duplication
	public User getEmailDupl(String email)throws Exception;
		
	//SELECT LIST
	public List<User> getUserList(Search search) throws Exception;
	
	//UPDATE 
	public void updateUser(User user) throws Exception;
	
	//회원탈퇴
	public void updateUserStatus(User user) throws Exception;
	
	//회원 목록 page 처리를 위한 전체 Row(totalCount) return
	public int getTotalCount(Search search) throws Exception;
	
	//내가본영화
	public List<Map<String, Object>> getSeenMovieList(Search search) throws Exception;
	
	//내가본영화 전체수
	public int getSeenMovieCnt(String phone) throws Exception;

}
