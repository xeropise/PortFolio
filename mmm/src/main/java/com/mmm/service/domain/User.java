package com.mmm.service.domain;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class User {
	
	///Field
	private int userNo;
	private String userId;
	private String userName;
	private String password;
	private String role;
	private String profile; 		//회원 프로필 이미지 
	private MultipartFile image;  //이미지 업로드 
	private String birth;
	private String gender;
	private String phone;
	private String email;
	private String likeGenre1;
	private String likeGenre2;
	private String likeGenre3;
	private String likeTheater1;
	private String likeTheater2;
	private String likeTheater3;
	private Timestamp userDate;
	private Timestamp userByeDate;
	private Timestamp lastLoginDate;	// 마지막 로그인 날짜
	private Timestamp updateUserDate;	// 마지막 회원정보수정 날짜
	private Timestamp updatePwDate;		// 마지막 비밀번호수정 날짜
	private int identity;
	private int userStatus;
	private int userGrade;
	private int totalPoint;
	private int accPoint;
	

	//Method
	
	public int getUserNo() {
		return userNo;
	}
	public String getUserId() {
		return userId;
	}
	public String getUserName() {
		return userName;
	}
	public String getPassword() {
		return password;
	}
	public String getRole() {
		return role;
	}
	public String getProfile() {
		return profile;
	}
	public MultipartFile getImage() {
		return image;
	}
	public String getBirth() {
		return birth;
	}
	public String getGender() {
		return gender;
	}
	public String getPhone() {
		return phone;
	}
	public String getEmail() {
		return email;
	}
	public String getLikeGenre1() {
		return likeGenre1;
	}
	public String getLikeGenre2() {
		return likeGenre2;
	}
	public String getLikeGenre3() {
		return likeGenre3;
	}
	public String getLikeTheater1() {
		return likeTheater1;
	}
	public String getLikeTheater2() {
		return likeTheater2;
	}
	public String getLikeTheater3() {
		return likeTheater3;
	}
	public Timestamp getUserDate() {
		return userDate;
	}
	public Timestamp getUserByeDate() {
		return userByeDate;
	}
	public Timestamp getLastLoginDate() {
		return lastLoginDate;
	}
	public Timestamp getUpdateUserDate() {
		return updateUserDate;
	}
	public Timestamp getUpdatePwDate() {
		return updatePwDate;
	}
	public int getIdentity() {
		return identity;
	}
	public int getUserStatus() {
		return userStatus;
	}
	public int getUserGrade() {
		return userGrade;
	}
	public int getTotalPoint() {
		return totalPoint;
	}
	public int getAccPoint() {
		return accPoint;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setLikeGenre1(String likeGenre1) {
		this.likeGenre1 = likeGenre1;
	}
	public void setLikeGenre2(String likeGenre2) {
		this.likeGenre2 = likeGenre2;
	}
	public void setLikeGenre3(String likeGenre3) {
		this.likeGenre3 = likeGenre3;
	}
	public void setLikeTheater1(String likeTheater1) {
		this.likeTheater1 = likeTheater1;
	}
	public void setLikeTheater2(String likeTheater2) {
		this.likeTheater2 = likeTheater2;
	}
	public void setLikeTheater3(String likeTheater3) {
		this.likeTheater3 = likeTheater3;
	}
	public void setUserDate(Timestamp userDate) {
		this.userDate = userDate;
	}
	public void setUserByeDate(Timestamp userByeDate) {
		this.userByeDate = userByeDate;
	}
	public void setLastLoginDate(Timestamp lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}
	public void setUpdateUserDate(Timestamp updateUserDate) {
		this.updateUserDate = updateUserDate;
	}
	public void setUpdatePwDate(Timestamp updatePwDate) {
		this.updatePwDate = updatePwDate;
	}
	public void setIdentity(int identity) {
		this.identity = identity;
	}
	public void setUserStatus(int userStatus) {
		this.userStatus = userStatus;
	}
	public void setUserGrade(int userGrade) {
		this.userGrade = userGrade;
	}
	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}
	public void setAccPoint(int accPoint) {
		this.accPoint = accPoint;
	}
	
	
	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userId=" + userId + ", userName=" + userName + ", password=" + password
				+ ", role=" + role + ", profile=" + profile + ", image=" + image + ", birth=" + birth + ", gender="
				+ gender + ", phone=" + phone + ", email=" + email + ", addr=" + ", likeGenre1=" + likeGenre1
				+ ", likeGenre2=" + likeGenre2 + ", likeGenre3=" + likeGenre3 + ", likeTheater1=" + likeTheater1
				+ ", likeTheater2=" + likeTheater2 + ", likeTheater3=" + likeTheater3 + ", userDate=" + userDate
				+ ", userByeDate=" + userByeDate + ", lastLoginDate=" + lastLoginDate + ", updateUserDate="
				+ updateUserDate + ", updatePwDate=" + updatePwDate + ", identity=" + identity + ", userStatus="
				+ userStatus + ", userGrade=" + userGrade + ", totalPoint=" + totalPoint + ", accPoint=" + accPoint
				+ "]";
	}
	
	
	
	
	
	
	
	
}
