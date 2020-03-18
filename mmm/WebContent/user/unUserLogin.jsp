<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
    font-family:'Noto Sans KR', sans-serif;
}
</style>

<title>mmm</title>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

$(function(){
	$("#loginModal > div > div > div.modal-header > button").on("click",function(){
		self.location ="/";
	})	
	
	$("#loginModal").modal("show");
	
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
	
	$("#chkBtn").on("click",function(){
		console.log("click");
		validate();
	});
	
	
	
	function validate() {
	    var re =  /^[0-9]{4}$/;  // 아이디와 패스워드가 적합한지 검사할 정규식
		var re5 = /^(01[016789]{1})([0-9]{3,4})([0-9]{4})$/; //폰번호가 적합한지 검사할 정규식
	    
		
		var phone = $("#phone").val().replace(/-/gi,'');
		var pw= $("#password").val();

		if(phone == null || phone.length <1){
			$("#confirmNum1").text("휴대폰 번호는 반드시 입력하셔야 합니다.");
			//$("#chkBtn").attr("disabled", true);
			return;
		}else if(phone != "" && phone.length <11 ){ 
			$("#confirmNum1").text("휴대폰번호를 확인해주세요.");
			//$("#chkBtn").attr("disabled", true);
		    return;	
		}else if(re5.test(phone)){
				$("#confirmNum1").text("");
		}else{
			$("#confirmNum1").text("");
		}
		
		
		if(!check(re,pw,"패스워드는 4자리 숫자로만 입력해주세요.")) {
		    return;
		}
		
		$("form").attr("method" , "POST").attr("action" , "/user/unUserLogin").submit();
			
	}

	function check(re, what, message) {
    	if(re.test(what)) {
        return true;
    	}
    	alert(message);
	}	
	
	//로그인 정보가 올바른지 확인하는 함수
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
	
});



</script>
<body>

<!--  화면구성 div Start /////////////////////////////////////-->
<!-- 	<div class="container" style="width: 600px;"> -->
	
<!-- 		<h1 class="bg-default text-center" style="margin-top: 10px; background-color:#fee50e" >비 회 원 예 매 확 인 </h1> -->
		
<!-- 		<!-- form Start /////////////////////////////////////--> 
<!-- 		<form> -->
<!-- 		  	<div class="form-group row" style="font-size: 12pt; text-align: center; margin-top: 20px;"> -->
<!-- 				<label for="staticEmail" class="col-sm-3 col-form-label">휴대전화번호</label> -->
<!-- 				<div class="col-sm-9"> -->
<!-- 					<input type="text" class="form-control" placeholder="-없이 입력해주세요." id="phone" name="phone" aria-label="Recipient's username" -->
<!-- 						aria-describedby="basic-addon2"> -->
<!-- 				</div> -->
<!-- 				<h6 id="confirmNum1" style="color: red;"></h6> -->
<!-- 			</div> -->
<!-- 			<div class="form-group row"  style="text-align: center;"> -->
<!-- 				<label for="password" class="col-sm-3 col-form-label">비밀번호</label> -->
<!-- 				<div class="col-sm-9"> -->
<!-- 					<input type="password" class="form-control" id="password" name="password" placeholder="Password"> -->
<!-- 		    	</div> -->
<!-- 			</div> -->
<!-- 			<div class="form-group row"> -->
<!-- 				<div class="col-sm-12 text-center"> -->
<!-- 					<button type="button" id="chkBtn" class="btn btn-primary" >비회원 예매확인</button> -->
<!-- 			 	</div> -->
<!-- 			</div> -->
<!-- 		</form> -->
<!-- 		<!-- form end /////////////////////////////////////--> 

<!-- 	</div> -->
	<!--  화면구성 div end /////////////////////////////////////-->

<!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header" style="height: 48px; text-align: center;  background: #fee50e;">
				<h3 class="tit" id="exampleModalLabel" style="font-size: 1.2em;">비회원 예매 확인</h3>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">	    
		    	<!-- col-wrap -->
			    <form>
					<div class="col-wrap">
						<div class="col left">
							<div class="login-input-area">
							<p> 예매 시 입력하신 휴대폰번호와 비밀번호를 입력해주세요.<br></p>
								<input autocomplete="off" id="phone" name="phone" maxlength="20" type="text" placeholder="휴대폰 번호" title="휴대폰 번호를 입력하세요" class="input-text strTrim"><br>
								<input autocomplete="off" id="password" name="password" maxlength="20" type="password" placeholder="비밀번호" title="비밀번호를 입력하세요" class="input-text mt15" style="margin-top: 15px;">
								<button id="chkBtn" type="button" class="button purple large btn-login" style="border-radius: 4px; color:#333; height: 46px;  border: 0; width: 100%; 
									cursor: default; background-color:#fee50e; margin-top: 10px;">로그인<!--로그인--></button>
					
								<div class="link" style="padding-top: 20px; padding-bottom: 30px; text-align: center;">
									<a href="/user/userAuthorization?type=findPw" title="PW 찾기 선택" style=" margin-left:10px; position: relative; color: #333;">PW 찾기<!--ID/PW 찾기--></a>
									<a href="/user/addUnUserView" title="비회원 예매"style=" margin-left:10px; position: relative; color: #333;">비회원 예매<!--비회원 예매--></a>
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