<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> <!-- 문서타입 --> 
<html lang="ko"> <!-- 휴먼랭귀지 --> 
<head> 
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"   integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
	
	<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>

<script type="text/javascript">
	
	$(function(){
		
		$('#updateBtn').on("click", function(){
			alert('update버튼이 클릭됨');
			self.location = "/event/updateQuizAd?quizNo=${quiz.quizNo}";
		});
		

		$('#delBtn').on("click", function(){
			alert('delBtn버튼이 클릭됨');
			var articleNo = ${article.articleNo};
			console.log(articleNo)
			self.location="/customer/deleteAsk?articleNo="+articleNo;
		});
		
		
		$('#okBtn').on("click", function(){
			alert('ok버튼이 클릭됨');
			history.go(-1);
		});
		
		
		$("button[name='ask']").on("click", function(){
			self.location="/customer/getAskList";
		});
		
		$("button[name='notice']").on("click", function(){
			self.location="/customer/getNoticeList";
		});
		
		$("button[name='contact']").on("click", function(){
			self.location="/customer/addContact";
		});
		
	});  

</script>

<style>
 #header{ 
      	width:808px;
      	height:500px;
      	padding: 20px;
        margin: 10px auto;
        border: 1px solid #bcbcbc;
        }
        
	 
		        
	  th {
	     width:300px;
	    border-bottom: 0.1px solid #444444;
	    padding: 10px;
	    text-align: center;
	  }        
	  
	  
	  .content{
	  	height:400px;
	  }
	  
	  		
		@media (min-width: 768px) {
	 	 .container {
	     width: 750px;
	  }
	}
	
		@media (min-width: 992px) {
		 .container {
	     width: 940px;
	  }
	}
  
</style>



</head> 

<body>
<jsp:include page="/layout/header.jsp"></jsp:include>
<div class="container">

	<div class="page-header text-dark">
	       <h3>고객센터</h3>
	       <hr>
	    </div>
	<div class="btn-toobar" role="toolbar" aria-label="Toolbar with button groups">
	  <div class="btn-group" role="group" aria-label="First group">
		<button type="button" name="ask" class="btn btn-outline-secondary active">자주찾는질문</button>
	    <button type="button" name="contact" class="btn btn-outline-secondary">일대일문의</button>
	    <button type="button" name="notice" class="btn btn-outline-secondary">공지사항</button>
	  </div>
	</div>

	<div class="btn-toobar" role="toolbar" aria-label="Toolbar with button groups">
	  <div class="btn-group" role="group" aria-label="First group">
	    <button type="button" class="btn btn-default">전체</button>
	    <button type="button" class="btn btn-default">예매&매표</button>
	    <button type="button" class="btn btn-default">스토어</button>
	    <button type="button" class="btn btn-default">결제</button>
	    <button type="button" class="btn btn-default">할인혜택</button>
	    <button type="button" class="btn btn-default">홈페이지</button>
	    <button type="button" class="btn btn-default">이벤트</button>
	  </div>
	</div>
</div>
	<div class="container">
	
	<div id="header"> 
	 <div class="noticebox">	
                        <table class="table">
	                        <thead>
		                        <tr>
		                        <th>
							 <c:if test="${article.category==1}">예매/매표</c:if>
					 		 <c:if test="${article.category==2}">스토어</c:if>
					  		 <c:if test="${article.category==3}">결제</c:if>
					 		 <c:if test="${article.category==4}">할인혜택</c:if>
						  	 <c:if test="${article.category==5}">홈페이지</c:if>
					 	 	 <c:if test="${article.category==6}">이벤트</c:if>
							</th>
		                        <th>${article.articleTitle}</th>
		                        </tr>
	                        </thead>
	                        <tbody>
		                        <tr>
		                        <td colspan="2">
			                        <div class="content">
				                        ${article.content}
			                        </div>
		                        </td>
		                        </tr>
	                        </tbody>
	                    </table>
	                    
                    </div>
				
		
	
			</div>
	 <div class="row">
		   
	</div>
		
	  
		<div class="text-center">
			<button id="updateBtn"" class="btn btn-secondary write" type="button">수 &nbsp;정</button>
			<button id="delBtn"" class="btn btn-secondary write" type="button">삭 &nbsp;제</button>
			<button id="okBtn" type="button" class="btn btn-secondary write">확 &nbsp;인</button>
		</div>

	</div>

 </body>
 
 </html>
