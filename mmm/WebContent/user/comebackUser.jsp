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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<style type="text/css">

body {
    font-family:'Noto Sans KR', sans-serif;
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
    line-height: 1.1;;
}	

.modal-layer .wrap .layer-con {
    overflow-y: auto;
    background-color: #fff;
    padding: 20px 20px 0 20px;
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
</style>





<script type="text/javascript">

$(function(){
	
	//모달창 엑스-휴대폰 모달
	$("#btn1").on("click",function(){
		history.go(-1);
	});
	
	//모달창 엑스-이메일모달
	$("#btn2").on("click",function(){
		history.go(-1);
	});
	
	
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
	
	if(status=="comeback"){
		comeback();
	}
	

	//모달창에서 엔터키 안눌리게
	$(document).keypress(function(e) { 
		if (e.keyCode == 13) e.preventDefault(); });
	
	

	//회원복구
	$("#comebackBtn").on("click",function(){
		var password= $("#password").val();
		var userId= $("#userId").val();
	
		$.ajax({
			url : '/user/json/updateUserStatus',
			method : "post" ,
			datatype : "json" ,
			headers : {
				"Accept" : "application/json" ,
				"Content-Type" : "application/json"
			} ,
			data : JSON.stringify({
				password : password,	
				userId:userId
			}), 
			success : function(data) {
				console.log("false = pw 일치 X / true = pw 일치 : "+ data);							
				
				if (data == 0) {
						// 0 : 비밀번호가 다름
						$("#passwordChk").text("비밀번호를 확인해주세요.");
						$("#passwordChk").css("color", "red");
						$("#byeconfirmBtn").attr("disabled", true);
				}else{
					$("#passwordChk").text("");
					alert("복구가 완료 되었습니다.")
					self.location="/";
				} 
			}, error : function() {
					console.log("실패");
				}
			})//ajax 끝
	
	})//회원복구끝
	
});


	function comeback(){
		$("#staticBackdrop").modal("show");	
	}

</script>


</head>
<body>

<!-- Modal -->
	<form>
		<div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header" style="height: 48px; text-align: center;  background: #fee50e;">
						<h5 class="modal-title" id="staticBackdropLabel">회원 복구</h5>
						<button type="button" class="close" data-dismiss="modal" id="Btn" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="col-wrap">
							<div class="col left">
								<div class="login-input-area">
									<p> ${user.userName}님 회원 복구를 하시겠습니까?<br>
										복구를 원하시면 비밀번호를 입력해주세요.</p>
									<input autocomplete="off" id="password" name="password" maxlength="20" type="password" placeholder="비밀번호" title="비밀번호를 입력하세요" class="input-text mt15" style=" width:250px; margin-top: 15px;">
									<input type="hidden" name="userId" id="userId" value="${user.userId }">	
									<h6 id="passwordChk" style="color: red;"></h6>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="button large" data-dismiss="modal" style=" border-radius: 4px; color:#333; height: 46px;  border: 0;"id="cancelBtn">취소</button>
							<button type="button" class="button large purple" style=" border-radius: 4px; color:#333; height: 46px;  border: 0; background-color:#fee50e; color: #333; "id="comebackBtn">복구</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

</body>
</html>