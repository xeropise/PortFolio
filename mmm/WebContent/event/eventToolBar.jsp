<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="UTF-8">
	<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- 	jQuery...  -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="<c:url value="/resources/javascript/jquery.barrating.min.js" />"></script> 
    <script src="<c:url value="/resources/javascript/rater.min.js" />"></script> 

    <!-- Bootstrap CSS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	
	
	
	<!-- 	SweetAlert2 CDN -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>
	
	
<style>
	#prodHeader{
    background-color: white;
    height: 3.0rem;
    font-family: 'Noto Sans KR', sans-serif;
	}
</style>

<script type="text/javascript">

	
	$( function() {
		$( "#addQuiz" ).on("click" , function() {
			self.location = "/event/addQuizAd";
		});
	});
	
	
	
	$( function() {
		$( "#quizList" ).on("click" , function() {
			self.location = "/event/getQuizListAd";
		});
	}); 
	
	
	$( function() {
		$( "#addPreview" ).on("click" , function() {
			self.location = "/movie/getExpectedMovieList";
		});
	}); 
	
	

	
	
		   	
		</script>
		
	</head>

<body>
	<jsp:include page="/layout/header.jsp"/>
		<div class="row mx-0" id="prodHeader">
				<div class="col-4">
				</div>
				
				
			<c:if test="${sessionScope.user.role == 'admin'}">
			
				<div class="col-4" style="text-align:center;">
				</div>
				
				
				<div class="col-1" style="text-align:center;">
					<h6 id="addQuiz"  style="color: #242424; margin: 15px 0px;"><strong>퀴즈등록</strong></h6>
				</div>
				
				<div class="col-1" style="text-align:center;">
					<h6 id="quizList"  style="color: #242424; margin: 15px 0px;"><strong>퀴즈관리</strong></h6>
				</div>

				<div class="col-1" style="text-align:center;">
					<h6 id="addPreview"  style="color: #242424; margin: 15px 0px;"><strong>이벤트 등록</strong></h6>
				</div>
				
				
			</c:if>	
				
			
				
			
		</div>	
</body>
</html>