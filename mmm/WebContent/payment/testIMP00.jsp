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

<!--  IMP cdn -->
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
    
	<script type="text/javascript">
	
	function IMPCard(){
	
		IMP.request_pay({
			pg : 'html5_inicis', //ActiveX 결제창은 inicis를 사용
			pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
			merchant_uid : 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
			amount : 100,
			buyer_name : '홍길동',
			buyer_tel : '01000000000', //누락되면 이니시스 결제창에서 오류
			name : '결제테스트'
		}, function(response) {
			//결제 후 호출되는 callback함수
			if ( response.success ) { //결제 성공
				console.log(response);
			
// 				[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달.
				$.ajax({
					url : "/payment/json/getPayinfo",
					type : "POST",
					dataType : "json",
					data : {
						imp_uid : response.imp_uid
// 						기타 필요한 데이터가 있다면 추가 전달
					}
				}).done(function(data){
					if(response.success){
						console.log("done.....");
						console.log("response.imp_uid : "+ response.imp_uid);			//고유 ID
						console.log("response.merchant_uid : "+ response.merchant_uid);	//상점 거래 ID
						console.log("response.paid_amount : "+ response.paid_amount);	//결제 금액
						console.log("response.apply_num : "+ response.apply_num);		//카드 승인번호
					}
					
				});
			
			} else {
				alert('결제실패 : ' + response.error_msg);
			}
		})
	};

	$(function(){
// 		IMP  page onload 시 init 해줘야한다. IMP.init(가맹점식별코드)
		IMP.init('imp58134678');
		
		$("#test-btn").on("click", function(){
			IMPCard();
		});
		
	});
	
	</script>
    
    <title>testAPI</title>
  </head>
<body>

<button id="test-btn"> 아이엠</button>

</body>
</html>