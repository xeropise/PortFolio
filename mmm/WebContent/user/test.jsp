<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

		document.addEventListener("DOMContentLoaded", function() {
		
		
		
		    if(window.sessionStorage) {
		
		        // 해당 예제를 실행하기전 이전 세션의 데이터를 clear( ) 메서드를 사용해 전부 삭제한다.
		        sessionStorage.clear();
		    }
		    else {
		        alert("세션을 사용할 수 없는 브라우저입니다.");
		    }
		});

		
		
		$(function(){
			console.log("test script")
			
			$("#userId").on("change keyup paste", function() {
				var userId = $("#userId").val();
				console.log("Enter userId : "+userId);
				
				$.ajax({
		            url : "/mmm/user/json/checkDuplication/"+userId,
		            type : "get",
		            dataType : "json",
		            data : {"userId" : userId},
		            success:function(data){
		            	if(data){
		            		$("#checkIdResult").text("사용 불가능")
		            	} else {
		            		$("#checkIdResult").text("사용 가능")
		            	}
		            }
				})
			})
		})
		
		
		$(function(){		
				$("a[href='#']:contains('문자전송')").on("click", function(){
					var phone = $("#phone").val();
					console.log(phone);
					console.log("클릭");
					$.ajax(
							{
								url : "/user/json/sendSMS/" + phone ,
								method : "get" ,
								datatype : "json" ,
								headers : {
									"Accept" : "application/json" ,
									"Content-Type" : "application/json"
								} ,
								success : function( JSONData , status ) {
									console.log("동작");
									
									console.log(JSONData.status);
									$("div").text(JSONData.status);
									
								}
							}
						)
				})
			})

		
		
		
		$(function(){		
			$("a[href='#']:contains('확인')").on("click", function(){
				console.log("확인클릭!");
				var numStr = $("#numStr").val();
				console.log(numStr);
				self.location = "/user/authSMS/"+ numStr;
			})
		})


</script>
</head>
<body>

<input type="text" id="userId">
<div id="checkIdResult"></div>

	<div class="container">
		<div class="row">	
			<div class="text-center">
				<input type ="text" id="phone" name="phone">
				<a class="btn btn-info btn-lg" href="#" role="button">문자전송</a>
			</div>	
		</div>
	</div>

	<div class="container">
			<div class="row">	
				<div class="text-center">
					<input type ="text" id="numStr" name="numStr">
					<a class="btn btn-info btn-lg" href="#" role="button">확인</a>
				</div>	
			</div>
		</div>



</body>
</html>