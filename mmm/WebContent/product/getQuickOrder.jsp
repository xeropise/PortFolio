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
	
	  <!-- font awesome -->
	  <script src="https://kit.fontawesome.com/b435a047df.js" crossorigin="anonymous"></script>	
		
	  <!--     Common Css -->
	  <link rel="stylesheet" href="/resources/css/product.css">	
	  
	  <title>mmm</title>
	  
	  <style>
	  #QuickModal > div.modal-footer > button.btn.btn-outline-warning {
		color: #fff;
	   	background-color: #6c757d;
	   	border-color: #6c757d;			  	
	  }
	  
	  #toPayment {
		background-color: #fee50e;
		border-color : #fee50e;
		color : #333;		  	
	  }
	  
	  input {
	  	border : none;
	  }
	  
	  </style>
</head>


<body id="body">
<jsp:include page="/product/prodToolBar.jsp" />
 		 	 
<div class="container">

	<div class="row">
			<div class="col-md-12" style="text-align:center;">
				<img src="/resources/image/1111.png" width ="1000" height="350">
		</div>
	</div><!-- end of row -->
 			
 		 			
 	<br/> <!-- 한줄 -->
 		
	<div class="row" id="row">
 		<c:forEach var="product" items="${list}">
				<div class="thumb-wrapper" id="QuickProdList">
	 				<div class="img-box text-center">
						<img src="/resources/image/${product.prodImage}"  class="img-circle img-responsive productImage" id="QuickProdImg">
						<input name="prodNo" type="hidden" value = "${product.prodNo}">
						<input name="prodPrice" type="hidden" value= "${product.prodPrice }">
						<div class="content-box">
							<h5 style="text-align:center;">${product.prodName}</h5><br>
							<h5><fmt:formatNumber value="${product.prodPrice}" type="currency" currencySymbol=""/>원</h5>
		 				</div> 
					</div>
				</div><!-- end of thumb-wrapper -->	
 		 </c:forEach>	
	</div><!-- end of row -->
	
	
</div><!-- end of container -->
<img id="shoppingCart" src="../resources/image/productIcon/shoppingcart_pd.png" class="rounded-circle">

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content"  id="QuickModal">
      <div class="modal-header"  id="QuickModalhead">
        <h5 class="modal-title" id="exampleModalCenterTitle">추가 입력</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="row">
      		<form class="form-inline col-12">
      		
      		</form>
      	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-warning" data-dismiss="modal">추가 선택하기</button>
        <button type="button" class="btn btn-outline-dark" id="toPayment">결제단계로</button>
      </div>
    </div>
  </div>
</div>
          
<form id="finalData">
	<input name="purchaseProductNo" type="hidden" value ="">
	<input name="purchaseProductQuantity" type="hidden" value="">
	<input name="purchasePrice" type="hidden" value= "">
	<input name="movieName" type="hidden" value="">
	<input name="theaterName" type="hidden" value="">
	<input name="dateTimeNo" type="hidden" value="">
	<input name="screenTime" type="hidden" value="">
	<input name="audienceType" type="hidden" value="">
	<input name="seatType" type="hidden" value="">
	<input name="seatNo" type="hidden" value="">
	<input name="headCount" type="hidden" value="">
	<input name="ticketingPrice" type="hidden" value="">
</form>          
<script>
//숫자를 3자리마다 콤마를 찍고 String으로 리턴하는 함수
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
// 콤마 포함한 String을 콤마 제거한 Number로 리턴하는 함수
function removeComma(str){
     return parseInt(str.replace(/,/g,""));
}
//이미지 클릭하여 상세 정보로 이동
$(function(){
	
	iconChange()
	toPayment();
	$("#shoppingCart").on("click",function(){
		$("#exampleModalCenter").modal("show");
	})
	
	 $("img.productImage").on("click",function(){
		 $("#shoppingCart").trigger("click");

  		var Element ="<div class='product'>"
  		    Element+="<div class='form-group mb-3'>";
			Element+="<kbd>상품번호 : <span class='purchaseProductNo'>"+$(this).next().val()+"</span></kbd><span class='name text-center purchasePrice'>"+ $(this).next().next().next().children().first().text()+"</span> <input class='purchaseProductQuantity text-right'   style=' width: 154px;'  type='number' min='1' step='1' value='1'> &nbsp;개수 &nbsp; &nbsp; &nbsp; <input type='text' class='text-right'  style=' width: 154px; border-color: #00ff0000;' value="+numberWithCommas($(this).next().next().val())+" readonly > 원  &nbsp;  &nbsp; &nbsp;<i class='fas fa-times'></i>"
  			Element+="</div></div>"
  	  
  			
  		$("div.modal-body > div > form.form-inline").append(Element);	
  		iconChange()
  		xClick();
  		
  		var prodPrice = $(this).next().next().val();
		
  		priceChange(prodPrice)

 	 });//end of click
 	 
	

 		
 	 // x 클릭하면
 	 function xClick(){
	 	 $("i.fas.fa-times").on("click",function(){
	 		$(this).parent().parent().remove()
	 		iconChange()
	 	 });
	 	 
 	 }
 	 function priceChange(prodPrice){
		$("input[type='number']").on('change',function(){
			
			$(this).next().val( numberWithCommas (prodPrice*$(this).val()))
		});
 	 }
 	 
 	 function iconChange(){
 		 if($.trim($("form.form-inline").html())==""){
 			 $("#shoppingCart").css("opacity","0.5");
 		 }else{
 			 $("#shoppingCart").css("opacity","1");
 		 }
 	 }
 	 
 	function toPayment(){
 		$("#toPayment").on("click",function(){
 			
 			var totalPurchaseProductNo="";
 			var totalPurchasePrice=0;
 			var totalPurchaseProductQuantity="";
 			
 			//상품번호
 			$("span.purchaseProductNo").each(function(index, item){ 
 				totalPurchaseProductNo+=$(item).text()+",";
 				
 			})
 			
 			//상품가격
 			$("form > div > div > input[type=text]").each(function(index, item){
 				totalPurchasePrice+= parseInt( removeComma( $(item).val() ) )
 			});
 			
 			//상품수량
 			$("form > div > div > input.purchaseProductQuantity").each(function(index, item){
 				totalPurchaseProductQuantity+= $(item).val()+",";
 			});
 			
 			//최종 상품번호
 			totalPurchaseProductNo = totalPurchaseProductNo.substring(0,totalPurchaseProductNo.length-1);
 			// 최종 상품수량
 			totalPurchaseProductQuantity = totalPurchaseProductQuantity.substring(0,totalPurchaseProductQuantity.length-1);
 			// 최종 상품가격
 			totalPurchasePrice;
 			
 			//퀵오더 정보
 			$("input[name='purchaseProductNo']").val(totalPurchaseProductNo);
 			$("input[name='purchaseProductQuantity']").val(totalPurchaseProductQuantity);
 			$("input[name='purchasePrice']").val(totalPurchasePrice)
 			
 			//예매 정보
 			$("input[name='movieName']").val('${ticketing.movieName}')
 			$("input[name='theaterName']").val('${ticketing.theaterName}')
 			$("input[name='dateTimeNo']").val('${ticketing.dateTimeNo}')
 			$("input[name='screenTime']").val('${ticketing.screenTime}')
 			$("input[name='audienceType']").val('${ticketing.audienceType}')
 			$("input[name='seatType']").val('${ticketing.seatType}')
 			$("input[name='seatNo']").val('${ticketing.seatNo}')
 			$("input[name='headCount']").val('${ticketing.headCount}')
 			$("input[name='ticketingPrice']").val('${ticketing.ticketingPrice}')
 			
 			$("form#finalData").attr("method","POST").attr("action","/payment/preparePayment").submit();
 			
 		});
 		
 		
 	}
});

</script>
<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>