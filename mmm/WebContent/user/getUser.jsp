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

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>

body {
    overflow: auto;
    overflow-y: scroll;
    letter-spacing: 0;
    line-height: 1.5;
    font-size: 15px;
    color: #444;
    font-weight: 400;
    font-family:'Noto Sans KR', sans-serif;
}

.container.has-lnb #contents {
    float: right;
    width: calc(100% - 260px);
}
#contents.location-fixed {
    padding-top: 82px;
}

#contents {
    width: 100%;
	margin-top: 30px;
    padding: 10px 0 0 0;
}


h2.tit {
    padding: 0 0 26px 0;
    font-weight: 400;
    letter-spacing: -1px;
    line-height: 1.1;
    color: #222;
}

.mb10 {
    margin-bottom: 10px!important;
}


.dot-list>li {
    position: relative;
    padding: 0 0 0 8px;
}

table {
    width: 100%;
    margin: 0;
    border: 0;
    table-layout: fixed;
    border-collapse: collapse;
    empty-cells: show;
}

.table-wrap {
    position: relative;
    border-top: 1px solid #555;
}

table caption {
    overflow: hidden;
    width: 0;
    height: 0;
    font-size: 0;
    line-height: 0;
    opacity: 0;
}

tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}

tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}

.board-form tbody th {
    background: #f7f8f9;
}

.board-form tbody td, .board-form tbody th {
    position: relative;
    height: 50px;
    padding: 7px 15px;
    text-align: left;
    border-bottom: 1px solid #d1d5dd;
}


.profile-photo {
    overflow: hidden;
}

.profile-photo .profile-img {
    overflow: hidden;
    float: left;
    width: 68px;
    height: 68px;
    margin: 0;
    padding: 0;
    font-size: 0;
    line-height: 0;
    border-radius: 68px;
    background-size: 100%;
    background-position: center;
}

.profile-photo .profile-img img {
    width: 100%;
    height: 100%;
}

img {
    border: 0;
}

.button.gray-line.small {
    line-height: 32px;
}

.button.gray-line {
    color: #444;
    line-height: 36px;
    border: 1px solid #c1c1c1;
    background-color: #fff;
}

.button.small {
    height: 32px;
    padding: 0 12px;
    line-height: 30px;
    font-size: .9333em;
}

button, select {
    text-transform: none;
}


.profile-photo .button.member-out {
    float: right;
    margin-left: 0;
}	


.profile-photo .button {
    float: left;
    margin: 17px 0 0 10px;
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
    font-family: 'Noto Sans KR', sans-serif;
    text-decoration: none;
    border: 1px solid #fee50e;
    vertical-align: middle;
    background-color: #fff;
    cursor: pointer;
}	

.mt40 {
    margin-top: 40px!important;
}

input[type="file" i] {
    -webkit-appearance: initial;
    background-color: initial;
    cursor: default;
    align-items: baseline;
    color: inherit;
    text-align: start !important;
    padding: initial;
    border: initial;
}
.tit-util .tit {
    float: left;
    padding: 0!important;
    line-height: 1.1;
}

h3.tit {
    margin: 0;
    padding: 0 0 16px 0;
    font-size: 1.6em;
    font-weight: 400;
    color: #333;
    line-height: 1.1;
}

h3 {
    display: block;
    font-size: 1.17em;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

.tit-util .right {
    float: right;
}
.tit-util:after {
    clear: both;
}

.tit-util:after, .tit-util:before {
    content: '';
    display: block;
}
p.reset {
    padding: 0;
    margin: 0;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
.font-orange {
    color: #e63e30!important;
}

colgroup {
    display: table-column-group;
}

col {
    display: table-column;
}


.modal-layer {
    overflow-y: scroll;
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 501;
    background-color: rgba(0,0,0,0);
}

.modal-layer .focus {
    display: block;
    position: absolute;
    left: -9999px;
    top: -9999px;
    z-index: 502;
}

.modal-layer .wrap {
    position: absolute;
    left: 50%;
    top: 50%;
    width: 300px;
    min-height: 250px;
    margin: 0;
    padding: 45px 0 0 0;
    box-shadow: 2px 2px 6px 2px rgba(0,0,0,.1);
    background: #fff;
}

.modal-layer .wrap .layer-header {
    overflow: hidden;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 45px;
    background: #fee50e;
}	

.modal-layer .wrap .layer-header h3.tit {
    color: #fff;
    padding: 15px 20px 0 20px!important;
    font-size: 1.2em;
    line-height: 1.1;
}	

.modal-layer .wrap .layer-con {
    overflow-y: auto;
    background-color: #fff;
    padding: 20px 20px 0 20px;
}

.box-gray.v1 {
    border-radius: 5px;
}


.clearfix:after {
    clear: both;
}
.lh32 {
    line-height: 32px;
}

.w170px {
    width: 170px!important;
}
.float-l {
    float: left!important;
}

.change-phone-num-area {
    padding: 10px 0 0 0;
}

.change-phone-num-area .position {
    overflow: hidden;
    position: relative;
    margin-top: 10px;
    padding: 0;
}

.change-phone-num-area .position .label {
    width: 110px;
    line-height: 32px;
}

.change-phone-num-area .position>* {
    float: left;
}

.w160px {
    width: 160px!important;
}

.change-phone-num-area .position .button {
    margin-left: 6px;
}

.chk-num {
    display: inline-block;
    position: relative;
    padding: 0;
    vertical-align: middle;
}

.chk-num.small .line {
    height: 32px;
}
.chk-num .line {
    position: relative;
    height: 36px;
    border: 1px solid #d8d9db;
    background-color: #fff;
}

.w180px {
    width: 180px!important;
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

.btn-group .button {
    margin: 0 3px;
}
.button.large {
    height: 46px;
    padding: 0 30px;
    line-height: 44px;
}

.button.purple.large {
    line-height: 46px;
}

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

.btn-group:after {
    clear: both;
}

.btn-group:after, .btn-group:before {
    content: '';
    display: table;
}

.btn-group, .btn-group-vertical {
    position: relative;
    display: -ms-inline-flexbox;
    display: inline-flex;
    vertical-align: middle;
}

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

label{
	font-weight: normal;
}

#cancelBtn {
	color: #fff;
	background-color: #6c757d;
  	border-color: #6c757d;	
}

/*회원 탈퇴 버튼 */
#contents > div.table-wrap > table > tbody > tr:nth-child(1) > td > div > button.button.small.member-out {
	color: #fff;
	background-color: #6c757d;
  	border-color: #6c757d;	
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

$(function(){
	
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
		alert("로그인 정보가 올바르지 않습니다.");
	}
	
	
	
	function validate() {
	    
	    var re2 = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/g // 이메일이 적합한지 검사할 정규식
	   
	    var email = $("#email").val(); 
			
		if(email=="") {
		    alert("이메일을 입력해 주세요");
		    $("#email").focus();
		    return false;
		    
		}
		
		if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
			$("#email").focus();
		    return false; 
		}
		
		return true;
	} //validate()

	function check(re, what, message) {
    	if(re.test(what)) {
    		return true;
    	}
    	alert(message);
	}	
	

	//프로필업로드
	$("#updateImgBtn").on("click",function(){
		$("#fileForm").attr("action","/user/addProfile").attr("method","post").attr("enctype","multipart/form-data").submit();
	});
	
	
	//휴대폰번호 변경
	$("#phoneChgBtn").on("click",function(){
		$("#newPhone").show();
	});
	
	//인증번호 전송 
	$("#sendNumberBtn").on("click",function(){
		var phone = $("#chPhone").val();
		var re5 = /^(01[016789]{1})([0-9]{3,4})([0-9]{4})$/; //폰번호가 적합한지 검사할 정규식
		console.log(phone)
		
		if(phone == null || phone.length <1){
			$("#confirmNum1").text("휴대폰 번호는 반드시 입력하셔야 합니다.");
			return;
		}else if(phone != "" && phone.length <11 ){
			$("#confirmNum1").text("휴대폰번호를 확인해주세요.");
		    return;	
		}else if(re5.test(phone)){ //휴대폰 유효성 통과면 
				$("#confirmNum1").text("");
				$("#inputPhone").show();
				
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
						console.log(status);
						if(JSONData == 0){
							//0: 인증번호가 틀림
							$('confirmNum2'),text('인증번호를 확인해주세요.');
							$("#confirmNum2").css("color", "red");
						}else{
							$("#confirmNum2").text("인증이 완료되었습니다.");
													
						}
					}, error : function() {
						console.log("실패");
					}
				})//ajax	
		}else{
			$("#confirmNum1").text("");
		}
	});//휴대폰인증 
	
	//변경완료 버튼  변경된번호 ajax
	$("#chgBtn").on("click",function(){
		var phone = $("#chPhone").val();
		$.ajax({ 
			url : "/user/json/updateUser/" + phone ,
			method : "get" ,
			datatype : "json" ,
			headers : {
				"Accept" : "application/json" ,
				"Content-Type" : "application/json"
			} ,
			success : function( JSONData , status ) {
				console.log("/user/json/updateUser/ 동작! 변경된 휴대폰번호 : "+phone);
				console.log(status);
				console.log(JSONData);
				$("#phoneNumber").html(phone);
				$("#newPhone").hide();
				$("#inputPhone").hide();
				$("#chPhone").val("");
				$("#chkNum").val("");
			}, error : function() {
				console.log("실패");
			}
		})//ajax
		//$("#plusPage").load("/user/getUser");
	});
		

	//비밀번호 입력창
	$("#chgPwBtn").on("click",function(){
		//$("#pwModal").modal("show");
// 		self.location= "/user/updatePw";
		$("#plusPage").load("/user/updatePw");

	});

	//회원정보 수정
	$("#updateBtn").on("click",function(){
		if(!validate()){ //이메일 유효성 오류 : false, 정상 : true
			return;
		}
		var email = $("#email").val();
		//var userNo = $("#userNo").val();
		
		$.ajax({
			url : '/user/json/updateUser',
			method : "post" ,
			datatype : "json" ,
			headers : {
				"Accept" : "application/json" ,
				"Content-Type" : "application/json"
			} ,
			data : JSON.stringify({
				email : email ,
				userNo: ${user.userNo}
			}), 
			success : function(data) {
				console.log( data);
				alert("회원정보가 수정되었습니다.");
				$("#plusPage").load("/mypage/mypage?condition=99");
			}, error : function() {
					console.log("실패");
				}
			})//ajax 끝
		})//회원정보 수정 끝
		
		//취소버튼
		$("#cancelBtn").on("click",function(){
			$("#plusPage").load("/mypage/mypageUser");
		});
	
	
	
	// 파일 선택 후 액션
    $('#profileTarget').on('change', function(e) {
    	
 		//프로필 사진 유효성 체크
 		var fileNm = $("#profileTarget").val();
 		if (fileNm != "") {
 		    var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1).toLowerCase();
 		    if (!(ext == "gif" || ext == "jpg" || ext == "png")) {
 		        alert("이미지파일 (.jpg, .png, .gif ) 만 업로드 가능합니다.");
 		        $("#profileTarget").val("");
 		        return false;
 		    }
 		}
    	
    	var fileSize = this.files[0].size;
		var maxSize = 360 * 360;
 		if(fileSize > maxSize) {
			alert("파일용량을 초과하였습니다.");
			return;
		}else{
			readImg(this);
		}
 		
	})

	function readImg(input){
    	
		var width = 360;
		var height = 360;
	
		if(input.files && input.files[0]){
			var render = new FileReader();
			
			render.onload = function(e){
				var image = $('#preview').attr('src',e.target.result).attr('width','300px').attr('height','300px').css('overflow' , 'hidden');
				console.log(e.target.result);
				 $("#preview").html("<img src="+e.target.result+" style='border-color: #E6E6E6; border: 10px; overflow : hidden'>");
			}	
			 render.readAsDataURL(input.files[0]);
		}
	}

	
	// 첨부파일 추가
	$('#addProfileImgBtn').on('click', function() {
	    $('#profileTarget').click();
	});
	
	


	
	
	
	
	//모달창에서 엔터키 안눌리게
	$(document).keypress(function(e) { 
		if (e.keyCode == 13) e.preventDefault(); });
	
	//회원탈퇴
	$("#byeconfirmBtn").on("click",function(){
		var password= $("#password").val();
		$("#passwordChk").text("");
		$.ajax({
			url : '/user/json/updateUserStatus',
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
				console.log("false = pw 일치 X / true = pw 일치 : "+ data);							
				
				if (data == 0) {
						// 0 : 비밀번호가 다름
						$("#passwordChk").text("비밀번호를 확인해주세요.");
						$("#passwordChk").css("color", "red");
						//$("#byeconfirmBtn").attr("disabled", true);
					
				}else{
					$("#passwordChk").text("");
					alert("정말 탈퇴 하실건가요?")
					self.location="/user/logout";
				} 
			}, error : function() {
					console.log("실패");
				}
			})//ajax 끝
	})//회원탈퇴 끝
	
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
						alert("등록된 이메일입니다 :p");
						//$("#confirmNum1").text("등록된 이메일입니다 :p");
						//$("#confirmNum1").css("color", "red");
						$("#updateBtn").attr("disabled", true);
				}else{
					$("#confirmNum1").text("");
					$("#updateBtn").attr("disabled", false);
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


<!--container-->
<div class="container" style="margin-top: 40px;">
	<div id="contents">
		<h2 class="tit">
		<strong>개인정보 수정</strong>
		</h2>

		<ul class="dot-list mb10">
			<li>회원님의 정보를 정확히 입력해주세요.</li>
		</ul>

		<div class="table-wrap">
			<table class="board-form">
				<caption>프로필사진, 아이디 항목을 가진 표</caption>
				<colgroup>
					<col style="width:180px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">프로필 사진</th>
							<td>
							<div class="profile-photo">
								<form name="fileForm" id="fileForm">
									<input type="file"  class="profileTarget" id="profileTarget" name="image" accept="image/gif,image/jpeg,image/png" style="display: none;">
									<input type="hidden" name="userNo" id="userNo" value="${user.userNo}">
									
									<div class="profile-img" id="preview">
										<c:if test="${empty user.profile.trim()}">	
											<img src="https://www.megabox.co.kr//static/pc/images/mypage/bg-profile.png" alt="프로필 사진 샘플" />
										</c:if>
										<c:if test="${! empty user.profile.trim()}">
											<img alt="" src="/resources/image/${user.profile}">
											<input type="hidden" name="profile" value="${user.profile}">
										</c:if>
									</div>
								</form>
								
								<button type="button" class="button small gray-line" id="addProfileImgBtn">이미지 선택</button>
								<button type="button" class="button small gray-line " id="updateImgBtn">등록</button>
								
								<!-- Button trigger modal -->
								<button type="button" class="button small member-out" data-toggle="modal" data-target="#staticBackdrop" title="회원탈퇴">회원탈퇴</button>
								
							<!-- Modal -->
							 <form>
								<div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								       <div class="modal-header" style="height: 48px; text-align: center;  background: #fee50e;">
								        <h5 class="modal-title" id="staticBackdropLabel">회원 탈퇴</h5>
								        <button type="button" class="close" data-dismiss="modal" id="btn" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								      <div class="modal-body">
										<div class="col-wrap">
											<div class="col left">
												<div class="login-input-area">
													<p> ${user.userName}님 탈퇴를 하시겠습니까?<br>
														탈퇴를 원하시면 비밀번호를 입력해주세요.</p>
													<input autocomplete="off" id="password" name="password" maxlength="20" type="password" placeholder="비밀번호" title="비밀번호를 입력하세요" class="input-text mt15" style=" width:250px; margin-top: 15px;">
													<h6 id="passwordChk" style="color: red;"></h6>
												</div>
											</div>
										</div>
								      <div class="modal-footer">
								        <button type="button" class="button large" data-dismiss="modal">취소</button>
								        <button type="button" class="button large purple" style=" background-color:#fee50e; color: #333 "id="byeconfirmBtn">탈퇴</button>
								      </div>
								    </div>
								  </div>
								</div>
							</div>
							</form><!-- Madal --> 
						</div>
						</td>
					</tr>
					<tr>
						<th scope="row">아이디</th>
							<td>${user.userId}</td>	
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="tit-util mt40 mb10">
			<h3 class="tit">기본정보</h3>

			<div class="right">
				<p class="reset"><em class="font-orange">*</em> 필수</p>
			</div>
		</div>

		<form name="mbInfoForm" id="InfoForm">
			<input type="hidden" name="userNo" value="${user.userNo}" />
			<input type="hidden" name="phone" value="${user.phone}" />
			
			<div class="table-wrap mb40">
				<table class="board-form">
					<caption>이름, 생년월일, 휴대폰, 이메일, 비밀번호, 주소 항목을 가진 기본정보 표</caption>
					<colgroup>
						<col style="width:180px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">
								이름 <em class="font-orange">*</em>
							</th>
								<td>
									<span class="mbNmClass">${user.userName}</span>
								</td>
						</tr>
						<tr>
							<th scope="row">
						    	생년월일 <em class="font-orange">*</em>
						    </th>
						    <td>
						      ${user.birth}  
						    </td>
						</tr>
						<tr>
							<th scope="row">
							    <label for="num" id="phoneCol">휴대폰</label> <em class="font-orange">*</em>
							</th>
								<td>
									<div class="clearfix">
										<p class="reset float-l w170px lh32 changeVal" id="phoneNumber">
										    ${user.phone}
										</p>
									    <div class="float-l">
									        <button type="button" class="button small gray-line change-phone-num" id="phoneChgBtn" title="휴대폰번호 변경">휴대폰번호 변경</button>
									    </div>
									</div>
									
									<div class="change-phone-num-area">
                                      <div class="position" id="newPhone" style="display: none;">
                                          <label for="chPhone" class="label">변경할 휴대폰</label>
                                          <input type="text" id="chPhone" class="input-text w160px numType" placeholder="'-'없이 입력해 주세요" title="변경할 휴대폰 번호 입력" maxlength="11" />
                                          <button type="button" class="button small gray-line" id="sendNumberBtn">인증번호 전송</button>
                                          <h6 id="confirmNum1" style="color: red;"></h6>
                                      </div>

                                      <div class="position"  id="inputPhone" style="display: none;">
                                          <label for="chkNum" class="label">인증번호 입력</label>

                                          <div class="chk-num small">
                                              <div class="line">
                                                  <input type="text" id="chkNum" class="input-text w180px" title="인증번호 입력" placeholder="인증번호를 입력해 주세요" maxlength="6">
                                                  <h6 id="confirmNum1" style="color: red;"></h6>
                                              </div>
                                          </div>
                                          <button type="button" class="button small gray-line" id="chgBtn">변경완료</button>
                                      </div>
                                  </div>
								</td>
							</tr>
							<tr>
							    <th scope="row">
							        <label for="email">이메일</label> <em class="font-orange">*</em>
							    </th>
							    <td>
							        <input type="text" id="email" name="email" style="font-weight: normal;" class="input-text w500px" value="${user.email}" />
							    </td>
							</tr>
							<tr>
							    <th scope="row">비밀번호 <em class="font-orange">*</em></th>
							    <td>
							        <button type="button" class="button small gray-line" id="chgPwBtn" title="비밀번호 변경">비밀번호 변경</button>
							        <fmt:formatDate var="updatePwDate" value="${user.updatePwDate}" pattern="yyyy-MM-dd HH:mm"/>
							        	마지막 비밀번호 변경:(${updatePwDate})
							    </td>
							</tr>	
							
<!-- 							<tr> -->
<!-- 							    <th scope="row">주소</th> -->
<!-- 							    <td> -->
<!-- 							        <span></span> -->
<!-- 							        <a href="#" id="addrBtn" class="button small gray-line ml10" title="우편번호 검색">우편번호 검색</a> -->
<!-- 							        <p class="reset mt10"> </p> -->
<!-- 							    </td> -->
<!-- 							</tr> -->
                      </tbody>
                  </table>
              </div>
			</form>
			
		
          <div class="mt40" style="text-align: center; margin-bottom:20px;">
			
	              <button class="button large"  id="cancelBtn">취소</button>
	              <button class="button purple large" id="updateBtn" style="font: #333;">등록</button>
			
          </div>
          
		</div>
<!-- contents -->
	
</div>
<!-- container end-->


</body>
</html>