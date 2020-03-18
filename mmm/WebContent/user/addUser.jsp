<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 카카오 맵 api key -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e195c747986bcc9e0da58dd2ded5409c"></script>

<!-- Required meta tags -->
<meta charset="utf-8">
<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
<title>mmm</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 	SweetAlert2 CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<!-- Bootstrap Extended Color -->
<link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors.css" />
<link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors-themes.css" />
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<title>회원가입</title>
<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
 	
  #infoWindow{
	  white-space: nowrap; 
	  width: 50px; 
	  overflow: hidden;
	  text-overflow: ellipsis; 	
  }
		
   .dot {overflow:hidden;float:left;width:12px;height:12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
   .dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
   .dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
   .number {font-weight:bold;color:#ee6152;}
   .dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
   .distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
   .distanceInfo .label {display:inline-block;width:50px;}
   .distanceInfo:after {content:none;}
 
  
.button.purple {
    color: #333;
    line-height: 36px;
    border: 0;
    background: #fee50e;
}
.button.large {
    height: 46px;
    padding: 0 30px;
    line-height: 44px;
}

.button {
    display: inline-block;
    height: 36px;
    margin: 0;
    padding: 0 15px;
    text-align: center;
    line-height: 34px;
    color: #fee50e;
    font-weight: 400;
    border-radius: 4px;
	font-family:'Noto Sans KR', sans-serif;
    text-decoration: none;
    border: 1px solid #fee50e;
    vertical-align: middle;
    background-color: #fff;
    cursor: pointer;
}

.font-orange {
    color: #e63e30!important;
}

#addTheater {
	background-color: #fee50e;
	border-color : #fee50e;
	color : #222;
}

#myModalBodyButton {
	background-color: #fee50e;
	border-color : #fee50e;
	color : #333;
} 

button.swal2-confirm.swal2-styled {
	background-color: #fee50e;
	border-color : #fee50e;
	color : #333;
}

#myModal > div > div > div.modal-footer > button:nth-child(1) {
	color: #fff;
   	background-color: #6c757d;
   	border-color: #6c757d;	
}

#addUser > div:nth-child(13) > div > a {
	color: #fff;
   	background-color: #6c757d;
   	border-color: #6c757d;		
}      
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

$(function(){
	//======================"가입" Event 연결==========
	$("#addUserBtn").on("click",function(){
		console.log("클릭");
		validate();
		
	});
	
	//============= "취소"  Event 처리 및  연결 ===========
	$("a[href='#']").on("click",function(){
		//$("form")[0].reset();
		self.location="/";
	});		


	function validate() {
	    var re =  /^[0-9a-z]{5,15}$/;  // 아이디와 패스워드가 적합한지 검사할 정규식
	    var re2 = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/g // 이메일이 적합한지 검사할 정규식
	    var re3 = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{1,50}).{5,15}$/; //숫자, 특문 각 1회 이상, 영문은 2개 이상 사용하여 5자리 이상 15자입력    
		var re4 = /^[가-힣]{2,15}$/ //이름이 한글인지 검사할 정규식
		var re5 = /^(01[016789]{1})([0-9]{3,4})([0-9]{4})$/; //폰번호가 적합한지 검사할 정규식
	    
	 	var id= $("#userId").val();  //숫자,영문섞어서 5~15자 이내   	
		var pw= $("#password").val(); //숫자, 특문 각 1회 이상, 영문은 2개 이상 사용하여 5자리 이상 15자입력  
		var checkPw= $("#password2").val();
		var name = $("#userName").val();
		var birth = $("#birth").val(); 
		var addr = $("#addr").val(); 
		var email = $("#email").val(); 
		var phone = $("#phone").val().replace(/-/gi,''); 
		var isChk = $("#agreeCheck").is(":checked");
		console.log("쳬크빢쓰 : "+isChk)
		
		
		if(!check(re,id,"아이디는 5~15자의 영문 소문자와 숫자로만 입력해주세요.")) {
			console.log(id);
			$("#userId").focus();
		    return;
		}
		
		if(!check(re3,pw,"비밀번호는 5~15자의 영문 소문자와 숫자,특수문자를 포함하여 입력해주세요.")) {
		    return;
		}
		
		if(pw != checkPw) {
		   // alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
		    Swal.fire({
				  icon: 'error', //"info,success,warning,error" 중 택1
				 // title: 'Oops...',
				  text: '비밀번호가 다릅니다. 다시 확인해 주세요.'
				})
		    $("#password2").val("");
		    $("#password2").focus();
		    return;
		}
		
		if(name == "") {
		    //alert("이름을 입력해 주세요.");
		    Swal.fire({
			  icon: 'error', //"info,success,warning,error" 중 택1
			 // title: 'Oops...',
			  text: '이름을 입력해 주세요.'
			})
		    $("#userName").focus();
		    return false;
		}
		
		if(!check(re4, name, "적합하지 않은 이름 형식입니다.")) {
		    return false;
		}
		
		if(birth=="") {
		  //  alert("생년월일을 입력해 주세요");
		    Swal.fire({
			  icon: 'error', //"info,success,warning,error" 중 택1
			 // title: 'Oops...',
			  text: '생년월일을 입력해 주세요.'
			})
		    console.log(birth);
		    $("#birth").focus();
		    return false;
		}
		
		if(email=="") {
		   // alert("이메일을 입력해 주세요");
		    Swal.fire({
			  icon: 'error', //"info,success,warning,error" 중 택1
			 // title: 'Oops...',
			  text: '이메일을 입력해 주세요.'
			})
		    $("#email").focus();
		    return false;
		}
		
		 
		if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
		    return false;
		}
		
		if(!(phone.length==11||phone.length==10)) {
		   // alert("전화번호를 확인해주세요.");
		    Swal.fire({
			  icon: 'error', //"info,success,warning,error" 중 택1
			 // title: 'Oops...',
			  text: '전화번호를 확인해주세요.'
			})
		    $("#phone").focus();
		    return false;
		}
		if(!check(re5,phone,"숫자만 입력해주세요.")){
			$("#phone").focus();
			return;
		}
		
		if(!isChk){
			//alert("개인정보 수집동의 체크해주세요.")
			Swal.fire({
			  icon: 'error', //"info,success,warning,error" 중 택1
			 // title: 'Oops...',
			  text: '개인정보 수집동의 체크해주세요.'
			})
			return;
		}
		
		
		Swal.fire({
	           icon: 'success', //"info,success,warning,error" 중 택1
	          title: '가입 완료',
	      }).then((result) => {   
	 		//alert("가입을 축하합니다.!!!!");
			$("#addUser").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		
	      });

	}

	function check(re, what, message) {
    	if(re.test(what)) {
        return true;
    	}
    	Swal.fire({
		  icon: 'error', //"info,success,warning,error" 중 택1
		 // title: 'Oops...',
		  text: message
		})
   		//alert(message);
	}	
	
	// 아이디 중복체크(1 = 중복 / 0 != 중복)
	$('#userId').keyup(function() {
		console.log("클릭!!!")
		// id = "userId" / name = "userId"
		var re =  /^[0-9a-z]{5,15}$/;  // 아이디와 패스워드가 적합한지 검사할 정규식
		var userId = $('#userId').val();
		console.log(userId);
		$.ajax({
			url : '/user/json/idCheckDupl/'+ userId,
			type : 'get',
			success : function(data) {
				console.log("false = 중복o / true = 중복x : "+ data);							
				
				if (data == 0) {
						// 0 : 아이디가 중복되는 문구
						$("#checkId").text("사용중인 아이디입니다.");
						$("#checkId").css("color", "red");
						$("#addUserBtn").attr("disabled", true);
				} else {
						
						if(re.test(userId)){
							// 1 : 아이디 길이 / 문자열 검사
							$("#checkId").text("");
							$("#addUserBtn").attr("disabled", false);
				
						} else if(userId == ""){
							
							$('#checkId').text('아이디를 입력해주세요 :)');
							$('#checkId').css('color', 'red');
							$("#addUserBtn").attr("disabled", true);				
							
						} else {
							
							$('#checkId').text("아이디는 소문자와 숫자 5~15자리만 가능합니다.");
							$('#checkId').css('color', 'red');
							$("#addUserBtn").attr("disabled", true);
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});//ajax 끝
		});//아이디 중복체크
		
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
						Swal.fire({
						  icon: 'error', //"info,success,warning,error" 중 택1
						 // title: 'Oops...',
						  text: '중복된 이메일입니다.'
						})
							$("#addUserBtn").attr("disabled", true);
					}else{
						$("#confirmNum1").text("");
						$("#addUserBtn").attr("disabled", false);
					} 
				}, error : function() {
						console.log("실패");
					}
				})//ajax 끝
			});//중복체크 끝
		
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
							$("#confirmNum2").text("등록된 전화번호입니다 :p");
							$("#confirmNum2").css("color", "red");
							$("#addUserBtn").attr("disabled", true);
					}else{
						$("#confirmNum2").text("");
						$("#addUserBtn").attr("disabled", false);
					} 
					}, error : function() {
							console.log("실패");
					}
			})//ajax 끝
		});//중복체크 끝
		
		
	
});			
		    

</script>
</head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/layout/header.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container" style=" margin-top: 50px; width: 600px;">
	
		<h1 class="bg-default text-center"style="margin-top: 10px; background-color:#fee50e">회 원 가 입</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form id="addUser">
			<div class="form-group row" style="text-align: center;">
			    <label for="userId" class="col-sm-3 col-form-label">아이디<em class="font-orange">*</em></label>
			    <div class="col-sm-9">
		      		<input type="text" class="form-control" id="userId" name="userId" placeholder="아이디는 소문자와 숫자 5~15자리만 가능합니다." >
		      		<input type="hidden" class="form-control" id="role" name="role" value="user" >
		      		<h6 id="checkId" style="margin-top:10px; color:red;"></h6>
		    	</div>
			</div>
			<div class="form-group row" style="text-align: center;">
				<label for="password" class="col-sm-3 col-form-label">비밀번호<em class="font-orange">*</em></label>
				<div class="col-sm-9">
					<input type="password" class="form-control" id="password" name="password" placeholder="5~15자의 영문 소문자와 숫자,특수문자를 포함해주세요.">
		    	</div>
			</div>
			<div class="form-group row" style="text-align: center;">
				<label for="password2" class="col-sm-3 col-form-label">비밀번호확인<em class="font-orange">*</em></label>
				<div class="col-sm-9">
					<input type="password" class="form-control" id="password2" placeholder="비밀번호 확인">
				</div>
			</div>
		  	<div class="form-group row" style="text-align: center;">
		    	<label for="userName" class="col-sm-3 col-form-label">이름<em class="font-orange">*</em></label>
		    	<div class="col-sm-9">
		      		<input type="text" class="form-control" id="userName" name="userName" placeholder="이름">
		    	</div>
		  	</div>
			<fieldset class="form-group">
				<div class="row" >
					<legend class="col-form-label col-sm-4 pt-0" style="padding-left: 57px;" >성별</legend>
					
						<div class="col-sm-4" style="text-align: center;" >
							<div class="form-check" style=" padding-left: 0px;">
		          				<input class="form-check-input" type="radio" id="male" name="gender" value="M" checked>
		          				<label class="form-check-label" for="Male">
		                           	남	
		          				</label>
	          				</div>
	        			</div>
		        			<div class="col-sm-4" style="text-align: center;" >
								<div class="form-check" style=" padding-left: 0px;">
									<input class="form-check-input" type="radio" id="female" name="gender" value="F">
									<label class="form-check-label" for="female">
										여	
			          				</label>
								</div>
		      				</div>
				</div>
		  	</fieldset>
			<div class="form-group row" style="text-align: center;">
    			<label for="birth" class="col-sm-3 col-form-label">생년월일</label>
    			<div class="col-sm-9">
      				<input type="date" class="form-control" id="birth" name="birth" placeholder="ex)20200101">
    			</div>
			</div>
<!-- 			<div class="form-group row" style="text-align: center;"> -->
<!-- 		    	<label for="userName" class="col-sm-3 col-form-label">주소</label> -->
<!-- 		    	<div class="col-sm-9"> -->
<!-- 		      		<input type="text" class="form-control" id="addr" name="addr" placeholder="주소"> -->
<!-- 		    	</div> -->
<!-- 		  	</div> -->
  			<div class="form-group row" style="text-align: center;">
    			<label for="email" class="col-sm-3 col-form-label">이메일<em class="font-orange">*</em></label>
    			<div class="col-sm-9">
	    			<c:choose> 
					    <c:when test="${not empty sessionScope.email }">   
					       <input type="text" class="form-control" id="email" name="email" value="${sessionScope.email}" readonly>
					    </c:when>
					    <c:otherwise>    
							<input type="text" class="form-control" id="email" name="email" placeholder="- 없이 입력해주세요.">
							<h6 id="confirmNum2" style="color: red; margin-top: 8px;"></h6>
					    </c:otherwise>                  
					</c:choose>
    			</div>
  			</div> 
			<div class="form-group row" style="text-align: center;">
    			<label for="phone" class="col-sm-3 col-form-label">휴대전화번호<em class="font-orange">*</em></label>
    			<div class="col-sm-9">
    				<c:choose> 
					    <c:when test="${not empty sessionScope.phone }">   
					       <input type="text" class="form-control" id="phone" name="phone" value="${sessionScope.phone}" readonly>
					    </c:when>
					    <c:otherwise>    
							<input type="text" class="form-control" id="phone" name="phone" placeholder="- 없이 입력해주세요.">
							<h6 id="confirmNum2" style="color: red; margin-top: 8px;"></h6>
					    </c:otherwise>                  
					</c:choose>
    			</div>
  			</div>
  			<div class="form-group row" style="text-align: center;">
    			<label for="likeGenre1" class="col-sm-3 col-form-label" style="text-align: center;">선호장르</label>
    			<div class="col-sm-3">
    				<select class="form-control" id="likeGenre1" name="likeGenre1">
    				<option selected>선호장르</option>
      					<option>드라마</option>
						<option>코미디</option>
						<option>액션</option>
						<option>멜로/로맨스</option>
						<option>스릴러</option>
						<option>미스터리</option>
						<option>공포(호러)</option>
						<option>어드벤쳐</option>
						<option>범죄</option>
						<option>가족</option>
						<option>판타지</option>
						<option>SF</option>
						<option>서부극(웨스턴)</option>
						<option>사극</option>
						<option>애니메이션</option>
						<option>다큐멘터리</option>
						<option>전쟁</option>
						<option>뮤지컬</option>
						<option>성인물(에로)</option>
						<option>공연</option>
						<option>기타</option>
    				</select>
    			</div>
    			<div class="col-sm-3">
					<select class="form-control" id="likeGenre2" name="likeGenre2">
					<option selected>선호장르</option>
						<option>드라마</option>
						<option>코미디</option>
						<option>액션</option>
						<option>멜로/로맨스</option>
						<option>스릴러</option>
						<option>미스터리</option>
						<option>공포(호러)</option>
						<option>어드벤쳐</option>
						<option>범죄</option>
						<option>가족</option>
						<option>판타지</option>
						<option>SF</option>
						<option>서부극(웨스턴)</option>
						<option>사극</option>
						<option>애니메이션</option>
						<option>다큐멘터리</option>
						<option>전쟁</option>
						<option>뮤지컬</option>
						<option>성인물(에로)</option>
						<option>공연</option>
						<option>기타</option>
					</select>
    			</div>
				<div class="col-sm-3">
					<select class="form-control" id="likeGenre3" name="likeGenre3">
					<option selected>선호장르</option>
						<option>드라마</option>
						<option>코미디</option>
						<option>액션</option>
						<option>멜로/로맨스</option>
						<option>스릴러</option>
						<option>미스터리</option>
						<option>공포(호러)</option>
						<option>어드벤쳐</option>
						<option>범죄</option>
						<option>가족</option>
						<option>판타지</option>
						<option>SF</option>
						<option>서부극(웨스턴)</option>
						<option>사극</option>
						<option>애니메이션</option>
						<option>다큐멘터리</option>
						<option>전쟁</option>
						<option>뮤지컬</option>
						<option>성인물(에로)</option>
						<option>공연</option>
						<option>기타</option>
					</select>
				</div>
  			</div>
  			<div class="form-group row" style="text-align: center;">
				<label for="likeTheater1" class="col-sm-3 col-form-label" style="text-align: center;">자주가는 극장</label>
    			<div class="col-sm-3">
					<select class="form-control" id="likeTheater1" name="likeTheater1">
							<option selected>극장선택</option>
						<c:forEach var="i" items="${getTheaterList}">
			   				<option value="${i.theaterName}">${i.theaterName}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-sm-3">
					<select class="form-control" id="likeTheater2" name="likeTheater2">
							<option selected>극장선택</option>
						<c:forEach var="i" items="${getTheaterList}">
			   				<option value="${i.theaterName}">${i.theaterName}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-sm-3">
					<select class="form-control" id="likeTheater3" name="likeTheater3">
							<option selected>극장선택</option>
						<c:forEach var="i" items="${getTheaterList}">
			   				<option value="${i.theaterName}">${i.theaterName}</option>
						</c:forEach>
					</select>
				</div>
  			</div>
  			<div style="text-align:center;">
					<button type="button" id="mapModal" class="button large purple" data-toggle="modal" data-target=".bd-example-modal-xl">지도로 선택</button>
			</div>
  			<div class="form-check" style="margin-top: 5px; margin-bottom: 5px;">
			    <input type="checkbox" class="form-check-input" id="agreeCheck">
			    <label class="form-check-label" for="agreeCheck">개인정보수집 및 이용 동의<em class="font-orange">*</em></label>
			</div>	
			<div class="form-group row">
				<div class="col-sm-12 text-center" style="margin-bottom: 20px;">
					<button type="button" id="addUserBtn" class="button large purple" >가&nbsp;입</button>
      				<a class="button large" href="#" role="button">취&nbsp;소</a>
    			</div>
			</div>
			
		</form>
		<!-- form end /////////////////////////////////////-->

	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
<!-- Header Start /////////////////////////////////////-->
<jsp:include page="/layout/footer.jsp" />
<!-- Header End /////////////////////////////////////-->		
			
	
	<div class="modal fade bd-example-modal-xl" id="outerMotdal" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
     		<div id="map" style="width:1138px;height:762px;"></div>
	<script>
	
	$(function(){
		$('.dropdown-toggle').dropdown('toggle')
		$('.dropdown-toggle').dropdown('hide')
	});
	$("#outerMotdal").on('shown.bs.modal', function (e) {
		activeMap();
	})
	
	

	  
	function activeMap(){

		
			//비트 캠프 위치
		    var coords = {
		        latitude: 37.499526740945925,
		        longitude: 127.02925836185794
		    };
		    success(coords)
	
		  
		// 현재 위치 불러오는게 성공했다면	
		function success(coords) {
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(coords.latitude, coords.longitude),
				level: 3,
				keyboardShortcuts : true
			};
	
			var map = new kakao.maps.Map(container, options); // 화면에 맵 추가
			
			var mapTypeControl = new kakao.maps.MapTypeControl();
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT); // 일반-스카이뷰 선택 추가
			
			var control = new kakao.maps.ZoomControl(); // 맵 축소 확대 추가
			map.addControl(control, kakao.maps.ControlPosition.RIGHT);
			
			// 현재 위치 마커 이미지
			var myPosition ="../resources/image/kakaoMapIcon/myPosition.png";
			
			var icon = new kakao.maps.MarkerImage(myPosition, new kakao.maps.Size(100, 100));
			
			// 현재 위치 마커
			var marker = new kakao.maps.Marker({ 
			    // 지도 중심좌표에 마커를 생성합니다 
			    position: map.getCenter(),
			    image: icon
			}); 
			// 지도에 마커를 표시합니다
			marker.setMap(map);
			
	
			
			var cgvLogo ="../resources/image/kakaoMapIcon/CGV.png";
			var lotteLogo ="../resources/image/kakaoMapIcon/lotte.png";
			var megaLogo ="../resources/image/kakaoMapIcon/MegaBox.png";
			
			//theater List ajax로 불러오고 Marker로 표시
			var theaterMarkerArray = new Array();
			var jqxhr = $.getJSON( "/ticketing/json/getTheaterList", function() {
				  console.log( "success" );
				})
				  .done(function(theaters) {
				     theaters.forEach(
				    	theater => {
				    		//로고 달기
				    		if(theater.franchise=='CGV'){
				    			var icon = new kakao.maps.MarkerImage(cgvLogo, new kakao.maps.Size(50, 50));
				    		}else if(theater.franchise=='롯데시네마'){
				    			var icon = new kakao.maps.MarkerImage(lotteLogo, new kakao.maps.Size(80, 80));
				    		}else if(theater.franchise=='메가박스'){
				    			var icon = new kakao.maps.MarkerImage(megaLogo, new kakao.maps.Size(50, 50));
				    		}
				    		//극장 마커 생성
				    		var theaterMarker = new kakao.maps.Marker({
				    		    map: map,
				    		    position: new kakao.maps.LatLng(theater.positionY, theater.positionX),
				    		 	image: icon
				    		});
				    		
				    		theaterMarkerArray.push(theaterMarker);
				    		//극장 마커 표시
				    		theaterMarker.setMap(map);
							
				    	    var infowindow = new kakao.maps.InfoWindow({
				    	        content: "<span id='infoWindow'>"+theater.theaterName+"</span>" // 인포윈도우에 표시할 내용
				    	    });
				    		
				    		//극장 마커에 인포윈도우 달기
				    		kakao.maps.event.addListener(theaterMarker, 'mouseover', function(){
				    			
				    			 infowindow.open(map, theaterMarker);
				    		});
				    		
				    		kakao.maps.event.addListener(theaterMarker, 'mouseout', function(){
				    			
				    			 infowindow.close();
				    		});			    		
				    		//극장 마커에 Click 이벤트 달기
				    		kakao.maps.event.addListener(theaterMarker, 'click', function() {
				    			$("#myModalTitle").html("<strong>"+theater.theaterName+"</strong>");
				    			
				    			var bodyHtml = "<p>주소  : "+theater.address+"</p>"
				    				bodyHtml+= "<p>도로명 주소 : "+theater.roadAddress+"</p>"
				    				bodyHtml+= "<p>전화번호 : "+theater.theaterPhone+"</p>"
				    				bodyHtml+= "<button type='button' id='myModalBodyButton' class='btn btn-link p-0'>상세정보</button>"
				    			$("#myModalBody").html(bodyHtml);
				    			$("#myModalBodyButton").on("click",function(){
				    				showPopup(theater.placeUrl);
				    			});	
				    			$('#myModal').modal('show')
				    			
				    			
				    		});//end of theaterMarker event click
				    	}//end of forEach inner Function		 
				     )//end of for Each
				  })// end of done
			
			
		  var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
		  var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
		  var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
		  var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
		  var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
			
				
			//현재 위치를 제외한 마커
			var markerArray = new Array();
			
			// 맵에 클릭 이벤트 추가
			// 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
			kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
				//map.relayout();
				markerArray.forEach(
					marker => {marker.setMap(null);}		
				)//end of forEach
				// 클릭한 위도, 경도 정보를 가져옵니다  
				var latlng = mouseEvent.latLng; 
	            
				//새 마커를 표시합니다
				var newMarker = new kakao.maps.Marker({ 
				    
				    position: latlng
				}); 
			    
				newMarker.setMap(map);
				
				markerArray.push(newMarker);
				// 마우스로 클릭한 위치입니다 
			    var clickPosition = mouseEvent.latLng;
			 	
			    // 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
			    if (!drawingFlag) {
	
			        // 상태를 true로, 선이 그리고있는 상태로 변경합니다
			        drawingFlag = true;
			        
			        // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
			        deleteClickLine();
			        
			        // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
			        deleteDistnce();
	
			        // 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
			        deleteCircleDot();
			    
			        // 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
			        clickLine = new kakao.maps.Polyline({
			            map: map, // 선을 표시할 지도입니다 
			            path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
			            strokeWeight: 3, // 선의 두께입니다 
			            strokeColor: '#db4040', // 선의 색깔입니다
			            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			            strokeStyle: 'solid' // 선의 스타일입니다
			        });
			        
			        // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
			        moveLine = new kakao.maps.Polyline({
			            strokeWeight: 3, // 선의 두께입니다 
			            strokeColor: '#db4040', // 선의 색깔입니다
			            strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			            strokeStyle: 'solid' // 선의 스타일입니다    
			        });
			    
			        // 클릭한 지점에 대한 정보를 지도에 표시합니다
			        displayCircleDot(clickPosition, 0);
	
			            
			    } else { // 선이 그려지고 있는 상태이면
	
			        // 그려지고 있는 선의 좌표 배열을 얻어옵니다
			        var path = clickLine.getPath();
	
			        // 좌표 배열에 클릭한 위치를 추가합니다
			        path.push(clickPosition);
			        
			        // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
			        clickLine.setPath(path);
	
			        var distance = Math.round(clickLine.getLength());
			        displayCircleDot(clickPosition, distance);
			    }
			});
			    
			// 지도에 마우스무브 이벤트를 등록합니다
			// 선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
			kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {
	
			    // 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
			    if (drawingFlag){
			        
			        // 마우스 커서의 현재 위치를 얻어옵니다 
			        var mousePosition = mouseEvent.latLng; 
	
			        // 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
			        var path = clickLine.getPath();
			        
			        // 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
			        var movepath = [path[path.length-1], mousePosition];
			        moveLine.setPath(movepath);    
			        moveLine.setMap(map);
			        
			        var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // 선의 총 거리를 계산합니다
			            content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">' + distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다
			        
			        // 거리정보를 지도에 표시합니다
			        showDistance(content, mousePosition);   
			    }             
			});                 
	
			// 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
			// 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
			kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {
	
			    // 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
			    if (drawingFlag) {
			        
			        // 마우스무브로 그려진 선은 지도에서 제거합니다
			        moveLine.setMap(null);
			        moveLine = null;  
			        
			        // 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
			        var path = clickLine.getPath();
			    
			        // 선을 구성하는 좌표의 개수가 2개 이상이면
			        if (path.length > 1) {
	
			            // 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
			            if (dots[dots.length-1].distance) {
			                dots[dots.length-1].distance.setMap(null);
			                dots[dots.length-1].distance = null;    
			            }
	
			            var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
			                content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
			                
			            // 그려진 선의 거리정보를 지도에 표시합니다
			            showDistance(content, path[path.length-1]);  
			             
			        } else {
						markerArray.forEach(
								marker => {marker.setMap(null);}		
							)//end of forEach
			            // 선을 구성하는 좌표의 개수가 1개 이하이면 
			            // 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
			            deleteClickLine();
			            deleteCircleDot(); 
			            deleteDistnce();
	
			        }
			        
			        // 상태를 false로, 그리지 않고 있는 상태로 변경합니다
			        drawingFlag = false;          
			    }  
			});    
	
			// 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
			function deleteClickLine() {
			    if (clickLine) {
			        clickLine.setMap(null);    
			        clickLine = null;        
			    }
			}
	
			// 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
			// 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
			function showDistance(content, position) {
			    
			    if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면
			        
			        // 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
			        distanceOverlay.setPosition(position);
			        distanceOverlay.setContent(content);
			        
			    } else { // 커스텀 오버레이가 생성되지 않은 상태이면
			        
			        // 커스텀 오버레이를 생성하고 지도에 표시합니다
			        distanceOverlay = new kakao.maps.CustomOverlay({
			            map: map, // 커스텀오버레이를 표시할 지도입니다
			            content: content,  // 커스텀오버레이에 표시할 내용입니다
			            position: position, // 커스텀오버레이를 표시할 위치입니다.
			            xAnchor: 0,
			            yAnchor: 0,
			            zIndex: 3  
			        });      
			    }
			}
	
			// 그려지고 있는 선의 총거리 정보와 
			// 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
			function deleteDistnce () {
			    if (distanceOverlay) {
			        distanceOverlay.setMap(null);
			        distanceOverlay = null;
			    }
			}
	
			// 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
			// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
			function displayCircleDot(position, distance) {
	
			    // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
			    var circleOverlay = new kakao.maps.CustomOverlay({
			        content: '<span class="dot"></span>',
			        position: position,
			        zIndex: 1
			    });
	
			    // 지도에 표시합니다
			    circleOverlay.setMap(map);
	
			    if (distance > 0) {
			        // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
			        var distanceOverlay = new kakao.maps.CustomOverlay({
			            content: '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>',
			            position: position,
			            yAnchor: 1,
			            zIndex: 2
			        });
	
			        // 지도에 표시합니다
			        distanceOverlay.setMap(map);
			    }
	
			    // 배열에 추가합니다
			    dots.push({circle:circleOverlay, distance: distanceOverlay});
			}
	
			// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
			function deleteCircleDot() {
			    var i;
	
			    for ( i = 0; i < dots.length; i++ ){
			        if (dots[i].circle) { 
			            dots[i].circle.setMap(null);
			        }
	
			        if (dots[i].distance) {
			            dots[i].distance.setMap(null);
			        }
			    }
	
			    dots = [];
			}
	
			// 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
			// 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
			// HTML Content를 만들어 리턴하는 함수입니다
			function getTimeHTML(distance) {
	
			    // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
			    var walkkTime = distance / 67 | 0;
			    var walkHour = '', walkMin = '';
	
			    // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
			    if (walkkTime > 60) {
			        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
			    }
			    walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'
	
			    // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
			    var content = '<ul class="dotOverlay distanceInfo">';
			    content += '    <li>';
			    content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
			    content += '    </li>';
			    content += '    <li>';
			    content += '        <span class="label">도보</span>' + walkHour + walkMin;
			    content += '    </li>';
			    content += '</ul>'
	
			    return content;
			}
			
				$("#addTheater").off("click");
				
				$("#addTheater").on("click",function(){
					var theaterName = $("#myModalTitle").text();
					if( $("#likeTheater1 option:selected").val() == "극장선택"){
						//alert("첫번째 선호극장이 선택되었습니다.")
						$("#likeTheater1 option:selected").removeAttr("selected");
						$("#likeTheater1 option").each(
							(index,item) => {
								console.log(index)
								if( $("#likeTheater1 option")[index].innerText==theaterName ){
									$($("#likeTheater1 option")[index]).attr("selected",true);
									
								}
							}//end of option		
						)//end of each
					}else if( $("#likeTheater2 option:selected").val() == "극장선택"){
							//alert("두번째 선호극장이 선택되었습니다.")
							$("#likeTheater2 option:selected").removeAttr("selected");
							$("#likeTheater2 option").each(
									(index,item) => {
									if( $("#likeTheater2 option")[index].innerText==theaterName ){
										$($("#likeTheater2 option")[index]).attr("selected",true);
										
									}
								}//end of option		
							)//end of each		
					}else if( $("#likeTheater3 option:selected").val() == "극장선택"){
							//alert("세번째 선호극장이 선택되었습니다.")
							$("#likeTheater3 option:selected").removeAttr("selected");
							$("#likeTheater3 option").each(
									(index,item) => {
									if( $("#likeTheater3 option")[index].innerText==theaterName ){
										$($("#likeTheater3 option")[index]).attr("selected",true);
										
									}
								}//end of option		
							)//end of each		
					}else{
						//alert("선호 극장이 모두 선택되었습니다.");
						$("#myModal").modal('hide')
						$("#outerMotdal").modal('hide')
						$('body').removeClass('modal-open');
						$('.modal-backdrop').remove();
					}
				});//end of #addtheater click
				
		};//end of success
		

	}//end of activeMap()
	
	function showPopup(url){
		
		window.open(url, "a", "width=400, height=300, left=100, top=50");
	}

	// 현재 위치 불러오는게 실패했다면
	function error(err) {
  		console.warn('ERROR(' + err.code + '): ' + err.message);
	};	  
	
	function otherModal(){
		$("button[data-dismiss=modal2]").click(function () {
		    $('#myModal').modal('hide');
		});
		
		$('#myModal').trigger("click");
	}
	
	/* 마커 클릭하면 정보 보이고, 버튼 누를시에 선호 극장으로 데이터 전송하기 */
	</script>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="myModalTitle"></h5>
	        <button type="button" class="close" data-dismiss="modal2" aria-label="Close" onClick='otherModal()'>
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body" id="myModalBody">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="button large" style="margin-right: 10px;" data-dismiss="modal2" onClick='otherModal()'>닫기</button>
	        <button type="button" class="button large purple" style="color: #333; " id="addTheater">선호극장 추가하기</button>
	      </div>
	    </div>
	  </div>
	</div>
    </div>
  </div>
</div>

<script>



</script>

</body>
</html>



