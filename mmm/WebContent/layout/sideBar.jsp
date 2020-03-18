<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
 <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  
  <!-- Bootstrap Extended -->
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors.css" />
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors-themes.css" />

    <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  
	<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>

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
 	text-decoration : none;
 } 
 
</style>
</head>
<body>

<aside>
	<div class="container-fluid px-0">
		<div class="row px-0 mx-0">
			<div class="aside col-12 px-0 mb-3 text-center">
				<a href="/mypage/mypage?condition=99" style="text-decoration: none;">
				<img class="aside" src="../resources/image/mainPage/aside/myPage_pd.png" width=60 >
				<p><span class="aside">마이 페이지</span></p>
				</a>
			</div>
			<div class="aside col-12 px-0 mb-3 text-center">
				<a href="/ticketing/addTicketing" style="text-decoration: none;">
					<img class="aside"  src="../resources/image/mainPage/aside/addTicketing_pd.png" width=60 >
					<p><span class="aside">예매하기</span></p>
				</a>
			</div>
			<div class="aside col-12 px-0 mb-3 text-center">
				<a href="/mypage/mypage?condition=1" style="text-decoration: none;">
					<img class="aside"  src="../resources/image/mainPage/aside/getTicketingList_pd.png" width=60 >
					<p><span class="aside">예매내역</span></p>
				</a>
			</div>		
			<div class="aside col-12 px-0 mb-3 text-center">
				<a href="/product/getVoucherList" style="text-decoration: none;">
					<img class="aside"  src="../resources/image/mainPage/aside/product_pd.png" width=60 >
					<p><span class="aside">상품권구매</span></p>
				</a>
			</div>
		</div>
	
	</div>

</aside>

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
		console.log("작동?")
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
</body>
</html>