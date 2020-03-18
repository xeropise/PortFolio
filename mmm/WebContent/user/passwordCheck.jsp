<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>

<style>
.container.has-lnb #contents {
    float: right;
    width: calc(100% - 260px);
}
#contents {
    width: 100%;
    margin: 0;
    padding: 27px 0 0 0;
}
	
user agent stylesheet
div {
    display: block;
}
body {
    overflow: auto;
    letter-spacing: 0;
    line-height: 1.5;
    font-size: 16px;
    color: #444;
    font-weight: 400;
  	font-family:'Noto Sans KR', sans-serif;
}

h2.tit {
    padding: 0 0 26px 0;
    font-size: 1.8666em;
    font-weight: 400;
    letter-spacing: -1px;
    line-height: 1.1;
    color: #222;
    font-family:'Noto Sans KR', sans-serif;
}

h2 {
    display: block;
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}

.intro-pwd {
    margin: 0;
    padding: 25px 0;
    text-align: center;
    border-top: 1px solid #333;
    border-bottom: 1px solid #eaeaea;
}

.intro-pwd strong {
    display: block;
    padding: 0 0 20px 0;
    line-height: 1.1;
    font-size: 1.3333em;
    font-weight: 500;
}

.intro-pwd span {
    display: block;
    padding: 0 0 25px 0;
    line-height: 1.1;
}

.input-text.large {
    height: 46px;
    line-height: 44px;
}
.w380px {
    width: 380px!important;
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
    font-family: 'Noto Sans KR', sans-serif;
}
button, input {
    overflow: visible;
}
button, input, optgroup, select, textarea {
    margin: 0;
    font-size: 1em;
    line-height: 1.15;
}

.btn-group {
    padding: 20px 0 30px 0;
    margin: 0;
    text-align: center;
}

a.button:active, a.button:focus, a.button:hover, a.button:visited {
    color: #fee50e;
}
.btn-group .button {
    margin: 0 3px;
}
.button.large {
    height: 46px;
    padding: 0 30px;
    line-height: 44px;
}
a.button {
    text-decoration: none;
}
a:visited {
    color: #666;
    text-decoration: none;
    outline: 1px dotted #000;
}
a:link {
    color: #444;
    text-decoration: none;
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
a {
    background-color: transparent;
}

a.button.purple:active, a.button.purple:focus, a.button.purple:hover, a.button.purple:visited {
    color: #333;
}
.button.purple.large {
    line-height: 46px;
}
a.button:active, a.button:focus, a.button:hover, a.button:visited {
    color: #fee50e;
}
.btn-group .button {
    margin: 0 3px;
}
.button.purple {
    color: #fff;
    line-height: 36px;
    border: 0;
    background: #fee50e;
}
.button.large {
    height: 46px;
    padding: 0 30px;
    line-height: 44px;
}

#cancelBtn{
	color: #fff;
   	background-color: #6c757d;
   	border-color: #6c757d;
}

</style>

<script type="text/javascript">
$(function(){
	
	var check = false;
	
	$("#ckBtn").on("click",function(){
		if(!check){
			return;
		}
		$("#plusPage").load("/user/getUser");
	});
	
	$("#pwd").keydown(function(key) {
		if (key.keyCode == 13) {
			if(!check){
				return;
			}
			$("#plusPage").load("/user/getUser");
		}
	});
	
	$('#cancelBtn').on("click",function(){
		console.log('click');
		//history.go(-1);
		$("#plusPage").load("/mypage/mypageUser");
	});
	

	
	
	//비밀번호 체크 (1 = 중복 / 0 != 중복)
	
	$('#pwd').keyup(function() {
		var password = $("#pwd").val();
		
		$.ajax({
			url : '/user/json/pwChk',
			method : "post" ,
			datatype : "json" ,
			headers : {
				"Accept" : "application/json" ,
				"Content-Type" : "application/json"
			} ,
			data : JSON.stringify({
				password : password	
			}), 
			success : function(data) {
				if (data == 0) {
					// 0 : 비밀번호가 일치하지 않는경우
					$("#chkPw").text("비밀번호를 확인해주세요.");
					check =false;
				}else{
					$("#chkPw").text("");
					$("#chkPw").css("color", "red");
					check= true;
				} 
			}, error : function() {
					console.log("실패");
				}
		})//ajax 끝
	});//비밀번호 체크 
	
});
</script>



</head>

<body>


<div id="contents" style="margin-top: 30px;">
		<h2 class="tit"><strong>회원정보</strong></h2>

		<div class="intro-pwd">
			<strong>회원님의 개인정보 보호를 위해 비밀번호를 입력하셔야 합니다.</strong>
			<span>MovMovMov 로그인 시 사용하시는 비밀번호를 입력해 주세요.</span>

			<input type="password" title="비밀번호 입력" class="input-text large w380px" id="pwd" name="pwd" maxlength="20" autocomplete="new-password" />
			<h6 id="chkPw" style="color: red; padding-left:20px; red; margin-top: 8px;"></h6>
		</div>

		<div style="text-align: center; padding-top: 30px;">
			<a href="#" class="button large" id="cancelBtn" title="취소">취소</a>
			<a href="#" class="button large purple" id="ckBtn" title="확인">확인</a>
		</div>
	</div>
 

</body>
</html>