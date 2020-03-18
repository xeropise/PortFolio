<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

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

    <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

	<title>예매 상태 Bar</title>
	 
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	
	<!-- CGV 예매 상태바 css -->
	
	<link rel="stylesheet" href="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/css/2020/01/FORM_TYPE2/reservation.css">
	<link rel="stylesheet" href="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/css/2020/01/FORM_TYPE2/reservation_tnb.css">   
	  
	<!-- jQuery UI toolTip 사용 CSS-->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- jQuery UI toolTip 사용 JS-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	#ticket_tnb {
	    z-index : 2;
	}
	.tnb .info.movie .row {
	    float: none;
	}
	
	#ticket_tnb > div > div.info.theater{
		margin-left: 10px;
		margin-right: 10px;
	}
	
	#screen > span.header{
		float: none;
	}
	
	.tnb .info {
	    float: left;
	    height: 108px;
	    padding-right: 15px;
	    background: url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/tnb/split.png) no-repeat right;
	    position: relative;
	    color: #cccccc;
	    font-size: 12px;
	}
	
	.tnb .info.movie .row .data {
	    width: 105px;
	    max-height: 40px;
	}
	
	.tnb .btn-left, .tnb .btn-right {
	    background: url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/tnb/tnb_buttons.png) no-repeat;
	    background-position: 0 0;
	    overflow: hidden;
	    text-indent: -1000px;
	}
	
	.tnb .info.theater .placeholder{
		position: initial;
	}
	.tnb .info.seat .placeholder{
		position: initial;
	}
	
	.tnb .info.seat .row .header {
	    width: 58px;
	    padding-left: 10px;
	}

	#movieRating > span{
		width: 120px;
	    max-height: 40px;		
	}
	
	#exampleModalCenter > div > div > div.modal-footer > button.btn.btn-primary {
		background-color: #fee50e;
		border-color : #fee50e;
		color : #333;			
	}
	
	#exampleModalCenter > div > div > div.modal-header {
		background-color: #fee50e;
		border-color : #fee50e;
		color : #333;	
	}
	</style>

     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">	

	</script>
	
</head>

<body>

<div id="ticket_tnb" class="tnb_container">
		<div class="tnb step2">  <!-- step1 , 2, 3 -->
			<!-- btn-left -->
			<a class="btn-left" href="#" onclick="history.go(-1); return true;" title="영화선택">이전단계로 이동</a>
			
			<!-- 1. 영화 선택(영화 제목, 영화 타입(2D, 3D...), 관람등급) -->
			<div class="info movie">
				<span class="movie_poster"><img src="${dateTime.poster }" alt="영화 포스터" style="display: inline;"></span>
				<div id="movieTitle" class="row movie_title colspan2" style="display: block;">
					<span class="data letter-spacing-min ellipsis-line2" title="${dateTime.movieName}"><a href="#" target="_blank" onmousedown="javascript:logClick('SUMMARY/영화상세보기');"></a>${dateTime.movieName}</span>
				</div>
				<div id="movieType" class="row movie_type" style="display: block;">
					<span class="data ellipsis-line1" title=""></span>
				</div>			
				<div id="movieRating" class="row movie_rating" style="display: block;">
					<span class="data" title="${dateTime.rating } 관람가">${dateTime.rating } 관람가</span>
				</div>
				<div class="placeholder" title="영화선택" style="display: none;"></div>
			</div>
			
			<!-- 2. 극장 선택(극장, 일시, 상영관, 인원) -->
			<div class="info theater">
				<div id="theater" class="row name" style="display: block;">
					<span class="header">극장</span>
					<span class="data letter-spacing-min ellipsis-line1" title="${dateTime.theaterName}">${dateTime.theaterName}</span>
				</div>			
				<div id="date" class="row date" style="display: block;">
					<fmt:formatDate var="screenDate" value="${dateTime.screenDate}" pattern="yyyy.MM.dd"/>
					<fmt:formatDate var="screenDay" value="${dateTime.screenDate}" pattern="E"/>
					<fmt:formatDate var="screenTime" value="${dateTime.screenTime}" pattern="HH:mm"/>
					<span class="header">일시</span>
					<span class="data" title="">${screenDate}(${screenDay}) </span>
				</div>			
				<div id="screen" class="row screen" style="display: block;">
					<span class="header">상영관</span>
					<span class="data" title="${dateTime.screenName}">${dateTime.screenName}</span>
				</div>	
				<div id="number" class="row number" style="display: block;">
					<span class="header">인원</span>
					<span class="data" title=""></span>
				</div>
				<div class="placeholder" title="극장선택" style="display: none;"></div>
			</div>				
			
			<!-- 3. 좌석 선택 -->
			<div class="info seat">
				<div class="row seat_name" style="display: none;">
					<span class="header">좌석명</span>
					<span class="data" title=""></span>				
				</div>
				<div class="row seat_no colspan3" style="display: none;">
					<span class="header">좌석번호</span>
					<span class="data ellipsis-line3" title=""></span>
				</div>				
				<div class="placeholder" title="좌석선택"></div>
			</div>				
			
			<!-- 4. 결제 -->
			<div class="info payment-ticket" style="display: block; top: 13px;">
				<div class="row payment-adult" style="display: none; margin-top: 0px;">
					<span class="header" style="width: 55px; padding-left: 19px;">일반</span>
					<span class="data"><span class="price"></span>원 <span class="quantity" style="display: none;"></span></span>
				</div>			
				<div class="row payment-youth" style="display: none;">
					<span class="header" style="width: 55px; padding-left: 19px;">청소년</span>
					<span class="data"><span class="price"></span>원 <span class="quantity" style="display: none;"></span></span>
				</div>						
				<div class="row payment-special" style="display: none;">
					<span class="header" style="width: 55px; padding-left: 19px;">우대</span>
					<span class="data"><span class="price"></span>원 <span class="quantity" style="display: none;"></span></span>
				</div>
				<div class="row payment-final" style="display: none;">
					<span class="header" style="width: 55px; padding-left: 19px;">총금액</span>
					<span class="data"><span class="price"></span><span class="won">원</span></span>
				</div>
			</div>
			
			<div class="info path">
				<div class="row colspan4">
					<span class="path-step2" title="좌석선택">&nbsp;</span>
					<span class="path-step3" title="결제">&nbsp;</span>
				</div>
			</div>
			
			<!-- btn-right -->
			<div class="tnb_step_btn_right_before" id="tnb_step_btn_right_before"></div>
			<c:if test="${user.role eq 'user'}">
				<a class="btn-right" id="tnb_step_btn_right" href="#" onclick="" title="결제선택"></a>
			</c:if>
			
			<c:if test="${user.role ne 'user'}">
				<a class="btn-right" id="tnb_step_btn_right" href="#" onclick="" title="결제선택"></a>
			</c:if>
		</div>
	</div> 
	
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">안내</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body text-sm-left">
	                
	      </div>
	      <div class="modal-footer">
	      	<!-- 퀵오더 진행 -->
	      	<button type="button" class="btn btn-primary" onclick='total(0)'></button>
	      	<!-- 퀵오더 없이 바로 예매 진행 -->
	        <button type="button" class="btn btn-secondary" onclick='total(1)' data-dismiss="modal"></button>
	        
	      </div>
	    </div>
	  </div>
	</div>
	
<!-- 함수 모음 -->
<script>
var userExist =${user.role eq 'user'};
var unUserExist =${user.role ne 'user'};

var rating='${dateTime.rating}';
console.log(rating)
if(rating=='전체'){
	
}else if(rating=='12세'){
	$("div.modal-header h5").text('관람등급 안내');	
	$("div.modal-body").append("<p class='alert_msg'><em style='color:#006cc7;'>[12세 이상 관람가]</em><br>본 영화는 만 12세 이상 관람 가능한 영화입니다.<br>만 12세 미만 고객은 부모님 또는 만 19세 이상 보호자 동반 시 관람이 가능합니다.<br>연령 확인 불가 시 입장이 제한 될 수 있습니다.</p>")
	$("div.modal-footer button").first().css("display","none");
	$("div.modal-footer button").first().next().removeAttr('onclick');
	$("div.modal-footer button").first().next().text("확인");
	$('#exampleModalCenter').modal('show');
}else if(rating=='15세'){
	$("div.modal-header h5").text('관람등급 안내');	
	$("div.modal-body").append("<p class='alert_msg'><em style='color:#006cc7;'>[15세 이상 관람가]</em><br>본 영화는 만 15세 이상 관람 가능한 영화입니다.<br>만 12세 미만 고객은 부모님 또는 만 19세 이상 보호자 동반 시 관람이 가능합니다.<br>연령 확인 불가 시 입장이 제한 될 수 있습니다.</p>")
	$("div.modal-footer button").first().css("display","none");
	$("div.modal-footer button").first().next().removeAttr('onclick');	
	$("div.modal-footer button").first().next().text("확인");
	$('#exampleModalCenter').modal('show');
}else if(rating=='18세'){
	$("div.modal-header h5").text('관람등급 안내');	
	$("div.modal-body").append("<p class='alert_msg'><p class='adultMark'><span>청소년<br>관람불가</span></p>본 영화는 <em>[청소년 관람 불가]</em> 영화입니다.<br>관람 시, 신분증을 꼭 지참해 주세요.<br><br>만 18세 미만(영,유아 포함)은 보호자가 있어도 관람하실 수 없으며,<br>만 18세 이상이더라도 「초중등교육법」에 따라 재학중인 학생은 입장이 제한됩니다.</p>")
	$("div.modal-footer button").first().css("display","none");
	$("div.modal-footer button").first().next().removeAttr('onclick');
	$("div.modal-footer button").first().next().text("확인");
	$('#exampleModalCenter').modal('show');
}
//로그인했으면, 선택했으면 Confirm 창 추가(회원)
function modalConfirmCheck(){
	if(userExist && $("a.btn-right").hasClass("on")){
		$("a.btn-right").attr("data-toggle","modal").attr("data-target","#exampleModalCenter");
		$("div.modal-footer button").first().css("display","block");
		$("div.modal-footer button").first().next().attr('onclick','total(1)');
		$("div.modal-body").text("퀵오더페이지로 이동하시겠습니까? ('아니오'시 결제창으로)");
		$("div.modal-footer button").first().text("네");
		$("div.modal-footer button").first().next().text("아니오");
		$("div.modal-header h5").text('안내')
	}else{
		$("a.btn-right").removeAttr("data-toggle").removeAttr("data-target")
	}
}

//비회원일경우, 바로
function unUserCheck(){
	if(unUserExist && $("a.btn-right").hasClass("on")){
		$("a.btn-right").attr("onclick","total(1)"); // 퀵오더 없이 바로 예매 진행
	}
}

</script>	

</body>
</html>