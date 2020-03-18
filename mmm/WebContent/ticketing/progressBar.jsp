<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="utf-8">
  	<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
  	<title>mmm</title>
  
	<!-- Required meta tags -->
	 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	 <!-- Bootstrap CSS -->
	 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	
	   <!-- Optional JavaScript -->
	 <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	 <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
	 <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

	<!-- CGV 예매 상태바 css -->
	<link rel="stylesheet" href="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/css/2020/01/FORM_TYPE2/common.css">
	<link rel="stylesheet" href="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/css/2020/01/FORM_TYPE2/reservation.css">
	<link rel="stylesheet" href="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/css/2020/01/FORM_TYPE2/reservation_tnb.css">   
    <link rel="stylesheet" href="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/css/2020/01/FORM_TYPE2/reservation_step3_step1.css">
    <link rel="stylesheet" href="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/css/2020/01/FORM_TYPE2/reservation_step3_step2.css">
	<!-- jQuery UI toolTip 사용 CSS-->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- jQuery UI toolTip 사용 JS-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	
	body, input, select, textarea, header, footer {
	    color: #333;
	    font-family: 'Tahoma','돋움',dotum,Nanum Gothic,sans-serif;
	    font-size: 12px;
	    font-weight: bold;
	}
	


	.tnb .info.movie .row {
	    float: none;
	}
	
	
	#ticket_tnb{
    	margin-bottom: 25px;
    	z-index : 2;
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
	
	.tnb .info.theater .placeholder{
		position: initial;
	}
	
	.tnb .info.seat .placeholder{
		position: initial;
	}
	
	/* 관람 등급 아이콘 */
	span.icon {
	    display: inline-block;
	    *display: inline;
	    zoom: 1;
	    width: 32px;
	    height: 35px;
	    background-position: 0 0;
	    background-repeat: no-repeat;
	    background-image: url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/icon/icon_ratings2.png);
	}
	
	/* 전체 */	
	span.icon.rating-all{
		background-position: 5px 6px;
	}	
	
	/* 12세 */	
	span.icon.rating-12{
		background-position: 5px -29px;
	}	
	
	/* 15세 */	
	span.icon.rating-15{
		background-position: 5px -64px;
	}	
	
	/* 18세 */	
	span.icon.rating-18{
		background-position: 5px -99px;
	}
	
	/* 조조 */
	span.morning {
	    float: left;
	    height: 18px;
	    padding-left: 25px;
	    background: url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/icon/icon_morning_night.png) no-repeat left;
	    background-position: 7px 2px;
	}
	
	/* 심야 */
	span.night {
	    float: left;
	    height: 16px;
	    padding-left: 16px;
	    margin-left: 8px;
	    background: url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/icon/icon_morning_night.png) no-repeat left;
	    background-position: 2px -18px;
	}
	
	#movieRating > span{
		width: 120px;
	    max-height: 40px;		
	}	
	
	
	</style>

     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">	

	</script>
	
</head>

<body>

<div id="ticket_tnb" class="tnb_container">
		<div class="tnb step1">  <!-- step1 , 2, 3 -->
			<!-- btn-left -->
			<a class="btn-left" href="#" onclick="OnTnbLeftClick(); return false;" title="영화선택">이전단계로 이동</a>
			
			<!-- 1. 영화 선택(영화 제목, 영화 타입(2D, 3D...), 관람등급) -->
			<div class="info movie">
				<span class="movie_poster"><img src="${dateTime.poster }" alt="영화 포스터" style="display: none;"></span>
				<div id="movieTitle" class="row movie_title colspan2" style="display: none;">
					<span class="data letter-spacing-min ellipsis-line2"><a href="#" target="_blank" onmousedown="javascript:logClick('SUMMARY/영화상세보기');"></a></span>
				</div>
				<div id="movieType" class="row movie_type" style="display: block;">
					<span class="data ellipsis-line1" title=""></span>
				</div>
				<div id="movieRating" class="row movie_rating" style="display : block">
					<span class="data" title=""></span>
				</div>
				<div class="placeholder" title="영화선택"></div>
			</div>
			
			<!-- 2. 극장 선택(극장, 일시, 상영관, 인원) -->
			<div class="info theater">
				<div id="theater" class="row name" style="display: none;">
					<span class="header">극장</span>
					<span class="data letter-spacing-min ellipsis-line1" title=""></span>
				</div>
				<div id="date" class="row date" style="display: none;">
					<span class="header">일시</span>
					<span class="data" title=""></span>
				</div>
				<div id="screen" class="row screen" style="display: none;">
					<span class="header">상영관</span>
					<span class="data" title=""></span>
				</div>
				<div id="number" class="row number" style="display: none;">
					<span class="header">인원</span>
					<span class="data" title=""></span>
				</div>
				<div class="placeholder" title="극장선택"></div>
			</div>
			
			<!-- 3. 좌석 선택 -->
			<div class="info seat">
				<div class="row seat_name">
					<span class="header">좌석명</span>
					<span class="data" title=""></span>
				</div>
				<div class="row seat_no colspan3">
					<span class="header">좌석번호</span>
					<span class="data ellipsis-line3" title=""></span>
				</div>
				<div class="placeholder" title="좌석선택"></div>
			</div>
			
			<!-- 4. 결제 -->
			<div class="info payment-ticket">
				<div class="row payment-adult">
					<span class="header">일반</span>
					<span class="data"><span class="price"></span>원 x <span class="quantity"></span></span>
				</div>
				<div class="row payment-youth">
					<span class="header">청소년</span>
					<span class="data"><span class="price"></span>원 x <span class="quantity"></span></span>
				</div>
				<div class="row payment-special">
					<span class="header">우대</span>
					<span class="data"><span class="price"></span>원 x <span class="quantity"></span></span>
				</div>
				<div class="row payment-final">
					<span class="header">총금액</span>
					<span class="data"><span class="price">0</span><span class="won">원</span></span>
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
			<a class="btn-right" id="tnb_step_btn_right" href="#" onclick="addSeatSelect(); return false;" title="좌석선택"></a>
		</div>
	</div>


</body>
</html>