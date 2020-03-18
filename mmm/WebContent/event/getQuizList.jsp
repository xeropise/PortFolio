<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
  	<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  
  <!-- Bootstrap Extended Color -->
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors.css" />
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors-themes.css" />
   
   <!-- google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
   
    <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<!-- 	SweetAlert2 CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>

<!-- fontawesome-->
<script src="https://kit.fontawesome.com/35102316d7.js" crossorigin="anonymous"></script>
<script type="text/javascript">

	
	
	function checkAnswer(qBtn){
		
 		var quizNo =qBtn.parent().children('input[name="quizNo"]').val();
 		var userNo =qBtn.parent().children('input[name="userNo"]').val();
		var choice = qBtn.parent().parent().find('input[name="option"]:checked').val();
// 		console.log($("input[name='quizNo']").val(quizNo));
		
 		console.log("quizNo>>"+quizNo);
 		console.log("userNo>>"+userNo);
 		console.log("choice>>"+choice);

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
			
			//alert(JSONData.partCnt)
			//이미참여했을때
			if(JSONData.result==2){
				
				Swal.fire({
					text: '이미 참여하셨습니다.',
					icon: 'error',
					confirmButtonText: "confirm"
				}).then((confirm)=>{
					self.location="/event/getQuizList?userNo="+userNo;
				})
				
			}else{
				
				if(JSONData.result==0){
					
 					Swal.fire({
 						text: '정답입니다',
						icon: 'success',
 						confirmButtonText: "confirm"
					}).then((confirm)=>{
						//alert('정답')
						$("form").attr("method","POST").attr("action", "/event/addWinQuiz").submit();
						console.log(quizNo);
						var quizNo2 = qBtn.parent().children('input[name="quizNo"]').val();
						console.log("정답이야 >>"+quizNo2);
						//var quizNo = $(this).parent().first();
						//alert(quizNo);
						//console.log(quizNo)
						self.location="/event/addWinQuiz/"+quizNo2;
				})
					
					
				}else if(JSONData.result==1){
					
					
 					Swal.fire({ 
 						text: '정답이 아닙니다.',
 						icon: 'error',
						confirmButtonText: "confirm"
					}).then((confirm)=>{
						//alert('오답')
						//$("form").attr("method","POST").attr("action", "/event/addLoseQuiz").submit();
						var quizNo2 = qBtn.parent().children('input[name="quizNo"]').val();
						console.log("오답이야 >>"+quizNo2)
						self.location="/event/addLoseQuiz/"+quizNo2;
				})
				}
			
		}
			
		
		
	});

	}

	$(function(){
		
		
		$("button[name='qBtn']").on("click", function(){
			
			console.log("퀴즈풀기 버튼 클릭됨");
			var qBtn = $(this);
			checkAnswer(qBtn);
		});
		
		
	})


 	function Pagination(currentPage) {
 		console.log('fncGetList에 왔거든여');
 		$("#currentPage").val(currentPage);
		console.log($('#currentPage').val());

	$("form").attr("method","POST").attr("action", "/event/getQuizList").submit();
	}
	
	
</script>

<style>

		a.crtPage {
			background-color: black;
		}

   		#header { 
	      	width:750px;
	      	height:auto;
	      	padding: 20px;
	      	background-color:white;
	        margin: 10px auto;
			border-top:1px solid darkgray;
			border-bottom:1px solid darkgray;
	        color:  black;
        }
        
       .qLogin ul { 
	   		 position: absolute;
		  	 right: 18px;
		   	 top: 11px;
		}
		
		.qLogin ul li {
		  	  float: left;
		 	  padding-left: 18px;  
         }
         
		.qLogin ul li P {
		 	 padding: 15px 40px 22px;
		     background: #fff;
		     text-align: center;
		     line-height: 19px;
		     font-size: 16px;
		}
		
		.qLogin ul li p span {
		    display: block;
	    	padding-bottom: 11px;
	    	font-weight: 650;
		}
   
        ul, ol {
       		 list-style: none;
        } 
        
         .qLogin {
	      	 width:808px;
	     	 height: 119px;
	         margin: 10px auto;
	         position: relative;
	   }
    
       .qLogin .qltx{
	        padding-top: 30px;
		    padding-left: 45px;
		    pqeeint-bottom: 28px;
		    font-size: 18px;
		    color: black;
		    line-height: 20px;
		    font-weight: 650;
	  }
  
		  
		button.quiz.btn{ 
			background-color: #fee50e!important;
	   		color: #212529;
	    	border-color: #fcfaf5;
	    	font-size: 13px;
		}
		
		button.quiz.btn:hover {
		     color: #f8f9fa;
		     background-color: #e0a800;
		     border-color: #040404;
		}
		
		
		.page-item.active .page-link {
		    z-index: 1;
		    color: #333 !important;
		    background-color: #fee50e !important;
		    border-color: #fee50e !important;
		 }
		 
		 .page-link {
		 	color: #333 !important;
		 }

</style>

</head>


<body>
<jsp:include page="/layout/header.jsp"></jsp:include>
<div class="container">
		<br/><br/>
		<h4><span style="font-size:30px; font-weight:bold;"><i class="fas fa-spell-check"></i> 뭅뭅무비퀴즈</span></h4>
		<p class="lbtxt">하루에 1번, 영덕이라면 도전! 뭅뭅뭅 클릭 퀴즈</p>
		<hr>
		<br/>
				
		
   		<div class="qLogin">
		<p class="qltx">
		<span>${user.userId}님의 퀴즈 참여 내역</span>
		<br>
		
		</p>
		
		<p style="margin-left:3em;">
		       참여수 ${totalCount} | 
			정답수 ${winCount} | 정답률<fmt:formatNumber value="${winRate}" pattern=".00" />% | 
			남은퀴즈 ${leftQuiz}
		</p>
		
	</div>		
	<form>
	  <input type="hidden" id="currentPage" name="currentPage" value=""/> 
	  
	  	<c:set var="i" value="0" />
		 <c:forEach var="quiz" items="${list}">
		 <c:set var="i" value="${ i+1 }"/>
		<div id="header" name="headBox"> 
		<script type="text/javascript">
		var partFlag = ${quiz.partFlag}
		
		
			
		
		</script>
		<div class="jj"></div> 
		
		<div>
		<c:if test="${quiz.partFlag eq 1}">
		<span style="color: red;"> <i class="far fa-smile"></i> 참여완료 </span>
		</c:if>
		<p>
		<span style="font-weight: 600;">${quiz.quizStDate}의 퀴즈</span>
		</p>
		</div>
		<div><p style="font-weight: bold; font-size:18px; background-color:white;">${quiz.question}</p>
		<ul class="mqli" style="font-size:18px;">
		<li><input type="radio"  name="option" value="1" /><label for="quiz_2020010031_1">${quiz.optionFirst}</label></li>
		<li><input type="radio"  name="option" value="2" /><label for="quiz_2020010031_2">${quiz.optionSecond}</label></li>
		<li><input type="radio"  name="option" value="3" /><label for="quiz_2020010031_3">${quiz.optionThird}</label></li>
		<li><input type="radio"  name="option" value="4" /><label for="quiz_2020010031_4">${quiz.optionFourth}</label></li>
		</ul>
		      
		<div class="text-center">
		<input type="hidden" name="quizNo" value="${quiz.quizNo}"/> 
		<input type="hidden" name="userNo" value="${user.userNo}"/> 
		<button name="qBtn" type="button" class="quiz btn" >채점하기</button>

		</div>
		</div>
	 	</div>
		<br>
          </c:forEach>
	 	</form>
		

 
<div class="container text-center">
		 
		<c:if test="${!empty list}">
	<!-- pagination -->
	<div class="ticketingPagination row">
			  		<div class="col-4"></div>
			  		<div class="col-4 ">
					  <ul class="pagination d-flex justify-content-center ">
		   				 <!--  <<== 좌측 nav -->
		  				<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
		  					    <li class="page-item disabled">
     								 <a class="page-link" href="#" tabindex="-1" aria-disabled="true">«</a>
   								 </li>
		  				</c:if>
		  				<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
					   		<li class="page-item">
					   		 <a class="page-link" href="javascript:Pagination('${resultPage.beginUnitPage-1}')" tabindex="-1" aria-disabled="true">«</a></li>
						</c:if>
						
					    <!--  중앙  -->
						<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
							<c:if test="${ resultPage.currentPage == i }">
								<!--  현재 page 가르킬경우 : active -->
							    <li class="page-item active" aria-current="page">
      								<a class="page-link" href="javascript:Pagination('${ i }')">${ i }<span class="sr-only">(current)</span></a>
   								 </li>
							</c:if>	
							
							<c:if test="${ resultPage.currentPage != i}">	
								<li class="page-item">
									<a class="page-link" href="javascript:Pagination('${ i }')">${ i }</a>
								</li>
							</c:if>
						</c:forEach>
					     <!--  우측 nav==>> -->
					     <c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">						
					    	<li class="page-item disabled">
					    		<a class="page-link" href="#">»</a>
    						</li>
					      </c:if>
					      <c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
					      	    <li class="page-item">
     							 <a class="page-link" href="javascript:Pagination('${resultPage.endUnitPage+1}') ">»</a>
    							</li>
						 </c:if>	
					  </ul><!-- end of pagination -->
					 </div><!-- end of middle col --> 
					 <div class="col-4"></div>
			  </div><!-- end of ticketingPagination -->
	<!--// pagination -->
</c:if>
</div>
</div>
<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>