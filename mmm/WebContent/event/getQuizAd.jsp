<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> <!-- 문서타입 --> 
<html lang="ko"> <!-- 휴먼랭귀지 --> 
<head> 
 	<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>	 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"   integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>

<script type="text/javascript">
	
	$(function(){
		$('#updateBtn').on("click", function(){
			self.location = "/event/updateQuizAd?quizNo=${quiz.quizNo}";
		});
		
		$('#okBtn').on("click", function(){
			self.location = "/event/getQuizListAd";
		});
	});  

</script>

<style>

span.title{
		 font-size: 20px;
		 font-weight: bold;
		}
.qBox{
        border: 4px dashed #bcbcbc;
	}		
	
button.btn.write { 
		background-color: #fee50e!important;
   		color: #212529;
    	border-color: #fcfaf5;
    	font-size: 13px;
	}
	
button.btn.write:hover {
     color: #f8f9fa;
     background-color: #e0a800;
     border-color: #040404;
}  		
</style>
</head> 

<body>
<jsp:include page="/layout/header.jsp"></jsp:include>
	
	<div class="container">
	
	<div class="m-4">
	<span class="title">퀴즈 상세조회</span>
	</div>
		
		<div class='qBox p-3'>
		<div class='p-2'><span>Q.</span>${quiz.question}</div>
		<div class='p-2'><span>1.</span>${quiz.optionFirst}</div>
		<div class='p-2'><span>2.</span>${quiz.optionSecond}</div>
		<div class='p-2'><span>3.</span>${quiz.optionThird}</div>
		<div class='p-2'><span>4.</span>${quiz.optionFourth}</div>
		<div class='p-2'><span>정답.</span>${quiz.answer}</div>
		<div class='p-2'><span>시작날짜</span>${quiz.quizStDate}</div>
		</div>
		
	  
		<div class="text-center mt-3">
			<button id="updateBtn" class="btn write" type="button">수 &nbsp;정</button>
			<button id="okBtn" type="button" class="btn write">확 &nbsp;인</button>
		</div>

	</div>
<jsp:include page="/layout/footer.jsp"></jsp:include>
 </body>
 
 </html>