<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html lang="ko">

<head>
	<!-- Required meta tags -->
  <meta charset="utf-8">
  <link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
  <title>mmm</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  
  <!-- Bootstrap Extended Color -->
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors.css" />
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors-themes.css" />

    <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  
  <!--     Common Css -->
  <link rel="stylesheet" href="/resources/css/product.css">
	
	<style>
/* 장바구니 */
  #shoppingCart{
		width : 60px;
		position:fixed;
		right:30px;
		bottom:0px;
		z-index:2000;
		cursor : pointer;
	}
	
  div.shoppingCart{
		position:fixed;
		right:-200px;
		bottom:12%;
		z-index:1000;
		transition-property: right;
		transition-duration: 1s;
		width : 150px;
		height : 500px;
		border : 4px dashed #bcbcbc;
		overflow : auto;
	}
 
  aside {
 	border:3px solid #4D5155;
	z-index:2000; 
 	border-radius: 30px;
 	height: 420px; 
 	width:100px; 
 	right:10px; 
 	position: fixed;
 	bottom : 12%;
 	background-color : #333;
	transition-property: right;
	transition-duration: 1s; 	
 }
 
 aside div div.row {
 	position : relative;
 	top : 18px;
 }
 
 div.aside {
 	border-radius: 30px;
	
 }
 
 span.aside {
 	color : #fff;
 	font-size: 13px;
 	cursor : pointer;
 } 
	</style>

	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	$(function() {				
		
		//==> Enter 키 검색
		$("input[name='searchKeyword']").on("keydown" , function(event) {						
			if(event.keyCode == '13'){
				fncGetProductList(1);
			}
		});
	
			
	});


	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( ".img-circle.img-responsive" ).on("click" , function() {
			var prodNo = $(this).next().val();
			console.log(prodNo);
			self.location = "/product/getProduct?prodNo="+prodNo;
		});
	});	

	
	 
	//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetProductList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
		}
		
		
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-default" ).on("click" , function() {
				fncGetProductList(1);
			});
		 });
		
		
		 $(document).ready(function() {

				$(window).scroll(function () {

					// 현재 위치의 높이

					//var curHeight = $(window).height() + $(window).scrollTop();

					var curHeight = $(window).scrollTop();

					// 문서의 높이

					var docHeight = $(document).height();



					// 어느 정도 조건이 만족하면 내용 생성

					if (curHeight > docHeight - 800) {

						$('<div class="thumb-wrapper">').appendTo('body');

					}

				});

			});

		
		</script>
		<title>mmm</title>
	</head>

<body id="body">
	
	<jsp:include page="/product/prodToolBar.jsp" />
	
	
 		<br/>
 		 	
	
 	<!--  화면구성 div Start /////////////////////////////////////-->
 	
 	
 	<div class="container" id = "container">
 		<br/>
 		 	 <div class="row mx-0">
	    
			<div class="col-6">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
					<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품명</option>
					<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품가격</option>
					</select>
				  </div>
	    		
	    		<div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    </div>
 		<!-- table 위쪽 검색 Start /////////////////////////////////////-->	
 			
 			
 		<hr style="background-color : black ;">
		<br/>
		
	<div class="productListContent row" style="  margin-left: 50px;">
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i }" />
      				<div class="thumb-wrapper" id="productList">
      					<div class="img-box text-center">
 						<img src="/resources/image/${product.prodImage}" id="getProdListImg"class="img-circle img-responsive" style="cursor: pointer;">
				       	<input type="hidden" value = "${product.prodNo}">
				       </div>
				       	<div class="prodName col-11 text-center" id="getProdListProdName"><h4><span>${product.prodName}</span></h4>
					       	<div class="prodPrice col-9 text-center" id="getProdListProdPrice">
					       		<h5>
					       			<fmt:formatNumber value="${product.prodPrice}" type="currency" currencySymbol=""/>원
					       		</h5>
					       	</div>	
      					</div>
      					<hr>
      				</div>
    		
    	
          </c:forEach>
        </div>	 
	</div>
	
	<div class="shoppingCart" >
	</div>


	<img id="shoppingCart" src="../resources/image/productIcon/shoppingcart_pd.png" class="rounded-circle">
	
	  <!-- 장바구니 -->
	  <script>
	 $(function(){ 
		myCartList();
		//페이지네이션으로 1페이지 설정했기때문에 8개까지만 나옵니다
		function myCartList(){
		 $.ajax({
			  type: "POST",
			  url: "/product/json/getCartList",
			  data: JSON.stringify({ cartUserNo : '${user.userNo}'}),
			  dataType : "json",
		      headers: { 
		        "Accept" : "application/json",
		        "Content-Type": "application/json"
		      },
		 }).done(
			data => {
				
				$("div.shoppingCart").empty()
				data.list.forEach( (data,index) => {
					$.getJSON("/product/json/getProduct/"+data.cartProdNo)
					.done( x =>{
							var Image =x.product.prodImage
							
							var Element ="<div class='product' style='background-color : white;'><span><img class='prodImage' src='../resources/image/"+Image+"' width=100><img class='removeCart'src='../resources/image/productIcon/close-button.jpg' width=20><span>";
								Element+="<input class='cartNo' type='hidden' value='"+data.cartNo+"'</div>"
							$("div.shoppingCart").append(Element);
							
							$("div.product img.prodImage").last().on("click",function(){
								
								self.location ="/product/getProduct?prodNo="+x.product.prodNo
							});
							var cartNo = $.trim($("input.cartNo").last().val());
							$("img.removeCart").last().on("click",function(){
								
								$.get("/product/json/removeCart/"+cartNo)
								.done( () =>{
									 console.log("성공")
									 myCartList();
								})//end of $.get
							});//end of img.removeCart click
					})//end of $.getJSON
				}) //end of forEach
			}) //end of ajax Done
		}//end of function
	});// end of function
	
		$("#shoppingCart").on("click", function(){
			if($("div.shoppingCart").css("right")=="-200px"){
				$("aside").css("right","-200px");
				$("div.shoppingCart").css("right","0px");
				$("#shoppingCart").css("opacity","0.5")
			}else{
				$("aside").css("right","10px");
				$("div.shoppingCart").css("right","-200px");
				$("#shoppingCart").css("opacity","1");
			}
		});
	  </script>
	  <jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>