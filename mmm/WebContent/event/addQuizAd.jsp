<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>


<!DOCTYPE html> <!-- 문서타입 --> 
<html lang="ko"> <!-- 휴먼랭귀지 --> 
<head> <meta charset="utf-8"> <!-- 문자셋 --> 
	<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	
	<!-- datepicker CDN -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- fontawesome CDN -->
    <script src="https://kit.fontawesome.com/35102316d7.js" crossorigin="anonymous"></script>
	
	<script type="text/javascript">
	
	function fncAddQuiz(){
		
		var question = $("input[name='question']").val();
		var optionFirst = $("input[name='optionFirst']").val();
		var optionSecond = $("input[name='optionSecond']").val();
		var optionThird = $("input[name='optionThird']").val();
		var optionFourth = $("input[name='optionFourth']").val();
		var answer = $("select[name='answer']").val();
		var quizStartDate = $("input[name='quizStartDate']").val();
		
		if(question == null || question.length<1) {
			alert("퀴즈문제는 반드시 입력하셔야 합니다.")
			return;
		}
		if(optionFirst == null || optionFirst.length<1) {
			alert("선택지1은 반드시 입력하셔야 합니다.")
			return;
		}
		if(optionSecond == null || optionSecond.length<1) {
			alert("선택지2는 반드시 입력하셔야 합니다.")
			return;
		}
		if(optionThird == null || optionThird.length<1) {
			alert("선택지3은 반드시 입력하셔야 합니다.")
			return;
		}
		if(optionFourth == null || optionFourth.length<1) {
			alert("선택지4는 반드시 입력하셔야 합니다.")
			return;
		}
		if(answer == null || answer.length<1) {
			alert("정답은 반드시 입력하셔야 합니다.")
			return;
		}
		if(quizStartDate == null || quizStartDate.length<1) {
			alert("퀴즈참여 시작일자는 반드시 입력하셔야 합니다.")
			return;
		}
		$("form").attr("method","post").attr("action","/event/addQuizAd").submit();
	
	}
	
	
		$(function(){
			$('#regBtn').on("click", function(){
				fncAddQuiz();
			});

		$(function(){
			$('#cancelBtn').on("click", function(){
				history.go(-1);
			});
		})
	});
	
	</script>

		<script type="text/javascript">
		
		
			$(document).ready(function() {
			
		    $(".datepicker").datepicker({ 
		        dateFormat: 'yy-mm-dd'
		    });
	
			$(".datepicker").on("change", function () {
		        var fromdate = $(this).val();
// 		        alert(fromdate);
		    });
		
		});
		
		</script>



	
	 <style type="text/css">
	
	
	.pinkstyle{
	 color:#495057;
	 font-size:25px;
	}
	.qOrder{
	  display:inline;
	  }
				
	 body {
	  font-family: 'Noto Sans KR', sans-serif;	
	 }
	 
	 #contents {
   		 width: 100%;
    	 margin: 0;
  		 padding: 40px 0 0 0;
	}

	.event-detail h2.tit {
	    width: 1100px;
	    margin: 0 auto;
	    padding: 0;
	}
	
	
	h2.tit {
	    padding: 0 0 26px 0;
	    font-size: 1.8666em;
	    font-weight: 400;
	    letter-spacing: -1px;
	    line-height: 1.1;
	    color: #222;
	    }
	  
	.event-detail .event-detail-date {
	    overflow: hidden;
	    width: 1100px;
	    margin: 0 auto 30px auto;
	    padding: 15px 0 25px 0;
	    line-height: 1.1;
	    border-bottom: 1px solid #555;
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
	
		.div-center-cs{
			float: none;
			margin: 0 auto;
		}		
		
		span.title{
		 font-size: 20px;
		 font-weight: bold;
		}
	
	
	</style>
				
</head> 
<body>
<jsp:include page="/layout/header.jsp"></jsp:include>

<div class="container">


<div class="m-4">
<span class="title">영화 퀴즈등록</span>
</div>

<div class="col-sm-8 div-center-cs formData">

<form autocomplete="off">
	<input type="text" class="form-control mb-3" name="question" placeholder="퀴즈 문제를 입력하세요">
	<input type="text" class="form-control mb-3" name="optionFirst"  placeholder="선택지 1을 입력하세요">
	<input type="text" class="form-control mb-3" name="optionSecond" placeholder="선택지 2를 입력하세요">
	<input type="text" class="form-control mb-3" name="optionThird" placeholder="선택지 3를 입력하세요">
	<input type="text" class="form-control mb-3" name="optionFourth" placeholder="선택지 4를 입력하세요">
	<select class="form-control mb-3"  name="answer">
           <option value="1">1</option>
           <option value="2">2</option>
           <option value="3">3</option>
           <option value="4">4</option>
    </select>

	<div class='input-group date' data-provide="datepicker">
 				 <input placeholder="Selected date" type="text" name="quizStartDate" class="form-control datepicker" >                    
 				 <div class="input-group-addon pinkstyle">
                     <i class="far fa-calendar-alt"></i>
                </div>
                 </div>	


</form>
</div><!-- 영화등록폼. -->

<div class="text-center m-4">
			<button id="regBtn" class="btn write" type="button">등 &nbsp;록</button>
			<button id="cancelBtn" type="button" class="btn write">취 &nbsp;소</button>
</div>


</div><!-- 컨테이너 -->

	
	
<jsp:include page="/layout/footer.jsp"></jsp:include>
 </body>
 
 </html>