<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    
<!DOCTYPE html>
<html>
<head>	
 <!-- Required meta tags -->
  <meta charset="utf-8">
  <link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
  <title>mmm</title>  
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


  
  <!-- Bootstrap Extended -->
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors.css" />
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors-themes.css" />

  <!-- google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  
    <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  
  
  <!--     Common Css -->
  <link rel="stylesheet" href="/resources/css/common.css?aer">
  
  	
<title>mmm</title>
<style>
	  body {
 	  	font-family: 'Noto Sans KR', sans-serif !important;
 	  	background-color: 
 	  }

	.col-10{
        margin-bottom : 200px;
	}
	.table{
		table-layout:fixed;
		word-break:break-all;
	}
	.head-cs{
		width: 30%;
	}
	
	body > div.container.mb-3.border-bottom.p-3 > div:nth-child(3) > div:nth-child(3) > button {
		color: #fff;
	   	background-color: #6c757d;
	   	border-color: #6c757d;		
	}
</style>
</head>
<body>
<jsp:include page="/layout/header.jsp"></jsp:include>

<div class="container mb-3 border-bottom p-3">
	<div class="row mt-5 mb-5">
	<c:if test="${payment.payObjectFlag==0 || payment.payObjectFlag==2 }">
		<div class="col-12 text-center bg-dark-cs p-3 mb-0">
			<span><h2>예매가 완료 되었습니다.</h2></span>
		</div>
	</c:if>
	<c:if test="${payment.payObjectFlag==1 }">
		<div class="col-12 text-center bg-dark-cs p-3 mb-0">
			<span><h2>구매가 완료 되었습니다.</h2></span>
		</div>
	</c:if>	
	</div><!-- end of row -->
	<c:if test="${payment.payObjectFlag==0 || payment.payObjectFlag==2 }">
	<div class="row">
		<div class="col-4 text-center my-auto">
			<img src="${movie.poster}" width="200" height="280" />
		</div>
		<div class="col-1"></div>
		<div class="col-7">		
			<div class="row mb-4">
				<div class="col-3 border-right border-warning">예매 PIN NO</div>
				<div class="col-9">${ticketing.ticketingPinNo }</div>
			</div>
			<div class="row mb-4 ">
				<div class="col-3 border-right border-warning">영화제목</div>
				<div class="col-9">${ticketing.movieName}</div>
			</div>
			<div class="row mb-4 ">
				<div class="col-3 border-right border-warning">극장</div>
				<div class="col-9">${ticketing.theaterName }</div>
			</div>
			<div class="row mb-4">
				<div class="col-3 border-right border-warning">상영일시</div>
				<div class="col-9">${ticketing.screenTime }</div>
			</div>	
			<div class="row mb-4">
				<div class="col-3 border-right border-warning">인원수</div>
				<div class="col-9">${ticketing.headCount } 명</div>
			</div>
			<div class="row mb-4">
				<div class="col-3 border-right border-warning">좌석번호</div>
				<div class="col-9">${ticketing.seatNo }</div>
			</div>
			
	</c:if> 
	<c:if test="${payment.payObjectFlag==1 || payment.payObjectFlag==2 }" >
			<div class="row mb-4 ">
				<div class="col-3 border-right border-warning">상품명</div>
				<div id="prodName" class="col-9"></div>
			</div>
			<div class="row mb-4">
				<div class="col-3 border-right border-warning">상품개수</div>
				<div class="col-9">${purchase.purchaseProductQuantity }</div>
			</div>
	</c:if> 			
			<div class="row mb-4">
				<div class="col-3 border-right border-warning">결제금액</div>
				<div class="col-9">${payment.totalPrice}원</div>
			</div>
			<div class="row mb-4 ">
				<div class="col-3 border-right border-warning">결제수단</div>
				<div class="col-9 p-0">
				<c:choose>
					<c:when test="${payment.payMethod==0}">
						<div class="col">현금 ${payment.cash}원</div>
					</c:when>
					<c:when test="${payment.payMethod==1}">
						<div class="col">포인트 ${payment.usingPoint}p</div>
					</c:when>
					<c:when test="${payment.payMethod==2}">
						<div class="col">상품권 ${payment.cash}원</div>
					</c:when>
					<c:when test="${payment.payMethod==3}">
						<div class="col">현금 ${payment.cash}원</div>
						<div class="col">포인트 ${payment.usingPoint}p</div>
					</c:when>
					<c:when test="${payment.payMethod==4}">
						<div class="col">현금 ${payment.cash}원</div>
						<div class="col">상품권 ${payment.cash}원</div>
					</c:when>
					<c:when test="${payment.payMethod==5}">
						<div class="col">포인트 ${payment.usingPoint}p</div>
						<div class="col">상품권 ${payment.cash}원</div>
					</c:when>
					<c:when test="${payment.payMethod==6}">
						<div class="col">현금 ${payment.cash}원</div>
						<div class="col">포인트 ${payment.usingPoint}p</div>
						<div class="col">상품권 ${payment.cash}원</div>
					</c:when>
				</c:choose>
				</div>
			</div>			
			
			<c:if test="${payment.payMethod==0 || payment.payMethod==3 || payment.payMethod==4 || payment.payMethod==6}">
				<div class="row ">
					<div class="col-3 border-right border-warning">적립포인트</div>
					<div class="col-9">${payment.savingPoint}p</div>
				</div>
			</c:if>
		</div>
	</div><!-- end of row -->
	
	<div class="row mt-5">
		<div class="col-3"></div>
		<div class="col-2 text-center">
		</div>
		<div class="col-2 text-center">
			<c:if test="${payment.payObjectFlag==0 || payment.payObjectFlag==2}">
			<button type="button" class="btn  btn-dark confirm">예매 확인/취소</button>
			</c:if>
			<c:if test="${payment.payObjectFlag==1 }">
				<button type="button" class="btn  btn-dark confirm">구매 확인/취소</button>
			</c:if>		
		</div>
		<div class="col-2 text-center">
		</div>
		<div class="col-3"></div>
	</div>

</div><!-- end of container -->

<jsp:include page="/layout/footer.jsp"></jsp:include>

<script>
$.ajaxSetup({async:false}); //전역 ajax 동기로
<c:if test="${payment.payObjectFlag==1 || payment.payObjectFlag==2 }" >
	var productName = new Array();
	var productNo = '${purchase.purchaseProductNo }';
	
	productNo.split(",").forEach( (value,index) => {
		//console.log(value)
		$.getJSON('/product/json/getProduct/'+value)
		.done( x => {
			var product = x.product;
			productName.push(product.prodName);
						
		})
	}); // end of forEach
	//중복 제거
	productName= productName.reduce(function(a,b){
					if(a.indexOf(b)==-1){
						a.push(b)
					}
					return a
					
					},[])
	var fullName="";
	productName.forEach( (value,index) => {
		
		fullName += value+",";
	})					
	fullName = fullName.substring(0, fullName.length-1);
	$("div#prodName").text(fullName);
</c:if>
<c:if test="${payment.payObjectFlag==1 }">
	$("button.confirm").on("click",function(){
		self.location="/mypage/mypage?condition=2";
	});
</c:if>

<c:if test="${payment.payObjectFlag==0 || payment.payObjectFlag==2 }" >
$("button.confirm").on("click",function(){
	self.location="/mypage/mypage?condition=1";
});
</c:if>
</script>
</body>
</html>