<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!doctype html>
<html lang="ko">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 	jQuery...  -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="<c:url value="/resources/javascript/jquery.barrating.min.js" />"></script> 
    <script src="<c:url value="/resources/javascript/rater.min.js" />"></script> 

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    
    <!-- fontawesome CDN -->
    <script src="https://kit.fontawesome.com/e464a52b8d.js" crossorigin="anonymous"></script>
     
    <!--  IMP cdn -->
	<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
     
<!--      jQuery Redirect v1.1.3 cdn -->
	<script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js" type="text/javascript"/>
	
<!-- 	SweetAlert2 CDN -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>
	
<!-- 	Google web font -->
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
	<!--     Common Css -->
    <link rel="stylesheet" href="/resources/css/common.css?atddr">
	
<!-- 	Payment Css -->
    <link rel="stylesheet" href="/resources/css/payment.css?afddr">	
    
    <!--     movie css -->
    <link rel="stylesheet" href="/resources/css/movieIcon.css?aefdr">
	
	
	
    <style type="text/css">
    
/* 	div 안에 element들 가운데 정렬 */
	.row div {
		float: none;
/* 		margin: 0 auto; */
	}
	
/* 	하단바 마이너스 모양 흰색으로.. */
	.whiteSym{
		color : white;
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

    </style>
    
	<script type="text/javascript">
	
// 	JavaScript에서 사용하기 위해 전역변수 처리..
// 	회원정보
	var userName;
	var phone;

// 	결제를 위한 변수들
	var ticketingPrice;

	var productNo;
	var productQuatity;
	var purchasePrice;
	
	var totalPrice;
	var voucherPrice=0;
	var partPoint=0;
	var totalDiscount;
	var cash;
	
	var usingVoucherid = '';
	
// 	해당 회원이 사용할 수 있는 voucher List
	if (${! empty voucherJSONArray}) {
		var voucherList = JSON.parse('${voucherJSONArray}');

		console.log(" voucherList : "+voucherList)
		console.log(" voucherListddd : "+voucherList[0].invenPrice)
		console.log(" voucherList.length : "+voucherList.length);
		
	}


// 	if ('${! empty voucherJSONArray}') {
// 		for (var i = 0; i < voucherList.length; i++) {
			
// 		}
// 	}
	
// 	해당 회원이 select한 voucher List
	var usingVoucherList = new Array();
	
	
		
// 	var ticketingNo;
// 	var purchaseNo;

	
	function IMPCard(){
		
		IMP.request_pay({
			pg : 'html5_inicis', //ActiveX 결제창은 inicis를 사용
			pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
// 			merchant_uid : 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
			amount : cash,
			buyer_name : userName,
			buyer_tel : phone, 			//누락되면 이니시스 결제창에서 오류
			name : 'mmm_Import_Payment'
		}, function(response) {			//결제 후 호출되는 callback함수	
			
			if ( response.success ) { 	// imPort 결제 성공
				console.log('--- imPort결제 성공.. : '+JSON.stringify(response));
// 				alert('usingVoucherid  : '+ usingVoucherid);
			
				// form 양식 없이 POST로 보내는 jQuery.. cdn..
				$.redirect("/payment/addPayment", 				//보낼 url
							{	"movieName" : '${movie.movieTitle}',			//properties for Ticking VO 
								"theaterName" : '${ticketing.theaterName}',
								"screenTime" : '${ticketing.screenTime}',
								"audienceType" : '${ticketing.audienceType}',
								"dateTimeNo" : '${ticketing.dateTimeNo}',
								"seatType" : '${ticketing.seatType}',
								"seatNo" : '${ticketing.seatNo}',
								"headCount" : '${ticketing.headCount}',
// 								"ticketingPrice" : '${ticketing.ticketingPrice}',
								"ticketingPrice" : ticketingPrice,
								"purchaseProductNo" : '${purchase.purchaseProductNo}',//properties for purchase
								"purchaseProductQuantity" : '${purchase.purchaseProductQuantity}',
// 								"purchasePrice" : purchasePrice,
								"purchasePrice" : '${purchase.purchasePrice}',
								"totalPrice" : totalPrice,						//properties for Payment
								"usingPoint" : partPoint,
								"vouchers" : usingVoucherid,
								"cash" : cash,
								"impUid" : response.imp_uid
								},
								"POST");							//보낼 Http Method
// 							"_blank");							//새창에 띄울 것인지..
			
			
			
// // 				[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달.
// 				$.ajax({
// 					url : "/payment/addPayment",
// 					type : "POST",
// 					dataType : "json",
// 					data : {
// 						imp_uid : response.imp_uid
// // 						기타 필요한 데이터가 있다면 추가 전달
// 					}
// 				}).done(function(data){
// 					if(response.success){
// 						console.log("done.....");
// 						console.log("response.imp_uid : "+ response.imp_uid);			//고유 ID
// 						console.log("response.merchant_uid : "+ response.merchant_uid);	//상점 거래 ID
// 						console.log("response.paid_amount : "+ response.paid_amount);	//결제 금액
// 						console.log("response.apply_num : "+ response.apply_num);		//카드 승인번호
// 					}
					
// 				});
			
			} else {
				alert('결제실패 : ' + response.error_msg);
			}
		})
	};
		
	//천단위 콤마 String으로
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	// 콤마 찍힌 String에서 콤마제거하고 Number로
	function removeComma(str){
	     return parseInt(str.replace(/,/g,""));
	}
	
	$(function(){
		
// 		회원 정보 세션에서 가져와서 넣어주자
		userName = '${user.userName}';
		phone = '${user.phone}';	
		totalPoint = '${totalPoint}'
		
// 		사용가능한 상품권 목록을 넣어준다

		if (voucherList != undefined) {
			var voucherDisplay = '<option selected>사용 가능한 상품권을 선택하세요</option>';
			for (var i = 0; i < voucherList.length; i++) {
				voucherDisplay += "<option value='"+voucherList[i].invenNo+"'>";
				voucherDisplay += voucherList[i].invenName+"("+ voucherList[i].invenPrice+"원)</option>";
			}		
		}else if(voucherList == undefined){
			voucherDisplay += '<option selected>사용 가능한 상품권이 없습니다.</option>';		
		}
		
		$('select[name=select-voucher]').html(voucherDisplay);
		
// 		$('#barPartPoint').on("propertychange", function(){
			
// 			console.log('바뀌었다!!!');
			
// 		});
		
// 		상품권 선택 못하도록...
		$('button[name=addVoucher-btn]').hide();
		
		
		
// // 		예매번호 및 구매번호 넣어주자
// 		ticketingNo = '${ticketing.ticketingNo}';
// 		purchaseNo = '${purchase.purchaseNo}';
		
		console.log(userName+ " / " + phone);
// 		var ticketingPrice; 	
// 		var purchasePrice;
// 		var totalPrice;
		
// 		화면 세팅을 위해 변수처리	
// 		1-1. 예매 가격
		if (${!empty ticketing.ticketingPrice}) {
			ticketingPrice = "${ticketing.ticketingPrice}";
// 			console.log('inner ? : ' + ticketingPrice);
			$("span[name='barTicketingPrice']").text(numberWithCommas(ticketingPrice));	
		}
// 		console.log('outer ? : ' + ticketingPrice);
		
		if (${empty ticketing.ticketingPrice}) {
			console.log('${ticketing.ticketingPrice}');			
			ticketingPrice = 0;
			$("span[name='barTicketingPrice']").text(ticketingPrice);	
// 			ticketingPrice = 16500;
		}
		
// 		1-2. 구매 가격
		if (${!empty purchase.purchasePrice}) {
			purchasePrice = "${purchase.purchasePrice}";

			$('span[name="barPurchasePrice"]').text(numberWithCommas(purchasePrice));
		}
		if (${empty purchase.purchasePrice}) {
			purchasePrice = 0;
			$('span[name="barPurchasePrice"]').text(purchasePrice);
// 			purchasePrice = 3500;
		}
		
// 		1-3. 총결제금액
		totalPrice = ticketingPrice*1 + purchasePrice*1;
		
		console.log("   ticketingPrice  : "+ ticketingPrice);
		console.log("   purchasePrice  : "+ purchasePrice);
		console.log("   totalPrice  : "+ totalPrice);
		
// 		name으로 화면 세팅
		$('span[name="barTotalPrice"]').text( numberWithCommas(totalPrice) );
		
		
		
		
// 		2-1 상품권 금액/////////////////////////////////// 작성해야
		
// 		2-2 사용 포인트
// 		포인트 입력이 끝나고 하단바에 포인트 업데이트(이벤트 blur와 keyup.. blur는 필요 업는듯)
// 		partPoint;
		totalDiscount=0;
		cash = totalPrice;
		
// 		하단바 (총할인금액, 최종결제금액) 초기 세팅
		$("#barPartPoint").text(0);
		$('#barTotalDiscount').text(numberWithCommas(totalDiscount));
		$('#barCash').text(numberWithCommas(cash));
		

		$("#partPoint").on("keyup",  function(){
			
// 			 숫자만 오도록.. 정규 표현식
			var regexp = /^[0-9]*$/
			partPoint = $(this).val();
			if( !regexp.test(partPoint) ) {
				Swal.fire({
					text: '숫자만 입력하셔야 해요.',
					icon: 'error',
					confirmButtonText: "확인"
				});
				$(this).val('');
			}
			
			
			console.log("partPoint"+ $(this).val())
			console.log("totalPoint "+totalPoint);

// 			보유포인트보다 큰 숫자를 쓰지 못하도록
// 			숫자로 처리... 1을 곱한다
			if(partPoint*1 > totalPoint*1){

				$(this).val(totalPoint) ;
				$("#barPartPoint").text(totalPoint);
				Swal.fire({
					text: '가지고 계신 포인트보다 많은 숫자를 입력하셨어요.',
					icon: 'error',
					confirmButtonText: "확인"
				});
				return;
			}
			
// 			총 결제금액보다 큰 숫자를 쓰지 못하도록
			if(partPoint*1 > totalPrice*1){

				$(this).val(totalPrice) ;
				$("#barPartPoint").text(totalPrice);
				
				Swal.fire({
					text: '총 결제금액보다 더 큰 포인트를 사용하실 수 없어요.',
					icon: 'error',
					confirmButtonText: "확인"
				});
			}
			partPoint = $(this).val();
			$("#barPartPoint").text(numberWithCommas($(this).val()));
			
			console.log("partPoint  : " + partPoint)
			
	// 		2-3 총할인금액
	// 		할인금액이 없을 경우 0으로 ..
// 			나중에 상품권 금액도 더해라!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// 			if (partPoint != 0) {

// 				console.log("----------"+ totalDiscount);
// 				partPoint += Number($(this).val());
// 			}
			totalDiscount = (voucherPrice*1 + partPoint*1)*1;
			$('#barTotalDiscount').text(numberWithCommas(totalDiscount))
			
			console.log("totalDiscount  : "+ totalDiscount);
			
	// 		3. 최종결제금액
			cash = totalPrice - totalDiscount;
			console.log(" cash :  " +cash);
			$('#barCash').text(numberWithCommas(cash));
		});
		
		
	
// 		상품권 3장까지만 사용 가능하도록..
		var addVoucherCnt = 0;
		

		
// 		상품권 3장까지 추가하는 function
// 		$('button[name="addVoucher-btn"]').on("click", function(){
// 		새로 추가되는 애들은 못잡을 수도 있기 때문에 document안에서 찾도록 .. 두번째 parameter는 이벤트걸리는 대상
		$(document).on("click", "button[name='addVoucher-btn']", function(){
			var voucher_btn = $(this);
			
			var voucher = "<div class='form-inline form-group text-center' >";
				voucher += "<label for='select-voucher' class='col-sm-4 control-label'>상품권</label>";
			    voucher += "<div class='col'>";
			    voucher += "<select class='custom-select custom-select-md-3 custom-select-sm' name='select-voucher'>";
			    voucher += "<option selected>사용 가능한 상품권을 선택하세요</option>";
			    
				for (var i = 0; i < voucherList.length; i++) {
					voucher += "<option value='"+voucherList[i].invenNo+"'>";
					voucher += voucherList[i].invenName+"("+ voucherList[i].invenPrice+"원)</option>";
				}		
			    voucher += "</select>";
				voucher += "<button type='button' name='addVoucher-btn' class='btn btn-md'>"  
				voucher += "<i class='far fa-plus-square'></i>"  
				voucher += "</button>"  
				voucher += "</div>"  
				voucher += "</div>"  
			
            
			if (addVoucherCnt <2) {
				addVoucherCnt += 1;
				voucher_btn.parent().parent().parent("div.card-body").append(voucher);
				
				$('button[name=addVoucher-btn]').hide();
				
				console.log('vouCNT  : ' + addVoucherCnt )
			}else if(addVoucherCnt >1) {
// 				alert("상품권은 최대 3장까지 사용이 가능합니다.");
				Swal.fire({
					text: '상품권은 최대 3장까지 사용이 가능해요.',
					icon: 'error',
					confirmButtonText: '확인'
				})
			}
		});
		
		
//	 	상품권 하나 선택하면 사용가능 목록에서 선택된 상품권 목록으로 이동시키는..
		$(document).on("change", "select[name='select-voucher']", function(){
			
			var selectedVoucher = $(this).children('option:selected').val();
			
// 			alert("선택된 상품권 번호 :  "+selectedVoucher);
			
			var index = voucherList.findIndex(voucher => voucher.invenNo == selectedVoucher);
			console.log(" index " + index);
			
			usingVoucherList.push(voucherList[index]);
			
//	 		usingVoucherList
			if(index !== undefined) voucherList.splice(index, 1);
			
			console.log("-----------after VoucherList.length :: " + voucherList.length )
			console.log("-----------after VoucherList :: " + JSON.stringify(voucherList) )
			console.log("-----------after usingVoucherList.length :: " + usingVoucherList.length )
			console.log("-----------after usingVoucherList :: " + JSON.stringify(usingVoucherList) )
			
			voucherPrice = 0;
			for (var i = 0; i < usingVoucherList.length; i++) {
				
// 				console.log("usingVoucherList[i].invenPrice   : " + usingVoucherList[i].invenPrice)			
				voucherPrice += usingVoucherList[i].invenPrice;
			}
			
			if(voucherPrice*1 > totalPrice*1){

				Swal.fire({
					text: '총 결제금액보다 더 큰 상품권을 사용하실 수 없어요.',
					icon: 'error',
					confirmButtonText: "확인"
				});
				
				voucherPrice = 0;
// 				$(this).val('');
				$(this).children(' option:first').attr('selected',true);
				return;
			}
			
			
			
			$('#barVoucherPrice').text(numberWithCommas(voucherPrice));
			
			console.log('voucherPrice  : ' + Number(voucherPrice));
			console.log("partPoint  : " + partPoint);
			console.log("totalDiscount  : "+ totalDiscount);

			
			totalDiscount = (voucherPrice*1 + partPoint*1)*1;
			$('#barTotalDiscount').text(numberWithCommas(totalDiscount))
			
			
			// 		3. 최종결제금액
			cash = totalPrice - totalDiscount;
			console.log(" cash :  " +cash);
			$('#barCash').text(cash);
			
			if(addVoucherCnt != 2){
				$('button[name=addVoucher-btn]').show();
			}
		});
		
		
// 		IMP  page onload 시 init 해줘야한다. IMP.init(가맹점식별코드)
		IMP.init('imp58134678');
		
// 		import 모달 띄우는 이벤트
		$("#imp-btn").on("click", function(){
				
			
// 			alert("usingVoucherList"  + usingVoucherList);
			for (var i = 0; i < usingVoucherList.length; i++) {
				usingVoucherid += usingVoucherList[i].invenNo;
				
				if (i != usingVoucherList.length-1) {
					usingVoucherid += ","
				}
			}
			
// 			alert("usingVoucherid"  + usingVoucherid);
			
			IMPCard();
		});
		
	});
	




	</script>
    
    <title>mmm</title>
  </head>
  <body>
    
	  <div class="album py-5 bg-light">
	    <div class="container">
	    
	    
	      <div class="col-10 div-center-cs" >
	   		<div>
	   		  <h3><strong>결제하기</strong></h3>
	   		  <div class="row border-bottom mb-2"></div>
	   		    <p>결제하시기 전에 예매 및 구매 내용을 확인해주세요.</p>
	   		</div>
	   		
<!-- 	   		각 카드의 header에 넘버링할 숫자  -->
	   		<c:set var="i" value="0"/>
	   		
	   		
	   		<c:if test="${ticketing.ticketingPrice > 0}">
<!-- 	   		예매정보 -->
		   		<div class="card mb-4">
				  <div class="card-header text-white bg-dark" >
				    <h5 class="card-title mb-0">${i+1}. 예매정보</h5>
			   		<c:set var="i" value="${i+1}"/>
				  </div>
				  <div class="card-body">
				     <div class="row mb-3 align-items-center">
					     <div class="col-md-4 text-center">
					      <c:if test="${movie.poster != null }">
				        	<img id='poster' height="200" width="144" src="${movie.poster}"/>
				          </c:if>
				          <c:if test="${movie.poster == null }">
				        	<img id='poster' height="200" width="144" src="http://placehold.it/144x200/E8117F/ffffff?text=sample"/>
				          </c:if> 
				         </div>
				         <div class="col-md-6 m-3 ">
				           <div class="border-bottom p-2">
				              <span class="col-md-4"><h5 class="d-inline font-bolder-cs">${movie.movieTitle}</h5></span> 
				              <span class="col-md-2">
				              		<c:choose>
										<c:when test="${movie.movieRating ne null && movie.movieRating=='전체관람가'}">
											<em class = "ico_movie allrating">${movie.movieRating}</em>
										</c:when>
										<c:when test="${movie.movieRating ne null && movie.movieRating=='12세이상관람가'}">
											<em class = "ico_movie rating12">${movie.movieRating}</em>
										</c:when>
										<c:when test="${movie.movieRating ne null && movie.movieRating=='15세이상관람가'}">
											<em class = "ico_movie rating15">${movie.movieRating}</em>
										</c:when>
										<c:when test="${movie.movieRating ne null && movie.movieRating=='청소년관람불가'}">
											<em class = "ico_movie rating19">${movie.movieRating}</em>
										</c:when>
									</c:choose>
				              </span></div>
				          
				           <table class="table table-borderless table-sm m-2 ">
							  <tbody>
							    <tr>
							      <th class="head-cs">극장</th>
							      <td scope="col">${ticketing.theaterName}</td>
							    </tr>
							    <tr>
							    
	<!-- 						    규비쓰꺼 날 짜 형식 변환 가져다 쓰기  -->
							      <th class="head-cs">상영일시</th>
							      <td scope="col">${ticketing.screenTime}</td>
							    </tr>
							    <tr>
							      <th class="head-cs">관객 정보</th>
							      <td scope="col">${ticketing.headCount} 명<br> ${ticketing.audienceType}</td>
							    </tr>
							    <tr>
							      <th class="head-cs">좌석 정보</th>
							      <td scope="col"> ${ticketing.seatNo} <br> ${ticketing.seatType}</td>
							    </tr>
							  </tbody>
							</table>
				         </div>
			         </div>
<!-- 				  	 <div class="m-3"></div> -->
<!-- 				  	 <div class="bg-dark font-yellow-cs"> -->
<!-- 					   <h5 class="text-right">예매 금액 : <span name="barTicketingPrice"></span>원</h5>			  	  -->
<!-- 				  	 </div> -->
				  </div>
				  <div class="card-footer bg-dark font-yellow-cs">
				    <h5 class="text-right">예매 금액 : <span name="barTicketingPrice"></span>원</h5>
				  </div>
				</div>
	   		</c:if>
	   		
	   		
	   		
	   		
<!-- 	   		구매정보 -->
	   		<c:if test="${purchase.purchasePrice > 0}">
				<div class="card mb-4">
				  <div class="card-header text-white bg-dark" >
				    <h5 class="card-title mb-0">${i+1}. 구매정보</h5>
			   		<c:set var="i" value="${i+1}"/>
				  </div>
				  <div class="card-body">
				  	<div>
				  	
						  <table class="table table-hover text-center">
							  <thead class="thead">
							    <tr >
							      <th scope="col" class="align-middle">상품 이미지</th>
							      <th scope="col" class="align-middle">상품명</th>
							      <th scope="col" class="align-middle">상품 가격</th>
							      <th scope="col" class="align-middle">수량</th>
							      <th scope="col" class="align-middle">총 가격</th>
							    </tr>
							  </thead>
							  <tbody>
					  
					  
						  	<c:forEach var="prod" items="${prodList}">
						      <tr >
						        <th scope="col"><img src="/resources/image/${prod.prodImage}" width="70px" height="70px" /></th>
						        <td scope="col" class="align-middle">${prod.prodName}</td>
						        <td scope="col"  class="text-right align-middle" >
						        	<fmt:formatNumber value="${prod.prodPrice}" type="currency" currencySymbol=""/>원
						        </td>
						        <td scope="col" class="align-middle">${prod.quantity}개</td>
						        <td scope="col" class="text-right font-weight-bold align-middle">
						        	<fmt:formatNumber value="${prod.quantity * prod.prodPrice}" type="currency" currencySymbol=""/>원	
						        </td>
						      </tr>					  	
					       </c:forEach> 
				       
		        			  </tbody>
						</table> 
				         
<!-- 					  	 <div> -->
<!-- 						   <h5 class="text-right text-primary">구매 금액 : <span name="barPurchasePrice"></span>원</h5>			  	  -->
<!-- 					  	 </div> -->
				  	 
				  	 </div>
<!-- 				  	 end of card-body -->
				  </div>
 				  <div class="card-footer bg-dark font-yellow-cs">
				    <h5 class="text-right">구매 금액 : <span name="barPurchasePrice"></span>원</h5>
				  </div>
				</div>
			</c:if>
			
<!-- 	   		자체 결제수단 -->
			<div class="card mb-5">
			  <div class="card-header text-white bg-dark" >
			    <h5 class="card-title mb-0">${i+1}. 포인트 및 상품권</h5>
			  </div>
			  <div class="card-body text-center">
                  
                     <div class="form-inline form-group text-center" >
                      <label for="partPoint" class="col-sm-4 control-label">포인트</label>
                      <div class="col">
                       <input type="text" class="form-control" id="partPoint" 
                       placeholder="보유포인트: ${totalPoint}">
                      </div>
                     </div>

                     <div class='form-inline form-group text-center' >
                      <label for='select-voucher' class='col-sm-4 control-label'>상품권</label>
                      <div class='col'>
                          <select class='custom-select custom-select-md-3 custom-select-sm' name='select-voucher'>
                              
                              
<%--                               <c:forEach var='inven' items="${invenList}"> --%>
<%-- 	                              <option value='${inven.inventoryNo}'> --%>
<%-- 	                              	${inven.inventoryName}( ${inven.inventoryPrice}원) --%>
<%-- <%-- 	                              	<input class="voucherPrice" type="hidden" value="${inven.inventoryPrice }"/> --%> --%>
<!-- 	                              </option> -->
<%--                               </c:forEach> --%>
                              
                              
                           </select>
                          <button type='button' name='addVoucher-btn' class='btn btn-md'>
                            <i class='far fa-plus-square'></i>
                          </button>
                      </div>
                     </div>	
					   
		         </div>
		         
		     
			  </div>
			</div>
		  </div>
			
<!-- 			하단 진행바 -->
			<div class="fixed-bottom p-3 bg-dark text-center ">
	   		  <div class="row col-auto align-items-center div-center-cs">
	   		  
<!-- 	    총결제금액 -->
	   		    <div class="card col-md-3 mb-2 p-0 div-center-cs">
	   		      <div class ="card-header bg-yellow-cs">
	   		        <h6 class="p-0 m-0 font-bolder-cs" > 총 결제금액 </h6>
	   		      </div>  
<!-- 	   		      얘네 분기문 처리 해줘야... -->
				  <div class="card-body text-right p-2 ">
	   		        <p class="small m-1">(+) 예매 금액 : <span name="barTicketingPrice"></span>원<p>
	   		        <p class="small m-1">(+) 구매 금액 : <span name="barPurchasePrice"></span>원<p>
				  </div>
				  <div class="card-footer p-2">
	   		        <h6 >(+) 총 결제금액 : <span name="barTotalPrice"></span>원<h6>
				  </div>
	   		    </div>
	   		    
<!-- 	     마이너스  -->
	   		    <div class="col-1">
	   		      <i class="fas fa-minus-circle whiteSym"></i>
	   		    </div>
	   		    
<!-- 	      총할인금액 -->
	   		    <div class="card col-md-3 mb-2 p-0 div-center-cs">
	   		     <div class ="card-header bg-yellow-cs">
	   		        <h6 class="p-0 m-0 font-bolder-cs"> 총 할인금액 </h6>
	   		      </div>  
	   		      
	   		      <div class="card-body text-right p-2 ">
	   		        <p class="small m-1">(-) 상품권 금액 : <span id="barVoucherPrice"></span>원<p>
	   		        <p class="small m-1">(-) 사용 포인트 : <span id="barPartPoint"></span>원<p>
				  </div>
				  <div class="card-footer p-2">
	   		        <h6 >(-) 총 할인금액 : <span id="barTotalDiscount"></span>원</h6>
				  </div>
	   		    </div>
	   		    
<!-- 	   	 이퀄 -->
	   		    <div class="col-1">
	   		      <i class="fas fa-equals whiteSym"></i>
	   		    </div>
	   		    
<!-- 	     최종결제금액 -->
<!-- 	   		    <div class="card col-md-3 mb-2 pb-4 pt-1"> -->
   	   		    <div class="card col-md-3 mb-2 p-0 div-center-cs">
	   		      <div class ="card-header bg-yellow-cs">
	   		     	 <h6 class="p-0 m-0 font-bolder-cs"> 최종결제금액 </h6>
	   		      </div>  
	   		      <div class="card-body  p-2 ">
	   		      	<h5 text-right> <span id="barCash"></span>원 </h5>
	   		      	<input type	="hidden" id="impPrice">
	   		      	<button type="button" id="imp-btn" class="btn btn-warning btn-sm text-center">결제하기</button>
				  </div>
	   		    </div>
	   		    
	   		  </div>
	   		</div>
	   		
	   		
	   		
		</div>
<!-- 		end of container -->
      </div>

  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  </body>
</html>

