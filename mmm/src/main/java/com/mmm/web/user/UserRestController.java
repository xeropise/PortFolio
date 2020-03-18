package com.mmm.web.user;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthCache;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.DefaultHttpClient;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;

import com.mmm.common.CheckAuth;
import com.mmm.common.CryptoUtil;
import com.mmm.common.MailUtils;
import com.mmm.common.Search;
import com.mmm.service.domain.User;
import com.mmm.service.movie.MovieService;
import com.mmm.service.movie.impl.MovieServiceImpl;
import com.mmm.service.user.UserService;

@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method 구현하지 않음
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MovieService movieService;

	///Constructor
	public UserRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value= "json/idCheckDupl/{userId}", method=RequestMethod.GET)
	public boolean idCheckDupl(@PathVariable("userId")String userId) throws Exception {
		
		System.out.println("/user/json/idCheckDupl : GET");
		
		//Business Logic 
		boolean result = true;
		result=	userService.idCheckDupl(userId);
		
		if(result) {
			System.out.println("사용 가능한 아이디 입니다.");
		}else {
			System.out.println("중복된 아이디 입니다.");
		}
		
		return result;
		
	}
	
	@RequestMapping(value= "json/phoneCheckDupl/{phone}", method=RequestMethod.GET)
	public boolean phoneCheckDupl(@PathVariable("phone")String phone) throws Exception {
		
		System.out.println("/user/json/phoneCheckDupl : GET");
		
		//Business Logic 
		boolean result = true;
		result=	userService.phoneCheckDupl(phone);
		
		if(result) {
			System.out.println("사용 가능한 휴대전화번호 입니다.");
			System.out.println(result);
		}else {
			System.out.println("중복된 휴대전화번호 입니다.");
		}
		
		return result;
		
	}
	
	@RequestMapping(value= "json/emailCheckDupl", method=RequestMethod.POST)
	public boolean emailCheckDupl(@RequestBody Map<String,Object> params) throws Exception {
		
		System.out.println("/user/json/emailCheckDupl : GET");
		
		//Business Logic 
		boolean result = true;
		result=	userService.emailCheckDupl((String)params.get("email"));
		
		if(result) {
			System.out.println("사용 가능한 이메일입니다.");
			System.out.println(result);
		}else {
			System.out.println("중복된 이메일 입니다.");
		}
		
		return result;
		
	}
	
	
	@RequestMapping(value = "json/updateUserStatus", method=RequestMethod.POST)
	public boolean updateUserStatus(@RequestBody Map<String,Object> params , HttpSession session) throws Exception{
		
		System.out.println("/json/updateUserStatus : POST");

		//Business Logic
		boolean result = true;
		
		String password= ((String)params.get("password")); //화면에서 받아온 password
		User user= new User(); //User가 입력한 password
		String cryptoPassword = CryptoUtil.cryptoText(password);
		user.setPassword(cryptoPassword);
		
		
		System.out.println("user===="+user);
		
		User sessionUser = ((User)session.getAttribute("user"));
		
		System.out.println("세션...!!"+(User)session.getAttribute("user"));
		System.out.println("status 변경전!!!!!"+sessionUser.getUserStatus());
		
		if(sessionUser.getPassword().equals(user.getPassword())) { //비밀번호 일치하면 userStatus 변경
			userService.updateUserStatus(sessionUser);
			
			int userNo = sessionUser.getUserNo();
			user= userService.getUser(userNo); //변경된 유저 다시 담아줌 
			System.out.println("status 변경후!!"+user.getUserStatus());
			
			if(user.getUserStatus() == 0) { //탈퇴가 된 회원이라면 세션지움..
				System.out.println("여기 타냐?"+user.getUserStatus());
				session.invalidate();
			}else { 
				session.setAttribute("user", user);
			}
			return result;
		}else{
			result= false;
			return result;
		}
	
	}
	
	@RequestMapping(value = "json/updateUser/{phone}", method=RequestMethod.GET)
	public boolean updateUser(@PathVariable("phone") String phone , HttpSession session) {
		
		try {
		System.out.println("/json/updateUser : GET");
		
		//Business Logic
		boolean result = true;
		User user = (User)session.getAttribute("user");
		user.setPhone(phone);
		System.out.println("여기"+user);
		
		if(phone != null) {
			
				userService.updateUser(user);
			
			System.out.println("업데이트된 폰"+user.getPhone());
			session.setAttribute("user", user);
			return result;
		}else{
			result= false;
			return result;
		}
		
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	@RequestMapping(value = "json/updateUser", method=RequestMethod.POST)
	public boolean updateUser(@RequestBody Map<String,Object> params , HttpSession session) throws Exception{
		
		System.out.println("/json/updateUser : POST");
		
		
		//Business Logic
		boolean result = true;
		
		String email= ((String)params.get("email"));
		int userNo= ((Integer)params.get("userNo"));
		User user = new User();
		user.setEmail(email);
		user.setUserNo(userNo);
		
		User sessionUser = ((User)session.getAttribute("user"));

		if(sessionUser.getUserNo() == user.getUserNo()) {
			userService.updateUser(user);
			session.setAttribute("user", userService.getUser(userNo));
			return result;
		}else{
			result= false;
			return result;
		}
	
	}
	
	@RequestMapping(value = "json/pwChk", method=RequestMethod.POST)
	public boolean pwChk(@RequestBody Map<String,Object> params , HttpSession session) throws Exception{
		
		System.out.println("/json/pwChk : POST");

		//Business Logic
		boolean result = true;
		String password= ((String)params.get("password"));
		User user= new User(); //User가 입력한 password
		String cryptoPassword = CryptoUtil.cryptoText(password);
		user.setPassword(cryptoPassword);
		
		
		System.out.println("user===="+user);
		
		User sessionUser = ((User)session.getAttribute("user"));
		
		if(sessionUser.getPassword().equals(user.getPassword())) { //비밀번호 일치하면 비밀번호 변경허용
			
			return result;
		}else{
			result= false;
			return result;
		}
		
	}


	@RequestMapping( value = "json/sendSMS/{phone}" )
	public Map sendSMS(@PathVariable String phone, Model model, HttpSession session) throws Exception {
		
		System.out.println("sendSMS!!!!");
		
	  String hostname = "api.bluehouselab.com";
      String url = "https://"+hostname+"/smscenter/v1.0/sendsms";

      CredentialsProvider credsProvider = new BasicCredentialsProvider();
      credsProvider.setCredentials(
    		new AuthScope(hostname, 443, AuthScope.ANY_REALM),
            new UsernamePasswordCredentials("byeol", "a1c36bc2546811eab4b90cc47a1fcfae")
        );
      
        // Create AuthCache instance
        AuthCache authCache = new BasicAuthCache();
        authCache.put(new HttpHost(hostname, 443, "https"), new BasicScheme());

        // Add AuthCache to the execution context
        HttpClientContext context = HttpClientContext.create();
        context.setCredentialsProvider(credsProvider);
        context.setAuthCache(authCache);

        DefaultHttpClient client = new DefaultHttpClient();
        
        List resultInnerList = null;

        try {
            HttpPost httpPost = new HttpPost(url);
            httpPost.setHeader("Content-type", "application/json; charset=utf-8");
           // String json = "{\"sender\":\""+"등록된 발신자 번호"+"\",\"receivers\":[\""+"수신자 번호"+"\"],\"content\":\""+"테스트123abcABC!@#"+"\"}";
            
           //인증번호 생성
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
            
            Map<String, Object>smsMap = new HashMap<String,Object>();
            smsMap.put("sender", "01085239856");
            smsMap.put("content","MovMovMov 본인확인 인증번호["+numStr+"]입니다. 정확히 입력해주세요.");
            
            List<String>receivers = new ArrayList<String>();
            receivers.add(phone);
            smsMap.put("receivers",receivers);
            
            session.setAttribute("phone", phone);
            session.setAttribute("numStr", numStr);
            
            
            
            //문자전송 시작
            ObjectMapper objectMapper = new ObjectMapper();
            String json = objectMapper.writeValueAsString(smsMap);
            
            System.out.println("===========json ? "+json);
            
            StringEntity se = new StringEntity(json, "UTF-8");
            httpPost.setEntity(se);

            HttpResponse httpResponse = client.execute(httpPost, context);
            System.out.println(httpResponse.getStatusLine().getStatusCode());

            InputStream inputStream = httpResponse.getEntity().getContent();
            
            BufferedReader br = new BufferedReader(new InputStreamReader(inputStream,"UTF-8"));
            
            JSONObject jsonObject = (JSONObject)JSONValue.parse(br);
            System.out.println("=========JSONObject : ?"+jsonObject);
            
            Map<String,Object> resultMap = objectMapper.readValue(jsonObject.toString(), new TypeReference<Map<String,Object>>(){});
            
            System.out.println("----------------------resultMap ? : " + resultMap);   		            
    		System.out.println("----------------------resultMap.get('sent') ? : " + resultMap.get("sent"));
            
            List resultList = (List)resultMap.get("sent");
            System.out.println("----------------------resultList ? : " + resultList); 
            resultInnerList = (List)resultList.get(0);
            System.out.println("----------------------resultInnerList ? : " + resultInnerList); 
    		System.out.println("----------------------resultInnerList.get(1) ? : " + resultInnerList.get(1)); 
    		
            //문자전송끝
            
            
        } catch (Exception e) {
            System.err.println("Error: "+e.getLocalizedMessage());
        } finally {
            client.getConnectionManager().shutdown();
        }
             

        String resultId = (String)resultInnerList.get(1);
        System.out.println("========================resultId ? :"+resultId);
        
       // model.addAttribute("resultId",resultId);
        
        Map map = new HashMap();
        
        map.put("resultId :", resultId);
        
        return map;

	}
 

	@RequestMapping( value = "json/sendSMSResult/{resultId}" )
	public Map sendSMSResult( @PathVariable String resultId ) throws Exception {
		
		String hostname = "api.bluehouselab.com";
        String url = "https://" + hostname + "/smscenter/v1.0/result/" + resultId;

        CredentialsProvider credsProvider = new BasicCredentialsProvider();
        credsProvider.setCredentials(
            new AuthScope(hostname, 443, AuthScope.ANY_REALM),
            new UsernamePasswordCredentials("mmmmm", "c16597bc430511ea9fc20cc47a1fcfae")
        );

        // Create AuthCache instance
        AuthCache authCache = new BasicAuthCache();
        authCache.put(new HttpHost(hostname, 443, "https"), new BasicScheme());

        // Add AuthCache to the execution context
        HttpClientContext context = HttpClientContext.create();
        context.setCredentialsProvider(credsProvider);
        context.setAuthCache(authCache);

        DefaultHttpClient client = new DefaultHttpClient();
        
        Map<String, String> resultMap = new HashMap<String, String>();
        
        int responseCode = 0;
        
        try {
            HttpGet httpGet = new HttpGet(url);

            HttpResponse httpResponse = client.execute(httpGet, context);
            System.out.println("------------------------ httpResponse.getStatusLine().getStatusCode() ? : " + httpResponse.getStatusLine().getStatusCode());
            responseCode = httpResponse.getStatusLine().getStatusCode();
            InputStream inputStream = httpResponse.getEntity().getContent();
            
            BufferedReader br = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
    		
    		JSONObject jsonObject = (JSONObject)JSONValue.parse(br);
    		
    		ObjectMapper objectMapper = new ObjectMapper();
    		
    		resultMap = objectMapper.readValue(jsonObject.toString(), new TypeReference<Map<String, String>>(){});

        } catch (Exception e) {
            System.err.println("Error: "+e.getLocalizedMessage());
        } finally {
            client.getConnectionManager().shutdown();
        }
        
        Map map = new HashMap();
        
        map.put("status", "status : " + resultMap.get("status") + " / responseCode : " + responseCode);
        
        
        return map;
	}
	

	@RequestMapping(value= "json/authSMS/{numStr}", method=RequestMethod.GET)
	public boolean authSMS(@PathVariable("numStr") String numStr, HttpSession session) throws Exception{
		
		System.out.println("/user/authSMS : GET");
		
		boolean result = true;
		
		//Business Logic
		String sessionNum = (String)session.getAttribute("numStr");
		if(sessionNum.equals(numStr)){
			
			return result;	
		}else{
			result= false;
			return  result;	
		}
		
	}
	
	@RequestMapping( value = "json/checkMail" )
	public boolean checkMailValue(@RequestBody Map<String,Object> params, HttpSession session) throws Exception {
		
		boolean result = true;

		try {
		
		// 메일 인증 시 입력할 값을 생성 
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString(32);
		
		// Autowired된 JavaMailSender로 MailUtils 객체 생성 
		MailUtils sendMail = new MailUtils(mailSender);
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		messageHelper.setSubject("[MovMovMov] 이메일 인증");
		
		messageHelper.setFrom("movmovmov6@gmail.com", "MovMovMov");
	    messageHelper.setTo((String)params.get("email"));
	    
	    StringBuffer contents = new StringBuffer();
	    contents.append("<img src=\"cid:boxoffice.jpg\" width=\"500\" height=\"300\">");
	    contents.append("<h1>[MovMovMov] 이메일 인증</h1>");
	    contents.append("<h2><p>아래 인증문자를 입력하시면 이메일 인증이 완료됩니다.</p></h2>");
	   // contents.append("<p>입력 문자 :: </p><br/><br/><hr/>");
		// 본인인증을 위한 state를 메일로 발송 
	    contents.append("<h2><p>" + state +"</p></h2>");
	    messageHelper.setText(contents.toString(), true);
	    FileSystemResource file = new FileSystemResource(new File("C:/Users/user/git/MainPJTmmm/mmm/WebContent/resources/image/logo/logo.png"));
	    messageHelper.addInline("boxoffice.jpg", file);
	    mailSender.send(message);
		
		// JavaMailSender.setSubject(title) :: 메일 제목 설정 
		//sendMail.setSubject("[MovMovMov] 회원가입 이메일 인증");
		
		// JavaMailSender.setText(text) :: 메일 내용 설정 
		// StringBuffer로 작성 
	    /*
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
				.append("<img src=\"cid:DUKE.gif\">")
				.append("<p>아래 글자를 입력하시면 이메일 인증이 완료됩니다.</p>")
				.append("<p>입력 문자 :: </p><br/><br/><hr/>")
				// 본인인증을 위한 state를 메일로 발송 
				.append("<p>" + state +"</p>")
				.toString());
		*/
		// JavaMailSender.setFrom(senderEmail, senderName) :: 메일 작성자 설정 
		//sendMail.setFrom("movmovmov6@gmail.com", "MovMovMov");
		
		// JavaMailSender.setTo(receiverEmail) :: 메일 수신자 설정 
		//sendMail.setTo((String)params.get("email"));
		
		// JavaMailSender.send :: 설정한 내용을 바탕으로 메일 전송
		//sendMail.send();
		
		session.setAttribute("email", (String)params.get("email"));
		session.setAttribute("state", state);
		
		}catch(Exception e){
			result = false;
		}
		
		return result;
	}
	
	@RequestMapping( value = "json/addUser" )
	public Map addUser(@RequestBody Map<String, Object> jsonMap) throws Exception {
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		String mapString = objectMapper.writeValueAsString(jsonMap);
		
		JSONObject jsonObject = (JSONObject)JSONValue.parse(mapString);
		
		User user = objectMapper.readValue(jsonObject.get("json").toString(), User.class);
		
		System.out.println("------------------------user ? : " + user);
		
		userService.addUser(user);
		
		user = userService.getUser(user.getUserNo());

		Map<String, String> returnMap = new HashMap<String, String>();
		returnMap.put("result", "ok");
		return returnMap;
	}
	
	@RequestMapping(value= "json/authEmail/{emailChkNum}", method=RequestMethod.GET)
	public boolean authEmail(@PathVariable("emailChkNum") String emailChkNum, HttpSession session) throws Exception{
		
		System.out.println("/user/authSMS : GET");
		
		boolean result = true;
		
		//Business Logic
		String sessionNum = (String)session.getAttribute("emailChkNum");
		if(sessionNum.equals(emailChkNum)){
			
			return result;	
		}else{
			result= false;
			return  result;	
		}
		
	}
	
	//===========================naverLogin===========================
	@RequestMapping( value = "json/naverLoginUrlMake" )
	public Map naverLogin( HttpSession session ) throws Exception {
		// 네이버 아이디로 로그인(회원가입) 절차 
		// 네이버 아이디로 인증 요청 => 접근 토큰 발급 => 접근 토큰을 이용해 네이버 회원 프로필 조회
		// 해당 부분은 네이버 아이디로 인증 요청을 위한 URL 작성 구간
		
		// developers.naver.com 에서 상단 Documents => 네이버 아이디로 로그인 => API 명세 => 로그인 API 명세 => 3.1 네이버 아이디로 로그인 인증 요청 참조
		
		/////////////////////////////////////////////////////////
		// 사이트 간 요청 위조(cross-site request forgery) 공격을 방지하기 위한 상태 토큰 생성
		// developers.naver.com 에서 상단 Documents => 네이버 아이디로 로그인 => 튜토리얼 => Web 애플리케이션 => 1.1.2 Java로 구현한 상태 토큰 생성 코드 예 참조
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString(32);
		
		// 상태 토큰의 경우 요청 URL과 web server의 sessionScope에 저장된 값이 같아야 하기 때문에 session에 저장 
		session.setAttribute("state", state); 
		
		// 상단 메뉴 => Application => 내 어플리케이션에서 발급받은 Client ID
		String clientId = "2P_hAYrSC24AikGvmMgw";
		
		// 네이버 로그인이 끝난 뒤 redirect로 연결할 url 주소 
		// 내 애플리케이션 => API 설정 => 사용 API => 로그인 오픈 API 서비스 환경에 등록한 
		// 네이버아이디로로그인 Callback URL (최대 5개)에 등록한 URL을 인코딩 
		String redirectUrl = URLEncoder.encode("http://192.168.0.49:8080/user/naverLoginLogic", "UTF-8");
		
		// https://nid.naver.com/oauth2.0/authorize :: 네이버 아이디로 로그인 인증 요청
		// GET방식으로 url을 연결할 예정이므로 query String 형식으로 URL 작성
		
		// client_id :: 상단 메뉴 => Application => 내 어플리케이션에서 발급받은 Client ID
		// redirect_url :: 애플리케이션을 등록 시 입력한 Callback URL 값으로 URL 인코딩을 적용한 값
		// state :: 애플리케이션에서 생성한 상태 토큰값, session에 저장되어 있는 값
		String naverLoginUrl = 	"https://nid.naver.com/oauth2.0/authorize?response_type=code" + 
								"&client_id=" + clientId + 
								"&redirect_uri=" + redirectUrl + 
								"&state="+(String)session.getAttribute("state");
		
		// json 형식은 key : value의 mapping된 형식이므로 Map을 새로 생성 
		Map<String, String> map = new HashMap<String, String>();
		
		// {"url" : "naverLoginUrl"} 로 저장 => $.ajax에서 JSONData.url로 접근 가능  
		map.put("url", naverLoginUrl);
		
		return map;
	}

	//===========================kakaoLogin===========================
	@RequestMapping( value = "json/kakaoLoginUrlMake" )
	public Map loginKakao( HttpSession session ) throws Exception {
		// 카카오 아이디로 로그인(회원가입) 절차 :: 사용자 관리  Rest API 
		// 로그인 => 사용자 토큰 받기 => 사용자 정보 요청
		// 해당 부분은 로그인 요청을 위한 URL 작성 구간
		
		// https://developers.kakao.com/docs/restapi/user-management 로그인 부분 참조 
		
		// 내 애플리케이션 => 앱 정보 => 앱 키 표시에서 확인할 수 있는 키 중 REST API 키 
		String clientId = "bb1b23ffa656f92b2b5ad48241b0f78e"; 

		// 카카오 로그인이 끝난 뒤 redirect로 연결할 url 주소 
		// 내 애플리케이션 => 카카오 로그인 => 사용자 관리 => 로그인 Redirect URL에 등록한 URL 
		String redirectUrl = "http://192.168.0.49:8080/user/kakaoLoginLogic";
		
		// OAuth 2.0 인증방식은 https로 요청해야 함
		
		// GET /oauth/authorize?client_id={app_key}&redirect_uri={redirect_uri}&response_type=code HTTP/1.1
		// Host: kauth.kakao.com
		
		// GET 방식으로 URL Request하므로 query string 형식으로 URL 작성
		// client_id :: 내 애플리케이션 => 앱 정보 => 앱 키 표시에서 확인할 수 있는 키 중 REST API 키 
		// redirect_uri :: 내 애플리케이션 => 카카오 로그인 => 사용자 관리 => 로그인 Redirect URL에 등록한 URL 
		// response_type :: code로 고정 
		String kakaoLoginUrl = 	"https://kauth.kakao.com/oauth/authorize?" + 
								"client_id=" + clientId + 
								"&redirect_uri=" + redirectUrl + 
								"&response_type=code";
		
		// json 형식은 key : value의 mapping된 형식이므로 Map을 새로 생성 
		Map<String, String> map = new HashMap<String, String>();
		
		// {"url" : "kakaoLoginUrl"} 로 저장 => $.ajax에서 JSONData.url로 접근 가능  
		map.put("url", kakaoLoginUrl);
		
		return map;
	}
	
	//===========================googleLogin===========================
	@RequestMapping( value = "json/googleLoginUrlMake" )
	public Map googleLogin( HttpSession session ) throws Exception {
		
		
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString(32);
		
		// 상태 토큰의 경우 요청 URL과 web server의 sessionScope에 저장된 값이 같아야 하기 때문에 session에 저장 
		session.setAttribute("state", state); 
		
		// 상단 메뉴 => Application => 내 어플리케이션에서 발급받은 Client ID
		String clientId = "390106883897-isb9t3klp9f0ni2cb47tktqq837og6f7.apps.googleusercontent.com";
		
		
		String redirectUrl = URLEncoder.encode("http://localhost:8080/user/googleLoginLogic", "UTF-8");
		
		// GET방식으로 url을 연결할 예정이므로 query String 형식으로 URL 작성
		
		
		// state :: 애플리케이션에서 생성한 상태 토큰값, session에 저장되어 있는 값
		String googleLoginUrl = "https://accounts.google.com/o/oauth2/v2/auth?response_type=code&" + 
								"scope=openid%20profile%20email"+
								"&client_id=" + clientId + 
								"&redirect_uri=" + redirectUrl + 
								"&state="+(String)session.getAttribute("state");
		
		// json 형식은 key : value의 mapping된 형식이므로 Map을 새로 생성 
		Map<String, String> map = new HashMap<String, String>();
		
		// {"url" : "naverLoginUrl"} 로 저장 => $.ajax에서 JSONData.url로 접근 가능  
		map.put("url", googleLoginUrl);
		
		

		
		return map;
	}
	
	
	@RequestMapping(value = "json/getWishMovieList", method=RequestMethod.POST)
	public HashMap<String, Object> getWishMovieList(@RequestBody Search search, HttpSession session){
		
		System.out.println("=== getWishMovieList start ===");
		
		HashMap<String, Object> result = null;
		
		try {
			
			if(session.getAttribute("user") != null) {

				User user = (User) session.getAttribute("user");
				
				System.out.println("=== getWishMovieList userNo : "+user.getUserNo());
				System.out.println("=== getWishMovieList page : "+search.getStartRowNum()+"~"+search.getEndRowNum());
				
				HashMap<String, Object> inputData = new HashMap<String, Object>();
				inputData.put("userNo", user.getUserNo());
				inputData.put("search", search);
				
				result = movieService.getWishMovieList(inputData);
				
				System.out.println("=== getWishMovieList Result Data : "+result);
				
				return result;
			}
			
		} catch (Exception e) {
			System.out.println("=== getWishMovieList error : "+e.getMessage());
		}
		
		System.out.println("=== getWishMovieList end ===");
		
		return result;
		
	}
	
	@CheckAuth(role="user,admin")
	@RequestMapping(value="json/mySeenMovieList", method=RequestMethod.POST)
	public Map<String, Object> mySeenMovieList(@RequestBody Search search, HttpSession session) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			if(session != null) {
				User user = (User) session.getAttribute("user");
				search.setTicketerPhone(user.getPhone());
				List<Map<String, Object>> mySeenMovieList = userService.getSeenMovieList(search);
				int totalCnt = userService.getSeenMovieCnt(user.getPhone());
				
				result.put("mySeenMovieList", mySeenMovieList);
				result.put("totalCnt", totalCnt);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	

}
