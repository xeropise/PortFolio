<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>    

    
<!DOCTYPE html>
<html>
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
  
  <link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
  	
<style>

input {
	border: none;
}

img.removeCart {
	float : right;
	cursor : pointer;
}
</style>

</head>
<body id="body">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<div class="container" style="height:auto;">
		<div class="row mx-0">
			<div class="cartHeader col-12 ">
			<br>
				<h2><strong><span>장바구니</span></strong></h2>
			</div>
		</div>
		
		<hr  style="background-color: black; ">
		
		<div class="cartContentHeader row mx-0">
		<div class="prodNoHeader col-2"><span>상품번호</span></div>  
<!--			<div class="prodNoHeader col-2"><h4><span>번호</span></h4></div>	 -->	
			<div class="prodNameHeader col-6"><h5><span>상품명</span></h5></div>
			<div class="prodPriceHeader col-2"><h5><span>가격</span></h5></div>
			<div class="prodQuantityHeader col-2"><h5><span>수량</span></h5></div>
		</div>
		
		<hr  style="background-color: black; ">
		
		<div class="cartContent">
		
				
		</div>
		
		<div class="cartContentFooter row">
			<div class="col-2"><span></span></div>
			<div class="col-6"><span></span></div>
			<div class="fianlPrice col-2">
				<h5><span>최종가격</span></h5>
				<input style="display:inline; text-align:center;" size="9" name="totalPrice" type="text" readonly><span>원</span>
			</div>			
			<div class="col-2"><span></span>
			<br>
				<button id="toPayment" type="button" class="btn btn-dark">결제하기</button>
				<br><br><br><br>
			</div>
		</div>
	</div>
	
	
<form id="finalData">
	<input name="purchaseProductNo" type="hidden" value ="">
	<input name="purchaseProductQuantity" type="hidden" value="">
	<input name="purchasePrice" type="hidden" value= "">
</form> 
	
<script>
//천단위 콤마 String으로
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
// 콤마 찍힌 String에서 콤마제거하고 Number로
function removeComma(str){
     return parseInt(str.replace(/,/g,""));
}


$(function(){
	$('.dropdown-toggle').dropdown('toggle')
	$('.dropdown-toggle').dropdown('hide')
	
	

});
$.ajaxSetup({async:false}); //전역 ajax 동기로
	var prodNoList = new Array();	//상품 번호 
	var prodNameList = new Array();
	var prodQuantityList = new Array();	// 상품 갯수
	var prodPriceList = new Array();
	var prodImageList = new Array();
	var cartNoList = new Array();
	<c:forEach var='i' items='${cartList }'>
		//console.log('${i.cartNo}');
		cartNoList.push('${i.cartNo}');
		prodNoList.push('${i.cartProdNo}');
		prodQuantityList.push('${i.cartProdQuantity}')	
	</c:forEach>
	prodNoList.sort( function(a,b) { return a - b});
	prodNoList.forEach( (x) => {
			//console.log(x)
			
			$.get('/product/json/getProduct/'+x)
			.done( y => {
				
				prodNameList.push(y.product.prodName)
				prodPriceList.push(y.product.prodPrice)
				prodImageList.push(y.product.prodImage)
				
			})
			

	});
	
	setTimeout(function(){
		console.log(prodNoList)
		console.log(prodNameList)
		console.log(prodQuantityList)
		console.log(prodPriceList);
		console.log(prodImageList)		
	prodNoList.forEach( (x,i) => {
		//console.log(i)
		var Element = "<div class='cartContentIn row mx-0 mb-2'>"
			Element+= "<div class='prodNo col-1' style='margin-top: 55px;'><span><kbd>"+prodNoList[i]+"</kbd></span></div>"
//				Element+= "<div class='prodNo col-1'><span><h3 style='margin-top: 55px;'>"+[i+1]+"</h3></span></div>"
			Element+= "<div class='prodName col-6'>"
			Element+= "<span><img src='../resources/image/"+prodImageList[i]+"' width=170 height=150 ></span>"
			Element+= "<span>"+prodNameList[i]+"</span>"
			Element+= "</div>"
			Element+= "<div class='prodPrice col-3'><span><input class='text-center' name='prodPrice' type='text' style='margin-top: 55px;' initialValue='"+prodPriceList[i]+"'value='"+numberWithCommas( prodPriceList[i] )+"' readonly> 원</span></div>"
			Element+= "<div class='prodQuantity col-2'><span><input class='text-center' type='number' style='margin-top: 55px;'  value='"+prodQuantityList[i]+"' min='1' step='1' max='99'> 개</span><img class='removeCart' style='position:relative; top:60px;'src='../resources/image/productIcon/close-button.jpg' width=20><input type='hidden' value='"+cartNoList[i]+"' </div>"
			Element+= "</div><hr style='background-color: black;'>"		
			//console.log(Element)
			
		$("div.cartContent").append(Element);		
			
	})
	var sum=0;
	$("input[name=prodPrice]").each( (index,value) => {
		var Quantity = $($("div.prodQuantity > span > input")[index]).val();
		//console.log( "갯수는 : " +Quantity);
		sum += parseInt( Quantity * removeComma( $(value).val() ) )
	});
	$("input[name=totalPrice]").val( numberWithCommas(sum) )
	
	
	$("input[type=number]").on("change",function(){
		
		var index = $("input[type=number]").index( $(this) )
		var price = parseInt( $($("input[type=text]")[index]).attr('initialValue') );
		var quantity = $(this).val()
		$($("input[type=text]")[index]).val( numberWithCommas(price * quantity ) );
		
		var sum=0;
		$("input[name=prodPrice]").each( x => {
			sum += parseInt( removeComma( $($("input[name=prodPrice]")[x]).val() ) )
		})
		
		$("input[name=totalPrice]").val( numberWithCommas(sum) )
		
	});
		
	$("#toPayment").on("click",function(){
		
		var finalPrice = removeComma( $("div.fianlPrice > input[type=text]").val() ) //최종 가격
		var finalProductNo ="";
		var finalQuantity = "";
		$("div.prodNo > span > kbd").each( x => {
			//console.log ( $($("div.prodNo > span > kbd")[x]).text() )
			finalProductNo+= $($("div.prodNo > span > kbd")[x]).text()+","
		})
		finalProductNo = finalProductNo.substring(0,finalProductNo.length-1);
		//console.log(finalProductNo)
		
		$("div.prodQuantity > span > input[type=number]").each( x => {
			
			finalQuantity+= $($("div.prodQuantity > span > input[type=number]")[x]).val()+",";
		})
		
		finalQuantity = finalQuantity.substring(0,finalQuantity.length-1);
		//console.log(finalQuantity)
		$("input[name=purchaseProductNo]").val(finalProductNo)
		$("input[name=purchaseProductQuantity]").val(finalQuantity)
		$("input[name=purchasePrice]").val(finalPrice)
		
		if($("input[name=purchasePrice]").val()!=0){
			$("form#finalData").attr("action","/payment/preparePayment").attr("method","POST").submit();
		}else{
			alert("장바구니에 상품이 없습니다.")
		}
	});	
	
	//장바구니 삭제하기 
	
	$(".removeCart").on("click",function(){
		var cartNo= $(this).next().val();
		$.get("/product/json/removeCart/"+cartNo)
		.done( () =>{
			 location.reload(true);
		})//end of $.get
	});
	
	},50)

</script>
<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>