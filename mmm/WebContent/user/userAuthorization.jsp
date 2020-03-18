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
	
<!-- 	SweetAlert2 CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >

<!--google font  -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
    font-weight: 400;
    font-family:'Noto Sans KR', sans-serif;
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

button.swal2-confirm.swal2-styled {
	background-color: #fee50e;
	border-color : #fee50e;
	color : #222;
}


</style>

<title>mmm</title>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

$(function(){	
	
	
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

	var type = getParam("type");
	
	function nextPage(keyword, authType){
	    var f=document.nextPage; //폼 name
	    f.keyword.value = keyword; //POST방식으로 넘기고 싶은 값
	    f.authType.value = authType; //POST방식으로 넘기고 싶은 값
	    f.action="/user/"+type;//이동할 페이지
	    f.method="post";//POST방식
	    f.submit();
	}
	

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
	
	if(status=="notfound"){
		//alert("로그인 정보가 올바르지 않습니다.");
		Swal.fire({
		  icon: 'error', //"info,success,warning,error" 중 택1
		 // title: 'Oops...',
		  text: '로그인 정보가 올바르지 않습니다.'
		})
	}
	
	
	
	
	/* if(type=="findUnUserPw" || type=="addUnUserView"){//비회원가입 , 비회원 비번찾기는 휴대폰번호로만 가능
		//$("#emailArea").hide();
		
	} */
	
	if(type=="addUser"){ //신규 회원가입
		// 휴대폰중복체크(1 = 중복 / 0 != 중복)
		$('#phone').keyup(function() {
			console.log("클릭!!!")
			var phone = $('#phone').val();
			console.log(phone);
			$.ajax({
				url : '/user/json/phoneCheckDupl/'+ phone,
				type : 'get',
				success : function(data) {
					console.log("false = 중복o / true = 중복x : "+ data);							
					
					if (data == 0) {
							// 0 : 휴대폰번호가 중복되는 문구
							$("#confirmNum1").text("등록된 전화번호입니다 :p");
							$("#confirmNum1").css("color", "red");
							$("#smsBtn").attr("disabled", true);
					}else{
						$("#confirmNum1").text("");
						$("#smsBtn").attr("disabled", false);
					} 
					}, error : function() {
							console.log("실패");
					}
			})//ajax 끝
		});//중복체크 끝
		
		// 이메일중복체크(1 = 중복 / 0 != 중복)
		$('#email').keyup(function() {
			console.log("클릭!!!")
			var email = $('#email').val();
			console.log(email);
			$.ajax({
				url : '/user/json/emailCheckDupl/',
				method : "post" ,
				datatype : "json" ,
				headers : {
					"Accept" : "application/json" ,
					"Content-Type" : "application/json"
				} ,
				data : JSON.stringify({
					email : email
				}), 
				success : function(data) {
					console.log("false = 중복o / true = 중복x : "+ data);							
					
					if (data == 0) {
							// 0 : 이메일이 중복되는 문구
							$("#confirmNum3").text("등록된 이메일입니다 :p");
							$("#confirmNum3").css("color", "red");
							$("#sendBtn").attr("disabled", true);
					}else{
						$("#confirmNum3").text("");
						$("#sendBtn").attr("disabled", false);
					} 
				}, error : function() {
						console.log("실패");
					}
				})//ajax 끝
			});//중복체크 끝
			
	} else { // 기존회원의 아이디/비번 찾기
		// 휴대폰중복체크(1 = 중복 / 0 != 중복)
		$('#phone').keyup(function() {
			console.log("클릭!!!")
			var phone = $('#phone').val();
			console.log(phone);
			$.ajax({
				url : '/user/json/phoneCheckDupl/'+ phone,
				type : 'get',
				success : function(data) {
					console.log("false = 중복o / true = 중복x : "+ data);							
					
					if (data == 0) {
							// 0 : 휴대폰번호가 있는 경우
							$("#confirmNum1").text("");
							$("#smsBtn").attr("disabled", false);
					}else{
						$("#confirmNum1").text("등록되지 않은 전화번호입니다 :p");
						$("#confirmNum1").css("color", "red");
						$("#smsBtn").attr("disabled", true);
					} 
					}, error : function() {
							console.log("실패");
					}
			})//ajax 끝
		});//중복체크 끝
		
		// 이메일중복체크(1 = 중복 / 0 != 중복)
		$('#email').keyup(function() {
			console.log("클릭!!!")
			var email = $('#email').val();
			console.log(email);
			$.ajax({
				url : '/user/json/emailCheckDupl/',
				method : "post" ,
				datatype : "json" ,
				headers : {
					"Accept" : "application/json" ,
					"Content-Type" : "application/json"
				} ,
				data : JSON.stringify({
					email : email
				}), 
				success : function(data) {
					console.log("false = 중복o / true = 중복x : "+ data);							
					
					if (data == 0) {
						// 0 : 이메일이 중복되는 문구
						$("#confirmNum3").text("");
						$("#sendBtn").attr("disabled", false);
					}else{
						$("#confirmNum3").text("등록되지 않은 이메일입니다 :p");
						$("#confirmNum3").css("color", "red");
						$("#sendBtn").attr("disabled", true);
					} 
				}, error : function() {
						console.log("실패");
					}
				})//ajax 끝
			});//중복체크 끝
	}
		
	///////////////////////휴대폰번호 인증///////////////////////////////////
	
	
	$("#smsBtn").on("click", function(){
		console.log("클릭!")
		var phone = $("#phone").val();
		var re5 = /^(01[016789]{1})([0-9]{3,4})([0-9]{4})$/; //폰번호가 적합한지 검사할 정규식
		console.log(phone)
		
		if(phone == null || phone.length <1){
			$("#confirmNum1").text("휴대폰 번호는 반드시 입력하셔야 합니다.");
			return;
			
		}else if(phone != "" && phone.length <11 ){
			$("#confirmNum1").text("휴대폰번호를 확인해주세요.");
		    return;	
		    
		}else if(re5.test(phone)){
				$("#confirmNum1").text("");
				$("#smsBtn").attr("disabled", false);
		}else{
			$("#confirmNum1").text("");
		}

		
		$.ajax({ 
			url : "/user/json/sendSMS/" + phone ,
			method : "get" ,
			datatype : "json" ,
			headers : {
				"Accept" : "application/json" ,
				"Content-Type" : "application/json"
			} ,
			success : function( JSONData , status ) {
				console.log("동작");
				alert("문자가 전송되었습니다.")
				console.log(JSONData.status);
				$("div").text(JSONData.status); 
			}
		})
	})
	

		
	$(document).on("click", "#chkBtn", function() {
		var numStr = $("#numStr").val();
		var phone = $('#phone').val();
		var len = numStr.length
		if(len != 6){
			$("#confirmNum2").text("인증번호를 확인해주세요.");
					
		}else {
			$.ajax({ 
				url : "/user/json/authSMS/" + numStr ,
				method : "get" ,
				datatype : "json" ,
				headers : {
					"Accept" : "application/json" ,
					"Content-Type" : "application/json"
				} ,
				success : function( JSONData , status ) {
					console.log("동작");
					console.log(JSONData.status);
					console.log(type);
		
					if(JSONData == 0){
						//0: 인증번호가 틀림
						$('#confirmNum2'),text('인증번호를 확인해주세요.');
						$("#confirmNum2").css("color", "red");
					}else{
						Swal.fire({
							icon: 'success', //"info,success,warning,error" 중 택1
							title: '인증 완료',
							text: '계속 진행해주세요.',
							}).then((result) => {
								
								if(type=="addUser"){
									self.location= "/user/addUser";

							}else{
								nextPage(phone, "phone");
							}
							});
					}//else
				}, error : function() {
					console.log("실패");
				}
			})//ajax 끝 
		}
		
	})//폰번호인증번호 입력후 확인 
			
	
	
	///////////////////////////////이메일 인증////////////////////////////////////
	
		
	$( "#sendBtn" ).on("click" , function() {
		console.log("click");
		var email = $("#email").val();
		var re2 = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/g // 이메일이 적합한지 검사할 정규식
		console.log(email);
				
	// 입력한 이메일 유효성 검사 
	// 단 존재하지 않는 이메일을 보냈을 때에도 이메일 형식에만 맞는다면 동작한다 
		if( email == null || email.length <1){
		//	$("#confirmNum3").text("이메일은 반드시 입력하셔야 합니다.");
			Swal.fire({
				  icon: 'error', //"info,success,warning,error" 중 택1
				 // title: 'Oops...',
				  text: '이메일은 반드시 입력하셔야 합니다.'
				})
			
			
			return;
		}else if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
		//	$("#confirmNum3").text("이메일 형식이 아닙니다.");
			Swal.fire({
				  icon: 'error', //"info,success,warning,error" 중 택1
				 // title: 'Oops...',
				  text: '이메일 형식이 아닙니다.'
				})

	    	return;
		}else if(re2.test(email)){
			$("#confirmNum3").text("");
			$("#sendBtn").attr("disabled", false);	

     	}else{
			$("#confirmNum3").text("");
		}
				
		$.ajax({
			url : "/user/json/checkMail" ,
			method : "post" ,
			datatype : "json" ,
			headers : {
				"Accept" : "application/json" ,
				"Content-Type" : "application/json"
			} ,
			data : JSON.stringify({
				email : email
			}) , 
			success : function( result , status ) {
				console.log("동작");
				console.log(result);
				console.log(status);
				if(result){
				//	$("#confirmNum3").text("인증메일이 발송되었습니다."); 
					Swal.fire({
					  icon: 'info', //"info,success,warning,error" 중 택1
					 // title: 'Oops...',
					  text: '인증메일이 발송되었습니다.'
					})

				}else{
				//	$("#confirmNum3").text("메일주소를 확인해주세요.!!!"); 
					Swal.fire({
						  icon: 'error', //"info,success,warning,error" 중 택1
						 // title: 'Oops...',
						  text: '메일주소를 확인해주세요.'
						})

				}
 			}
		}) 			
	}); //이메일 인증 끝
		
	$(document).on("click", "#chkBtn2", function() {
		var emailChkNum = $("#emailChkNum").val();
		var email = $('#email').val();
		console.log("click") 
		
		$.ajax({ 
				url : "/user/json/authEmail/" + emailChkNum ,
				method : "get" ,
				datatype : "json" ,
				headers : {
					"Accept" : "application/json" ,
					"Content-Type" : "application/json"
				} ,
				success : function( JSONData , status ) {
					console.log("동작");
					console.log(JSONData.status);
					console.log(type);
					//$("div").text(JSONData.status); 
					
					if(JSONData == 0){
						//0: 인증번호가 틀림
						//$('confirmNum2'),text('인증번호를 확인해주세요.');
						//$("#confirmNum2").css("color", "red");
						Swal.fire({
							  icon: 'error', //"info,success,warning,error" 중 택1
							 // title: 'Oops...',
							  text: '인증번호를 확인해주세요.'
							})
						
						$("#chkBtn2").attr("disabled", true);
					}else{
						Swal.fire({
							icon: 'success', //"info,success,warning,error" 중 택1
							title: '인증 완료',
							text: ' 계속 진행해주세요.',
							}).then((result) => {   
								if(type=="addUser"){
									self.location= "/user/addUser";

								}else{
									nextPage(email, "email");
								}
								
							});
					}//else
				}, error : function() {
					console.log("실패");
				}
			})//ajax 끝
		
		
	})//이메일인증번호 입력후 확인 self.location = "/user/authEmail/" +emailChkNum; 
	
	
	
	
	
	
	
	
	 

});

</script>
</head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/header.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->


<!-- nextPage Form -->
<form name="nextPage">
      <input type="hidden" name="keyword"/>
      <input type="hidden" name="authType"/>
</form>

<!--  화면구성 div Start /////////////////////////////////////-->
<div class="container" style="margin-top: 50px; width: 600px;">

	<h1 class="bg-default text-center" style="background-color:#fee50e;">본 인 인 증</h1><br>
		<h5 class="bg-default text-center"> 본인 인증단계 입니다.<br>
			원하시는 인증 방법을 선택해주세요. <br>
		</h5>	
		<div class="row" style="margin-top: 20px;"> 
			<div class="col-md-6" ><a href="#" data-toggle="modal" data-target="#phoneModal"><img style="float: right;width: 200px;height: 230px;" alt="" src="/resources/image/user/phone_img.png"></a></div>
			<div class="col-md-6" ><a href="#" data-toggle="modal" data-target="#emailModal"><img style="padding-top: 30px; width: 190px; height: 200px;" alt="" src="/resources/image/user/email_img.png"></a></div>
		</div><br>
			<h5 class="bg-default text-center" style="margin-bottom: 10px;">
				14세 미만 어린이는 보호자 인증을 추가로 완료한 후 <br> 가입이 가능합니다.<br>
				 본인인증 시 제공되는 정보는 해당 인증기관에서 직접 <br> 수집하며, 
				인증 이외의 용도로 이용 또는 저장되지 않습니다. 
			</h5><br>
</div>	<!-- container -->	

<!-- 		<div class="row"> -->
<!-- 			<div class="col-md-2"></div> -->
<!-- 			<div class="col-md-4" style="height: 300px; font-size: 14pt; padding-top: 7px; border: 1px solid purple; background-color: beige;"> -->
<!-- 				<strong>휴대폰 인증</strong> -->
<!-- 				<form> -->
<!-- 					<div class="form-group row" style="font-size: 12pt;"> -->
<!-- 						<label for="phone" class="col-sm-4 col-form-label">휴대전화번호</label> -->
<!-- 						<div class="input-group sm-4"> -->
<!-- 							<input type="text" class="form-control" placeholder="-없이 입력해주세요." id="phone" name="phone" aria-label="Recipient's username" -->
<!-- 								aria-describedby="basic-addon2"> -->
<!-- 							<div class="input-group-append"> -->
<!-- 								<button class="btn btn-outline-secondary" id="smsBtn"type="button">문자전송</button> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<h6 id="confirmNum1" style="color: red;"></h6> -->
<!-- 					</div> -->
<!-- 					<div class="form-group row"> -->
<!-- 						<label for="numStr" class="col-sm-4 col-form-label"style="font-size: 12pt;">인증번호</label> -->
<!-- 						<div class="col-sm-6"> -->
<!-- 							<input type="number" id="numStr" class="form-control" placeholder="인증번호 6자리"> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<h6 id="confirmNum2" style="color: red;"></h6> -->
<!-- 					<div class="col-sm-12" style="text-align: center;"> -->
<!-- 						<button type="button" class="btn btn-dark" id="chkBtn">확인</button> -->
<!-- 					</div> -->
<!-- 				</form> -->
<!-- 			</div> -->
<!-- 			&nbsp;&nbsp;&nbsp; -->
<!-- 			<div id ="emailArea" class="col-md-4" style="height: 300px; font-size: 14pt; padding-top: 7px; border: 1px solid purple; background-color: beige;"> -->
<!-- 				<strong>이메일 인증</strong> -->
<!-- 				<form> -->
<!-- 					<div class="form-group row" style="font-size: 12pt;"> -->
<!-- 						<label for="staticEmail" class="col-sm-4 col-form-label">이메일</label> -->
<!-- 						<div class="input-group sm-4"> -->
<!-- 							<input type="text" class="form-control" id="email" name="email" -->
<!-- 								placeholder="이메일을 정확히 입력해주세요." aria-label="Recipient's username" -->
<!-- 								aria-describedby="basic-addon2"> -->
<!-- 							<div class="input-group-append"> -->
<!-- 								<button class="btn btn-outline-secondary" id="sendBtn" type="button">메일전송</button> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<h6 id="confirmNum3" style="color: red;"></h6> -->
<!-- 					</div> -->
<!-- 					<div class="form-group row"> -->
<!-- 						<label for="emailChkNum" class="col-sm-4 col-form-label" style="font-size: 12pt;">인증번호</label> -->
<!-- 						<div class="col-sm-6"> -->
<!-- 							<input type="text" class="form-control" id="emailChkNum" placeholder="인증번호">  -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<h6 id="confirmNum4" style="color: red;"></h6> -->
<!-- 					<div class="col-sm-12" style="text-align: center;"> -->
<!-- 						<button type="button" class="btn btn-dark" id="chkBtn2">확인</button> -->
<!-- 					</div> -->
<!-- 				</form> -->
<!-- 			</div> -->
<!-- 			<div class="col-md-2"></div> -->
<!-- 		</div> -->
<!-- 	</div> -->

	
		<!-- Modal -->
		<div class="modal fade" id="phoneModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header" style="height: 48px; text-align: center;  background: #fee50e;">
						<h3 class="tit" id="exampleModalLabel">휴대폰 인증</h3>
						<button type="button" class="close" data-dismiss="modal" id="btn1" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
					    <form>
							<div class="col-wrap">
								<div class="col left">
									<div class="login-input-area">
										<div class="row" style="margin-bottom: 20px;"> 
										
											<span style="padding-right: 10px; margin-top: 10px;">휴대전화 번호</span>
											<input type="text" class="form-control" placeholder="-없이 입력해주세요." id="phone" name="phone" style="margin-top: 5px; margin-right: 20px; width: 200px">
											
											<button id="smsBtn" type="button" class="button purple large btn-login" style="border-radius: 4px; color:#333; padding-right: 10px;
										         width: 120px; height: 46px;  border: 0;  cursor: default; background-color:#fee50e;">인증번호발송</button>
										         <h6 id="confirmNum1" style=" padding-left:100px; red; margin-top: 8px;"></h6>  
										</div>
												
										<div class="row">	
											<span style="padding-right: 10px; width: 97px;">인증번호</span>
											<input type="number" id="numStr" class="form-control" style="width: 150px; margin-right: 20px;" placeholder="인증번호 6자리">
										</div>
										<h6 id="confirmNum2" style="color: red;"></h6>
										<div style="text-align: center;">
										<button id="chkBtn" type="button" class="button purple large btn-login" style="border-radius: 4px; color:#333; padding-right: 10px;
											         width: 100px; height: 46px; margin-top:20px; border: 0; cursor: default; background-color:#fee50e;">확인</button> 
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
		
		<!-- Modal -->
		<div class="modal fade" id="emailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header" style="height: 48px; text-align: center;  background: #fee50e;">
						<h3 class="tit" id="exampleModalLabel">이메일 인증</h3>
						<button type="button" class="close" data-dismiss="modal" id="btn2"  aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form>
							<div class="col-wrap">
								<div class="col left">
									<div class="login-input-area">
										<div class="row" style="margin-bottom: 20px;"> 
										
											<span style="padding-right: 10px; margin-top: 10px;">이메일</span>
											<input type="text" class="form-control" placeholder="이메일을 정확히 입력해주세요." id="email" name="email" style="margin-top: 5px; margin-right: 20px; width: 250px">
											
											<button id="sendBtn" type="button" class="button purple large btn-login" style="border-radius: 4px; color:#333; padding-right: 10px;
										         width: 120px; height: 46px;  border: 0;  cursor: default; background-color:#fee50e;">인증번호발송</button> 
											<h6 id="confirmNum3" style="color: red; padding-left:50px; red; margin-top: 8px;"></h6>
										</div>
										 		
										<div class="row">	
											<span style="padding-right: 10px; width: 97px;">인증번호</span>
											<input type="text" id="emailChkNum" class="form-control" style="width: 150px; margin-right: 20px;" placeholder="인증번호 ">
										</div>
										<h6 id="confirmNum4" style="color: red;"></h6>
										<div style="text-align: center;">
										<button id="chkBtn2" type="button" class="button purple large btn-login" style="border-radius: 4px; color:#333; padding-right: 10px;
											         width: 100px; height: 46px; margin-top:20px; border: 0; cursor: default; background-color:#fee50e;">확인</button> 
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div> <!-- email 인증  -->
	
<!-- Header Start /////////////////////////////////////-->
	<jsp:include page="/layout/footer.jsp" />
<!-- Header End /////////////////////////////////////-->		
		

</body>
</html>