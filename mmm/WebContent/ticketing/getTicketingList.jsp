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
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>  
  
  <!-- font Awesome -->
  <script src="https://kit.fontawesome.com/b435a047df.js" crossorigin="anonymous"></script>
  	
<title>mmm</title>

<style>

.modal-backdrop {
    background-color: rgba(0, 0, 0, 0.2);
    opacity: 1;
}

#body {
	
	font-family: 'Noto Sans KR', sans-serif !important;

}

div.ticketingHeader h3 {
	display : inline;
	float : left;
}

div.ticketingHeader h6 {
	line-height: 50px;
}

div.ticketingBody div div.ticketingTitle.row div.col-6 {

    background-color: #D1D0DF;
}

/* 세로줄 */
.vl {
  border-left: 1px solid rgba(0,0,0,.1);
  margin-left: 80px;
}

div.container.getTicketingList {
	margin-top : 47px;

}

button.cancelButton {
	outline: 1px hidden #000;
	background-color: white;
	color: black;
	display: block;
	float: left;
	width: 100%;
	position : relative;
	top : 108px;

}

#cancelToast {
		width : 300px;
		position:fixed;
		right:30px;
		bottom:0px;
		z-index:2000;
		cursor : pointer;
}


#cancelToast > div.toast-header > i {
		position : relative;
		top : 1px;	
		right : 2px;
}

#cancelToast > div.toast-header {
		background-color : #fee50e;
		color: #333;
}

div.ticketingPagination.row > div:nth-child(2) > ul {
	position : relative;
	left : 70px;
}

.page-item.active .page-link {
    z-index: 3;
    color: #212529;
    background-color: #fee50e;
    border-color: #fee50e;
}

#modalButton {
	background-color: #fee50e;
	border-color : #fee50e;
	color : #333;
}

.page-link {
	color: #212529;

}

#ticketingCancel > div > div > div.modal-header{
	background-color: #fee50e;
	border-color : #fee50e;
	color : #333;
}


</style>
</head>
<body id="body">
	
	<div class="container getTicketingList">
		<div class="getTicketingList">
				<div class="ticketingHeader row">
						<h3 class="mb-0"><strong>나의 예매내역</strong></h3><h6 class="mb-0">(항목을 <kbd>Click</kbd>하여, 상세확인 가능합니다)</h6>
				</div>
				<div class="ticketingBody row">
					<div class="ticketingBodyIn col-md">
						<div class="ticketingTitle row">
							<div class="col-6 text-center border-right">
								<button type="button" class="btn btn-dark booked">예매 내역</button>
							</div>
							<div class="col-6 text-center border-left">
								<button type="button" class="btn btn-dark cancel">취소 내역</button>
							</div>
						</div>
						<div class="ticketingContent">
						<c:forEach var="i" items="${ticketingList }">
							<fmt:formatDate var="ticketingDate" value="${i.ticketingDate }" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="cancelDate" value="${i.cancelDate }" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="ticketingDay" value="${i.ticketingDate }" pattern="E"/>
							<fmt:formatDate var="cancelDay" value="${i.cancelDate }" pattern="E"/> 
							<fmt:formatDate var="ticketingHM" value="${i.ticketingDate }" pattern="HH:mm"/>
							<fmt:formatDate var="cancelHM" value="${i.cancelDate }" pattern="HH:mm"/>
							<div class="ticketingContentIn row" >	
									<div class="col-6 border">
										<div class="row">
											<div class="col-5">
												<span class="contentImage"><img src="" alt="https://via.placeholder.com/100x100" class="img-thumbnail" width="100"></span>
											</div>
											<div class="col-7">
													<span class="contentMoiveName">${i.movieName}</span><br>
													<span class="contentPinNo"><kbd>예매번호: ${i.ticketingNo}</kbd></span><br>	
													<span class="contentDate">예매일시 : ${ticketingDate} (${ticketingDay}) ${ticketingHM}</span><br>
												<c:if test="${ cancelDate ne null}">  
													
													<span class="contentCancel">취소일시 : ${cancelDate} (${cancelDay}) ${cancelHM}</span>
												</c:if>
											</div>
										</div>
									</div>
									<div class="col-6 border">
										<div class="row">
											<div class="contentStatus col-8">
												<c:if test="${ i.ticketingStatus==0 }">
									    			<span class="contentStatus">예매완료</span>
									    		</c:if>
												<c:if test="${ i.ticketingStatus==1 }">
									    			<span class="contentStatus">예매취소</span>
									    		</c:if>									    		
									    	</div>
									    	<div class="afterButton col-4">
									    	    <c:if test="${ i.ticketingStatus==0 }">
									    	    	<button class="cancelButton" type="button" class="btn btn-primary"><strong>예매 취소</strong></button>
									    	    	<form id="cancelForm" action="/payment/cancelPayment" method="POST">
									    				
										    			<input type='hidden' name='ticketingNo' value='${i.ticketingNo}'>
									    			</form>
									    		</c:if>
									    	</div>
									    </div>
									</div>							
							</div><!-- end of ticketingContentIn -->	
						</c:forEach>
							</div><!-- end of ticketingContent -->
				  </div><!--  end of ticketingBodyIn -->
			  </div><!--  end of TicketingBody -->
			  <br><br>
			  <div class="ticketingPagination row">
			  		<div class="col-4"></div>
			  		<div class="col-4">
					  <ul class="pagination">
		   				 <!--  <<== 좌측 nav -->
		  				<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
		  					    <li class="page-item disabled">
     								 <a class="page-link" href="#" tabindex="-1" aria-disabled="true">«</a>
   								 </li>
		  				</c:if>
		  				<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
					   		<li class="page-item">
					   				 <a class="page-link" href="javascript:Pagination('${resultPage.beginUnitPage-1}')" tabindex="-1" aria-disabled="true">«</a>
   							</li>
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
					 <form name="contents">
					 	<input type="hidden" id="currentPage" name="currentPage" value=""/>
					 	<input type="hidden" id="searchCondition" name="searchCondition" value="${search.searchCondition }"/>
					 </form>
			  </div><!-- end of ticketingPagination -->
			  
					<!-- Modal -->
			<div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-scrollable modal-xl" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title ticketingNo" id="exampleModalScrollableTitle"><kbd>Modal title</kbd></h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <div class="row">
			        	<div class="col-1"></div>
			        	<div class="col-3 text-center">
			        		<div class="movieImage"><img src="https://via.placeholder.com/300x400" alt="..." class="img-thumbnail"></div><br>
			        		<div class="movieName font-weight-bold"></div><br>
			        		
			        		<div class="font-weight-bold">상영일시</div>
			        		<div class="dateTime"></div><br>
			        		
			        		<div class="font-weight-bold">예매 PIN NO</div>
			        		<div class="ticketingPinNo"></div><br>
			        	</div>
			        	<div class="col-2 text-center">
			        		<div class="vl h-100"></div>
			        	</div>			   
			        	<div class="modalTicketingInfo col-5 bg-gray-light">
			        		<div class="row pb-5">
			        			<div class="col-3 font-weight-bold">극장명</div>
			        			<div class="theaterName col-9"></div>
			        		</div>
			        		<div class="row pb-5">
			        			<div class="headCount col-3 font-weight-bold">관객타입(인원수)</div>
			        			<div class="audienceType col-9">
			        				<div class="normal"></div>
			        				<div class="youth"></div>
			        				<div class="special"></div>
			        			</div>
			        		</div>
			        		<div class="row pb-5">
			        			<div class="col-3 font-weight-bold">상영관</div>
			        			<div class="screenName col-9"></div>
			        		</div>
			        		<div class="row pb-5">
			        			<div class="col-3 font-weight-bold">좌석번호</div>
			        			<div class="seatNo col-9"></div>
			        		</div>
			        		<div class="row pb-5">
			        			<div class="col-3 font-weight-bold">결제수단</div>
			        			<div class="payMethod col-9"></div>
			        		</div>
			        		<div class="row pb-5">
			        			<div class="col-3 font-weight-bold">결제금액</div>
			        			<div class="totalPrice col-9"></div>
			        		</div>
			        		<div class="row pb-5">
			        			<div class="ticketingStatus col-3 font-weight-bold"></div>
			        			<div class="ticketingDate col-9"></div>
			        		</div>		        		
			        	</div>
			        	<div class="col-1"></div>     	
			        </div><!-- end of row -->
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div><!-- end of modal -->			  
		  </div><!-- end of getTicketingList -->	
	  </div><!-- end of Container -->

<!-- Modal -->
<div class="modal fade" id="ticketingCancel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">안내 창</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	 예매를 취소하시겠습니까?
      </div> 
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button>
        <button id="modalButton" type="button" class="btn btn-primary" >네</button>
      </div>
    </div>
  </div>
</div>

<div class="toast" style="display:none;" role="alert" aria-live="assertive" aria-atomic="true" id="cancelToast" data-animation="true" data-delay="10000">
  <div class="toast-header">
    <i class="far fa-bell"></i>
    <strong class="mr-auto">알림</strong>
    <small>방금</small>
    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
  <div class="toast-body">
           <strong>예매 취소가 완료되었습니다.</strong>
  </div>
</div>


<!-- ajax 모음 -->	  
<script>
function cancelTicketing(jqueryElement){
	$("#modalButton").off("click");
	$("#modalButton").on("click",function(){
		jqueryElement.next().submit();
	});
	//$("form#cancelForm").submit();
}

function activeCancel(){
	$("div.afterButton > button").on("click",function(){
		$("div#ticketingCancel").modal("show")
		
		cancelTicketing($(this));
	})
}

$(function(){
	console.log("${alarm}");
	<c:if test="${alarm eq '1'}">
		$('#cancelToast').css("display","block");
		$('#cancelToast').toast('show')
	</c:if>
		
	activeCancel();

	detail();
	
	//기본 화면일때 img추가 하기
	<c:forEach var="i" items="${ticketingList }" varStatus="status">
		ajaxPromise("/ticketing/json/getDateTime/"+${i.dateTimeNo}).then(
			data => {
				$($("span.contentImage img")[${status.index}]).attr("src",data.poster);
			}
	)
	</c:forEach>
	
	
	//상세 내역
	function detail(){
		$("div.ticketingContent > div > div:nth-child(1)").on("click",function(){
			
			var ticketingNo = $(this).find("span.contentPinNo").text().substring(6);
			
			ajaxPromise("/ticketing/json/getTicket/"+ticketingNo).then(
					data => {
						//예매번호 왼쪽상단
						$("div.modal-header h5.ticketingNo kbd").text("예매번호 : "+data.ticketingNo);
						
						//영화 포스터 
						ajaxPromise("/ticketing/json/getDateTime/"+data.dateTimeNo).then(
								data => {
									console.log(data)
									$("div.movieImage img").attr("src",data.poster);
								}
						)
						
						
						
						
						//영화제목
						$("div.movieName").text(data.movieName);
						
						//상영일시
						ajaxPromise("/ticketing/json/getDateTime/"+data.dateTimeNo).then(
							data => {
								$("div.dateTime").text( toYMD(data.screenDate)()+" "+toHM(data.screenTime)() );
							}		
						
						)
						
						//예매번호
						$("div.ticketingPinNo").text( data.ticketingPinNo);
						
						//극장명
						$("div.theaterName").text( data.theaterName);
						
						
						//관객타입, 인원수 찍기
						var audienceArray =data.audienceType.split(",");
						var Normal="";
						var Youth="";
						var Special="";
						for( var i in audienceArray){
							if(audienceArray[i]=="일반"){
								Normal+=audienceArray[i]
							}
							if(audienceArray[i]=="청소년"){
								Youth+=audienceArray[i]
							}
							if(audienceArray[i]=="우대"){
								Special+=audienceArray[i]
							}						
						}
						
						if(Normal.length>0){
							Normal = "일반 x "+Normal.length/2;
							$("div.normal").text( Normal);
						}else if(Normal.length==0){
							$("div.normal").css("display","none");
						}
						
						if(Youth.length>0){
							Youth = "청소년 x "+Youth.length/3;
							$("div.youth").text(Youth);
						}else if(Youth.length==0){
							$("div.youth").css("display","none");
						}
						
						if(Special.length>0){
							Special = "우대 x "+Special.length/2;
							$("div.special").text(Special);
						}else if(Special.length==0){
							$("div.special").css("display","none");
						}					
						
						$("div.headCount").text("관객타입("+data.headCount+")");
						
						ajaxPromise("/ticketing/json/getDateTime/"+data.dateTimeNo).then(
							data => {
								$("div.screenName").text(data.screenName);
							}		
						
						)
						
						//좌석번호
						$("div.seatNo").text(data.seatNo);
						
						$.getJSON("/payment/json/getPaymentbyTicketingNo/"+data.ticketingNo)
						.done( x=> {
							console.log(x.payment)
							//결제수단
							// 0: cash	1: point	2: voucher	3: cash+point
							// 4: cash+voucher		5: point+voucher	6: cash+point+voucher
							if(x.payment.payMethod==0){
								$("div.payMethod").text("현금");
								$("div.totalPrice").text(x.payment.cash);
							}else if(x.payment.payMethod==1){
								$("div.payMethod").text("포인트");
								$("div.totalPrice").text(x.payment.usingPoint);
							}else if(x.payment.payMethod==2){
								$("div.payMethod").text("상품권");
								$("div.totalPrice").text(x.payment.vouchers);
							}else if(x.payment.payMethod==3){
								$("div.payMethod").text("현금,포인트");
								$("div.totalPrice").text("현금 : "+x.payment.cash+" 포인트 : "+x.payment.usingPoint);
							}else if(x.payment.payMethod==4){
								$("div.totalPrice").text("현금 : "+x.payment.cash+" 상품권 : "+x.payment.vouchers);
							}else if(x.payment.payMethod==5){
								$("div.payMethod").text("포인트,상품권");
								$("div.totalPrice").text("포인트 : "+x.payment.usingPoint+" 상품권 : "+x.payment.vouchers)
							}else if(x.payment.payMethod==6){
								$("div.payMethod").text("현금,포인트,상품권");
								$("div.totalPrice").text("현금 : "+x.payment.cash+"포인트 : "+x.payment.usingPoint+" 상품권 : "+x.payment.vouchers)
							}
							
							
						})
						

						
						//예매일시
						//console.log(data.cancelDate.length)
						
						if(data.ticketingStatus==0){
							$("div.ticketingStatus").text("예매일시")
							$("div.ticketingDate").text(toYHMS(data.ticketingDate)());
						}else{
							$("div.ticketingStatus").text("취소일시")
							$("div.ticketingDate").text(toYHMS(data.cancelDate)());
						}
						
						//예매일시
						
						
						//$("div.modal-body").append()//내용 추가하기
					}
			
			);//end of then 
			$("#exampleModalScrollable").modal("show")
		});//end of function
	}
	//예매 내역 클릭
	$("div.ticketingTitle.row > div > button.booked").on("click",function(){
		
		$("#searchCondition").val("0")//예매 내역 으로
		
		var datas = JSON.stringify({
			currentPage : "1",
			searchCondition : "0",
		 		 })	 
		
		ajaxPromise("/ticketing/json/getBookedTicketList",datas).then( 
				data => {
					$(".ticketingContent").empty();					
						if(data.ticketingList.length!=0){
							for(var i=0; i<data.ticketingList.length; i++){
								var Element = "<div class='ticketingContentIn row'>"	
								    Element+= "<div class='col-6 border'>"
									Element+= "<div class='row'>"
									Element+= "<div class='col-5'>"
									Element+= "<span class='contentImage'><img src='' alt='https://via.placeholder.com/100x100' class='img-thumbnail' width='100'></span>"
									Element+= "</div>"
									Element+= "<div class='col-7'>"
									Element+= "<span class='contentMoiveName'>"+data.ticketingList[i].movieName+"</span><br>"
									Element+= "<span class='contentPinNo'><kbd>예매번호: "+data.ticketingList[i].ticketingNo+"</kbd></span><br>"
									Element+= "<span class='contentDate'>예매일시 : "+toYHM(data.ticketingList[i].ticketingDate)()+"</span><br>"
									Element+="</div>"
									Element+="</div>"
									Element+="</div>"
									Element+="<div class='col-6 border'>"
									Element+="<div class='row'>"
									Element+="<div class='contentStatus col-8'>"
													//예매 상태 추가								    		
								    Element+="</div>"
								    Element+="<div class='afterButton col-4'>"
													//버튼 추가
								    Element+="</div>"
								    Element+="</div>"
								    Element+="</div>"							
								    Element+="</div><!-- end of ticketingContentIn -->"
								    
								    
								    $(".ticketingContent").append(Element);
								    
								    
								    //예매 상태 추가
								    Element = "<span class='contentStatus'>예매완료</span>"
								    
								    $($("div.contentStatus")[i]).append(Element);									    
								    
					    			
					    			//예매 취소 버튼 추가
 					    			Element  = "<button class='cancelButton' type='button' class='btn btn-primary'><strong>예매 취소</strong></button>"
					    			Element += "<form id='cancelForm' action='/payment/cancelPayment' method='POST'>"

				    				Element += "<input type='hidden' name='ticketingNo' value='"+data.ticketingList[i].ticketingNo+"'>"
				    				Element += "</form>"
				    				
				    				$($("div.afterButton")[i]).append(Element);
				    				
				    				
				    				(function(x){
					    				ajaxPromise("/ticketing/json/getDateTime/"+data.ticketingList[x].dateTimeNo).then(
					    						data => {
					    							//console.log(data)
					    							//console.log(x)
					    							$($("span.contentImage img")[x]).attr("src",data.poster);
					    							
					    							
					    						}
					    						
					    				)//end of then
				    				})(i);//end of IIFE(Immediately Invoked Function Expression)
				    				
							}//end of for
								
								//페이지네이션 추가
								$("div.ticketingPagination.row").empty();
								
								Element = "<div class='col-4'></div>"
						  		Element +="<div class='col-4'>"
								Element +="<ul class='pagination'>"
					   			if(data.resultPage.currentPage <= data.resultPage.pageUnit){
					   				Element +="<li class='page-item disabled'>"
					   				Element +="<a class='page-link' href='#' tabindex='-1' aria-disabled='true'>«</a>"
					   				Element +="</li>"
					   			}else if(data.resultPage.currentPage > data.resultPage.pageUnit){
					   				Element +="<li class='page-item'>"
					   				Element +="<a class='page-link' href='javascript:Pagination("+(parseInt(data.resultPage.beginUnitPage)-1)+")' tabindex='-1' aria-disabled='true'>«</a>"
					   				Element +="</li>"
					   			}
								
					  			for(var i=data.resultPage.beginUnitPage; i<=data.resultPage.endUnitPage; i++){
					  				if(data.resultPage.currentPage==i){
					  					Element+="<li class='ge-item active' aria-current='page'>"
					  					Element+="<a class='page-link' href='javascript:Pagination("+i+")'>"+i+"<span class='sr-only'>(current)</span></a>"
					  					Element+="</li>"
					  				}else{
					  					Element+="<li class='page-item'>";
					  					Element+="<a class='page-link' href='javascript:Pagination("+i+")'>"+i+"</a>"
					  					Element+="</li>"
					  				}
					  				
					  			}//end of for
								
					  			if(data.resultPage.endUnitPage >= data.resultPage.maxPage){
					  				Element+="<li class='page-item disabled'>"
					  				Element+="<a class='page-link' href='#'>»</a>"
					  				Element+="</li>"
					  			}else if(data.resultPage.endUnitPage < data.resultPage.maxPage){
					  				Element+="<li class='page-item'>"
					  				Element+="<a class='page-link' href='javascript:Pagination("+(parseInt(data.resultPage.endUnitPage)+1)+") '>»</a>"
					  				Element+="</li>"
					  			}
								
					  			Element+= "</ul>"
								Element+= "</div>"
								Element+= "<div class='col-4'></div>"
								Element+= "<form name='contents'>"
								Element+= "<input type='hidden' id='currentPage' name='currentPage' value=''/>"
								Element+= "<input type='hidden' id='searchCondition' name='searchCondition' value='"+data.search.searchCondition+"'/>"
								Element+= "</form>"
								
								$("div.ticketingPagination").append(Element);
								
								$("#searchCondition").val(data.search.searchCondition);
								activeCancel()
								detail()
								
								//Pagination(1)
						}else{
							$("div.ticketingPagination.row").empty();
						}//end of if
					}//end of arrow function
						
		);//end of then
	});//end of eventHandler
	
	//취소 내역 클릭
	$("div.ticketingTitle.row > div > button.cancel").on("click",function(){
		
		$("#searchCondition").val("1")//취소 내역 으로
				
		var datas = JSON.stringify({
			currentPage : "1",
			searchCondition : "1",
		 		 })	 
		
		ajaxPromise("/ticketing/json/getBookedTicketList",datas).then( 
				data => {
					$(".ticketingContent").empty();
					if(data.ticketingList.length!=0){
						for(var i=0; i<data.ticketingList.length; i++){
							var Element = "<div class='ticketingContentIn row'>"	
							    Element+= "<div class='col-6 border'>"
								Element+= "<div class='row'>"
								Element+= "<div class='col-5'>"
								Element+= "<span class='contentImage'><img src='' alt='https://via.placeholder.com/100x100' class='img-thumbnail' width='100'></span>"
								Element+= "</div>"
								Element+= "<div class='col-7'>"
								Element+= "<span class='contentMoiveName'>"+data.ticketingList[i].movieName+"</span><br>"
								Element+= "<span class='contentPinNo'><kbd>예매번호: "+data.ticketingList[i].ticketingNo+"</kbd></span><br>"
								Element+= "<span class='contentDate'>예매일시 : "+toYHM(data.ticketingList[i].ticketingDate)()+"</span><br>"
								               //예매일시 다음에 취소일시 추가
								Element+="</div>"
								Element+="</div>"
								Element+="</div>"
								Element+="<div class='col-6 border'>"
								Element+="<div class='row'>"
								Element+="<div class='contentStatus col-9'>"
												//예매 상태 추가								    		
							    Element+="</div>"
							    Element+="<div class='afterButton col-3'>"
												//버튼 추가
							    Element+="</div>"
							    Element+="</div>"
							    Element+="</div>"							
							    Element+="</div><!-- end of ticketingContentIn -->"
							    
							    
								$(".ticketingContent").append(Element);
							  	//예매일 시 다음에 취소일시 추가
								var Element ="<br><span class='contentCancel'>취소일시 : "+toYHM(data.ticketingList[i].cancelDate)()+"</span>";
	
							    $($("span.contentDate")[i]).after(Element);
							    
							    //예매 상태 추가
							    Element = "<span class='contentStatus'>예매취소</span>"
							    
							    $($("div.contentStatus")[i]).append(Element);	
							    
			    				(function(x){
				    				ajaxPromise("/ticketing/json/getDateTime/"+data.ticketingList[x].dateTimeNo).then(
				    						data => {
				    							//console.log(data)
				    							//console.log(x)
				    							$($("span.contentImage img")[x]).attr("src",data.poster);
				    							
				    							
				    						}
				    						
				    				)//end of then
			    				})(i);//end of IIFE(Immediately Invoked Function Expression)
						}//end of for

						//페이지네이션 추가
						$("div.ticketingPagination.row").empty();
						
						Element = "<div class='col-4'></div>"
				  		Element +="<div class='col-4'>"
						Element +="<ul class='pagination'>"
			   			if(data.resultPage.currentPage <= data.resultPage.pageUnit){
			   				Element +="<li class='page-item disabled'>"
			   				Element +="<a class='page-link' href='#' tabindex='-1' aria-disabled='true'>«</a>"
			   				Element +="</li>"
			   			}else if(data.resultPage.currentPage > data.resultPage.pageUnit){
			   				Element +="<li class='page-item'>"
			   				Element +="<a class='page-link' href='javascript:Pagination("+(parseInt(data.resultPage.beginUnitPage)-1)+")' tabindex='-1' aria-disabled='true'>«</a>"
			   				Element +="</li>"
			   			}
						
			  			for(var i=data.resultPage.beginUnitPage; i<=data.resultPage.endUnitPage; i++){
			  				if(data.resultPage.currentPage==i){
			  					Element+="<li class='page-item active' aria-current='page'>"
			  					Element+="<a class='page-link' href='javascript:Pagination("+i+")'>"+i+"<span class='sr-only'>(current)</span></a>"
			  					Element+="</li>"
			  				}else{
			  					Element+="<li class='page-item'>";
			  					Element+="<a class='page-link' href='javascript:Pagination("+i+")'>"+i+"</a>"
			  					Element+="</li>"
			  				}
			  				
			  			}//end of for
						
			  			if(data.resultPage.endUnitPage >= data.resultPage.maxPage){
			  				Element+="<li class='page-item disabled'>"
			  				Element+="<a class='page-link' href='#'>»</a>"
			  				Element+="</li>"
			  			}else if(data.resultPage.endUnitPage < data.resultPage.maxPage){
			  				Element+="<li class='page-item'>"
			  				Element+="<a class='page-link' href='javascript:Pagination("+(parseInt(data.resultPage.endUnitPage)+1)+")'>»</a>"
			  				Element+="</li>"
			  			}
						
			  			Element+= "</ul>"
						Element+= "</div>"
						Element+= "<div class='col-4'></div>"
						Element+= "<form name='contents'>"
						Element+= "<input type='hidden' id='currentPage' name='currentPage' value=''/>"
						Element+= "<input type='hidden' id='searchCondition' name='searchCondition' value='"+data.search.searchCondition+"'/>"
						Element+= "</form>"
						
						$("div.ticketingPagination").append(Element);						
						
						$("#searchCondition").val(data.search.searchCondition);		
						
						detail()
						
						//Pagination(1)
					}else{
						$("div.ticketingPagination.row").empty();
					}//end of if
				}//end of arrow function
						
					
					
		);//end of then		
	});//end of eventHandler
	
});  

function Pagination(currentPage) {
	
	$("#currentPage").val(currentPage)
	//$("form").attr("method","POST").attr("action", "/ticketing/getTicketingList").submit();
	
	$("#plusPage").load("/ticketing/getTicketingList",$("form").serialize());
	
}

function ajaxPromise(urls,datas){
	return new Promise(function (resolve, reject){
	  $.ajax({
		  type: "POST",
		  url: urls,
		  data: datas,
		  dataType : "json",
		      headers: { 
		        "Accept" : "application/json",
		        "Content-Type": "application/json"
		      },
		      success : function(result,status){
		    	  // 데이터를 받으면 resolve() 호출
			      resolve(result);			      		
		    	  
		      }//end of success	
	
	  })//end of ajax
	})//end of Promise
}//end of function-ajaxPromise

//long을 dateFormat으로 (클로저로 작성)
function toYHM(time){
	var time = new Date(time);
	var year = time.getFullYear();
	var month = time.getMonth()+1; // 0-11을 NUMBER로 리턴
	var date = time.getDate();
	var day = week[time.getDay()];
	var hours = time.getHours();
	var minutes = time.getMinutes();
	
	var dateFormat = year+"-"+formatZero(month)+"-"+formatZero(date)+" ("+day+") "+formatZero(hours)+":"+formatZero(minutes);
	
	return function(){
		return dateFormat;
	}
	
}

function toYHMS(time){
	var time = new Date(time);
	var year = time.getFullYear();
	var month = time.getMonth()+1; // 0-11을 NUMBER로 리턴
	var date = time.getDate();
	var day = week[time.getDay()];
	var hours = time.getHours();
	var minutes = time.getMinutes();
	var seconds = time.getSeconds();
	
	var dateFormat = year+"년 "+formatZero(month)+"월 "+formatZero(date)+"일 ("+day+") "+formatZero(hours)+"시 "+formatZero(minutes)+"분 "+formatZero(seconds)+"초";
	
	return function(){
		return dateFormat;
	}
	
}

function toYMD(time){
	var time = new Date(time);
	var year = time.getFullYear();
	var month = time.getMonth()+1; // 0-11을 NUMBER로 리턴
	var date = time.getDate();
	var day = week[time.getDay()];
	
	var dateFormat = year+"년 "+formatZero(month)+"월 "+formatZero(date)+"일 ("+day+")"
	
	return function(){
		return dateFormat;
	}	
}

function toHM(time){
	var time = new Date(time);
	var hours = time.getHours();
	if(hours<5) hours+=24;	
	var minutes = time.getMinutes();
	var seconds = time.getSeconds();
	
	var dateFormat = formatZero(hours)+"시 "+formatZero(minutes)+"분";
	
	return function(){
		return dateFormat;
	}	
}


var week = ['일', '월', '화','수','목','금','토'];

//두자리수가 아닌 한자리 숫자를 앞에 0 붙여 출력
function formatZero(x){
	if(x<10){
		x = "0"+x;
	}
	
	return String(x);
}    

/**
 * 문자열이 빈 문자열인지 체크하여 결과값을 리턴한다.
 * @param str       : 체크할 문자열
 */
function isEmpty(str){
     
    if(typeof str == "undefined" || str == null || str == "")
        return true;
    else
        return false ;
}
 
/**
 * 문자열이 빈 문자열인지 체크하여 기본 문자열로 리턴한다.
 * @param str           : 체크할 문자열
 * @param defaultStr    : 문자열이 비어있을경우 리턴할 기본 문자열
 */
function nvl(str, defaultStr){
     
    if(typeof str == "undefined" || str == null || str == "")
        str = defaultStr ;
     
    return str ;
}


</script>	  
</body>
</html>