<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html lang="ko"> <!-- 휴먼랭귀지 --> 
<head> 
	<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" type="text/javascript" ></script>	 -->

<!-- 부트스트랩4 를 위한 것 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"   integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>


<script type="text/javascript">
	
	//채점하는 함수
	function checkAnswer(subBtn){
		
		var userNo = $('input[name="userNo"]').val();
		var quizNo = $('input[name="quizNo"]').val();
		var choice = $('input[name="option"]:checked').val();
		console.log(userNo);
		console.log(quizNo);
		console.log("선택한답>>"+choice);
		
		
		$.ajax(
				{
			
				url: "/event/json/checkQuiz",
				method: "POST",
				data: JSON.stringify({
					userNo  :  userNo,
					quizNo  :  quizNo,
					choice : choice
					}),
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
			}
				
		).done(function(JSONData){
			
			//이미참여했을때
			if(JSONData.result==2){
				
				alert('이미 참여했다 얘야...');
				return ;
				
			}else{
				
				if(JSONData.result==0){
					alert('정답이다')
					$("form").attr("method","POST").attr("action", "/event/addWinQuiz").submit();
				}else if(JSONData.result==1){
					alert('정답이 아니다');
					$("form").attr("method","POST").attr("action", "/event/addLoseQuiz").submit();
				
				}
				
			}
			
		});
	}
	
	
	$(function(){
		
		$('button[name="submit"]').on("click", function(){
			
			console.log('submit버튼 클릭됨');
			var subBtn = $(this);
			checkAnswer(subBtn);
			
		});
		
		
		$('#okBtn').on("click", function(){
			
			alert('ok버튼이 클릭됨');
			var userNo = $('input[name="userNo"]').val();
			self.location="/event/getQuizList?userNo="+userNo;
			
		});
		
	})
	
	

	
</script>


<style>
			
	   #content {
        width: 808px;
        height: 430px;
        margin: 0px auto;
        padding: 20px;
        border: 1px solid #bcbcbc;
        }
      
      #header{ 
      	width:808px;
      	height:300px;
      	padding: 20px;
        margin: 10px auto;
        border: 1px solid #bcbcbc;
        }
        
       .qLogin ul{
   		 position: absolute;
	  	 right: 14px;
	   	 top: 11px;
		}
		
		.qLogin ul li {
	  	  float: left;
	 	  padding-left: 12px;  
         }
         
		.qLogin ul li P{
	 	 padding: 25px 56px 22px;
	     background: #fff;
	     text-align: center;
	     line-height: 19px;
	     font-size: 14px;
		}
		
		.qLogin ul li p span{
	    display: block;
    	padding-bottom: 11px;
    	font-weight: 650;
		}
		
        p{
        display: block;
	    margin-block-start: 1em;
	    margin-block-end: 1em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
        }
        
        ul, ol{
        list-style: none;
        } 

       .qLogin{
      	 width:808px;
     	 height: 119px;
     	 background: #f7dfdc;
         margin: 10px auto;
         position: relative;
         border: 1px solid #bcbcbc;
	   }
    
       .qLogin .qltx{
        padding-top: 37px;
	    padding-left: 29px;
	    font-size: 18px;
	    color: #454545;
	    line-height: 20px;
	    font-weight: 650;
	  }
	  

	  

</style>

</head> 

<body>

<div class="container">
<form>
<input type="hidden" name="userNo" value="${user.userNo}">
<input type="hidden" name="quizNo" value="${quiz.quizNo}">
<!-- 테스트용  -->

	<br>
		<div class="page-header text-secondary">
	       <h3>퀴즈 참여</h3>
	       <hr>
	    </div>
	    
<!-- 	<div id="record">  -->
		<div class="qLogin">
		<p class="qltx">
		<span>${user.userId}님의 응모내역</span>
		<br>
		</p>
		<ul>
			<li><p>참여수:${totalCount}</p></li>
			<li><p>정답수: ${winCount}</p></li>
			<li><p>정답률:  <fmt:formatNumber value="${winRate}" pattern=".00" /></p></li>
		</ul>
		  
		
	</div>		
	
					
		<div id="header"> 
		<div><p>
		${quiz.quizStDate}의 퀴즈</p>
		</div>
	
		<div><p>${quiz.question}</p>
		<ul class="mqli">
		<li><input type="radio" id="optionFirst" name="option" value="1" /><label for="quiz_2020010031_1">${quiz.optionFirst}</label></li>
		<li><input type="radio" id="optionSecond" name="option" value="2" /><label for="quiz_2020010031_2">${quiz.optionSecond}</label></li>
		<li><input type="radio" id="optionThird" name="option" value="3" /><label for="quiz_2020010031_3">${quiz.optionThird}</label></li>
		<li><input type="radio" id="optionFourth" name="option" value="4" /><label for="quiz_2020010031_4">${quiz.optionFourth}</label></li>
		</ul>
		</div>
		
	
	</div>
		   
		
</form>
</div> <!-- 	container 닫는 애  -->

		<br>
		<div class="text-center">
			<button name="submit"" class="btn btn-outline-secondary" type="button">퀴즈풀기</button>
			<button id="okBtn" type="button" class="btn btn-outline-secondary">지난퀴즈보기</button>
		</div>
		<br>
		
		
<%-- 			<jsp:include page="../event/getQuizListAd.jsp"/> --%>
		
 </body>
 
 </html>