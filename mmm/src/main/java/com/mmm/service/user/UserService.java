package com.mmm.service.user;

import java.util.List;
import java.util.Map;

import com.mmm.common.Search;
import com.mmm.service.domain.User;

//==> 회원관리에서 서비스할 내용 추상화/캡슐화한 Service  Interface Definition  
public interface UserService {
	
	//회원가입
	public void addUser(User user) throws Exception;
	
	//SNS 추가정보등록
	public void extraAddUser(User user) throws Exception;
	
	//회원 ID 중복확인(a.jax)
	public boolean idCheckDupl(String userId) throws Exception;
	
	//phone 중복확인(a.jax)
	public boolean phoneCheckDupl(String phone) throws Exception;
		
	//email 중복확인(a.jax)
	public boolean emailCheckDupl(String email) throws Exception;
	
	//내정보조회 / user 로그인
	public User getUser(int userNo) throws Exception;
	
	//user 로그인
	public User getUserId(String userId) throws Exception;
	
	//아이디 찾기, 비밀번호 찾기
	public User getPhone(String phone) throws Exception;
	
	//아이디 찾기, 비밀번호 찾기
	public User getEmail(String email) throws Exception;
	
	//회원정보수정 / 비밀번호 재설정
	public void updateUser(User user) throws Exception;
		
	//회원탈퇴 / 복구 / 
	public void updateUserStatus(User user) throws Exception;
		
	//회원정보리스트 (admin)
	public Map<String,Object> getUserList(Search search)throws Exception;
	
	//내가본영화
	public List<Map<String, Object>> getSeenMovieList(Search search) throws Exception;
	
	//내가본영화 전체수
	public int getSeenMovieCnt(String phone) throws Exception;
	
	
	
	
	

}
