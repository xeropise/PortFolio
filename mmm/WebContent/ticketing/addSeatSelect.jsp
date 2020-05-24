<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
 <!-- Required meta tags -->
  <meta charset="utf-8">
  <link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
  <title>mmm</title>  
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	
    <!-- google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  
    <!-- font Awesome -->
  <script src="https://kit.fontawesome.com/b435a047df.js" crossorigin="anonymous"></script>
  	
    <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

  
<title>mmm</title>

<style>

	  .mb-2, .my-2 {
	    margin-bottom: .5rem!important;
	    margin-top: .5rem !important;
	  }
	  
	  
 	  body {
 	  	font-family: 'Noto Sans KR', sans-serif !important;
 	  }
   	  
   	  
#numberSelector > div.group.normal > ul {
    margin-top: 0;
    margin-bottom: 0rem; 
}

#numberSelector > div.group.young > ul {
    margin-top: 0;
    margin-bottom: 0rem; 
}

div.steps-header.bg-dark.w-auto > div > div {
	font-size: 15px;
    height: 33px;
    padding-top: 5px;
}

span.resetAllseats.text-white.mb-0 > img{
	width: 18px; 
	height: 16px; 
	margin-right: 1px; 
	margin-bottom: 4px;
}

/* ///////////////////////////////////////////////// */

/* ///////////////////////////////////////////////// */
/* 인원수 셀렉터 */

ul {
    list-style:none;
    font-size : small;
    margin:0;
    padding:0;
    
}

#numberSelector > div.group > ul > li {
	margin: 0 0 0 0;
    padding: 0 0 0 0;
    border : 0;
    display: inline-block;
    cursor: pointer;
    
    color: #333;
	font-family: 'Tahoma','돋움',dotum,Nanum Gothic,sans-serif;
	font-size: 12px;
	font-weight: bold;
	text-align : center;
	width: 18px;
	height: 20px;
	border: 1px solid #d6d3ce;
	background-color: #f2f0e5;
	vertical-align: middle;
}

.title {
	font-family: 'Tahoma','돋움',dotum,Nanum Gothic,sans-serif;
	font-size: 12px;
	font-weight: normal;
	text-align: left;
	float: left;
	width: 55px;
	height: 22px;
	line-height: 22px;
	color: #666;
	letter-spacing: -0.1em;
}

#numberSelector > div.group > ul > li.selected {
	background-color : black;
	color : white;
}

td.seat.on{
	background-color : red;
}

/* 적용이 왜안될까? 이해를 할 수가 없다..*/
/* 이유는 한 엘레먼트의 css에 여러값이 있으면 우선 쓴 값이 적용되어 버린다.. style로 처리하면 이런 문제가 발생함 */
td.seat.border {
	border-color : red; 
}

div.steps-body {
  background-color: #f2f0e4;
  
}

/* 좌석 */
#seatSelector{
}

#numberSelector{
	border-right: 2px solid #d4d3c9;
}
.top {
	border-bottom: 2px solid #d4d3c9;
}

.mid {
	padding-top : 30px;
	background-color: #f2f0e4;
	height : 355px;
}

div.mid > div > div.col-9 > div.steps-body{
	margin-top : 30px;
}

table {
	zoom : -1;
	margin : auto;
}
tr, td {
	width: 16px;
	height: 16px;
	vertical-align: middle;	
	text-align : center;
	border : 2px;
	padding : 0px;
}




td.seat {
	border-style : double;
	background-color: #666;
    font-family: 'Tahoma','돋움',dotum,Nanum Gothic,sans-serif;
    font-size: 10px;
    font-weight: normal;
	cursor: pointer;
	color : #fff;
}

td.seat.off {
	background-color : #bbb;
    pointer-events   : none;
}

td.alphabet{
    left: 0px;
    margin-bottom: 1px;
    width: 15px;
    height: 14px;
    line-height: 14px;
    border-top: 1px solid #d4d3c9;
    font-size: 11px;
    font-family: Verdana;
    font-weight: bold;
    text-align: center;
}


td.route{
	border-color : #d6d3ce;
}

/* A라인(Economy) 좌석 통로제외 */
tr:nth-child(1) td.seat{
	border-color : #ed8c00;  
}

/* B라인(Economy) 좌석 통로제외 */
tr:nth-child(2) td.seat{
	border-color : #ed8c00;
}

/* C라인(Standard) 좌석 통로제외 */
tr:nth-child(3) td.seat{
	border-color : #01c73c;
}

/* D라인(Standard) 좌석 통로제외 */
tr:nth-child(4) td.seat{
	border-color : #01c73c;
}

/* E라인(Standard) 좌석 통로제외 */
tr:nth-child(5) td.seat{
	border-color : #01c73c;
}

/* F라인(Prime) 좌석 통로제외 */
tr:nth-child(6) td.seat{
	border-color : #0777D9;
}

/* G라인(Prime) 좌석 통로제외 */
tr:nth-child(7) td.seat{
	border-color : #0777D9;
}

/* H라인(Prime) 좌석 통로제외 */
tr:nth-child(8) td.seat{
	border-color : #0777D9;
}

/* I라인(Prime) 좌석 통로제외 */
tr:nth-child(9) td.seat{
	border-color : #0777D9;
}

/* J라인(Prime) 좌석 통로제외 */
tr:nth-child(10) td.seat{
	border-color : #0777D9;
}

/* K라인(Prime) 좌석 통로제외 */
tr:nth-child(11) td.seat{
	border-color : #0777D9;
}

/* L라인(Sweet Box) 좌석 통로제외 */
tr:nth-child(12) td.seat{
    background-color: #da1b68;
    background-position: -100px 0;
    background-image: url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/step2/seat_icons_20190221.png);
    background-repeat: no-repeat;
}

tr:nth-child(12) td.seat.on{
    background-color: #ad1712;
    background-position: 0 0;
}

/* M라인(Sweet Box) 좌석 통로제외 */
tr:nth-child(13) td.seat{
    background-color: #da1b68;
    background-position: -100px 0;
    background-image: url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/step2/seat_icons_20190221.png);
    background-repeat: no-repeat;
}

tr:nth-child(13) td.seat.on{
    background-color: #ad1712;
    background-position: 0 0;
}

div.steps-header > div > p {
    background: url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/step2/screen_bg.png) repeat-x left;
    font-family: 'Tahoma','돋움',dotum,Nanum Gothic,sans-serif;
    font-size: 16px;
    font-weight: bolder;
    color : black;
}

/* display info */
.displayInfo{
font-size : 14px;
margin-top : 50px;
}

.icon-choose{
margin-left: 1px;
padding-right: 13px;
padding-top: 1px;
line-height: 1.5;
box-sizing: border-box;
width: 16px;
height: 16px;
vertical-align: middle;
text-align: center;
border-style: none;
font-family: 'Tahoma','돋움',dotum,Nanum Gothic,sans-serif;
font-size: 10px;
font-weight: normal;
color: #fff;
background-color: red;
}

.icon-impossible {
margin-left: 1px;
padding-right: 13px;
padding-top: 1px;
line-height: 1.5;
box-sizing: border-box;
width: 16px;
height: 16px;
vertical-align: middle;
text-align: center;
border-style: none;
font-family: 'Tahoma','돋움',dotum,Nanum Gothic,sans-serif;
font-size: 10px;
font-weight: normal;
color: #fff;
background-color : #bbb;

}
.icon-economy {
margin-left: 1px;
padding-right: 10px;
padding-top: 0px;
line-height: 1.5;
box-sizing: border-box;
width: 16px;
height: 16px;
vertical-align: middle;
text-align: center;
border: 2px;
border-style: double;
/* background-color: #4B4F52; */
font-family: 'Tahoma','돋움',dotum,Nanum Gothic,sans-serif;
font-size: 10px;
font-weight: normal;
color: #fff;
border-color: #ed8c00;

}

.icon-standard{
margin-left: 1px;
padding-right: 10px;
padding-top: 0px;
line-height: 1.5;
box-sizing: border-box;
width: 16px;
height: 16px;
vertical-align: middle;
text-align: center;
border: 2px;
border-style: double;
/* background-color: #4B4F52; */
font-family: 'Tahoma','돋움',dotum,Nanum Gothic,sans-serif;
font-size: 10px;
font-weight: normal;
color: #fff;
border-color: #01c73c;

}

.icon-prime{
margin-left: 1px;
padding-right: 10px;
padding-top: 0px;
line-height: 1.5;
box-sizing: border-box;
width: 16px;
height: 16px;
vertical-align: middle;
text-align: center;
border: 2px;
border-style: double;
/* background-color: #4B4F52; */
font-family: 'Tahoma','돋움',dotum,Nanum Gothic,sans-serif;
font-size: 10px;
font-weight: normal;
color: #fff;
border-color: #0777D9;

}

.icon-sweetBox{
border-bottom-width: 0px;
border-left-width: 0px;
border-top-width: 0px;
border-right-width: 0px;
line-height: 1.5;
box-sizing: border-box;
width: 0px;
height: 5px;
vertical-align: text-top;
text-align: center;
border: 1px;
padding: 0px;
background-position: -99px 3px;
/* background-color: #da1b68; */
background-image: url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/step2/seat_icons_20190221.png);
background-repeat: no-repeat;
font-family: 'Tahoma','돋움',dotum,Nanum Gothic,sans-serif;
font-size: 10px;
font-weight: normal;
color: #fff;
/* border-color: #da1b68; */
}

div.resetSelection {
cursor: pointer;
background-image: url('http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/top_buttons.png');
background-repeat: no-repeat;
background-position : 0 -120px;
width: 113px;
}

span.resetAllseats{
cursor: pointer;

}

#ticket_tnb {
	margin-bottom: 25px;
}
</style>





</head>
<body>
	
	<jsp:include page="/layout/header.jsp"></jsp:include>
 
    <div class="container">
    <!-- 좌석 선택 -->
    <div class="addSeatSelect">
     <!-- 타이틀 -->
     <div class="row mb-2">
     	<div class="col-12 navi">
     		<div class="resetSelection" style="clear:both; float:right; height:30px"></div>
     	</div>
     </div>
      <div class="top">
      <!-- 메인 컨텐츠  -->
      	<div class="steps-header bg-dark w-auto">
          	<div class="row mx-0">
	        	<div class="col-12 text-center">
	        		<span class="text-white mb-0" style="display : inline; font-weight: bold; margin-left: 54px;">인원 / 좌석</span>
	        		<span class="resetAllseats text-white mb-0" style="clear:both; float:right;">
	        			<img src="http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/step3/step_refresh_btn.png"/>
	        				다시하기
	        		</span>
	        	</div>    
	        </div>  	
      	</div>

        <div class="steps-body w-auto" style="height: 146px;">

        	<div class="row w-auto h-auto mx-0">    	
	        	<div class="col-6 px-0 h-auto">
	              <div class="steps-header">
	              </div>	
	              <div class="steps-body">
	              	<div class="col pt-3">
						<div id="numberSelector">
							<div class="group normal">
								<span class="title">일반</span>
								<ul>
									<li class="selected">0</li>
									<li>1</li>
									<li>2</li>
									<li>3</li>
									<li>4</li>
									<li>5</li>
									<li>6</li>
									<li>7</li>
									<li>8</li>
									<li>9</li>
									<li>10</li>
								</ul>
							</div>
					
							<br>
							
							<div class="group young">
								<span class="title">청소년</span>
								<ul>
									<li class="selected">0</li>		
									<li>1</li>
									<li>2</li>
									<li>3</li>
									<li>4</li>
									<li>5</li>
									<li>6</li>
									<li>7</li>
									<li>8</li>
									<li>9</li>
									<li>10</li>
								</ul>
							</div>
							
							<br>
							
							<div class="group special">
								<span class="title">우대</span>		
								<ul>
									<li class="selected">0</li>		
									<li>1</li>
									<li>2</li>
									<li>3</li>
									<li>4</li>
									<li>5</li>
									<li>6</li>
									<li>7</li>
									<li>8</li>
									<li>9</li>
									<li>10</li>
								</ul>		
							</div>	              
		            	</div>
	             	</div>   
	        	 </div>
	       		 </div>
	        	  <div class="col-6 px-0 h-auto">
		              <div class="steps-header"></div>	
		              <div class="steps-body">
			              <div class="user-select-info pt-3  w-auto">
								<div class="place-info">
									<span class="theaterName" style="border-right: 2px solid #ccc; padding-right: 8px;">${dateTime.theaterName}</span>
									<span class="screenName" style="border-right: 2px solid #ccc; padding-right: 8px; padding-left: 3px;">${dateTime.screenName}</span>
									<span class="seatCount" style="padding-left: 3px;">남은좌석  <b class="restNum" style="color: #CA4D10">${dateTime.remainingSeat}</b>/<b class="totalNum">130</b></span>
								</div>
								<div class="time-info" style="font-weight: bold; font-size: 1.3em; color: #5a5a5a; margin-top: 12px;">
									<fmt:formatDate var="screenDate" value="${dateTime.screenDate}" pattern="yyyy.MM.dd"/>
									<fmt:formatDate var="screenDay" value="${dateTime.screenDate}" pattern="E"/>
									<fmt:formatDate var="screenTime" value="${dateTime.screenTime}" pattern="HH:mm"/>
									<span class="screenDate">${screenDate}</span>
									<span class="screenDay">(${screenDay})</span>
									<span class="screenTime">${screenTime}</span>
									<!-- <span class="endTime">~</span> -->
								</div>
						  </div>
		              </div>
		      </div>
		      </div><!-- end of row -->
			<br>
		</div>
	</div>
	<div class="mid">
		<div class="row">
		<div class="col-9" >
      	<div class="steps-header">
	        	<div class="mx-auto w-50">
	        		<p class="text-black text-center mb-0 screen" style="width: 670px;">SCREEN</p>
	        	</div>    
	        </div>  		
		<div class="steps-body" style="border-left-width: 0px; margin-left: 232px;">
			<div id="seatSelector">
				<table class="">
					<thead>
					  <tr>
					    <td class="blank"></td>
					    <td class="number"></td>
					    <td class="number"></td>
					    <td class="number"></td>
					    <td class="number"></td>
					    <td class="number"></td>
					    <td class="number"></td>
					    <td class="number"></td>
					    <td class="number"></td>
					    <td class="number"></td>
					    <td class="number"></td>
					    <td class="number"></td>
					    <td class="number"></td>
					  </tr>
					</thead>
					<tbody>
					  <tr>	
					    <td class="alphabet economy" id="Economy">A</td>
					    <td class="seat" id="A1">1</td>
					    <td class="seat" id="A2">2</td>
					    <td class="route"></td>
					    <td class="seat" id="A3">3</td>
					    <td class="seat" id="A4">4</td>
					    <td class="seat" id="A5">5</td>
					    <td class="seat" id="A6">6</td>
					    <td class="seat" id="A7">7</td>
					    <td class="seat" id="A8">8</td>
					    <td class="route"></td>
					    <td class="seat" id="A9">9</td>
					    <td class="seat" id="A10">10</td>
					  </tr>
					  
					  <tr>
					    <td class="alphabet economy" id="Economy">B</td>
					    <td class="seat" id="B1">1</td>
					    <td class="seat" id="B2">2</td>
					    <td class="route"></td>
					    <td class="seat" id="B3">3</td>
					    <td class="seat" id="B4">4</td>
					    <td class="seat" id="B5">5</td>
					    <td class="seat" id="B6">6</td>
					    <td class="seat" id="B7">7</td>
					    <td class="seat" id="B8">8</td>
					    <td class="route"></td>
					    <td class="seat" id="B9">9</td>
					    <td class="seat" id="B10">10</td>
					  </tr>
					  
					  <tr>
					    <td class="alphabet standard" id="Standard">C</td>
					    <td class="seat" id="C1">1</td>
					    <td class="seat" id="C2">2</td>
					    <td class="route"></td>
					    <td class="seat" id="C3">3</td>
					    <td class="seat" id="C4">4</td>
					    <td class="seat" id="C5">5</td>
					    <td class="seat" id="C6">6</td>
					    <td class="seat" id="C7">7</td>
					    <td class="seat" id="C8">8</td>
					    <td class="route"></td>
					    <td class="seat" id="C9">9</td>
					    <td class="seat" id="C10">10</td>
					  </tr>
					  
					  <tr>
					    <td class="alphabet standard" id="Standard">D</td>
					    <td class="seat" id="D1">1</td>
					    <td class="seat" id="D2">2</td>
					    <td class="route"></td>
					    <td class="seat" id="D3">3</td>
					    <td class="seat" id="D4">4</td>
					    <td class="seat" id="D5">5</td>
					    <td class="seat" id="D6">6</td>
					    <td class="seat" id="D7">7</td>
					    <td class="seat" id="D8">8</td>
					    <td class="route"></td>
					    <td class="seat" id="D9">9</td>
					    <td class="seat" id="D10">10</td>
					  </tr>
					  
					  <tr>
					    <td class="alphabet standard" id="Standard">E</td>
					    <td class="seat" id="E1">1</td>
					    <td class="seat" id="E2">2</td>
					    <td class="route"></td>
					    <td class="seat" id="E3">3</td>
					    <td class="seat" id="E4">4</td>
					    <td class="seat" id="E5">5</td>
					    <td class="seat" id="E6">6</td>
					    <td class="seat" id="E7">7</td>
					    <td class="seat" id="E8">8</td>
					    <td class="route"></td>
					    <td class="seat" id="E9">9</td>
					    <td class="seat" id="E10">10</td>
					  </tr>		
					   
					  <tr>
					    <td class="alphabet prime" id="Prime">F</td>
					    <td class="seat" id="F1">1</td>
					    <td class="seat" id="F2">2</td>
					    <td class="route"></td>
					    <td class="seat" id="F3">3</td>
					    <td class="seat" id="F4">4</td>
					    <td class="seat" id="F5">5</td>
					    <td class="seat" id="F6">6</td>
					    <td class="seat" id="F7">7</td>
					    <td class="seat" id="F8">8</td>
					    <td class="route"></td>
					    <td class="seat" id="F9">9</td>
					    <td class="seat" id="F10">10</td>
					  </tr>
					  
					  <tr>
					    <td class="alphabet prime" id="Prime">G</td>
					    <td class="seat" id="G1">1</td>
					    <td class="seat" id="G2">2</td>
					    <td class="route"></td>
					    <td class="seat" id="G3">3</td>
					    <td class="seat" id="G4">4</td>
					    <td class="seat" id="G5">5</td>
					    <td class="seat" id="G6">6</td>
					    <td class="seat" id="G7">7</td>
					    <td class="seat" id="G8">8</td>
					    <td class="route"></td>
					    <td class="seat" id="G9">9</td>
					    <td class="seat" id="G10">10</td>
					  </tr>
			
					  <tr>
					    <td class="alphabet prime" id="Prime">H</td>
					    <td class="seat" id="H1">1</td>
					    <td class="seat" id="H2">2</td>
					    <td class="route"></td>
					    <td class="seat" id="H3">3</td>
					    <td class="seat" id="H4">4</td>
					    <td class="seat" id="H5">5</td>
					    <td class="seat" id="H6">6</td>
					    <td class="seat" id="H7">7</td>
					    <td class="seat" id="H8">8</td>
					    <td class="route"></td>
					    <td class="seat" id="H9">9</td>
					    <td class="seat" id="H10">10</td>
					  </tr>	
			
					  <tr>
					    <td class="alphabet prime" id="Prime">I</td>
					    <td class="seat" id="I1">1</td>
					    <td class="seat" id="I2">2</td>
					    <td class="route"></td>
					    <td class="seat" id="I3">3</td>
					    <td class="seat" id="I4">4</td>
					    <td class="seat" id="I5">5</td>
					    <td class="seat" id="I6">6</td>
					    <td class="seat" id="I7">7</td>
					    <td class="seat" id="I8">8</td>
					    <td class="route"></td>
					    <td class="seat" id="I9">9</td>
					    <td class="seat" id="I10">10</td>
					  </tr>
			
					  <tr>
					    <td class="alphabet prime" id="Prime">J</td>
					    <td class="seat" id="J1">1</td>
					    <td class="seat" id="J2">2</td>
					    <td class="route"></td>
					    <td class="seat" id="J3">3</td>
					    <td class="seat" id="J4">4</td>
					    <td class="seat" id="J5">5</td>
					    <td class="seat" id="J6">6</td>
					    <td class="seat" id="J7">7</td>
					    <td class="seat" id="J8">8</td>
					    <td class="route"></td>
					    <td class="seat" id="J9">9</td>
					    <td class="seat" id="J10">10</td>
					  </tr>
			
					  <tr>
					    <td class="alphabet prime" id="Prime">K</td>
					    <td class="seat" id="K1">1</td>
					    <td class="seat" id="K2">2</td>
					    <td class="route"></td>
					    <td class="seat" id="K3">3</td>
					    <td class="seat" id="K4">4</td>
					    <td class="seat" id="K5">5</td>
					    <td class="seat" id="K6">6</td>
					    <td class="seat" id="K7">7</td>
					    <td class="seat" id="K8">8</td>
					    <td class="route"></td>
					    <td class="seat" id="K9">9</td>
					    <td class="seat" id="K10">10</td>
					  </tr>
					  
					  <tr>
					    <td class="alphabet sweetBox" id="SweetBox">L</td>
					    <td class="seat" id="L1">1</td>
					    <td class="seat" id="L2">2</td>
					    <td class="route"></td>
					    <td class="seat" id="L3">3</td>
					    <td class="seat" id="L4">4</td>
					    <td class="seat" id="L5">5</td>
					    <td class="seat" id="L6">6</td>
					    <td class="seat" id="L7">7</td>
					    <td class="seat" id="L8">8</td>
					    <td class="route"></td>
					    <td class="seat" id="L9">9</td>
					    <td class="seat" id="L10">10</td>
					  </tr>
					  
					  <tr>
					    <td class="alphabet sweetBox" id="SweetBox">M</td>
					    <td class="seat" id="M1">1</td>
					    <td class="seat" id="M2">2</td>
					    <td class="route"></td>
					    <td class="seat" id="M3">3</td>
					    <td class="seat" id="M4">4</td>
					    <td class="seat" id="M5">5</td>
					    <td class="seat" id="M6">6</td>
					    <td class="seat" id="M7">7</td>
					    <td class="seat" id="M8">8</td>
					    <td class="route"></td>
					    <td class="seat" id="M9">9</td>
					    <td class="seat" id="M10">10</td>
					  </tr>					  
					  		  		  		  	  		  
					</tbody>
				</table>
			</div>
			</div>
			</div>
			<div class="col-3" style="left: 69px; top: 69px;">
				 <span class="displayInfo" style="margin-top: 72px;">
					 <span><span class="icon-choose mt-2"></span><span style="text-align: left;">&nbsp;&nbsp;선택</span></span> <br/>
					 <span><span class="icon-impossible mt-2"></span><span >&nbsp;&nbsp;예매 완료</span></span><br/>
					 <br/>
					 <span><span class="icon-economy mt-2"></span><span>&nbsp;&nbsp;Economy</span></span><br/>
					 <span><span class="icon-standard mt-2"></span><span>&nbsp;&nbsp;Standard</span></span><br/>
					 <span><span class="icon-prime mt-2"></span><span style="text-align: left;">&nbsp;&nbsp;Prime</span></span><br/>
					 <span><span class="icon-sweetBox mt-2" style="padding-right: 19px; width: 26px; padding-bottom: 8px;"></span><span>&nbsp;SweetBox</span></span>
				 </span>
			</div>
			</div>		
			</div>
		</div>
		<!-- 데이터 심기 -->
        <form>
        	<input type="hidden" name="dateTimeNo">
        	<input type="hidden" name="screenTime">
        	<input type="hidden" name="movieName">
        	<input type="hidden" name="theaterName">
  			<input type="hidden" name="audienceType">
  			<input type="hidden" name="seatType">
  			<input type="hidden" name="seatNo">
  			<input type="hidden" name="totalSeat">
  			<input type="hidden" name="headCount">
  			<input type="hidden" name="ticketingPrice">
        </form>
	</div> <!-- container div -->	
	
<!-- 하단 진행 바  --> 
    <jsp:include page="/ticketing/progressBar2.jsp" />	 
<!-- 하단 진행 바  -->     
	
	
	<jsp:include page="/layout/footer.jsp" />	 


<!-- 이벤트  -->
<script>
var totalArray;
var nNumber = 0;
var yNumber = 0;
var sNumber = 0;
var progress;
var index = 0;
var arrayK;
var arrayS;
var selectedSeat = "${dateTime.selectedSeat}"
var seatArray = selectedSeat.split(",");
var _str;  //좌석번호입력
var nPrice=0;
var yPrice=0;
var sPrice=0;
// 페이지 로딩시 이미 예약된 좌석 비활성화
if(selectedSeat!=null && selectedSeat.length >0){
	for(var i=0; i<seatArray.length; i++){
		var id ="#"+seatArray[i]
		$(id).css("background-color","#bbb");
		$(id).css("pointer-events", "none");	
	}
}

$(function(){
	//다시하기 버튼
	$("span.resetAllseats").on("click",function(){
		$("#numberSelector > div.group.normal > ul > li").first().trigger("click");
		$("#numberSelector > div.group.young > ul > li").first().trigger("click");
		$("#numberSelector > div.group.special > ul > li").first().trigger("click");
	});
	
	$("div.resetSelection").on("click",function(){
	
		history.go(-1);
	});
});
	/////////////////////////////////////////
	/* 인원수 셀렉터 EVENT 시작*/
	//trigger...
	//클릭하면..
	numberSelectorClick();
	/* 인원수 셀렉터 EVENT 끝*/
	

	//console.log("일 반 : "+$("#numberSelector > div.group.normal > ul > li.selected").text()+" 명");
	//console.log("청소년 : "+$("#numberSelector > div.group.young > ul > li.selected").text()+" 명");
	//console.log("우 대 : "+$("#numberSelector > div.group.special > ul > li.selected").text()+" 명")
	

	///////////////////////////////////////////////////////////////
	
	
	
	
	
	function numberSelectorClick(){
		totalArray = new Array();
		seatEvent();	//화면켜졌을 때는 0명
		
		$("#numberSelector div.group ul li").on("click",function(){
			
	 		// 좌석 선택 버튼 "빨간불" 해제하기!
	 	    $(".btn-right").removeClass("on");
	 	  	$(".btn-right").css("background", "url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/tnb/tnb_buttons.png) no-repeat;")
	 	  	
			$("#ticket_tnb > div > div.info.seat > div.row.seat_no.colspan3").children().first().next().text("");
			$("#ticket_tnb > div > div.info.seat > div.row.seat_name").children().first().next().text("");
			
			$("#ticket_tnb > div > div.info.seat > div.placeholder").css("display","block");
			$("#ticket_tnb > div > div.info.seat > div.row.seat_name").css("display","none");
			$("#ticket_tnb > div > div.info.seat > div.row.seat_no.colspan3").css("display","none");
			$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult > span.data").text("");
			$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth > span.data").text("");
			$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special > span.data").text("");
			$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final > span.data").text("");
			
			for(var i=0; i<index; i++){
				$("td.seat").removeClass("sequence"+i);
			}	
			$("td.seat").removeClass("on");
			$("td.seat").off("click");
			$("td.seat").off("mouseover");
			$("td.seat").off("mouseon");
			$(this).siblings().removeClass("selected");	
			$(this).addClass("selected");
			seatEvent();	// 인원수를 선택할 때마다 총인원수를 검사하여, 이벤트를 달리 적용한다.
			
			index = 0;
			
			totalArray = new Array();
			nNumber = $("#numberSelector > div.group.normal > ul > li.selected").text();
			yNumber = $("#numberSelector > div.group.young > ul > li.selected").text();
			sNumber = $("#numberSelector > div.group.special > ul > li.selected").text();
			
			nName = $("#numberSelector > div.group.normal > ul > li.selected").parent().prev().text()
			yName = $("#numberSelector > div.group.young > ul > li.selected").parent().prev().text()
			sName = $("#numberSelector > div.group.special > ul > li.selected").parent().prev().text()
			
			///// 0 을 선택했을 경우에는 인원이 지워지게 하도록 함!
			if(nNumber == '0' || yNumber == '0' || sNumber == '0'){
				$("#number").children().first().next().text("");
				$("#ticket_tnb > div > div.info.seat > div.row.seat_no.colspan3").children().first().next().text("");
				
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text("");
			}
			
			///// '일반' 만 선택했을 경우
			if(nName == '일반' && nNumber != '0' && yNumber == '0' && sNumber == '0'){
				// 상태바 "인원" 찍기! 
		        $("#number").children().first().next().text("일반 "+nNumber+"명");
		     	// 상태바 "인원" 타이틀 찍기!
		        $("#number").children().first().next().attr("title", "일반 "+nNumber+"명");
		     	
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").css("display", "none");
				
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text("");
			}
			
			///// '청소년' 만 선택했을 경우
			if(yName == '청소년' && yNumber != '0' && nNumber == '0' && sNumber == '0'){
				// 상태바 "인원" 찍기! 
		        $("#number").children().first().next().text("청소년 "+yNumber+"명");
		     	// 상태바 "인원" 타이틀 찍기!
		        $("#number").children().first().next().attr("title", "청소년 "+yNumber+"명");
		     	
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").css("display", "none");
				
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text("");
			}
			
			///// '우대' 만 선택했을 경우
			if(sName == '우대' && sNumber != '0' && yNumber == '0' && nNumber == '0'){
				// 상태바 "인원" 찍기! 
		        $("#number").children().first().next().text("우대 "+sNumber+"명");
		     	// 상태바 "인원" 타이틀 찍기!
		        $("#number").children().first().next().attr("title", "우대 "+sNumber+"명");
		     	
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").css("display", "none");
				
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text("");
			}
			
			///// '일반' & '청소년' 만 선택했을 경우
			if(nName == '일반' && yName == '청소년' && nNumber != '0' && yNumber != '0' && sNumber == '0'){
				nPrice=0;
				yPrice=0;
				sPrice=0;
		        // 상태바 "인원" 찍기! 
		        $("#number").children().first().next().text("일반 "+nNumber+"명"+", "+"청소년 "+yNumber+"명");
		     	// 상태바 "인원" 타이틀 찍기!
		        $("#number").children().first().next().attr("title", "일반 "+nNumber+"명"+", "+"청소년 "+yNumber+"명");
		     	
		        $("#ticket_tnb > div > div.info.payment-ticket").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").css("display", "none");
				
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text("");
			}
			
			///// '일반' & '우대' 만 선택했을 경우
			if(nName == '일반' && sName == '우대' && nNumber != '0' && sNumber != '0' && yNumber == '0'){
				nPrice=0;
				yPrice=0;
				sPrice=0;
				// 상태바 "인원" 찍기!  
		        $("#number").children().first().next().text("일반 "+nNumber+"명"+", "+"우대 "+sNumber+"명");
		     	// 상태바 "인원" 타이틀 찍기!
		        $("#number").children().first().next().attr("title", "일반 "+nNumber+"명"+", "+"우대 "+sNumber+"명");
		     	
		        $("#ticket_tnb > div > div.info.payment-ticket").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").css("display", "none");
				
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text("");
			}
			
			///// '청소년' & '우대' 만 선택했을 경우
			if(yName == '청소년' && sName == '우대' && yNumber != '0' && sNumber != '0' && nNumber == '0'){
				// 상태바 "인원" 찍기!  
		        $("#number").children().first().next().text("청소년 "+yNumber+"명"+", "+"우대 "+sNumber+"명");
		     	// 상태바 "인원" 타이틀 찍기!
		        $("#number").children().first().next().attr("title", "청소년 "+yNumber+"명"+", "+"우대 "+sNumber+"명");
		     	
		        $("#ticket_tnb > div > div.info.payment-ticket").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").css("display", "none");
				
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text("");
			}
			
			///// '일반' & '청소년' & '우대' (((모두))) 선택했을 경우
			if(nName == '일반' && yName == '청소년' && sName == '우대' && nNumber != '0' && yNumber != '0' && sNumber != '0'){
				// 상태바 "인원" 찍기! 
		        $("#number").children().first().next().text("일반 "+nNumber+"명"+", "+"청소년 "+yNumber+"명"+", "+"우대 "+sNumber+"명");
		     	// 상태바 "인원" 타이틀 찍기!
		        $("#number").children().first().next().attr("title", "일반 "+nNumber+"명"+", "+"청소년 "+yNumber+"명"+", "+"우대 "+sNumber+"명");
		     	
		        $("#ticket_tnb > div > div.info.payment-ticket").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").css("display", "none");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").css("display", "none");
				
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text("");
				
				$("#ticket_tnb > div > div.info.seat > div.row.seat_no.colspan3").children().first().next().text("");
				$("#ticket_tnb > div > div.info.seat > div.row.seat_name").children().first().next().text("");
				
			}
			
			
			
			
			for(var i=0; i<nNumber; i++){
				totalArray.push(new Normal());		
			}

			for(var i=0; i<yNumber; i++){
				totalArray.push(new Youth());
			}

			for(var i=0; i<sNumber; i++){
				totalArray.push(new Special());
			}
			
			console.log("Array에 저장된 인원수는 총 "+totalArray.length+"명 입니다.");
 			/*
			sequence = parseInt(nNumber)+parseInt(yNumber)+parseInt(sNumber);
			sequence = Math.ceil(sequence/2);			
			
			console.log("총 선택 횟수는 "+sequence+" 입니다");
			
			sequenceArray = new Array();
			
			for(var i=0; i<sequence; i++){
				sequenceArray.push("sequence"+i*2);
			}
			*/ 

		});
	}
	///////////////////////////////////////////////////////////////
	function seatEvent(){
		//마우스 올려놓으면...해제하면..
		var result = numberCheck();
		progress = result;
		// 총 인원수가 1이면 좌석을 한개만..
		if(result==0){
			$("body > div.container > div > div.mid > div").css("opacity", "0.4");
			$("body > div.container > div > div.mid > div").css("pointer-events", "none");
			$("td.seat").on("click",function(){
				alert("인원수가 0명이라 선택이 불가능합니다");
			});
			console.log("선택 인원수는 0명입니다");
			
		}else if(result==1){
			$("body > div.container > div > div.mid > div").css("opacity", "1");
			$("body > div.container > div > div.mid > div").css("pointer-events", "");
			console.log("인원수 1명입니다");
			numberOne();	//마우스 온오버 
			seatClickOne(result);	//클릭 이벤트
			
		}else if(result>=2){
			$("body > div.container > div > div.mid > div").css("opacity", "1");
			$("body > div.container > div > div.mid > div").css("pointer-events", "");
			console.log("인원수 "+result+"명입니다");
			numberTwo(result);		//마우스 온오버
			seatClickTwo(result);	//클릭 이벤트
		}
		
	}

	function numberCheck(){
		var array = $(".selected");
		var number = 0;
		for(var i=0; i<array.length; i++){
			number+=parseInt( $(array[i]).html() );
		}
		//console.log("총 인원수는 : "+number+" 입니다.");
		return number;
	}
	///////////////////////////////////////////////////////////////	
	// 1명 mouseOver
	function numberOne(){
		$("td.seat").on("mouseover",function(){
				var originalColor= $(this).css("border-color");
				$(this).css("border-color","red");
				$("td.seat").on("mouseout",function(){
					$(this).css("border-color",originalColor);
				});					
						
		});	
	}		
		
	
	// 2명이상 mouseOver
	function numberTwo(result){
		$("td.seat").off("mouseover");
		$("td.seat").off("mouseout");
		$("td.seat").on("mouseover",function(){
			
			if(result>1){
				
				var number = $(this).html();
				if(number%2==1){
					var alphabet =$(this).siblings().first().html();	// ex) A,B,C,D....L
					var numberFirst = $(this).html();	// ex) 1,2,3,4,5...10
					var numberNext = parseInt($(this).html())+1;
					
					var id = "#"+alphabet+numberFirst;	// ex) #A1,#A2....#L10
					var idNext = "#"+alphabet+numberNext;
					
					var originalColor = $(id).css("border-color");
					var originalColorNext = $(idNext).css("border-color");
					
					$(id).css("border-color","red");
					$(idNext).css("border-color","red");
					$(this).on("mouseout",function(){
						$(id).css("border-color",originalColor);
						$(idNext).css("border-color",originalColorNext);
						numberTwo(result);
					});				
				}else if(number%2==0){
					var alphabet =$(this).siblings().first().html();	// ex) A,B,C,D....L
					var numberFirst = $(this).html();	// ex) 1,2,3,4,5...10
					var numberPrev = parseInt($(this).html())-1;
					
					var id = "#"+alphabet+numberFirst;	// ex) #A1,#A2....#L10
					var idPrev = "#"+alphabet+numberPrev;
					
					var originalColor = $(id).css("border-color");
					var originalColorPrev = $(idPrev).css("border-color");
					

					$(id).css("border-color","red");
					$(idPrev).css("border-color","red");
					
					$(this).on("mouseout",function(){					
						$(id).css("border-color",originalColor);	
						$(idPrev).css("border-color",originalColorPrev);
						numberTwo(result);
					});				
				}
			}else if(result==1){
				numberOne();
			}
		});
		
	}
		
	function seatClickOne(result){
		$("td.seat").on("click",function(){
			
			//좌석 선택 div 없애기 
			$("#ticket_tnb > div > div.info.seat > div.placeholder").css("display","none");
			//좌석 선택 div 없앤 후 좌석명, 좌석번호 띄워주기!
			$("#ticket_tnb > div > div.info.seat > div.row.seat_name").css("display","block");
			$("#ticket_tnb > div > div.info.seat > div.row.seat_no.colspan3").css("display","block");
			
			if($(this).hasClass("on")){
				
		 		// 좌석 선택 버튼 "빨간불" 해제하기!
		 	    $(".btn-right").removeClass("on");
		 	  	$(".btn-right").css("background", "url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/tnb/tnb_buttons.png) no-repeat;")
				modalConfirmCheck();
		 	  	unUserCheck();
				$("#ticket_tnb > div > div.info.seat > div.row.seat_no.colspan3").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").children().first().next().text("");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text("");
				$("td.seat").removeClass("sequence"+index);
				$("td.seat").removeClass("on");
				totalArray[index].restore();
				totalArray[index].flagFalse();
				

			}else if(!$(this).hasClass("on")){
				$("td.seat").removeClass("sequence"+index);
				$("td.seat").removeClass("on");
				
				
				$(this).addClass("on");
				totalArray[index].seatNo = $(this).attr('id');
				
				$("#ticket_tnb > div > div.info.seat > div.row.seat_name").children().first().next().text($(this).siblings().first().attr('id')+"석");
				$("#ticket_tnb > div > div.info.seat > div.row.seat_name").children().first().next().attr("title", $(this).siblings().first().attr('id')+"석");
				
				nNumber = $("#numberSelector > div.group.normal > ul > li.selected").text();
				yNumber = $("#numberSelector > div.group.young > ul > li.selected").text();
				sNumber = $("#numberSelector > div.group.special > ul > li.selected").text();
				
				nName = $("#numberSelector > div.group.normal > ul > li.selected").parent().prev().text()
				yName = $("#numberSelector > div.group.young > ul > li.selected").parent().prev().text()
				sName = $("#numberSelector > div.group.special > ul > li.selected").parent().prev().text()

				if($(this).siblings().first().hasClass("economy")){
					totalArray[index].restore();
					totalArray[index].economy();
					totalArray[index].flagTrue();
					$(this).addClass("sequence"+index);
					

					}
				}else if($(this).siblings().first().hasClass("standard")){
					totalArray[index].restore();
					totalArray[index].flagTrue();
					$(this).addClass("sequence"+index);
					$("#ticket_tnb > div > div.info.seat > div.row.seat_no.colspan3").children().first().next().text(totalArray[index].seatNo);
					$("#ticket_tnb > div > div.info.seat > div.row.seat_no.colspan3").children().first().next().attr("title", totalArray[index].seatNo);
					///// '일반' 만 선택했을 경우
					if(nName == '일반' && nNumber != '0' && yNumber == '0' && sNumber == '0'){
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").children().first().next().text(totalArray[index].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text(totalArray[index].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$("#ticket_tnb > div > div.info.payment-ticket").css("display", "block");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").css("display", "block");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").css("display", "none");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").css("display", "none");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").css("display", "block");
					}
					///// '청소년' 만 선택했을 경우
					if(yName == '청소년' && yNumber != '0' && nNumber == '0' && sNumber == '0'){
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").children().first().next().text(totalArray[index].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text(totalArray[index].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$("#ticket_tnb > div > div.info.payment-ticket").css("display", "block");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").css("display", "none");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").css("display", "block");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").css("display", "none");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").css("display", "block");
					}
					///// '우대' 만 선택했을 경우
					if(sName == '우대' && sNumber != '0' && yNumber == '0' && nNumber == '0'){
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").children().first().next().text(totalArray[index].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text(totalArray[index].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$("#ticket_tnb > div > div.info.payment-ticket").css("display", "block");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").css("display", "none");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").css("display", "none");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").css("display", "block");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").css("display", "block");
					}
				}else if($(this).siblings().first().hasClass("prime")){
					totalArray[index].restore();
					totalArray[index].prime();
					totalArray[index].flagTrue();
					$(this).addClass("sequence"+index);
					$("#ticket_tnb > div > div.info.seat > div.row.seat_no.colspan3").children().first().next().text(totalArray[index].seatNo);
					$("#ticket_tnb > div > div.info.seat > div.row.seat_no.colspan3").children().first().next().attr("title", totalArray[index].seatNo);
					///// '일반' 만 선택했을 경우
					if(nName == '일반' && nNumber != '0' && yNumber == '0' && sNumber == '0'){
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").children().first().next().text(totalArray[index].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text(totalArray[index].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$("#ticket_tnb > div > div.info.payment-ticket").css("display", "block");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").css("display", "block");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").css("display", "none");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").css("display", "none");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").css("display", "block");
					}
					///// '청소년' 만 선택했을 경우
					if(yName == '청소년' && yNumber != '0' && nNumber == '0' && sNumber == '0'){
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").children().first().next().text(totalArray[index].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text(totalArray[index].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$("#ticket_tnb > div > div.info.payment-ticket").css("display", "block");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").css("display", "none");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").css("display", "block");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").css("display", "none");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").css("display", "block");
					}
					///// '우대' 만 선택했을 경우
					if(sName == '우대' && sNumber != '0' && yNumber == '0' && nNumber == '0'){
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").children().first().next().text(totalArray[index].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text(totalArray[index].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$("#ticket_tnb > div > div.info.payment-ticket").css("display", "block");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").css("display", "none");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").css("display", "none");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").css("display", "block");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").css("display", "block");
					}
				}else if($(this).siblings().first().hasClass("sweetBox")){
					totalArray[index].restore();
					totalArray[index].sweetbox();
					totalArray[index].flagTrue();
					$(this).addClass("sequence"+index);
					$("#ticket_tnb > div > div.info.seat > div.row.seat_no.colspan3").children().first().next().text(totalArray[index].seatNo);
					$("#ticket_tnb > div > div.info.seat > div.row.seat_no.colspan3").children().first().next().attr("title", totalArray[index].seatNo);
					///// '일반' 만 선택했을 경우
					if(nName == '일반' && nNumber != '0' && yNumber == '0' && sNumber == '0'){
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").children().first().next().text(totalArray[index].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text(totalArray[index].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$("#ticket_tnb > div > div.info.payment-ticket").css("display", "block");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").css("display", "block");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").css("display", "none");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").css("display", "none");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").css("display", "block");
					}
					///// '청소년' 만 선택했을 경우
					if(yName == '청소년' && yNumber != '0' && nNumber == '0' && sNumber == '0'){
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").children().first().next().text(totalArray[index].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text(totalArray[index].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$("#ticket_tnb > div > div.info.payment-ticket").css("display", "block");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").css("display", "none");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").css("display", "block");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").css("display", "none");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").css("display", "block");
					}
					///// '우대' 만 선택했을 경우
					if(sName == '우대' && sNumber != '0' && yNumber == '0' && nNumber == '0'){
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").children().first().next().text(totalArray[index].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text(totalArray[index].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$("#ticket_tnb > div > div.info.payment-ticket").css("display", "block");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").css("display", "none");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").css("display", "none");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").css("display", "block");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").css("display", "block");
					}
				}else if($(this).siblings().first().hasClass("handicap")){
					totalArray[index].restore();
					totalArray[index].flagTrue();
					$(this).addClass("sequence"+index);
					$("#ticket_tnb > div > div.info.seat > div.row.seat_no.colspan3").children().first().next().text(totalArray[index].seatNo);
					$("#ticket_tnb > div > div.info.seat > div.row.seat_no.colspan3").children().first().next().attr("title", totalArray[index].seatNo);
					///// '일반' 만 선택했을 경우
					if(nName == '일반' && nNumber != '0' && yNumber == '0' && sNumber == '0'){
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").children().first().next().text(totalArray[index].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text(totalArray[index].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$("#ticket_tnb > div > div.info.payment-ticket").css("display", "block");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").css("display", "block");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").css("display", "none");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").css("display", "none");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").css("display", "block");
					}
					///// '청소년' 만 선택했을 경우
					if(yName == '청소년' && yNumber != '0' && nNumber == '0' && sNumber == '0'){
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").children().first().next().text(totalArray[index].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text(totalArray[index].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$("#ticket_tnb > div > div.info.payment-ticket").css("display", "block");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").css("display", "none");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").css("display", "block");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").css("display", "none");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").css("display", "block");
					}
					///// '우대' 만 선택했을 경우
					if(sName == '우대' && sNumber != '0' && yNumber == '0' && nNumber == '0'){
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").children().first().next().text(totalArray[index].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text(totalArray[index].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$("#ticket_tnb > div > div.info.payment-ticket").css("display", "block");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").css("display", "none");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").css("display", "none");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").css("display", "block");
						$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").css("display", "block");
					}
				}//end of else-if	
		    	  // 좌석 선택 버튼 "빨간불" 들어오게!
		    	  $(".btn-right").addClass("on");
		    	  $(".btn-right").css("background", "url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/tnb/tnb_buttons.png) no-repeat;")
		    	  modalConfirmCheck();
		    	  unUserCheck();
			}//!hasClass("on") 안가지고 있다면
			//result-=1;
			
			return result;
		});//end of eventHandler- click
	}//end of function seatClickOne();		
		
	function seatClickTwo(result){
		$("td.seat").off("click");
		
		$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").css("display","none");
		$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").css("display","none");
		$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").css("display","none");
		$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").css("display","none");
		
		// price(가격) 찍어버리기!
		for(var i=0; i<totalArray.length; i++){
			
			if(totalArray[i].name == "일반"){
				yPrice=0;
				sPrice=0;
				console.log("여기는 일반 가격:"+ parseInt(totalArray[i].price))
				nPrice += parseInt(totalArray[i].price)
				console.log("여기는 일반 가격 합:"+ nPrice)
				
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").children().first().next().text(nPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
				
				$("#ticket_tnb > div > div.info.payment-ticket").css("display","block");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").css("display","block");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").css("display","block");
			}
			
			if(totalArray[i].name == "청소년"){
				nPrice=0;
				sPrice=0;
				console.log("여기는 청소년 가격:"+ parseInt(totalArray[i].price))
				yPrice += parseInt(totalArray[i].price)
				console.log("여기는 청소년 가격 합:"+ yPrice)
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").children().first().next().text(yPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
				
				$("#ticket_tnb > div > div.info.payment-ticket").css("display","block");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").css("display","block");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").css("display","block");
			}
			
			if(totalArray[i].name == "우대"){
				nPrice=0;
				yPrice=0;
				console.log("여기는 우대 가격:"+ parseInt(totalArray[i].price))
				sPrice += parseInt(totalArray[i].price)
				console.log("여기는 우대 가격 합:"+ sPrice)
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").children().first().next().text(sPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");
				
				$("#ticket_tnb > div > div.info.payment-ticket").css("display","block");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").css("display","block");
				$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").css("display","block");
			}
			
		}//end of for
		
		var nSum = $("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult > span.data").text().split(" 원")[0]
		console.log("nSum 이라구 :" + nSum)		
		
		var ySum = $("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth > span.data").text().split(" 원")[0]
		console.log("ySum 이라구 :" + ySum)
		
		var sSum = $("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special > span.data").text().split(" 원")[0]
		console.log("sSum 이라구 :" + sSum)
		
		// 일반 만!
		if(nSum != "" && ySum == "" && sSum== ""){
			nPrice=0;
			var nysSum = parseInt(nSum);
			console.log("nysSum 최종이라구 :"+ nysSum+",000")
			$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-adult").children().first().next().text(nysSum+",000 원");
			$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text(nysSum+",000 원");
		}		
		
		// 청소년 만!
		if(ySum != "" && nSum == "" && sSum== ""){
			yPrice=0;
			var nysSum = parseInt(ySum);
			console.log("nysSum 최종이라구 :"+ nysSum+",000")
			$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-youth").children().first().next().text(nysSum+",000 원");
			$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text(nysSum+",000 원");
		}		
		
		// 우대 만!
		if(sSum != "" && nSum == "" && ySum== ""){
			sPrice=0;
			var nysSum = parseInt(sSum);
			console.log("nysSum 최종이라구 :"+ nysSum+",000")
			$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-special").children().first().next().text(nysSum+",000 원");
			$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text(nysSum+",000 원");
		}		
		
		// 모두 선택했을 경우!
		if(nSum != "" && ySum != "" && sSum != ""){
			var nysSum = parseInt(nSum)+parseInt(ySum)+parseInt(sSum);
			console.log("nysSum 최종이라구 :"+ nysSum+",000")
			$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text(nysSum+",000 원");
		}
		
		// 일반 & 청소년 만
		if(nSum != "" && ySum != "" && sSum == ""){
			var nysSum = parseInt(nSum)+parseInt(ySum);
			console.log("nysSum 최종이라구 :"+ nysSum+",000")
			$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text(nysSum+",000 원");
		}
		
		// 일반 & 우대 만
		if(nSum != "" && sSum != "" && ySum == ""){
			var nysSum = parseInt(nSum)+parseInt(sSum);
			console.log("nysSum 최종이라구 :"+ nysSum+",000")
			$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text(nysSum+",000 원");
		}
		
		// 청소년 & 우대 만
		if(ySum != "" && sSum != "" && nSum == ""){
			var nysSum = parseInt(ySum)+parseInt(sSum);
			console.log("nysSum 최종이라구 :"+ nysSum+",000")
			$("#ticket_tnb > div > div.info.payment-ticket > div.row.payment-final").children().first().next().text(nysSum+",000 원");
		}
		
		
		// seatNo(좌석번호) 찍어버리기!
		for(var i=0; i<totalArray.length; i++){
			if(typeof totalArray[i].seatNo!="undefined" && totalArray[i].seatNo.length>0){
				console.log("여기는 씨트넘버:"+ totalArray[i].seatNo)
				_str+=totalArray[i].seatNo+","
				console.log("비포 str:"+ _str)
			}
		}//end of for
		
		if(typeof _str !="undefined"){
			var len = _str.length;
			var array = _str.substring(9, len-1).split(",");
			var newArray = [];
				for( var i in array){
				   if(newArray.indexOf(array[i])==-1){
				        newArray.push(array[i]);
				   }
				}
				var _str="";
				
				for( var j in newArray){
				    
				    _str+=newArray[j]+", ";
				}
				
				_str = _str.substring(0, _str.length-2)
				console.log("애프터 str:"+ _str)
				
			$("#ticket_tnb > div > div.info.seat > div.row.seat_no.colspan3").children().first().next().text(_str);
			$("#ticket_tnb > div > div.info.seat > div.row.seat_no.colspan3").children().first().next().attr("title", _str);
				
		}
		
		if(result>1){
			$("td.seat").on("click",function(){
				
				//좌석 선택 div 없애기 
				$("#ticket_tnb > div > div.info.seat > div.placeholder").css("display","none");
				//좌석 선택 div 없앤 후 좌석명, 좌석번호 띄워주기!
				$("#ticket_tnb > div > div.info.seat > div.row.seat_name").css("display","block");
				$("#ticket_tnb > div > div.info.seat > div.row.seat_no.colspan3").css("display","block");
				
				$("#ticket_tnb > div > div.info.seat > div.row.seat_name").children().first().next().text($(this).siblings().first().attr('id')+"석");
				$("#ticket_tnb > div > div.info.seat > div.row.seat_name").children().first().next().attr("title", $(this).siblings().first().attr('id')+"석");
				
				var number = $(this).html();
				if(number%2==1){
					if($(this).hasClass("on")){
						$(this).removeClass("on");
						$(this).next().removeClass("on");
						index = parseInt($(this).attr('class').substr($(this).attr('class').length-1));
						

						totalArray[index*2].restore();
						totalArray[index*2+1].restore();
						totalArray[index*2].flagFalse();
						totalArray[index*2+1].flagFalse();
						
						$(this).removeClass("sequence"+index);
						$(this).next().removeClass("sequence"+index);	
						
						

						result+=2;
						if(result==1){		// result count가 떨어져 1로 갈 경우에, mouseout trigger 시킴
							$(this).trigger("mouseout");
						}
						
						seatClickTwo(result);
					}else if(!$(this).hasClass("on")){
						
						$(this).addClass("on");
						$(this).next().addClass("on");
						$(this).addClass("sequence"+index);
						$(this).next().addClass("sequence"+index);									
						totalArray[index*2].seatNo = $(this).attr('id');
						totalArray[index*2+1].seatNo =$(this).next().attr('id');
						
						if($(this).siblings().first().hasClass("economy")){
								totalArray[index*2].restore();
								totalArray[index*2+1].restore();
								totalArray[index*2].economy();
								totalArray[index*2+1].economy();									
								totalArray[index*2].flagTrue();
								totalArray[index*2+1].flagTrue();								

						}else if($(this).siblings().first().hasClass("standard")){
							
								totalArray[index*2].restore();
								totalArray[index*2+1].restore();								
								totalArray[index*2].flagTrue();
								totalArray[index*2+1].flagTrue();
							
						}else if($(this).siblings().first().hasClass("prime")){
							
								totalArray[index*2].restore();
								totalArray[index*2+1].restore();
								totalArray[index*2].prime();
								totalArray[index*2+1].prime();									
								totalArray[index*2].flagTrue();
								totalArray[index*2+1].flagTrue();
							
						}else if($(this).siblings().first().hasClass("sweetBox")){
							
								totalArray[index*2].restore();
								totalArray[index*2+1].restore();
								totalArray[index*2].sweetbox();
								totalArray[index*2+1].sweetbox();									
								totalArray[index*2].flagTrue();
								totalArray[index*2+1].flagTrue();	
							
						}else if($(this).siblings().first().hasClass("handicap")){
							
								totalArray[index*2].restore();
								totalArray[index*2+1].restore();
								totalArray[index*2].handicap();
								totalArray[index*2+1].handicap();									
								totalArray[index*2].flagTrue();
								totalArray[index*2+1].flagTrue();
							
						}		
						

						var array = $("td.seat");
						arrayS = new Array();
						for(var i=0; i<array.length; i++){
							for(var j=0; j<Math.ceil(progress/2)+1; j++){
								if($(array[i]).hasClass("sequence"+j) ){
									arrayS.push(j);
									break;
								}
							}
						}
						
						
						//console.log(arrayS);
						
						arrayK = new Array();
						
						for( var i in arrayS){
							if(arrayK.indexOf(arrayS[i])==-1){
								arrayK.push(arrayS[i]);
							}
						}
						
						for(var i=0; i<Math.ceil(progress/2)+1; i++){
							if(arrayK.indexOf(i)==-1){
								index = i;
								break;
							}
							
						}
		
						result-=2;
						if(result==1){
							$(this).trigger("mouseout");
						}							
						seatClickTwo(result);
					}
			}else if(number%2==0){
					if($(this).hasClass("on")){
						$(this).removeClass("on");
						$(this).prev().removeClass("on");
						index = parseInt($(this).attr('class').substr($(this).attr('class').length-1));

						totalArray[index*2].restore();
						totalArray[index*2+1].restore();
						totalArray[index*2].flagFalse();
						totalArray[index*2+1].flagFalse();
						
						$(this).removeClass("sequence"+index);
						$(this).prev().removeClass("sequence"+index);	
						
						

						result+=2;
						if(result==1){		// result count가 떨어져 1로 갈 경우에, mouseout trigger 시킴
							$(this).trigger("mouseout");
						}
						
						seatClickTwo(result);
					}else if(!$(this).hasClass("on")){
						
						
						$(this).addClass("on");
						$(this).prev().addClass("on");
						$(this).addClass("sequence"+index);
						$(this).prev().addClass("sequence"+index);									
						totalArray[index*2].seatNo = $(this).prev().attr('id');
						totalArray[index*2+1].seatNo =$(this).attr('id');
						
						if($(this).siblings().first().hasClass("economy")){
							
								totalArray[index*2].restore();
								totalArray[index*2+1].restore();
								totalArray[index*2].economy();
								totalArray[index*2+1].economy();									
								totalArray[index*2].flagTrue();
								totalArray[index*2+1].flagTrue();							

						}else if($(this).siblings().first().hasClass("standard")){
							
								totalArray[index*2].restore();
								totalArray[index*2+1].restore();								
								totalArray[index*2].flagTrue();
								totalArray[index*2+1].flagTrue();	
							
						}else if($(this).siblings().first().hasClass("prime")){
							
								totalArray[index*2].restore();
								totalArray[index*2+1].restore();
								totalArray[index*2].prime();
								totalArray[index*2+1].prime();									
								totalArray[index*2].flagTrue();
								totalArray[index*2+1].flagTrue();
							
						}else if($(this).siblings().first().hasClass("sweetBox")){
							
								totalArray[index*2].restore();
								totalArray[index*2+1].restore();
								totalArray[index*2].sweetbox();
								totalArray[index*2+1].sweetbox();									
								totalArray[index*2].flagTrue();
								totalArray[index*2+1].flagTrue();
							
						}else if($(this).siblings().first().hasClass("handicap")){
							
								totalArray[index*2].restore();
								totalArray[index*2+1].restore();
								totalArray[index*2].handicap();
								totalArray[index*2+1].handicap();									
								totalArray[index*2].flagTrue();
								totalArray[index*2+1].flagTrue();
							
						}		
						
						var array = $("td.seat");
						arrayS = new Array();
						for(var i=0; i<array.length; i++){
							for(var j=0; j<Math.ceil(progress/2)+1; j++){
								if($(array[i]).hasClass("sequence"+j) ){
									arrayS.push(j);
									break;
								}
							}
						}
						
						
						//console.log(arrayS);
						
						arrayK = new Array();
						
						for( var i in arrayS){
							if(arrayK.indexOf(arrayS[i])==-1){
								arrayK.push(arrayS[i]);
							}
						}
						
						for(var i=0; i<Math.ceil(progress/2)+1; i++){
							if(arrayK.indexOf(i)==-1){
								index = i;
								break;
							}
						}
					
						result-=2;
						if(result==1){
							$(this).trigger("mouseout");
						}							
						seatClickTwo(result);
					}						
				}
			});

		}else if(result==1){
			$("td.seat").off("mouseover");
			$("td.seat").off("mouseout");	
			numberOne();
			$("td.seat").on("click",function(){
				var number = $(this).html();
				
				if(number%2==1){
					if($(this).hasClass("on") && $(this).next().hasClass("on")){
						$(this).removeClass("on");
						$(this).next().removeClass("on");
						index = parseInt($(this).attr('class').substr($(this).attr('class').length-1));
						

						totalArray[index*2].restore();
						totalArray[index*2+1].restore();
						totalArray[index*2].flagFalse();
						totalArray[index*2+1].flagFalse();
						
						$(this).removeClass("sequence"+index);
						$(this).next().removeClass("sequence"+index);	
						
						
						result+=2;
						seatClickTwo(result);
					}else if($(this).hasClass("on") && !$(this).next().hasClass("on")){
						$(this).removeClass("on");
						$(this).removeClass("sequence"+index);
						
						totalArray[index*2].restore();
						totalArray[index*2].flagFalse();
						
						result+=1;
						seatClickTwo(result);		
					}else if(!$(this).hasClass("on")){
						$(this).addClass("on");
						$(this).addClass("sequence"+index);								
						totalArray[index*2].seatNo = $(this).attr('id');
						
						if($(this).siblings().first().hasClass("economy")){
							
								totalArray[index*2].restore();
								totalArray[index*2].economy();								
								totalArray[index*2].flagTrue();						

						}else if($(this).siblings().first().hasClass("standard")){
							
								totalArray[index*2].restore();							
								totalArray[index*2].flagTrue();
							
						}else if($(this).siblings().first().hasClass("prime")){
							
								totalArray[index*2].restore();
								totalArray[index*2].prime();								
								totalArray[index*2].flagTrue();
							
						}else if($(this).siblings().first().hasClass("sweetBox")){
							
								totalArray[index*2].restore();
								totalArray[index*2].sweetbox();								
								totalArray[index*2].flagTrue();
							
						}else if($(this).siblings().first().hasClass("handicap")){
							
								totalArray[index*2].restore();
								totalArray[index*2].handicap();								
								totalArray[index*2].flagTrue();
							
						}		
						
						var array = $("td.seat");
						arrayS = new Array();
						for(var i=0; i<array.length; i++){
							for(var j=0; j<Math.ceil(progress/2)+1; j++){
								if($(array[i]).hasClass("sequence"+j) ){
									arrayS.push(j);
									break;
								}
							}
						}
						
						
						//console.log(arrayS);
						
						arrayK = new Array();
						
						for( var i in arrayS){
							if(arrayK.indexOf(arrayS[i])==-1){
								arrayK.push(arrayS[i]);
							}
						}
						
						for(var i=0; i<Math.ceil(progress/2)+1; i++){
							if(arrayK.indexOf(i)==-1){
								index = i;
								break;
							}
						}		
						
						result-=1;
						seatClickTwo(result);
					}
					
				}else{
					if($(this).hasClass("on") && $(this).prev().hasClass("on")){
						$(this).removeClass("on");
						$(this).prev().removeClass("on");
						
						index = parseInt($(this).attr('class').substr($(this).attr('class').length-1));
						

						totalArray[index*2].restore();
						totalArray[index*2+1].restore();
						totalArray[index*2].flagFalse();
						totalArray[index*2+1].flagFalse();
						
						$(this).removeClass("sequence"+index);
						$(this).next().removeClass("sequence"+index);		
						
						result+=2;
						seatClickTwo(result);
					}else if($(this).hasClass("on") && !$(this).prev().hasClass("on")){
						$(this).removeClass("on");
						$(this).removeClass("sequence"+index);
						
						totalArray[index*2].restore();
						totalArray[index*2].flagFalse();
													
						result+=1;
						seatClickTwo(result);		
					}else if(!$(this).hasClass("on")){
						$(this).addClass("on");
						$(this).addClass("sequence"+index);								
						totalArray[index*2].seatNo = $(this).attr('id');
						
						if($(this).siblings().first().hasClass("economy")){
							
								totalArray[index*2].restore();
								totalArray[index*2].economy();								
								totalArray[index*2].flagTrue();						

						}else if($(this).siblings().first().hasClass("standard")){
							
								totalArray[index*2].restore();							
								totalArray[index*2].flagTrue();
							
						}else if($(this).siblings().first().hasClass("prime")){
							
								totalArray[index*2].restore();
								totalArray[index*2].prime();								
								totalArray[index*2].flagTrue();
							
						}else if($(this).siblings().first().hasClass("sweetBox")){
							
								totalArray[index*2].restore();
								totalArray[index*2].sweetbox();								
								totalArray[index*2].flagTrue();
							
						}else if($(this).siblings().first().hasClass("handicap")){
							
								totalArray[index*2].restore();
								totalArray[index*2].handicap();								
								totalArray[index*2].flagTrue();
							
						}		
						
						var array = $("td.seat");
						arrayS = new Array();
						for(var i=0; i<array.length; i++){
							for(var j=0; j<Math.ceil(progress/2)+1; j++){
								if($(array[i]).hasClass("sequence"+j) ){
									arrayS.push(j);
									break;
								}
							}
						}
						
						
						//console.log(arrayS);
						
						arrayK = new Array();
						
						for( var i in arrayS){
							if(arrayK.indexOf(arrayS[i])==-1){
								arrayK.push(arrayS[i]);
							}
						}
						
						for(var i=0; i<Math.ceil(progress/2)+1; i++){
							if(arrayK.indexOf(i)==-1){
								index = i;
								break;
							}
						}							
						result-=1;
						seatClickTwo(result);
					}						
					
				}
			});
		}else if(result==0){
			  alert("좌석을 모두 선택하였습니다. 재선택하려면 다시하기를 선택하세요.");
	    	  // 좌석 선택 버튼 "빨간불" 들어오게!
	    	  $(".btn-right").addClass("on");
	    	  $(".btn-right").css("background", "url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/tnb/tnb_buttons.png) no-repeat;")			
	    	  modalConfirmCheck();
	    	  unUserCheck();
		}
	}//end of click();		
	
	
	//////////////////////// 자바스크립트 객체는 여기에 ///////////////////////
	function Normal(){
		this.name = "일반"
		this.seatNo ="";
		this.price = 0;
		this.seatType = "standard";
		this.flag = false;
		
		this.flagTrue = function(){
			this.flag = true;
		}
		
		this.flagFalse = function(){
			this.flag = false;
		}
		
		this.getPrice = function(){
			if(this.flag==true){
				return this.price;
			}
		}
		
		this.restore = function(){
			this.price = "10000";
			this.seatType = "standard";
		}

		this.economy = function(){
			this.price = "9000";
			this.seatType ="economy";
		}

		this.prime = function(){
			this.price = "11000";
			this.seatType ="prime";
		}

		this.sweetbox = function(){
			this.price = "12000";
			this.seatType = "sweetbox";
		}
	}

	function Youth(){
		this.name = "청소년"
		this.seatNo ="";			
		this.price = 0;
		this.seatType = "standard";
		this.flag = false;
		
		this.flagTrue = function(){
			this.flag = true;
		}
		
		this.flagFalse = function(){
			this.flag = false;
		}
		
		this.getPrice = function(){
			if(this.flag==true){
				return this.price;
			}
		}
		
		this.restore = function(){
			this.price = "8000";
			this.seatType = "standard";
		}
		

		this.economy = function(){
			this.price = "7000";
			this.seatType ="economy";
		}

		this.prime = function(){
			this.price = "9000";
			this.seatType ="prime";
		}

		this.sweetbox = function(){
			this.price = "10000";
			this.seatType = "sweetbox";
		}
	}
	// 우대는 전좌석 5천원 혹시 모를 오류방지를 위해 위와 똑같이 메서드 추가해놨음..
	function Special(){
		this.name = "우대";
		this.seatNo ="";
		this.price = 0;
		this.seatType = "standard";
		this.flag = false;
		
		this.flagTrue = function(){
			this.flag = true;
		}
		
		this.flagFalse = function(){
			this.flag = false;
		}
		
		this.getPrice = function(){
			if(this.flag==true){
				return this.price;
			}
		}
		
		this.restore = function(){
			this.price = "5000";
			this.seatType = "standard";
		}		
		
		this.economy = function(){
			this.price = "4000";
			this.seatType ="economy";
		}

		this.prime = function(){
			this.price = "6000";
			this.seatType ="prime";
		}

		this.sweetbox = function(){
			this.price = "8000";
			this.seatType = "sweetbox";
		}
	}
		
	///////////////////////////////////////////////////////////////////
	
	function total(x){
		var ticketingPrice=0;	
		var audienceType = "";
		var seatType ="";
		var seatNo = "";
		var headCount = totalArray.length;
		
		
		for(var j=0; j<totalArray.length; j++){
			ticketingPrice+=parseInt(totalArray[j].getPrice());
			if(j!=totalArray.length-1){
				audienceType+=totalArray[j].name+",";
				seatType+=totalArray[j].seatType+",";
				seatNo+=totalArray[j].seatNo+",";
			}else{
				audienceType+=totalArray[j].name;
				seatType+=totalArray[j].seatType;
				seatNo+=totalArray[j].seatNo;
			}
		}	
		console.log("audienceType :"+audienceType);
		console.log("seatType :"+seatType);
		console.log("seatNo : "+seatNo);
		console.log("totalPrice : "+ticketingPrice)
		console.log("headCount : "+headCount)
		console.log("dateTimeNo 는 :"+'${dateTime.dateTimeNo}');
		
	    $.ajax({
	    		  type: "POST",
	    		  url: "/ticketing/json/getSelectedSeat",
	    		  data: JSON.stringify({
	    			 	dateTimeNo : "${dateTime.dateTimeNo}", 
	    		  }),
	    		  dataType : "json",
    		      headers: {  
	    		        "Accept" : "application/json",
	    		        "Content-Type": "application/json"
    		      },
    		      success : function(jsonData,status){
    		    	  
    		    	  //누군가 예매를 진행했다면
    		    	  if(jsonData.selectedSeat!=null && jsonData.selectedSeat.length>0){
	    		    	  var selectedSeat =jsonData.selectedSeat.split(",");
	    		    	  var selectSeat = seatNo.split(",");
	    		    	  var flag = true;
	    		    	  var totalSeat = jsonData.selectedSeat+","+seatNo
	    		    	  //console.log(totalSeat);
	    		    	  for(var i=0; i<selectSeat.length; i++){
	    		    		  //겹치지 않으면..
	    		    		 if(selectedSeat.indexOf(selectSeat[i])==-1){ 			 
	    		    			 
	    		    		 //단 하나라도 겹치면..
	    		    		 }else{
	    		    			 alert("좌석 "+selectSeat[i]+"를 누군가 예약중입니다.")
	    		    			 flag = false;
	    		    		 }
	    		    	  }//end of for
	    		    	  
	    		    	  //전부 겹치지 않았으면
	    		    	  if(flag){  		    		  
	    		    			//관객타입, 좌석타입, 좌석번호, 총가격, 인원수
		  		    			if(x==0){
		  		    				moveToQuickOrder(audienceType, seatType, seatNo, totalSeat, headCount, ticketingPrice)
				    			}else if(x==1){
				    				moveToPayment(audienceType, seatType, seatNo, totalSeat, headCount, ticketingPrice)
				    			}
	    		    	  //하나라도 겹치면.. 	
	    		    	  }else{
	    		    		//  좌석 비활성화
	    		    		  for(var i=0; i<selectedSeat.length; i++){
	    		    		  	var id ="#"+selectedSeat[i]
	    		    		  	$(id).css("background-color","#bbb");
	    		    		  	$(id).css("pointer-events", "none");	
	    		    		  }  
	    		    		
	    		    		// 
							$("td.seat").removeClass("on");
							$("td.seat").off("click");
							$("td.seat").off("mouseover");
							$("td.seat").off("mouseon");	 
							
	    		  			seatEvent();	// 인원수를 선택할 때마다 총인원수를 검사하여, 이벤트를 달리 적용한다.
	    					
	    					index = 0;
	    					
	    					totalArray = new Array();
	    					nNumber = $("#numberSelector > div.group.normal > ul > li.selected").text();
	    					yNumber = $("#numberSelector > div.group.young > ul > li.selected").text();
	    					sNumber = $("#numberSelector > div.group.special > ul > li.selected").text();
	    					
	    					for(var i=0; i<nNumber; i++){
	    						totalArray.push(new Normal());		
	    					}

	    					for(var i=0; i<yNumber; i++){
	    						totalArray.push(new Youth());
	    					}

	    					for(var i=0; i<sNumber; i++){
	    						totalArray.push(new Special());
	    					}
	    					console.log("Array에 저장된 인원수는 총 "+totalArray.length+"명 입니다.");
	    					
	    		    	  }//end of if-else
	    		      //아무도 예매를안했다면 바로 ㄱㄱ		  
    		    	  }else if(jsonData.selectedSeat==null){
    		    		  console.log("null인데 아무도 예매안했음")
    		    		  console.log("x는 : "+x)
    		    		  var totalSeat = seatNo;
    		    		  
	  		    			if(x==0){
	  		    				moveToQuickOrder(audienceType, seatType, seatNo, totalSeat, headCount, ticketingPrice)
			    			}else if(x==1){
			    				moveToPayment(audienceType, seatType, seatNo, totalSeat, headCount, ticketingPrice)
			    			}
    		    		  
    		    	  }
    		    	 
    		      }//end of success
    		  }); //end of ajax
		
	}//end of total
	
	function moveToPayment(audienceType, seatType, seatNo, totalSeat, headCount, ticketingPrice){
		
		
		 
		
 		$("input[name='dateTimeNo']").val("${dateTime.dateTimeNo}")
 		$("input[name='screenTime']").val(toYMD(Date.parse('${dateTime.screenDate}'))()+" "+toHM(Date.parse('${dateTime.screenTime}'))())
		$("input[name='movieName']").val("${dateTime.movieName}")
		$("input[name='theaterName']").val("${dateTime.theaterName}")
		$("input[name='audienceType']").val(audienceType)
		$("input[name='seatType']").val(seatType);
		$("input[name='seatNo']").val(seatNo);
		$("input[name='totalSeat']").val(totalSeat);
		$("input[name='headCount']").val(headCount);
		$("input[name='ticketingPrice']").val(ticketingPrice);
		
		//조조인지, 심야인지 시간 체크하여 가격변경
		if(toHM(Date.parse('${dateTime.screenTime}'))().substring(0,2)<11 ){
			ticketingPrice=ticketingPrice*0.9	
		}else if(toHM(Date.parse('${dateTime.screenTime}'))().substring(0,2)>23){
			ticketingPrice=ticketingPrice*0.9
		}															
																
		 $("form").attr("method" , "POST").attr("action" , "/payment/preparePayment").submit();
		
	}//end of moveToPayment	
	
	function moveToQuickOrder(audienceType, seatType, seatNo, totalSeat, headCount, ticketingPrice){
 		$("input[name='dateTimeNo']").val("${dateTime.dateTimeNo}")
 		$("input[name='screenTime']").val(toYMD(Date.parse('${dateTime.screenDate}'))()+" "+toHM(Date.parse('${dateTime.screenTime}'))())
		$("input[name='movieName']").val("${dateTime.movieName}")
		$("input[name='theaterName']").val("${dateTime.theaterName}")
		$("input[name='audienceType']").val(audienceType)
		$("input[name='seatType']").val(seatType);
		$("input[name='seatNo']").val(seatNo);
		$("input[name='totalSeat']").val(totalSeat);
		$("input[name='headCount']").val(headCount);
		
		//조조인지, 심야인지 시간 체크하여 가격변경
		if(toHM(Date.parse('${dateTime.screenTime}'))().substring(0,2)<11 ){
			ticketingPrice=ticketingPrice*0.9	
		}else if(toHM(Date.parse('${dateTime.screenTime}'))().substring(0,2)>23){
			ticketingPrice=ticketingPrice*0.9
		}
		
		$("input[name='ticketingPrice']").val(ticketingPrice);
							
																
		 $("form").attr("method" , "POST").attr("action" , "/product/getQuickOrder").submit();
		
	}//end of moveToPayment		
	
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

</script>

<!-- Interval로 주기적 체크 -->
<script type="text/javascript">
//console.log( toHM(Date.parse('${dateTime.screenTime}'))().substring(0,2) )

		var hr = parseInt($("span.screenTime").text().substring(0,2));
		var min = parseInt($("span.screenTime").text().substring(3,5));
		if( hr <5 ){
			hr = hr+24;
		}
		if( hr>=5 && hr<10){
			hr = "0"+hr;
		}
		if( min <10) {
			min = "0" + min;
		}	
		
		var result = hr+":"+min
		
		$("span.screenTime").text(result)
		$("#date > span.data").append(result)
		
		$("#date > span.data").attr("title", $("#date > span.data").text())


console.log('${dateTime.screenTime}'.substring(14,'${dateTime.screenTime}'.length-5))
console.log('${dateTime.screenDate}'.substring(0,10))
//서버에 부하를 너무 많이준다.
/*
	setInterval(function() {
		$.ajax({
			  type: "POST",
			  url: "/ticketing/json/getSelectedSeat",
			  data: JSON.stringify({
				 	dateTimeNo : "${dateTime.dateTimeNo}", 
			  }),
			  dataType : "json",
		    headers: { 
			        "Accept" : "application/json",
			        "Content-Type": "application/json"
		    },
		    success : function(jsonData,status){
		    try{
		    	var array = ("td.seat");
		    	var idArray ="";
		    	for(var i in array){
		    		if(i==array.length-1){
		    			idArray+=array[array.length-1].id
		    		}else{
		    			idArray+=array[i].id+","
		    		}
		    	}
		    	idArray = idArray.split(",");
		    	
		    	for(var i in idArray){
		    		var id = "#"+idArray[i];
	    		  	$(id).removeClass("off");		    		
		    	}		    	
		    	
		    	var selectedSeat =jsonData.selectedSeat.split(",");
	    		  for(var i=0; i<selectedSeat.length; i++){
		    		  	var id ="#"+selectedSeat[i]
		    		  	$(id).addClass("off");	
		    		  }
		    }catch(e){
		    	var array = ("td.seat");
		    	var idArray ="";
		    	for(var i in array){
		    		if(i==array.length-1){
		    			idArray+=array[array.length-1].id
		    		}else{
		    			idArray+=array[i].id+","
		    		}
		    	}
		    	idArray = idArray.split(",");
		    	
		    	for(var i in idArray){
		    		var id = "#"+idArray[i];
	    		  	$(id).removeClass("off");		    		
		    	}	
		    	
		    	
		    }//end of catch
		    }
		});
		}, 5000);	
		*/
</script>
	
</body>
</html>
