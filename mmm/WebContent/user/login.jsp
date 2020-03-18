<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
<title>mmm</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<!-- 	SweetAlert2 CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>

<title>mmm</title>
<!--  ///////////////////////// CSS ////////////////////////// -->
<style>

body{
	font-family: 'Noto Sans KR', sans-serif;

}
 
h3.tit {
    color: #333;
    font-size: 1.2em;
    line-height: 1.1;
}  
.col-wrap{
	letter-spacing: 0;
	line-height: 1.5;
	font-size: 15px;
	color: #444;
	font-weight: 400; 
}
  
.login-input-area .input-text {
    display: block;
    width: 100%;
    height: 46px;
}
.input-text {
    display: inline-block;
    width: 100%;
    height: 32px;
    padding: 0 10px;
    line-height: 30px;
    color: #444;
    border: 1px solid #d8d9db;
    vertical-align: middle;
  
.login-input-area .chk-util {
    overflow: hidden;
    padding: 15px 0 35px 0;
}
.login-input-area .chk-util .left {
    float: left;
}

.button.purple.large {
    line-height: 46px;
}
.login-input-area .btn-login {
    display: block;
    width: 100%;
}
.login-input-area .link {
    padding: 20px 0 30px 0;
    text-align: center;
    line-height: 1.1;
}

.col-wrap{

	letter-spacing: 0;
	line-height: 1.5;
	font-size: 15px;
	color: #444;
	font-weight: 400; 

}
	
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

$(function(){	
	
	
	
	$('#loginModal').modal ({ keyboard: false, backdrop: 'static' });
	
	$("#loginModal").modal("show");
	
	//모달창 엑스
	$("#btn").on("click",function(){
		history.go(-1);
	})
	
	
	function getParam(key) {
	    var params = location.search.substr(location.search.indexOf("?") + 1);
	    var value = "";
	    params = params.split("&");
	    for (var i = 0; i < params.length; i++) {
	        temp = params[i].split("=");
	        if ([temp[0]] == key) { value = temp[1]; }
	    }
	    return value;
	}
	var status = getParam("status");
	
	if(status=="failed"){
		//alert("로그인 정보가 올바르지 않습니다.");
		Swal.fire({
		  icon: 'error', //"info,success,warning,error" 중 택1
		 // title: 'Oops...',
		  text: '로그인 정보가 올바르지 않습니다.'
		})
	}

	
	function validate() {
	    var re =  /^[0-9a-z]{5,15}$/;  // 아이디가 적합한지 검사할 정규식
	    var re3 = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{1,50}).{5,15}$/; 
	    
	 	var id= $("#userId").val();  //숫자,영문섞어서 5~15자 이내   	
		var pw= $("#password").val(); //숫자, 특문 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력    		
		
		if(!check(re,id,"아이디는 5~15자의 영문 소문자와 숫자로만 입력해주세요.")) {
			console.log(id);
			$("#userId").focus();
		    return;
		}
		
		if(!check(re3,pw,"비밀번호는 5~15자의 영문 소문자와 숫자,특수문자를 포함하여 입력해주세요.")) {
		    return;
		}
	}
	
	function check(re, what, message) {
    	if(re.test(what)) {
        return true;
    	}
    	alert(message);
	}
	
	//====================="아이디 저장"=================
	var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
    $("#userId").val(userInputId); 
     
    if($("#userId").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
                                           // 아이디 저장하기 체크되어있을 시,
        $("#chkIdSave").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#chkIdSave").change(function(){ // 체크박스에 변화가 발생시
        if($("#chkIdSave").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("#userId").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#userId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#chkIdSave").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("#userId").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
	
	
	
	//======================"로그인" Event 연결==========

	$("#password").on("keydown",function (event) {
		
		 if(event.keyCode == 13){//키가 13이면 실행 (엔터는 13)
			console.log("클릭");
			id= $('#userId').val();
			pw= $('#password').val();
			validate();
			
		
			if(id == '' || id ==null||pw == '' || pw ==null){
				alert('아이디와 비밀번호를 입력하세요.');
				// $('#loginBtn').attr("disabled", true);
				location.reload();
			/* }else if(pw == '' || pw ==null){
				alert('비밀번호를 입력하세요.');
				$('#loginBtn').attr("disabled", true); */
			}else{
			//	$('#loginBtn').attr("disabled", false);
				$('form').attr('method','POST').attr('action','/user/login').submit();	
			}
		 }
	})
			
		
	
	$('#loginBtn').on('click',function(){
		console.log("클릭");
		id= $('#userId').val();
		pw= $('#password').val();
		
		if(!check){
			return;
		}
		
		if(id == '' || id ==null||pw == '' || pw ==null){
			alert('아이디와 비밀번호를 입력하세요.');
			//$('#loginBtn').attr("disabled", true);
			location.reload();
		}else{
			//$('#loginBtn').attr("disabled", false);
			$('form').attr('method','POST').attr('action','/user/login').submit();	
		}
	})	
	
	$('#signUpBtn').on('click',function(){
		self.location = '/user/userAuthorization.jsp?type=addUser';
		
	})
	
	
	
	
	//===================naver Login============
	$('#naverLogin').on('click',function(){
		console.log('클릭');
		window.open('/naver/openWindow.jsp',
					'popWin',
					'left=400, top=90, width=775, height=700, marginwidth=0, marginheight=0, fullscreen=no, scrollbars=yes, scrolling=yes, menubar=no, resizable=no');
	})
	
	//===================kakao Login============
	$('#kakaoLogin').on('click',function(){
		console.log('클릭');
		window.open('/kakao/openWindow.jsp',
					'popWin',
					'left=400, top=90, width=775, height=700, marginwidth=0, marginheight=0, fullscreen=no, scrollbars=yes, scrolling=yes, menubar=no, resizable=no');
	})
	
	//===================google Login============
	$('#googleLogin').on('click',function(){
		console.log('클릭');
		window.open('/google/openWindow.jsp',
					'popWin',
					'left=400, top=90, width=775, height=700, marginwidth=0, marginheight=0, fullscreen=no, scrollbars=yes, scrolling=yes, menubar=no, resizable=no');
	})
	
});
</script>
</head>
<body>

<!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="height: 48px; text-align: center;  background: #fee50e;">
        <h3 class="tit" id="exampleModalLabel" style="font-size: 1.2em;">로그인</h3>
        <button type="button" class="close" data-dismiss="modal" id="btn" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
    
	    <!-- col-wrap -->
	    <form>
			<div class="col-wrap">
				<div class="col left">
					<div class="login-input-area">
						<input autocomplete="off" id="userId" name="userId" maxlength="20" type="text" placeholder="아이디" title="아이디를 입력하세요" class="input-text strTrim"><!--아이디--><!--아이디를 입력하세요-->
						<input autocomplete="off" id="password" name="password" maxlength="20" type="password" placeholder="비밀번호" title="비밀번호를 입력하세요" class="input-text mt15" style="margin-top: 15px;"><!--비밀번호--><!--비밀번호를 입력하세요-->
		
						<!-- chk-util -->
						<div class="chk-util">
							<div class="left">
								<input id="chkIdSave" type="checkbox"> <label for="chkIdSave">아이디 저장<!--아이디 저장--></label>
							</div>
						</div>
						<!--// chk-util -->
			
						<button id="loginBtn" type="button" class="button purple large btn-login" style="border-radius: 4px; color:#333; height: 46px;  border: 0; width: 100%; cursor: default; background-color:#fee50e;">로그인<!--로그인--></button>
			
						<div class="link" style="padding-top: 20px; padding-bottom: 30px; text-align: center;">
							<a href="/user/userAuthorization?type=findId" title="ID 찾기 선택" style=" margin-left:10px; color: #333; ">ID 찾기<!--ID/PW 찾기--></a>
							<a href="/user/userAuthorization?type=findPw" title="PW 찾기 선택" style=" margin-left:10px; position: relative; color: #333;">PW 찾기<!--ID/PW 찾기--></a>
							<a href="/user/userAuthorization.jsp?type=addUser" title="회원가입 선택"style=" margin-left:10px; relative; position: relative; color: #333;">회원가입<!--회원가입--></a>
							<a href="/user/addUnUserView" title="비회원 예매"style=" margin-left:10px; position: relative; color: #333;">비회원 예매<!--비회원 예매--></a>
							<a href="/user/unUserLogin" title="비회원 예매확인 선택"style=" margin-left:10px; position: relative; color: #333;">비회원 예매확인<!--비회원 예매확인--></a>
						</div>
			
						<div class="sns-login" style="text-align: center;">
							<a href="" style="margin-left: 23px; margin-right: 23px;" id ="naverLogin" title="네이버로 로그인 선택" ><img src="/resources/image/user/ico-naver.png" alt="네이버"></a>
							<a href="" style="margin-left: 23px; margin-right: 23px;" id ="kakaoLogin" title="카카오톡으로 로그인 선택"><img src="/resources/image/user/ico-kakao.png" alt="카카오톡"></a>
							<a href="" style="margin-left: 18px; margin-right: 23px;" id ="googleLogin" title="구글로 로그인 선택"><img src="/resources/image/user/ico-google.png" alt="구글"></a>
						</div>
					</div>
				</div>
			</div>
		</form>
		<!--// col-wrap -->
      </div>
    </div>
  </div>
</div>



</body>
</html>