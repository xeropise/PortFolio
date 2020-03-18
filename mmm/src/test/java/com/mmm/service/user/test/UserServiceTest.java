package com.mmm.service.user.test;


import java.util.List;
import java.util.Map;
import java.util.Random;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mmm.common.Search;
import com.mmm.service.domain.User;
import com.mmm.service.user.UserService;

import junit.framework.Assert;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/context-aspect.xml",
								   "classpath:config/context-common.xml",
								   "classpath:config/context-mybatis.xml",
								   "classpath:config/context-transaction.xml",})

public class UserServiceTest {
	
	
	//==>@RunWith, @ContextConfiguration 이용 Wiring, Test 할 instance DI
		@Autowired
		@Qualifier("userServiceImpl")
		private UserService userService;

		

		//@Test
		public void TestAddUser() throws Exception{
			
			User user= new User();
			
			//user.setUserNo(111);
			user.setUserId("testUserId3");
			user.setUserName("testUserName");
			user.setPassword("test1234");
			user.setBirth("19920404");
			user.setGender("F");
			user.setPhone("01033334444");
			user.setEmail("su222@naver.com");
			user.setLikeGenre1("스릴러");
			user.setLikeGenre2("액션");
			user.setLikeGenre3("코미디");
			user.setLikeTheater1("강남1");
			user.setLikeTheater2("강남2");
			user.setLikeTheater3("강남3");		
//			SimpleDateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
//			Calendar cal = Calendar.getInstance();
//			String today = null;
//			today = dateFormat.format(cal.getTime());
//			Timestamp ts = Timestamp.valueOf(today);
//			user.setUserDate(ts);
//			user.setIdentity(0);
			
			userService.addUser(user);

		}
		
		//@Test
		public void testGetUser() throws Exception{
			
			User user = new User();
			
			user = userService.getUser(10000);
			
			System.out.println(user);
			
		}
		
		//@Test
		public void testUpdateUser() throws Exception{
			
			User user = userService.getUser(10000);
			
			user.setPassword("abc123");
			user.setEmail("y@gmail.com");
			user.setLikeGenre1("멜로");
			user.setBirth("201112");
			
			userService.updateUser(user);
			
			System.out.println(userService.getUser(10000));
		}
		
		//@Test 
		public void testGetUserListAll() throws Exception{
			
			Search search = new Search();
			search.setCurrentPage(1);
			search.setPageSize(3);
			Map<String,Object> map = userService.getUserList(search);
			
			List<Object> list = (List<Object>)map.get("list");
			Assert.assertEquals(3, list.size());
			
			//==> console 확인
		 	System.out.println("list::"+list);
			
			Integer totalCount = (Integer)map.get("totalCount");
			System.out.println(totalCount);
			
			System.out.println("====================================");
			
			search.setCurrentPage(1);
			search.setPageSize(3);
			search.setSearchCondition("0");
			search.setSearchKeyword("");
			map = userService.getUserList(search);
			
			list= (List<Object>)map.get("list");
			Assert.assertEquals(3, list.size());
			
			totalCount = (Integer)map.get("totalCount");
			System.out.println(totalCount);
			
		}
		
		//@Test 
		public void testGetUserListByUserId() throws Exception{
			
			Search search = new Search();
			search.setCurrentPage(1);
		 	search.setPageSize(3);
		 	search.setSearchCondition("0");
		 	search.setSearchKeyword("testUserId");
		 	Map<String,Object> map = userService.getUserList(search);
		 	
		 	List<Object> list = (List<Object>)map.get("list");
		 	//Assert.assertEquals(3, list.size());
		 	
		 	//==> console 확인
		 	System.out.println(list);
			
		 	Integer totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 	
		 	System.out.println("=======================================");
		 	
			
		}
		
		//@Test 
		public void testGetUserListByUserName() throws Exception{
			
			Search search = new Search();
			search.setCurrentPage(1);
			search.setPageSize(3);
			search.setSearchCondition("1");
			search.setSearchKeyword("testUserName");
			Map<String,Object> map = userService.getUserList(search);
			
			List<Object>list = (List<Object>)map.get("list");
			
			//==> console 확인
		 	System.out.println(list);
			
		 	System.out.println("=======================================");
		 	
		 	Integer totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		
		}
		
		//@Test 
		public void testGetUserListByUserGrade() throws Exception{
			
			Search search = new Search();
			search.setCurrentPage(1);
			search.setPageSize(3);
			search.setSearchCondition("2");
			search.setSearchKeyword("1");
			Map<String,Object>map = userService.getUserList(search);
			
			List<Object> list =(List<Object>)map.get("list");
			
			System.out.println(list);
			
			System.out.println("=======================================");

			Integer totalCount = (Integer)map.get("totalCount");
			System.out.println(totalCount);
			
			
		        
		        Random rand = new Random();
		        String numStr = ""; //난수가 저장될 변수
		        int len = 6;
		        int dupCd = 1;
		        
		        for(int i=0;i<len;i++) {
		            
		            //0~9 까지 난수 생성
		            String ran = Integer.toString(rand.nextInt(10));
		            
		            if(dupCd==1) {
		                //중복 허용시 numStr에 append
		                numStr += ran;
		            }else if(dupCd==2) {
		                //중복을 허용하지 않을시 중복된 값이 있는지 검사한다
		                if(!numStr.contains(ran)) {
		                    //중복된 값이 없으면 numStr에 append
		                    numStr += ran;
		                }else {
		                    //생성된 난수가 중복되면 루틴을 다시 실행한다
		                    i-=1;
		                }
		            }
		        }
		        System.out.println("난수!!!"+numStr);


		}
		
		
	  //@Test 
	  public void testupdateUserStatus() throws Exception{
		  
		  User user = userService.getUser(10000);
	  
	  userService.updateUserStatus(user);
	  
	 // System.out.println("userStatus"+(userService.getUser("user01")).getUserStatus());
	   System.out.println(userService.getUser(10000));
	  
	  }
	 
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
