package com.mmm.service.datetime.test;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.openqa.selenium.By;
import org.openqa.selenium.ElementClickInterceptedException;
import org.openqa.selenium.ElementNotInteractableException;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mmm.service.datetime.DateTimeService;
import com.mmm.service.domain.DateTime;
import com.mmm.service.movie.MovieService;
import com.mmm.common.JavaUtil;
import com.mmm.common.MovieAPI;
import com.mmm.common.Search;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-aspect.xml",
									"classpath:config/context-common.xml",
									"classpath:config/context-mybatis.xml",
									"classpath:config/context-transaction.xml"})
public class DateTimeServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	private DateTimeService dateTimeService;

	//@Autowired
	//private TheaterService theaterService;
	
	//@Autowired
	//private TicketingService ticketingService;
	
	@Autowired
	private MovieService movieService;
	
	private DateTime dateTime;
	
	@Test
	public void testAddDateTime() throws Exception {
		
		

		long start = System.currentTimeMillis();
        System.setProperty("webdriver.chrome.driver","C:\\chromedriver.exe");
//        System.setProperty("webdriver.chrome.driver", "/Users/Jee-hang/chromedriver/chromedriver");	// for Mac chrome version 80

        //GUI�� ���� headless option ����
        ChromeOptions options = new ChromeOptions();
        //options.addArguments("headless");
        
        
        //WebDriver driver = new ChromeDriver(options);
        WebDriver driver = new ChromeDriver();
        JavascriptExecutor executor = (JavascriptExecutor)driver;
        //driver.manage().timeouts().implicitlyWait(5000, TimeUnit.MILLISECONDS);
        WebDriverWait wait = new WebDriverWait(driver,1000);
        
        String maxMovie = "https://ticket.maxmovie.com/Reserve/Date";
        int movieCount = 0;
        int franchiseCount = 0;
        int localCount = 0;
        int screenCount = 0;
        
        
	        	driver.get(maxMovie);
	            By date =By.cssSelector("span.pa");
	            By movieName = By.cssSelector("#rsvStep1 > div:nth-child(2) > div > div > div.msliin.sche > div > div.scrollbar-dynamic.scroll-content.scroll-scrolly_visible > div > ul > li > a");
	            By franchise = By.cssSelector("#step2TheaterList > li > a");
	            By Seoul = By.cssSelector("#step2TheaterAreaGroup > li:nth-child(1) > a.zac");
	            By local = By.cssSelector("#step2TheaterAreaGroup > li.ov > div.msyein > div > div.scrollbar-dynamic.scroll-content > div > ul > li > a");
	            By localRe = By.cssSelector("#step2TheaterAreaGroup > li.ov > a.zre");
	            By theaterName = By.cssSelector("#step2TheaterAreaGroup > li.ov > div.mstime.schi.open > div > div.mstimein.scrollbar-dynamic.scroll-content.scroll-scrolly_visible > div > ul > li > p > a.btnTheaterName");
	            By screenName = By.cssSelector("#step2TheaterAreaGroup > li.ov > div.mstime.schi.open > div > div.mstimein.scrollbar-dynamic.scroll-content > div > ul > li > div > p:first-child ");
	            By timeTable = By.cssSelector("#step2TheaterAreaGroup > li.ov > div.mstime.schi.open > div > div.mstimein.scrollbar-dynamic.scroll-content.scroll-scrolly_visible > div > ul > li > div > ul:nth-child(2)");
	            By poster = By.cssSelector("#reserveInfoImage");
	            List<WebElement> calendar =driver.findElements(date);
	            List<WebElement> months = driver.findElements(date);
	            SimpleDateFormat dateFormat =new SimpleDateFormat("yyyy/MM/dd");
	            SimpleDateFormat timeFormat =new SimpleDateFormat("HH:mm");
	            dateTime = new DateTime();
	            List<String> check =new ArrayList<String>();
	            for( int i=0; i<7; i++) {       	
	            	calendar.get(i).click();
	            	synchronized(calendar.get(i)) {
	            		calendar.get(i).wait(5000);
	            	}	// 뺴지말것
	            	
	            	//1월에서 2월로 변하는지 체크할것.. 지난번에는 변하지 않았음..
	            	
	            	
	            	WebElement parentElement = (WebElement)executor.executeScript("return arguments[0].parentNode;", months.get(i));
	            	
	            	
	            	String sYear = parentElement.getAttribute("data-date").substring(0,4);
	            	String sMonth = parentElement.getAttribute("data-date").substring(5, 7);
	            	check.add(sMonth);
	            	String sDate =calendar.get(i).getText().trim();
	            	StringBuffer sb =new StringBuffer();
	            	sb.append(sYear).append("/").append(sMonth).append("/").append(sDate);
	            	
	            	Timestamp screenDate = new Timestamp(dateFormat.parse(sb.toString()).getTime());
	            	dateTime.setScreenDate(screenDate); // 상영일시 날짜
	            	
	            	List<WebElement> mName = driver.findElements(movieName);
	            	for(WebElement mn : mName) {

	            		while(true) {
	            			try {
	            				
	            				mn.click();
	            				synchronized(mn){
	            					mn.wait(200);
	            				}
	            				if(mn.getText().trim()==null) {
	            					break;
	            				}
	            				//System.out.println("list : "+movieService.getAllofMovieTitle());
	            				//System.out.println("맥스무비 : "+mn.getText().trim());
	            				
	            				//System.out.println("list 목록 :\n"+movieService.getAllofMovieTitle());
	            				//System.out.println("영화 이름 :"+mn.getText().trim());
	            				if(movieService.getAllofMovieTitle().indexOf(mn.getText().trim())==-1) {
	            					break;
	            				}
	            				dateTime.setMovieName(mn.getText().trim()); // 상영일시 영화 이름
	            				
	            				//관람물 등급
	            				if(mn.getAttribute("class").equals("y12")) {
	            					dateTime.setRating("12세");
	            				}else if(mn.getAttribute("class").equals("y15")) {
	            					dateTime.setRating("15세");
	            				}else if(mn.getAttribute("class").equals("y18")) {
	            					dateTime.setRating("18세");
	            				}else if(mn.getAttribute("class").equals("yall")) {
	            					dateTime.setRating("전체");
	            				}
	            				
	            				
	            				synchronized(mn){
	            					mn.wait(2000);
	            				}	            				
	            				WebElement post =driver.findElement(poster);
	            				
	            				//포스터
	            				dateTime.setPoster(post.getAttribute("src").replace("thumbc/", ""));
	            				List<WebElement> fTab = driver.findElements(franchise);
	            				
	            				synchronized(mn){
	            					mn.wait(500);
	            				}
	            				
	            				for(int j=1; j<4; j++) {
	            					
	            					while(true) {
	            						try {
	            							// 여기 로직 수정
	            							// 
	            							if(fTab.get(j).getCssValue("color").equals("rgba(89, 98, 115, 1)") || fTab.get(j).getCssValue("color").equals("rgba(51, 51, 51, 1)")) {
	            								
	            								fTab.get(j).click();
	            								
	            								dateTime.setFranchise(fTab.get(j).getText().trim()); // 상영일시 프랜차이즈
	            								System.out.println(dateTime.getFranchise());
	            								System.out.println(fTab.get(j).getCssValue("color"));// 색깔 테스트
	            								WebElement Se = driver.findElement(Seoul);
	            								if(Se.getCssValue("color").equals("rgba(34, 34, 34, 1)")) {
	            									Se.click(); // 서울을 클릭
	            								}else {
	            									break;
	            								}
	            								List<WebElement> locals = driver.findElements(local);
	            								
	            								for( WebElement lc : locals) {
	            									synchronized(lc) {
	            										lc.wait(500);
	            									}
	            									if(!lc.getAttribute("class").equals("off")) {
	            										while(true) {
	            											try {
				            									synchronized(lc) {
				            										lc.wait(1000);
				            									}			
			            										lc.click();
            										
			            										WebElement lcRe = driver.findElement(localRe);
			            										
				            									synchronized(lc) {
				            										lc.wait(200);
				            									}	
				            									
			            										List<WebElement> tName = driver.findElements(theaterName);
			            										List<WebElement> scName = driver.findElements(screenName);
			            										
			            										for( int k=0; k<scName.size(); k++) {
			            											while(true) {
			            												try {
			            													    
			            														if(tName.isEmpty()) {  
			            															tName = driver.findElements(By.cssSelector("#step2TheaterAreaGroup > li.ov > div.mstime.schi.open > div > div.mstimein.scrollbar-dynamic.scroll-content > div > ul > li > p > a.btnTheaterName"));
			            															if(tName.isEmpty()) {
			            																break;
			            															}
			            														}
			            														
			            														if(tName.get(k).getText().trim()==null) {
			            															break;
			            														}
			            														
			            														dateTime.setTheaterName(tName.get(k).getText().trim());
			            														dateTime.setScreenName(scName.get(k).getText().split("디지털")[0]); // 상영일시 상영관명
			            														
			            														List<WebElement> tTable = driver.findElements(timeTable);
			            														
			            														if(tTable.isEmpty()) {	
			            															tTable = driver.findElements(By.cssSelector("#step2TheaterAreaGroup > li.ov > div.mstime.schi.open > div > div.mstimein.scrollbar-dynamic.scroll-content > div > ul > li > div > ul"));
			            														}
			            														
			            														
			            														String tTime = tTable.get(k).getText();
			            														//System.out.println(tTime);
			            														 while(true) {
			            															 
			            															 if(tTime.indexOf("종료")!=-1) {
			            																 if(tTime.length()-tTime.indexOf("종료")>8) {
			            																	 tTime=tTime.substring(0,tTime.indexOf("종료"))+tTime.substring(tTime.indexOf("종료")+9,tTime.length());
			            																 }else if(tTime.length()-tTime.indexOf("종료")==8) {
			            																	 tTime=tTime.substring(0, tTime.indexOf("종료")-1);
			            																 }
			            															 }else {
			            																 	 for( String s : tTime.split("\n")) {
			            																 		synchronized(s) {
			            						            										s.wait(100);
			            						            									}	
			            																	 
				            																 	 try {	
						            																	 java.util.Date resultTime = timeFormat.parse(s);
						            																	 if(resultTime==null) {
						            																		 break;
						            																	 }
						            																	 Timestamp timeStamp = new Timestamp(resultTime.getTime());
						            																	 dateTime.setScreenTime(timeStamp);	// 상영일시 시간
						            																	 dateTimeService.addDateTime(dateTime);
			            																 		 }catch(ParseException e) {
			            																 			 break;
			            																 		 }
			            																 	 }
			            																 
			            																 break;
			            															 }
			            														 }
			            														
			            														System.out.println();
				            												break;
			            												}catch(StaleElementReferenceException e5) {
			            													System.out.println("screen을 누르면서 오류가 생겼습니다 재시도 !");
			            													screenCount++;
			            												}
			            											}
			            											
			            										}
			            										System.out.println();
				            									synchronized(lc) {
				            										lc.wait(100);
				            									}				            										
			            										
				            									lcRe.click();
				            									break;
	            											}catch(ElementNotInteractableException e4) {
	            												System.out.println("local을 누르면서 오류가 생겼습니다 재시도 ! ");
	            												 localCount++;
	            											}
	            										}
	            									}
	            								}
	            								Se.click();
	            									
	            							}else {
	            								break;
	            							}
	            							
	            							break;
	            						}catch(StaleElementReferenceException e2) {
	            							System.out.println("franchise을 누르면서 오류가 생겼습니다 재시도 !");
	            							franchiseCount++;
	            						}catch(ElementClickInterceptedException e3) {
	            							System.out.println("franchise을 누르면서 오류가 생겼습니다 재시도 !");
	            							franchiseCount++;
	            						}//end of ftab try
	            					}//end of ftab while
	            				}//end of ftab for
	            				
	            				break;
	            			}catch(StaleElementReferenceException e) {
	            				System.out.println("movieName을 누르면서 오류가 생겼습니다 재시도 !");
	            				movieCount++;
	            			}catch(ElementClickInterceptedException e0) {
	            				System.out.println("movieName을 누르면서 오류가 생겼습니다 재시도 !");
	            				movieCount++;
	            			}//end of mn try
	            		}//end of mn while
	            		synchronized(mn) {
	            			mn.wait(300);
	            		}//end of synchronized
	            	}//end of mn for
	            	synchronized(calendar.get(i)) {
	            		calendar.get(i).wait(500);
	            	}//end of synchronized
	            }////end of calendar for	        	
        
        

        long end = System.currentTimeMillis();
        System.out.println("총 실행시간 : "+( end - start)/1000.0);
        System.out.println("오류 발생 :");
        System.out.println("영화에서 발생 : "+movieCount);
        System.out.println("프랜차이즈에서 발생 : "+franchiseCount);
        System.out.println("지역에서 발생  : "+localCount);
        System.out.println("상영관에서 발생 : "+screenCount);
		for(String s: check) {
			System.out.println(s);
		}
	}	
	
	
	//@Test
	public void testGetDateTime() throws Exception {
		
		Assert.assertNotNull(dateTimeService.getDateTime("10001"));
		dateTime =dateTimeService.getDateTime("10001");
		System.out.println(dateTime);
		//==> API 확인
	
		
		
		//System.out.println(date3.);
		Assert.assertEquals("기생충", dateTime.getMovieName());
		// 1월-12월 (0 - 11)
		Assert.assertEquals(0, dateTime.getScreenDate().getMonth());
		Assert.assertEquals(26, dateTime.getScreenDate().getDate());
		Assert.assertEquals("07", JavaUtil.formatNumber2(dateTime.getScreenTime().getHours()));
		Assert.assertEquals("30", JavaUtil.toString(dateTime.getScreenTime().getMinutes()));
		Assert.assertEquals(130, dateTime.getRemainingSeat());
		
		
	}
	
	//@Test
	 public void testUpdateDateTime() throws Exception{
		
		dateTime = dateTimeService.getDateTime("10002"); 
		 
		Assert.assertNotNull(dateTime);
		
		
		dateTime.setMovieName("디아블로");
		
		SimpleDateFormat pattern1 = new SimpleDateFormat("mm-dd");
		java.util.Date date1 =pattern1.parse("01-24");
		Timestamp dateStamp =new Timestamp(date1.getTime());		
		dateTime.setScreenDate(dateStamp);
		
		SimpleDateFormat pattern = new SimpleDateFormat("hh:mm");
		java.util.Date date2 =pattern.parse("07:30");
		Timestamp timeStamp = new Timestamp(date2.getTime());
		
		dateTime.setScreenTime(timeStamp);
		dateTime.setSelectedSeat("A3");
		dateTime.setRemainingSeat(129);
		dateTimeService.updateDateTime(dateTime);
		dateTime = dateTimeService.getDateTime("10002");
		
		//==> API 확인
		Assert.assertEquals("디아블로", dateTime.getMovieName());
		Assert.assertEquals(24, dateTime.getScreenDate().getDate());
		
		Assert.assertEquals("07", JavaUtil.formatNumber2(dateTime.getScreenTime().getHours()));
		Assert.assertEquals("30", JavaUtil.formatNumber2(dateTime.getScreenTime().getMinutes()));
		Assert.assertEquals("A3", dateTime.getSelectedSeat());
		Assert.assertEquals(129, dateTime.getRemainingSeat());
		
	 }
	 
	 //@Test
	 public void testaddTicketing() throws Exception{
	 		
	 		Map<Object,Object> map = new HashMap();
	 		map.put("headCount", 3);
	 		map.put("dateTimeNo", "10001");
	 		
	 		dateTimeService.addTicketing(map);
	 	}
	 	
	//@Test
	 public void testcancelTicketing() throws Exception{

	 		Map<Object,Object> map = new HashMap();
	 		map.put("headCount", 3);
	 		map.put("dateTimeNo", "10001");
	 		
	 		dateTimeService.cancelTicketing(map);
	 	}	 	
	 	
	 
	
	 //==>  주석을 풀고 실행하면....
	 //@Test
	 public void testGetDateTimeList() throws Exception{
		 
		
	 	Search search = new Search();
	 	search.setSearchCondition("1");
	 	search.setMovieName("히트맨");
	 	
	 	List<DateTime> date = dateTimeService.getDateTimeList(search);
	 	System.out.println(date.size());
	 	/*
	 	for(DateTime se : date) {
	 		System.out.println(se.getScreenDate());
	 		System.out.println(se.getScreenTime());
	 	}
	 	*/
	 	
	 }
	 
	 //@Test
	 public void testKmdb() throws Exception{
		 
		 MovieAPI poster = new MovieAPI();
		 
		 //System.out.println(poster.kmdbGetPoster("남산의부장들"));
		 System.out.println(poster.kmdbGetPosterRating(("히트맨")).split("@@@")[0]);
		 System.out.println(poster.kmdbGetPosterRating(("히트맨")).split("@@@")[1]);
		 
	 }
	 
	 

}
