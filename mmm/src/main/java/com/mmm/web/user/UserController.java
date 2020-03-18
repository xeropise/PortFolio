package com.mmm.web.user;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.mmm.common.CheckAuth;
import com.mmm.common.CryptoUtil;
import com.mmm.common.Search;
import com.mmm.service.datetime.DateTimeService;
import com.mmm.service.domain.User;
import com.mmm.service.user.UserService;

//==>회원관리 Controller
@Controller
@RequestMapping("/user/*")
public class UserController {
	
	///Field 
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method 구현 하지않음
	
	@Autowired
	private DateTimeService dateTimeService;
	
	///Constructor
	public UserController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value ="userAuthorization", method = RequestMethod.GET)
	public String userAuthorization(@RequestParam("type")String type) throws Exception{
		
		System.out.println("/user/userAuthorization : GET ");
			
		return "forward:/user/userAuthorization.jsp?type="+type;
	}
	
	@CheckAuth(role="user,admin")
	@RequestMapping(value ="passwordCheck", method = RequestMethod.GET)
	public String passwordCheck() throws Exception{
		
		System.out.println("/user/passwordCheck : GET ");
			
		return "forward:/user/passwordCheck.jsp";
	}
	
	
	@RequestMapping(value ="addUser", method = RequestMethod.GET)
	public String addUser(Model model) throws Exception{
		
		System.out.println("/user/addUser : GET ");
		
		model.addAttribute("getTheaterList",dateTimeService.getTheaterList(new Search()));
			

		return "forward:/user/addUser.jsp";

	}
	
	@RequestMapping(value = "addUser" , method=RequestMethod.POST)
	public String addUser(@ModelAttribute("user") User user) throws Exception{
		
	System.out.println("/user/addUser : POST");
	
	//System.out.println("userIdentity@@@@@@@ "+user.getIdentity());
	
	
	System.out.println(user);
	//Business Logic 
	//비밀번호 암호화
	String password = user.getPassword();
	String cryptoPassword = CryptoUtil.cryptoText(password);
	user.setPassword(cryptoPassword);
	userService.addUser(user);
	
	return "redirect:/user/login.jsp";
	}
	
	@RequestMapping(value = "extraAddUser" , method=RequestMethod.POST)
	public String extraAddUser(@ModelAttribute("user") User user, HttpSession session) throws Exception{
		
		System.out.println("/user/extraAddUser : POST");
		
		System.out.println("userIdentity@@@@@@@:::::: "+user.getIdentity());
		
		if(session != null) {
			//비밀번호 암호화
			String password = user.getPassword();
			String cryptoPassword = CryptoUtil.cryptoText(password);
			user.setPassword(cryptoPassword);
			userService.extraAddUser(user);
			
			session.setAttribute("user", userService.getUser(user.getUserNo()));
			
			return "redirect:/user/afterExtraAddUser.jsp";   
		}
		return "redirect:/user/login";  

	}
	
	@RequestMapping(value = "addProfile" , method=RequestMethod.POST)
	public String addProfile(@ModelAttribute("user") User user ,Model model , HttpSession session) throws Exception {
		System.out.println("addProfile POST Start");
		System.out.println(user);
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
		
		
		
		//다른방법
//		if(user.getImage().isEmpty()==false) {
//			MultipartFile mhsr = (MultipartFile)user.getImage();
//			String path = "C:\\Users\\User\\git\\Euroverse\\ksy\\WebContent\\resources\\images\\userImages";
//			String originalName = "";
//			originalName = new String(mhsr.getOriginalFilename().getBytes("8859_1"),"UTF-8");
//			System.out.println(originalName);
//			user.setUserImg("\\resources\\images\\userImages\\"+originalName);
//			System.out.println("유저이미지"+user.getUserImg());
//			File serverFile = new File(path+File.separator + originalName);
//			mhsr.transferTo(serverFile);
//		}else {
//			user.setUserImg("\\resources\\images\\userImages\\defaultUserImage.jpg");
//		}
		MultipartFile mhsr = (MultipartFile)user.getImage();
		if( mhsr.isEmpty() == false) {	//null 체크로 잡을 수 없음! 
			String fileName = mhsr.getOriginalFilename();
			fileName = uploadFile(fileName, mhsr.getBytes());
			//mpFile.transferTo( new File(path, fileName) );
			
			
			
			user.setProfile(fileName);
			
			System.out.println("프로필 사진~!!!!!"+user.getProfile());
			
			
		}else {
			user.setProfile("defaultUserImage.jpg");
		}
		
		userService.updateUser(user);

		User newUser = (User)userService.getUser(user.getUserNo());
		
		System.out.println(" 업데이트 됐나요? 프로필 사진~!!!!!"+user.getProfile());
		session.setAttribute("user", newUser);
		
		
		return "redirect:/mypage/mypage?condition=99";
	}


	private String uploadFile(String originalName, byte[] fileData) throws Exception{
		
		String uploadPath = "C:\\Users\\user\\git\\MainPJTmmm\\mmm\\WebContent\\resources\\image";
		
		//uuid 생성 (Universal Unique IDentifier, 범용 고유 식별자)
		UUID uuid = UUID.randomUUID();
		
		String savedName = uuid.toString()+"_"+originalName;
		File target = new File(uploadPath, savedName);
		//임시 디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	
	
	@CheckAuth(role="user,admin")
	@RequestMapping(value = "getUser" , method=RequestMethod.GET)
	public String getUser(Model model,HttpSession session) throws Exception{
		
		System.out.println("/user/getUser : GET ");
		
		//Business Logic
		User user = (User)session.getAttribute("user");
		
		if(user != null) {
			
			user = userService.getUser(user.getUserNo());
			
			System.out.println(user);
			//Model 과 View 연결
			model.addAttribute("user",user);
			return "forward:/user/getUser.jsp";
			
		}else {
			
			return "forward:/user/login.jsp";
		}

	}
	
	@RequestMapping(value = "addUnUserView" , method=RequestMethod.GET)
	public String addUnUserView() throws Exception{
		
		System.out.println("/user/addUnUserView : GET");
			
		return "forward:/user/addUnUserView.jsp";
	}
	
	@RequestMapping(value = "addUnUser" , method=RequestMethod.POST)
	public String addUnUser(@ModelAttribute("user") User user, HttpSession session) throws Exception{
		
		System.out.println("/user/addUnUser : POST");
		
		//Business Logic 
		//비밀번호 암호화
		String password = user.getPassword();
		String cryptoPassword = CryptoUtil.cryptoText(password);
		user.setPassword(cryptoPassword);
		user.setUserId(user.getPhone());
		userService.addUser(user);
		
		session.setAttribute("user", user);
		
	
		return "redirect:/?alarm=0";
	}
	
	@RequestMapping(value = "login" , method=RequestMethod.GET)
	public String login(HttpSession session ,HttpServletRequest request) throws Exception{
		
		System.out.println("/user/login : GET");
		
		String referrer = request.getHeader("Referer");
		request.getSession().setAttribute("prevPage", referrer);
		System.out.println("[login prevPage] >>> "+referrer);
		
		return "forward:/user/login.jsp";
		
	}
	
	@RequestMapping(value = "login" , method=RequestMethod.POST)
	public String login(@ModelAttribute("user") User user, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
		
		try {
			System.out.println("/user/login : POST");
			
			//System.out.println(user);
			//Business Logic
			//비밀번호 암호화
			String password = user.getPassword();
			String cryptoPassword = CryptoUtil.cryptoText(password);
			user.setPassword(cryptoPassword);
			
			System.out.println("Userrrrrrrrrrrr"+user);
			User dbUser = userService.getUserId(user.getUserId());
			
			System.out.println("/user/login dbUser : "+user);
			//회원정보가 없거나  비회원일 경우
			  if(dbUser == null || dbUser.getRole().trim().equals("unUser")) {
				  System.out.println("/user/login 회원정보가 없거나  비회원일 경우");
				  return "redirect:/user/login?status=failed"; 
			  }
			  
			 //탈퇴한 회원일 경우
			  if(dbUser.getUserStatus() == 0) {
				  session.setAttribute("user", dbUser);
				  System.out.println("/user/login 탈퇴한 회원일 경우");
				  return "redirect:/user/comebackUser.jsp?status=comeback"; 
			  }
		
			
			//회원일 경우
			if(user.getPassword().equals(dbUser.getPassword())) {
				System.out.println("/user/login 회원일경우");

				if(session != null) {
					System.out.println("/user/login 회원일경우 세션이 있는 경우");
					String prevPage = (String) session.getAttribute("prevPage");
					String[] redirectUrl = prevPage.split("8080");
					if (redirectUrl != null) {
						System.out.println("/user/login redirectUrl : "+redirectUrl[1]);
						session.setAttribute("user", dbUser);
		                session.removeAttribute("prevPage");
		                if(redirectUrl[1].equals("/user/findPw")) {
		                	return "redirect:/";
						}else if(redirectUrl[1].equals("/ticketing/addSeatSelect")) {
		                	return "redirect:/ticketing/addTicketing";
		                }else if(redirectUrl[1].equals("/")) {
		                	return "redirect:"+redirectUrl[1]+"?alarm=0";
		                }else if(redirectUrl[1].equals("/?alarm=1")){
		                	return "redirect:/?alarm=0";
		                }else {
		                	return "redirect:"+redirectUrl[1];
		                }
		                
		            }
				}
				
				session.setAttribute("user", dbUser);
				System.out.println("세션!!!!!!"+((User)session.getAttribute("user")).toString());
			}else {//로그인 실패시 
				return "redirect:/user/login?status=failed";
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "unUserLogin" , method=RequestMethod.GET)
	public String unUserLogin() throws Exception{
		
		System.out.println("/user/unUserLogin : GET");

		return "forward:/user/unUserLogin.jsp";
	}
	
	@RequestMapping(value = "unUserLogin" , method=RequestMethod.POST)
	public String unUserLogin(@ModelAttribute("user") User user, HttpSession session) throws Exception{
		
		System.out.println("/user/unUserLogin : POST");
		
		//System.out.println("user!!!!!!"+user);
		
		//Business Logic
		//비밀번호 암호화
		String password = user.getPassword();
		String cryptoPassword = CryptoUtil.cryptoText(password);
		user.setPassword(cryptoPassword);
		user.setUserId(user.getPhone());	
		
		User dbUser = userService.getUserId(user.getUserId());
		
		//System.out.println("dbUser!!!!111"+dbUser);
		
		  if(dbUser == null) {
			  return "forward:/user/unUserLogin.jsp?status=failed"; 
		  }		  
		 
		System.out.println(user);
		
		if(user.getPassword().equals(dbUser.getPassword()) && dbUser.getRole().trim() != "unUser") {
			session.setAttribute("user", dbUser);	
			System.out.println("!!!!!!"+((User)session.getAttribute("user")).toString());
			
		}else {//로그인 실패시 
			return "forward:/user/unUserLogin.jsp?status=failed";
		}
		return "forward:/mypage/mypage?condition=21";
	}
	
	@RequestMapping(value ="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		
		System.out.println("/user/logout : GET");
		
		session.invalidate();
		
		return "redirect:/?alarm=1";
	}
	
	@RequestMapping(value = "findPw" , method=RequestMethod.POST)
	public String findPw(HttpServletRequest request,
			Model model) throws Exception{
	
		System.out.println("/user/findPw : POST");
		
		//Business Logic
		User user = null;
		String keyword = (String)request.getParameter("keyword");
		String authType = (String)request.getParameter("authType");
		if(authType.equals("phone")) {
			user = userService.getPhone(keyword);
		} else {
			user = userService.getEmail(keyword);
		}
		
		if(user != null) {
			//임시비밀번호 생성
            Random rand = new Random();
	        String tmpPw = ""; //난수가 저장될 변수
	        int len = 8;
	        int dupCd = 1;
	        
	        for(int i=0;i<len;i++) {
	            
	            //0~9 까지 난수 생성
	            String ran = Integer.toString(rand.nextInt(10));
	            
	            if(dupCd==1) {
	                //중복 허용시 numStr에 append
	            	tmpPw += ran;
	            }else if(dupCd==2) {
	                //중복을 허용하지 않을시 중복된 값이 있는지 검사한다
	                if(!tmpPw.contains(ran)) {
	                    //중복된 값이 없으면 numStr에 append
	                	tmpPw += ran;
	                }else {
	                    //생성된 난수가 중복되면 루틴을 다시 실행한다
	                    i-=1;
	                }
	            }
	        }
	        
	        tmpPw = "m"+tmpPw+"!";
	   
	        System.out.println("임시비밀번호!!!"+tmpPw);
	        
	        //비밀번호 암호화
			String cryptoPassword = CryptoUtil.cryptoText(tmpPw);
			System.out.println("임시비밀번호 암호화!!!"+cryptoPassword);
			user.setPassword(cryptoPassword);
			System.out.println("임시비밀번호 User 111!!!"+user);
	        userService.updateUser(user);
	        System.out.println("임시비밀번호 User 222!!!"+user);
	        user.setPassword(tmpPw);
			model.addAttribute("user",user);
			return "forward:/user/findPw.jsp";
		} else { //조회된 유저가 없으면
			return "forward:/user/userAuthorization.jsp?status=notfound";
		}
		
	}
	
	@RequestMapping(value = "findId" , method=RequestMethod.POST)
	public String findId(HttpServletRequest request,
			Model model) throws Exception{
		
		System.out.println("/user/findId : POST");
		
		//Business Logic
		User user = null;
		String keyword = (String)request.getParameter("keyword");
		String authType = (String)request.getParameter("authType");
		if(authType.equals("phone")) {
			user = userService.getPhone(keyword);
		} else {
			user = userService.getEmail(keyword);
		}
		
		System.out.println(keyword+", "+authType);
		
		if(user != null) {
			
			String dbUserId =user.getUserId().trim();
			String findId = "";
			
			int len = dbUserId.length();
			
			for(int i=0; i<len; i++) {
				if(i==2 || i==3) {
					findId+="*";
				} else {
					findId+=dbUserId.charAt(i);
				}
			}
			user.setUserId(findId);
			//Model과 View의 연결
			model.addAttribute("user",user);
			return "forward:/user/findId.jsp";
		} else { //조회된 유저가 없으면
			return "forward:/user/userAuthorization.jsp";
		}
	}
	
	
	
	//@RequestMapping(value = "updateUser" , method=RequestMethod.GET)
//	public String updateUser(@RequestParam("userNo") int userNo, Model model) throws Exception{
//		
//		System.out.println("/user/updateUser : GET");
//		
//		//Business Logic
//		User user = userService.getUser(userNo);
//		
//		//Model과 View의 연결
//		model.addAttribute("user",user);
//		
//		return "forward:/user/updateUser.jsp";
//	}
	
	@RequestMapping(value = "updateUser" , method=RequestMethod.POST)
	public String updateUser(@ModelAttribute("user") User user, Model model, HttpSession session) {
		
		try {
			System.out.println("/user/updateUser : POST");
		
			if(session != null) {
				//Business Logic
				User sessionUser = ((User)session.getAttribute("user"));
				
				user.setUserNo(sessionUser.getUserNo());
				userService.updateUser(user);
				
				session.setAttribute("user", userService.getUser(user.getUserNo()));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/mypage/mypage?condition=99";
	}
		
	
	@RequestMapping(value= "updatePw", method=RequestMethod.GET)
	public String updatePw(HttpSession session) throws Exception{
		
		System.out.println("/user/updatePw : GET");
		
		//Business Logic
		User sessionUser = ((User)session.getAttribute("user"));
		sessionUser = userService.getUser(sessionUser.getUserNo());
		
		if(sessionUser != null) {
			return "forward:/user/updatePw.jsp";	
		}else {
			return "forward:/user/login.jsp";
		}
	}
		
	@RequestMapping(value= "updatePw", method=RequestMethod.POST)
	public String updatePw(@ModelAttribute("user") User user, Model model, HttpSession session) throws Exception{
		
		System.out.println("/user/updatePw : POST");
		
		System.out.println("화면단"+user.getPassword());
		
		//Business Logic
		
		User dbUser = userService.getUser(user.getUserNo());
		
		User sessionUser =(User)session.getAttribute("user");
		int sessionNo = ((User)session.getAttribute("user")).getUserNo();
		if(sessionNo == user.getUserNo()) {
			//비밀번호 암호화
			String password = user.getPassword();
			String cryptoPassword = CryptoUtil.cryptoText(password);
			sessionUser.setPassword(cryptoPassword);
			userService.updateUser(sessionUser);
			session.setAttribute("user", sessionUser);
			System.out.println("업데이트"+sessionUser.getPassword());
			
			return "redirect:/mypage/mypage?condition=99";
		}else {
			return "redirect:/user/updatePw.jsp?status=failed";
		}
	}
	

	@RequestMapping(value= "authSMS/{numStr}", method=RequestMethod.GET)
	public String authSMS(@PathVariable("numStr") String numStr, Model model, HttpSession session) throws Exception{
		
		System.out.println("/user/authSMS : GET");
		
		//Business Logic
		String sessionNum = (String)session.getAttribute("numStr");
		if(sessionNum.equals(numStr)){
			model.addAttribute("getTheaterList",dateTimeService.getTheaterList(new Search()));
			return "forward:/user/addUser.jsp";	
		}else{
			return "redirect:/";
		}
		
	}
		

	@RequestMapping(value= "authEmail/{emailChkNum}", method=RequestMethod.GET)
	public String authEmail(@PathVariable("emailChkNum") String emailChkNum, Model model, HttpSession session) throws Exception{
		
		System.out.println("/user/authEmail : GET");
		
		
		
		//Business Logic
		String sessionNum = (String)session.getAttribute("state");
		if(sessionNum.equals(emailChkNum)){
			model.addAttribute("getTheaterList",dateTimeService.getTheaterList(new Search()));
			return "forward:/user/addUser.jsp";
		}else{
			return "redirect:/";
		}
		
	}
		
	//===========================naverLogin===========================
		@RequestMapping( value = "naverLoginLogic" )
		// http://{encoding한 http://192.168.0.76:8080/user/naverLoginLogic}/redirect?code={code값}&state={state값}
		// 에서 주어지는 code와 state를 @RequestParam("code") / @RequestParam("state") 로 가져왔다.
		
		public String naverLoginLogic( @RequestParam("code") String code, @RequestParam("state") String state,Model model, HttpSession session) throws Exception {
			// 접근 토큰을 발생받고 접근 토큰을 이용해 네이버 회원 프로필 조회하는 구간 
			// developers.naver.com 에서 상단 Documents => 네이버 아이디로 로그인 => API 명세 => 로그인 API 명세 => 3.2 접근 토큰 발급/갱신/삭제 요청 참조
			
			// 상단 메뉴 => Application => 내 어플리케이션에서 발급받은 Client ID
			// 상단 메뉴 => Application => 내 어플리케이션에서 발급받은 Client Secret
			String clientId = "2P_hAYrSC24AikGvmMgw";
			String clientSecret = "jqB2qpZUQt";
			
			// https://nid.naver.com/oauth2.0/token :: 접근 토큰 발급요청
			// GET방식으로 url을 연결할 예정이므로 query String 형식으로 URL 작성
			
			// grant_type :: 접근 토큰 발급시 authorization_code 고정
			// client id :: 상단 메뉴 => Application => 내 어플리케이션에서 발급받은 Client ID
			// client_secret :: 상단 메뉴 => Application => 내 어플리케이션에서 발급받은 Client Secret
			// code :: redirect URL query string code={code값} => @RequestParam("code")로 받아온 값 
			// state :: redirect URL query string state={state값} => @RequestParam("state")로 받아온 값 
			String tokenUrl = 	"https://nid.naver.com/oauth2.0/token?" + 
									"grant_type=authorization_code" + 
									"&client_id=" + clientId + 
									"&client_secret=" + clientSecret + 
									"&code=" + code + 
									"&state=" + state;
			
			// 생성한 URL로 URL을 추상화 / 캡슐화한 Java Class URL 객체 생성 
			URL tokenURL = new URL(tokenUrl);
			
			// 생성한 URL 객체를 HttpURLConnection.openConnection()으로 연결 
			// HttpURLConnection :: java.net class에서 제공하는 URL 요청(Request)를 위한 클래스 
			HttpURLConnection tokenCon = (HttpURLConnection)tokenURL.openConnection();
			
			// 사용 method 선언
			tokenCon.setRequestMethod("GET");
			
			// tokenCon.getResponseCode()로 URL을 Request하고 그 응답 결과를 int형으로 반환 
			int tokenResponseCode = tokenCon.getResponseCode();
			
			// BufferedReader를 정상응답일때와 에러일때로 구분하기 위해 null로 선언 
			BufferedReader tokenBr =  null;
			
			if( tokenResponseCode == 200 ) { // Http 200 OK일 때 tokenCon.getInputStream() UTF-8 인코딩해서 읽음 
				tokenBr = new BufferedReader(new InputStreamReader(tokenCon.getInputStream(), "UTF-8"));
			}
			else { // 에러 발생시 tokenCon.getErrorStream()을 읽음 
				tokenBr = new BufferedReader(new InputStreamReader(tokenCon.getErrorStream()));
			}
			
			// BufferedReader를 한 줄씩 읽기 위한 변수 
			String tokenJsonData = "";
			// 실제 response를 출력하는 변수 
			StringBuffer tokenResponse = new StringBuffer();
			
			// readLine()의 경우 한 줄을 읽은 뒤 무조건 다음 줄로 개행되기 때문에 
			// readLine() != null이 아닌 ( ( tokenJsonData = tokenBr.readLine() ) != null로 설정했다
			
			while( ( tokenJsonData = tokenBr.readLine() ) != null ) {
				// BufferedReader에서 한 줄씩 읽어 tokenResponse에 추가 
				tokenResponse.append(tokenJsonData);
			}
			
			// buffered close
			tokenBr.close();
			
			// response 확인 
			System.out.println("----------response ? : " + tokenResponse.toString());
			
			
			// 접근 토큰 요청의 반환값은 모두 String이므로 Map<String, String>으로 형변환
			// developers.naver.com 에서 상단 Documents => 네이버 아이디로 로그인 => API 명세 => 로그인 API 명세 => 6.2.2 접근 토큰 발급 요청 참조
			JSONObject jsonObject = (JSONObject)JSONValue.parse(tokenResponse.toString());
			ObjectMapper objectMapper = new ObjectMapper();
			Map<String, String> tokenMap = objectMapper.readValue(jsonObject.toString(), new TypeReference<Map<String, String>>(){});
			
			// 접근 토큰, 갱신 토큰, 토큰 타입, 토큰 유효기간을 모두 출력 
			System.out.println("-----------------------tokenMap : " + tokenMap);
			
			// 접근 토큰 access_token을 가져와서 accessToken에 저장
			String accessToken = tokenMap.get("access_token");
			
			// 이후 구간은 네이버 회원 프로필 조회를 위한 구간 
			// developers.naver.com 에서 상단 Documents => 네이버 아이디로 로그인 => API 명세 => 회원 프로필 조회 API 명세 => 2. API 기본 정보 확인 
	             
	        Map<String, String> profileMap = new HashMap<String, String>();
	        
	        try {
	        	// https://openapi.naver.com/v1/nid/me :: 네이버 회원 프로필 조회 요청 url
	            String naverLoginUrl = "https://openapi.naver.com/v1/nid/me";
	            
	            URL naverLoginURL = new URL(naverLoginUrl);
	            
	            HttpURLConnection naverLoginCon = (HttpURLConnection)naverLoginURL.openConnection();
	            
	            // 해당 API는 GET 방식만 가능 
	            naverLoginCon.setRequestMethod("GET");
	            
	            // 접근 토큰을 전달하는 Header 설정
	            // Bearer뒤에 꼭 공백이 존재해야 한다 
	            // 예시 : Authorization: Bearer AAAAOLtP40eH6P5S4Z4FpFl77n3FD5I 
	            String header = "Bearer " + accessToken;
	            
	            // HttpURLConnection.setRequestProperty로 각 Attribute를 설정 가능
	            // 접근 토큰을 전달하는 Header 설정
	            naverLoginCon.setRequestProperty("Authorization", header);
	            
	            int naverLoginResponseCode = naverLoginCon.getResponseCode();
	            
	            BufferedReader naverLoginBr;
	            
	            if( naverLoginResponseCode == 200 ) { 
	            	naverLoginBr = new BufferedReader(new InputStreamReader(naverLoginCon.getInputStream(), "UTF-8"));
	            } else {  
	            	naverLoginBr = new BufferedReader(new InputStreamReader(naverLoginCon.getErrorStream()));
	            }
	            
	            String inputLine;
	            
	            StringBuffer naverLoginResponse = new StringBuffer();
	            
	            while ( ( inputLine = naverLoginBr.readLine() ) != null ) {
	            	naverLoginResponse.append(inputLine);
	            }
	            
	            naverLoginBr.close();
	            
	            
	            System.out.println(naverLoginResponse.toString());
	            
	            // 응답 예시에 따라 JSONData 형변환
	            // developers.naver.com 에서 상단 Documents => 네이버 아이디로 로그인 => API 명세 => 회원 프로필 조회 API 명세 => 7. 요청 예시에서 응답 예시 참조 
	            jsonObject = (JSONObject)JSONValue.parse(naverLoginResponse.toString());
	            profileMap = objectMapper.readValue(jsonObject.get("response").toString(), new TypeReference<Map<String, String>>(){});
	            
	        } catch (Exception e) {
	            System.out.println(e);
	        }
			
	        System.out.println("------------------profileMap" + profileMap);
	        
	        // id : 네이버 아이디의 고유한 식별성. 이메일과는 다름.
	        String id = profileMap.get("id");
			System.out.println("-------------------profileMap.get(id) : " + id);
			
			String name = profileMap.get("name");
			String email = profileMap.get("email");
			String gender = profileMap.get("gender");
			
			// 이메일 ~~~@naver.com에서 @의 인덱스를 가져옴
			int index = email.indexOf("@");
			
			// ~~~@naver.com에서 ~~~를 파싱해서 userId로 설정 
			String userId = email.substring(0, index);
			System.out.println("-----------------userId ? : " + userId);
			
			// checkDuplication return false :: 존재하는 아이디 => userService.getUserId
			if(! (userService.idCheckDupl(userId)) ) { 
				User dbUser = userService.getUserId(userId);
				
				// 로그인 처리 
				session.setAttribute("user", dbUser);	

			}
			// checkDuplication return false :: 존재하는 아이디 => userService.getUser
			// checkDuplication return true :: 없는 아이디 => userService.addUser
			else {
				
				model.addAttribute("getTheaterList",dateTimeService.getTheaterList(new Search()));
				
				User user = new User();
				user.setUserId(userId);
				user.setEmail(email);
				user.setUserName(name);
				user.setPassword(id);
				user.setGender(gender);
				user.setIdentity(1);
				
				model.addAttribute("user",user);
				
				
				return "forward:/user/extraAddUser.jsp";
			}
			
			// 모든 네이버 로그인(회원가입) Business Logic이 끝난 타이밍을 알기 위해 전혀 의미 없는 jsp로 연결
			return "forward:/naver/pathLoginImfo.jsp";
		}
	
	//===========================kakaoLogin===========================
	@RequestMapping( value = "kakaoLoginLogic" )
	// http://192.168.0.76:8080/user/kakaoLoginLogic?code={authorize_code}
	// 에서 주어지는 code를 @RequestParam("code") String code으로 받아왔다 
	public String kakaoLoginLogic( @RequestParam("code") String code,Model model, HttpSession session) throws Exception {
		// 접근 토큰을 발급받는 구간 
		// https://developers.kakao.com/docs/restapi/user-management 사용자 토큰 받기 부분 참조 
		
		// 내 애플리케이션 => 앱 정보 => 앱 키 표시에서 확인할 수 있는 키 중 REST API 키
		String clientId = "bb1b23ffa656f92b2b5ad48241b0f78e";
		
		System.out.println("code---------------------------------" + code);
		
		
		// POST /oauth/token HTTP/1.1
		// Host: kauth.kakao.com
		// Content-type: application/x-www-form-urlencoded;charset=utf-8
		// Post 방식이므로 query string을 URI에 붙여주지 않았다 
		String kakaoTokenUrl = 	"https://kauth.kakao.com/oauth/token";

		URL kakaoTokenURL = new URL(kakaoTokenUrl);
		HttpURLConnection kakaoTokenCon = (HttpURLConnection)kakaoTokenURL.openConnection();
		
		// POST 방식으로 Request 요청해야하므로 POST 설정
		kakaoTokenCon.setRequestMethod("POST");
		
		// POST 방식으로 Data를 넘겨주기 위해 OutputStream 사용 여부를 true로 변경. Default = false 
		kakaoTokenCon.setDoOutput(true);
		
		// Data를 넘겨주기 위한 BufferedWriter 
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(kakaoTokenCon.getOutputStream()));
		
		// query string 형식으로 Data 작성 
		String postData = 	"grant_type=" + "authorization_code" + 
							"&client_id=" + clientId + 
							"&redirect_uri=" + URLEncoder.encode("http://192.168.0.49:8080/user/kakaoLoginLogic") + 
							"&code=" + code;
		
		// POST Body에 query string을 적용시키기 위해 BufferedWriter write() 후 flush()
		bw.write(postData);
		bw.flush();
		
		int kakaoTokenResponseCode = kakaoTokenCon.getResponseCode();
		
		BufferedReader kakaoTokenBr =  null;
		
		if( kakaoTokenResponseCode == 200 ) {
			kakaoTokenBr = new BufferedReader(new InputStreamReader(kakaoTokenCon.getInputStream(), "UTF-8"));
		}
		else {
			kakaoTokenBr = new BufferedReader(new InputStreamReader(kakaoTokenCon.getErrorStream()));
		}
		
		String kakaoTokenLine = "";
		StringBuffer kakaoTokenResponse = new StringBuffer();
		
		while( (kakaoTokenLine = kakaoTokenBr.readLine()) != null ) {
			kakaoTokenResponse.append(kakaoTokenLine);
		}
		
		kakaoTokenBr.close();
		
		System.out.println("----------response ? : " + kakaoTokenResponse.toString());
			
		JSONObject kakaoTokenJSONObject = (JSONObject)JSONValue.parse(kakaoTokenResponse.toString());
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		Map<String, String> tokenMap = objectMapper.readValue(kakaoTokenJSONObject.toString(), new TypeReference<Map<String, String>>(){});
		System.out.println("-----------------------tokenMap : " + tokenMap);
		
		String token = tokenMap.get("access_token");
		
		System.out.println("---------------------카카오 로그인 시 accesstoken ? : " + token);
		
		// 이후 카카오페이 사용을 위해 token session에 저장 
		session.setAttribute("accessToken", token);
		session.setAttribute("refreshToken", tokenMap.get("refresh_token"));
       
		// JSON Data Type으로 return하기 위해 Map<String, Object> 선언
		// 카카오 프로필 조회의 경우 JSON Array 안에 JSON Array가 있으므로 Object로 받아야한다
		// https://developers.kakao.com/docs/restapi/user-management#사용자-정보-요청 => response 참조 
        Map<String, Object> profileMap = new HashMap<String, Object>();
        
        // try문 밖에서도 적용시킬 수 있도록 외부에서 미리 null String으로 선언 
        // 계정마다 고유한 id
        String kakaoId = "";
        
        try {
        	// 접근 토큰을 전달하는 Header 설정
            // Bearer뒤에 꼭 공백이 존재해야 한다 
            // 예시 : Authorization: Bearer 2be33286118c35092c40a77c63262640
        	String header = "Bearer " + token;
        	
        	// https://developers.kakao.com/docs/restapi/user-management#사용자-정보-요청 참조 
        	// 카카오 계정 프로필 정보 요청 URL 
            String kakaoLoginUrl = "https://kapi.kakao.com/v2/user/me";
            
            URL kakaoLoginURL = new URL(kakaoLoginUrl);
            
            HttpURLConnection kakaoLoginCon = (HttpURLConnection)kakaoLoginURL.openConnection();
            
            kakaoLoginCon.setRequestMethod("GET");
            
            kakaoLoginCon.setRequestProperty("Authorization", header);
            
            int kakaoLoginResponseCode = kakaoLoginCon.getResponseCode();
            
            BufferedReader kakaoLoginBr;
            
            if( kakaoLoginResponseCode == 200 ) { 
            	kakaoLoginBr = new BufferedReader(new InputStreamReader(kakaoLoginCon.getInputStream(), "UTF-8"));
            } else {  
            	kakaoLoginBr = new BufferedReader(new InputStreamReader(kakaoLoginCon.getErrorStream()));
            }
            
            String kakaoLoginLine = "";
            
            StringBuffer kakaoLoginResponse = new StringBuffer();
            
            while ((kakaoLoginLine = kakaoLoginBr.readLine()) != null) {
            	kakaoLoginResponse.append(kakaoLoginLine);
            }
            
            kakaoLoginBr.close();
            
            System.out.println(kakaoLoginResponse.toString());
            
            JSONObject kakaoLoginJSONObject = (JSONObject)JSONValue.parse(kakaoLoginResponse.toString());
            
            
            
            profileMap = objectMapper.readValue(kakaoLoginJSONObject.get("properties").toString(), new TypeReference<Map<String, Object>>(){});
            kakaoId = objectMapper.readValue(kakaoLoginJSONObject.get("id").toString(), String.class);
            
            System.out.println("---------------------------------profileMap ? : "+ profileMap);
            System.out.println("---------------------------------userId ? : "+ kakaoId);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        String userName = (String)profileMap.get("nickname");
        
        // DB에 카카오 아이디를 생성할 때 구분할 수 있도록 앞에 kakao 문자열 추가 
        String userId = "kakao" + kakaoId;
        
        
		// checkDuplication return false :: 존재하는 아이디 => userService.getUserId
		if(! (userService.idCheckDupl(userId)) ) { 
			User dbUser = userService.getUserId(userId);
			
			// 로그인 처리 
			session.setAttribute("user", dbUser);	

		}
		// checkDuplication return true :: 없는 아이디 => userService.addUser
		else {
			
			model.addAttribute("getTheaterList",dateTimeService.getTheaterList(new Search()));
			
			User user = new User();
			user.setUserId(userId);
			//user.setEmail(email);
			user.setUserName(userName);
			user.setPassword(kakaoId);
			//user.setGender(gender);
			user.setIdentity(2);
			
			model.addAttribute("user",user);
			
			return "forward:/user/extraAddUser.jsp";
		}

        // 모든 카카오 로그인(회원가입) Business Logic이 끝난 타이밍을 알기 위해 전혀 의미 없는 jsp로 연결
		return "forward:/kakao/pathLoginImfo.jsp";
	}
	
	
	//===========================googleLogin===========================
	@RequestMapping(value = "/googleLoginLogic")
    public String googleLoginLogic(@RequestParam("code") String code, Model model, HttpSession session ) throws Exception {
 
        //String code = request.getParameter("code");
        System.out.println(code);
        
		String clientId = "390106883897-isb9t3klp9f0ni2cb47tktqq837og6f7.apps.googleusercontent.com";
		String clientSecret = "_WfZADTEEsEyI_meh6B0b5eJ";
		String redirectUrl = "http://localhost:8080/user/googleLoginLogic";
        
        //RestTemplate을 사용하여 Access Token 및 profile을 요청한다.
        RestTemplate restTemplate = new RestTemplate();
        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("code", code);
        parameters.add("client_id", clientId);
        parameters.add("client_secret", clientSecret);
        parameters.add("redirect_uri",redirectUrl);
        parameters.add("grant_type", "authorization_code");
 
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String, String>>(parameters, headers);
        ResponseEntity<Map> responseEntity = restTemplate.exchange("https://www.googleapis.com/oauth2/v4/token", HttpMethod.POST, requestEntity, Map.class);
        Map<String, Object> responseMap = responseEntity.getBody();
 
        // id_token 라는 키에 사용자가 정보가 존재한다.
        // 받아온 결과는 JWT (Json Web Token) 형식으로 받아온다. 콤마 단위로 끊어서 첫 번째는 현 토큰에 대한 메타 정보, 두 번째는 우리가 필요한 내용이 존재한다.
        // 세번째 부분에는 위변조를 방지하기 위한 특정 알고리즘으로 암호화되어 사이닝에 사용한다.
        //Base 64로 인코딩 되어 있으므로 디코딩한다.
 
        String[] tokens = ((String)responseMap.get("id_token")).split("\\.");
        Base64 base64 = new Base64(true);
        String body = new String(base64.decode(tokens[1]));
        
        System.out.println(tokens.length);
        System.out.println(new String(Base64.decodeBase64(tokens[0]), "utf-8"));
        System.out.println(new String(Base64.decodeBase64(tokens[1]), "utf-8"));
 
        //Jackson을 사용한 JSON을 자바 Map 형식으로 변환
        ObjectMapper mapper = new ObjectMapper();
        Map<String, String> resultMap = mapper.readValue(body, Map.class);
        System.out.println("=======================================================");
        System.out.println("email"+resultMap.get("email"));
        //System.out.println(result.get("family_name"));
        //System.out.println(result.get("given_name"));
        //System.out.println(result.get("locale"));
        System.out.println("name"+resultMap.get("name"));
        System.out.println(resultMap.get("picture"));
        System.out.println("id"+resultMap.get("sub"));
        System.out.println("=======================================================");
        
        //sub 사용자의 식별자.. password로.. 
        String userName = (String)resultMap.get("name");
        String sub = (String)resultMap.get("sub");
        String email = (String)resultMap.get("email");
        
		// 이메일 ~~~@google.com에서 @의 인덱스를 가져옴
		int index = email.indexOf("@");
		
		// ~~~@google.com에서 ~~~를 파싱해서 userId로 설정 
		String userId = email.substring(0, index);
		System.out.println("-----------------userId ? : " + userId);
        

		// checkDuplication return false :: 존재하는 아이디 => userService.getUserId
		if(! (userService.idCheckDupl(userId)) ) { 
			User dbUser = userService.getUserId(userId);
			
			// 로그인 처리 
			session.setAttribute("user", dbUser);	

		}
		// checkDuplication return true :: 없는 아이디 => userService.addUser
		else {
			
			model.addAttribute("getTheaterList",dateTimeService.getTheaterList(new Search()));
			
			User user = new User();
			user.setUserId(userId);
			user.setEmail(email);
			user.setUserName(userName);
			user.setPassword(sub);
			user.setIdentity(3);
			
			model.addAttribute("user",user);
			
			return "forward:/user/extraAddUser.jsp";
		}        
        
		 // 모든 구글 로그인(회원가입) Business Logic이 끝난 타이밍을 알기 위해 전혀 의미 없는 jsp로 연결
        return "forward:/naver/pathLoginImfo.jsp";
	}
	
	
	
}
	

	
	
		
	
	
	
	
	
	
	
	
	
	
	
	
	


