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

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>

body {
    font-weight: 400;
    font-family:'Noto Sans KR', sans-serif;
}

.button.purple {
    color: #333;
    line-height: 36px;
    border: 0;
    background: #fee50e;
}
.button.large {
    height: 46px;
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
    font-weight: bold;
}

 
h3.tit {
    color: #333;
    font-size: 1.2em;
    line-height: 1.1;
} 

#confirmNum2 {
	font-size : 14px;
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
	$("#btn1 > span").on("click",function(){
		self.location ="/";
	})
	
	$("#loginModal").modal("show");
	$('#unUserModal').modal ({ keyboard: false, backdrop: 'static' });
	
	$("#unUserModal").modal("show");
	
	//모달창 엑스
	$("#btn").on("click",function(){
		history.go(-1);
	})
	

	
	$('#addUserBtn').on("click",function(){
		console.log('click');
		validate();
	});
		
	
	function validate() {
	    var re =  /^[0-9]{4}$/;  // 패스워드가 적합한지 검사할 정규식
		var re5 = /^(01[016789]{1})([0-9]{3,4})([0-9]{4})$/; //폰번호가 적합한지 검사할 정규식
	    
		var pw= $("#password").val(); 
		var checkPw= $("#password2").val();
		var birth = $("#birth").val(); 
		var phone = $("#phone").val().replace(/-/gi,''); 
		var isChk = $("#agreeCheck").is(":checked");
		console.log("쳬크빢쓰 : "+isChk)
		
		
		if(birth=="") {
		    alert("생년월일을 입력해 주세요");
		    console.log(birth);
		    $("#birth").focus();
		    return false;
		}
		
		if(phone == null || phone.length <1){
			$("#confirmNum1").text("휴대폰 번호는 반드시 입력하셔야 합니다.");
			$("#addUserBtn").attr("disabled", true);
			return;
		}else if(phone != "" && phone.length <11 ){ 
			$("#confirmNum1").text("휴대폰번호를 확인해주세요.");
			$("#addUserBtn").attr("disabled", true);
		    return;	
		}else if(re5.test(phone)){
				$("#confirmNum1").text("");
				$("#smsBtn").attr("disabled", true);
		}else{
			$("#confirmNum1").text("");
		}
		
		
		if(!check(re,pw,"패스워드는 4자리 숫자로만 입력해주세요.")) {
		    return;
		}
		
		if(pw != checkPw) {
		    alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
		    $("#password2").val("");
		    $("#password2").focus();
		    return;
		}
		
		
		if(!isChk){
			alert("개인정보 수집동의 체크해주세요.")
			return;
		}

		alert("가입을 축하합니다.!!!!");
		$("form").attr("method" , "POST").attr("action" , "/user/addUnUser").submit();
			
	}

	function check(re, what, message) {
    	if(re.test(what)) {
        return true;
    	}
    	alert(message);
	}	


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
						$("#confirmNum1").text("등록된 아이디가 있습니다. 로그인 해주세요 :p ");
						$("#confirmNum1").css("color", "red");
						$("#confirmNum1").css("color", "red");
						$("#smsBtn").attr("disabled", true);
						$("#addUserBtn").attr("disabled", true);
				}else{
					$("#confirmNum1").text("");
					$("#smsBtn").attr("disabled", false);
					//$("#addUserBtn").attr("disabled", false);
				} 
				}, error : function() {
						console.log("실패");
				}
		})//ajax 끝
	});//중복체크 끝  
	

	///////////////////////휴대폰번호 인증///////////////////////////////////
	$("#smsBtn").on("click", function(){
		console.log("클릭!")
		var phone = $("#phone").val();
		var re5 = /^(01[016789]{1})([0-9]{3,4})([0-9]{4})$/; //폰번호가 적합한지 검사할 정규식
		console.log(phone)
		
		if(phone == null || phone.length <1){
			$("#confirmNum1").text("휴대폰 번호는 반드시 입력하셔야 합니다.");
			$("#addUserBtn").attr("disabled", true);
			return;
		}else if(phone != "" && phone.length <11 ){ 
			$("#confirmNum1").text("휴대폰번호를 확인해주세요.");
			$("#addUserBtn").attr("disabled", true);
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
				alert("문자가 발송되었습니다.")
				console.log(JSONData.status);
				$("div").text(JSONData.status); 
			}
		})
		
	})
		
		
	$(document).on("click", "#chkBtn", function() {
		var numStr = $("#numStr").val();
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
					//$("div").text(JSONData.status); 
					
					if(JSONData == 0){
						//0: 인증번호가 틀림
						$('confirmNum2'),text('인증번호를 확인해주세요.');
						$("#confirmNum2").css("color", "red");
						$("#addUserBtn").attr("disabled", true);
					}else{
						$("#confirmNum2").text("인증이 완료되었습니다.");
						$("#addUserBtn").attr("disabled", false);
					}
				}, error : function() {
					console.log("실패");
				}
			})//ajax 끝	
		}	
	})//폰번호인증 끝 
	
})




</script>
<body>

<!-- 	<!-- ToolBar Start /////////////////////////////////////-->
<%-- 		<jsp:include page="/layout/header.jsp" /> --%>
<!--    	ToolBar End ///////////////////////////////////// -->
   	
<!-- <!--  화면구성 div Start /////////////////////////////////////--> 
<!-- 	<div class="container" style=" margin-top: 50px; width: 600px;"> -->
	
<!-- 		<h1 class="bg-default text-center" style="margin-top: 10px; background-color:#fee50e">비 회 원 예 매 </h1> -->
		
<!-- 		<!-- form Start /////////////////////////////////////--> 
<!-- 		<form> -->
<!-- 			<div class="form-group row" style="text-align: center;"> -->
<!--     			<label for="birth" class="col-sm-3 col-form-label">생년월일</label> -->
<!--     			<div class="col-sm-9"> -->
<!--       				<input type="date" class="form-control" id="birth" name="birth" placeholder="ex)20200101"> -->
<!--       				<input type="hidden" class="form-control" id="role" name="role" value="unUser"> -->
<!--     			</div> -->
<!-- 			</div> -->
<!-- 			<fieldset class="form-group"> -->
<!-- 				<div class="row" > -->
<!-- 					<legend class="col-form-label col-sm-4 pt-0" style="padding-left: 57px;" >성별</legend> -->
					
<!-- 						<div class="col-sm-4" style="text-align: center;" > -->
<!-- 							<div class="form-check" style=" padding-left: 0px;"> -->
<!-- 		          				<input class="form-check-input" type="radio" id="male" name="gender" value="M" checked> -->
<!-- 		          				<label class="form-check-label" for="Male"> -->
<!-- 		                           	남	 -->
<!-- 		          				</label> -->
<!-- 	          				</div> -->
<!-- 	        			</div> -->
<!-- 		        			<div class="col-sm-4" style="text-align: center;" > -->
<!-- 								<div class="form-check" style=" padding-left: 0px;"> -->
<!-- 									<input class="form-check-input" type="radio" id="female" name="gender" value="F"> -->
<!-- 									<label class="form-check-label" for="female"> -->
<!-- 										여	 -->
<!-- 			          				</label> -->
<!-- 								</div> -->
<!-- 		      				</div> -->
<!-- 				</div> -->
<!-- 		  	</fieldset> -->
<!-- 		  	<div class="form-group row" style="font-size: 12pt; text-align: center; "> -->
<!-- 				<label for="staticEmail" class="col-sm-3 col-form-label">휴대전화번호</label> -->
<!-- 				<div class="col-sm-9"> -->
<%-- 					<c:choose>  --%>
<%-- 					    <c:when test="${not empty sessionScope.phone }">    --%>
<%-- 					       <input type="text" class="form-control" id="phone" name="phone" value="${sessionScope.phone}" readonly> --%>
<%-- 					    </c:when> --%>
<%-- 					    <c:otherwise>     --%>
<!-- 							<input type="text" class="form-control" id="phone" name="phone" placeholder="- 없이 입력해주세요."> -->
<!-- 							<h6 id="confirmNum2" style="color: red; margin-top: 8px;"></h6> -->
<%-- 					    </c:otherwise>                   --%>
<%-- 					</c:choose> --%>
<!-- 				</div> -->
<!-- 				<h6 id="confirmNum1" style="color: red;"></h6> -->
<!-- 			</div> -->
<!-- 			<div class="form-group row" style="text-align: center;"> -->
<!-- 				<label for="password" class="col-sm-3 col-form-label">비밀번호</label> -->
<!-- 				<div class="col-sm-9"> -->
<!-- 					<input type="password" class="form-control" id="password" name="password" placeholder="Password"> -->
<!-- 		    	</div> -->
<!-- 			</div> -->
<!-- 			<div class="form-group row" style="text-align: center;"> -->
<!-- 				<label for="password2" class="col-sm-3 col-form-label">비밀번호확인</label> -->
<!-- 				<div class="col-sm-9"> -->
<!-- 					<input type="password" class="form-control" id="password2" placeholder="Password"> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="form-check" style=" margin-bottom: 10px;"> -->
<!-- 			    <input type="checkbox" class="form-check-input" id="agreeCheck"> -->
<!-- 			    <label class="form-check-label" for="agreeCheck" >개인정보수집 및 이용 동의</label> -->
<!-- 			</div>	 -->
<!-- 			<div class="form-group row"> -->
<!-- 				<div class="col-sm-12 text-center" style="margin-bottom: 40px;"	> -->
<!-- 					<button type="button" id="addUserBtn" class="button large purple" >비회원 예매하기</button> -->
<!--       				<a class="button large" href="#" id="cancelBtn" role="button">취&nbsp;소</a> -->
<!-- 			 	</div> -->
<!-- 			</div> -->
<!-- 		</form> -->
<!-- 		<!-- form end /////////////////////////////////////--> 

<!-- 	</div> -->
	<!--  화면구성 div end /////////////////////////////////////-->
	
	<!-- Modal -->
		<div class="modal fade" id="unUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header" style="height: 48px; text-align: center;  background: #fee50e;">
						<h3 class="tit" id="exampleModalLabel">비회원 로그인</h3>
						<button type="button" class="close" data-dismiss="modal" id="btn1" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form>
							<div class="col-wrap">
								<div class="col left">
									<div class="form-group row" style="text-align: center;">
						    			<label for="birth" class="col-sm-3 col-form-label">생년월일</label>
						    			<div class="col-sm-9">
						      				<input type="date" class="form-control" id="birth" name="birth" placeholder="ex)20200101">
						      				<input type="hidden" class="form-control" id="role" name="role" value="unUser">
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
								  	<div class="row"> 		
										<span style="padding-right: 10px; margin-top: 10px;">휴대전화 번호</span>
										<input type="text" class="form-control" placeholder="-없이 입력해주세요." id="phone" name="phone" style="margin-top: 5px; margin-right: 20px; margin-left: 20px; width: 175px;">
										
										<button id="smsBtn" type="button" class="button purple large btn-login" style="border-radius: 4px; color:#333; text-align:center; padding-left:10px; padding-right: 10px;
									         width: 120px; height: 46px;  border: 0;  cursor: default; background-color:#fee50e;">인증번호발송</button>
									         <h6 id="confirmNum1" style=" padding-left:100px; color:red; margin-top: 8px;"></h6>  
									</div>	
									<div class="row">
										<div class="col-sm-3">	
											<span style="padding-left:5px; padding-right: 10px; width: 97px;">인증번호</span>
										</div>
										<div class="col-sm-5">
											<input type="number" id="numStr" class="form-control" style="width: 150px;" placeholder="인증번호 6자리">
											<h6 id="confirmNum2" style="color: red; margin-top: 20px;"></h6>
										</div>
										<div class="col-sm-4">			
											<button id="chkBtn" type="button" class="button purple large btn-login" style="border-radius: 4px; color:#333; padding-right: 10px;
										        	width: 100px; height: 46px; border: 0; cursor: default; background-color:#fee50e;">확인</button> 
										</div>
									</div>
									<div class="form-group row" style="text-align: center; margin-top: 10px;">
										<label for="password" class="col-sm-3 col-form-label">비밀번호</label>
										<div class="col-sm-9">
											<input type="password" class="form-control" id="password" name="password"  style= " margin-top: 10px; width:250px;" placeholder="Password">
								    	</div>
									</div>
									<div class="form-group row" style="text-align: center; margin-top: 10px;">
										<label for="password2" class="col-sm-3 col-form-label" style="padding-left: 0;">비밀번호확인</label>
										<div class="col-sm-9">
											<input type="password" class="form-control" id="password2"  style="margin-top: 10px; width:250px;" placeholder="Password">
										</div>
									</div>
									<!-- chk-util -->
									<div class="chk-util">
										<div class="left">
											<input id="agreeCheck" type="checkbox"> <label for="agreeCheck">개인정보수집 및 동의</label>
										</div>
									</div>
									<!--// chk-util -->
						
									<button id="addUserBtn" type="button" class="button purple large btn-login" style="border-radius: 4px; color:#333; height: 46px; 
									 border: 0; width: 100%; cursor: default; background-color:#fee50e;">확인</button>
								</div>
							</div>
						</form>
					</div><!--modal-body -->
				</div>
			</div>
		</div>
			
	
	
	
	
	
	
	
<!-- <!-- Header Start /////////////////////////////////////--> 
<%-- 		<jsp:include page="/layout/footer.jsp" /> --%>
<!-- <!-- Header End /////////////////////////////////////--> 

</body>
</html>