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

<!-- 	SweetAlert2 CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>


<style type="text/css">
.container.has-lnb #contents {
    float: right;
    width: calc(100% - 260px);
}
#contents.location-fixed {
    padding-top: 60px;
}
#contents {
    width: 100%;
    margin: 0;
    padding: 40px 0 0 0;
}
.location-fixed {
    padding-top: 42px;
}
* {
    box-sizing: border-box;
}
user agent stylesheet
div {
    display: block;
}
body {
    overflow: auto;
    overflow-y: scroll;
    letter-spacing: 0;
    line-height: 1.5;
    font-size: 15px;
    color: #444;
    font-weight: 400;
}

h2.tit {
    padding: 0 0 26px 0;
    font-size: 1.8666em;
    font-weight: 400;
    letter-spacing: -1px;
    line-height: 1.1;
    color: #222;
}


.mb10 {
    margin-bottom: 10px!important;
}
ol, ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}
* {
    box-sizing: border-box;
}

ul {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

.dot-list>li {
    position: relative;
    padding: 0 0 0 8px;
}

li {
    display: list-item;
    text-align: -webkit-match-parent;
}

.dot-list>li:before {
    content: '';
    display: block;
    position: absolute;
    top: 9px;
    left: 0;
    background-color: #503396;
    width: 3px;
    height: 3px;
}

.mb20 {
    margin-bottom: 20px!important;
}

.table-wrap {
    position: relative;
    border-top: 1px solid #555;
}

table {
    width: 100%;
    margin: 0;
    border: 0;
    table-layout: fixed;
    border-collapse: collapse;
    empty-cells: show;
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

label {
    display: inline-block;
    vertical-align: middle;
    cursor: pointer;
}

.board-form tbody td, .board-form tbody th {
    position: relative;
    height: 50px;
    padding: 7px 15px;
    text-align: left;
    border-bottom: 1px solid #d1d5dd;
}

.w150px {
    width: 150px!important;
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
    font-family:'Noto Sans KR', sans-serif;
}
button, input {
    overflow: visible;
}
button, input, optgroup, select, textarea {
    margin: 0;
    font-size: 1em;
    line-height: 1.15;
}

caption {
    display: table-caption;
    text-align: -webkit-center;
}

colgroup {
    display: table-column-group;
}

.dot-list>li:before {
    content: '';
    display: block;
    position: absolute;
    top: 9px;
    left: 0;
    background-color: #503396;
    width: 3px;
    height: 3px;
}

.pt40 {
    padding-top: 40px!important;
}
.btn-group {
    padding: 20px 0 30px 0;
    margin: 0;
    text-align: center;
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
.btn-group .button {
    margin: 0 3px;
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

/* 취소 버튼 */
#cancelBtn {
		color: #fff;
   		background-color: #6c757d;
   		border-color: #6c757d;
}



</style>


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

	var status = getParam("status");
	
	if(status=="failed"){
		alert("비밀번호를 확인해주세요.");
	}
	
	$("#updateBtn").on("click",function(){
		result= validate();
		if(!result){
			alert("리턴")
			return;
		}else{
			Swal.fire({
		           icon: 'success', //"info,success,warning,error" 중 택1
		          title: '변경 완료',
		      }).then((result) => {   
		    	  $("form").attr("method","post").attr("action","/user/updatePw").submit();
		      });
		
		}
	})
	
		$('#cancelBtn').on("click",function(){
		console.log('click');
		history.go(-1);
	});
	
	
	
	
	function validate() {
					
		//숫자, 특문 각 1회 이상, 영문,숫자 사용하여 5자리 이상 15자입력
		var re3 = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{1,50}).{5,15}$/; 

		var pw= $("#pwnew").val();
		var checkPw= $("#repwnew").val();

		
		if(!check(re3,pw,"비밀번호는 5~15자의 영문 소문자와 숫자,특수문자를 포함하여 입력해주세요.")) {
			$("#pwnew").focus();
			alert("바꿀비번이 유효하지않음");
		    return false;
		}
		
		if(pw != checkPw) {
		    alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
		    $("#repwnew").val("");
		    $("#repwnew").focus();
		    return false;
		}
		return true;
	}
	
	function check(re, what, message) {
    	if(re.test(what)) {
        return true;
    	}
    	alert(message);
	}
	
	//비밀번호 체크 (1 = 중복 / 0 != 중복)
	$('#password').keyup(function() {
		var password = $("#password").val();
		
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
					$("#updateBtn").attr("disabled", true);
				}else{
					$("#chkPw").text("새로운 비밀번호를 입력해주세요.");
					$("#chkPw").css("color", "red");
					$("#updateBtn").attr("disabled", false);
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
	
	<div id="container" style="margin-top: 10px;" >
		<form id="pwchange" method="post">
		
			<div id="contents">
				<h2 class="tit">
				<strong>비밀번호 변경</strong>
				</h2>
			
				<ul class="dot-list mb10">
					<li>현재 비밀번호를 입력한 후 새로 사용할 비밀번호를 입력하세요.</li>
				</ul>
			
				<div class="table-wrap mb20">
					<table class="board-form">
						<caption>현재 비밀번호, 새 비밀번호, 새 비밀번호 확인 항목을 가진 표</caption>
						<colgroup>
							<col style="width:180px;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="pwnow">현재 비밀번호</label></th>
								<td>
									<input type="password" id="password" class="input-text w150px" />
									<h6 id="chkPw" style="color: red;"></h6>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="pwnew">새 비밀번호</label></th>
								<td>
									<input type="password" id="pwnew" name="password" class="input-text w150px" />
									<input type="hidden" name="userNo" value="${user.userNo }" />
									<div class="ml10 font-size-14" style="font-size:12px;">※ 비밀번호는 5~15자의 영문 소문자와 숫자,특수문자를 포함하여 입력해주세요.</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="repwnew">새 비밀번호 재입력</label></th>
								<td>
									<input type="password" id="repwnew" class="input-text w150px" />
									<div class="ml10 font-size-14" style="font-size:12px;">※ 비밀번호 확인을 위해 한 번 더 입력해 주시기 바랍니다.</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			
				<ul class="dot-list">
					<li>생년월일, 전화번호 등 개인 정보와 관련된 숫자, 연속된 숫자와 같이 쉬운 비밀번호는 다른 사람이 쉽게 알아낼 수 있으니 사용을 자제해 주세요.</li>
					<li>비밀번호는 3-6개월마다 꼭 바꿔 주세요.</li>
					<li>비밀번호 변경시 모바일 기기와 홈페이지에서 모두 로그아웃됩니다. 변경한 비밀번호로 다시 로그인해주세요.</li>
				</ul>
			
				<div class="pt40" style="text-align: center; margin-bottom:20px;">
					<button class="button large" type="button" id="cancelBtn">취소</button>
					<button class="button purple large" type="button" id="updateBtn">수정</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>