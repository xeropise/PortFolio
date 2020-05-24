<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

   <!-- font Awesome -->
  <script src="https://kit.fontawesome.com/b435a047df.js" crossorigin="anonymous"></script>
  
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  
  <!-- Bootstrap Extended -->
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors.css" />
  <link rel="stylesheet" href="https://bootstrap-colors-extended.herokuapp.com/bootstrap-colors-themes.css" />
	
   <!-- google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  	
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
 	  
	  ul li {
	    list-style-type:none;
	  }
	  
	  /* 예매율, 가나다 순 밑에 살짝 공백 주기 */
	  .sortmenu{
	  	margin-bottom: 9px;
	  }
	  
	  /* 영화, 프랜차이즈 & 극장, 날짜, 시간 header 부분 까맣고 굵게 */
	  .steps-header p{
	  	font-size: 15px;	  	
	    height: 33px;
	    padding-top: 5px;	  	
	  }
	  
	  /* 시간 선택부분에서 남은 좌석 div 조정 */
	  .seat{
	   padding-top: 9px;
	   padding-right: 9px;	  	  
	  }	  
	  
	  span, li{
	  	font-weight: bold;
	  }	  	  
	  
	  /* 바탕색 */
	  .steps-body {
	  	height : 583px;
	    background-color: #f2f0e4;
	  }
	  
	  body > div.container > div > div.steps > div > div.col-6.px-1.h-100 > div.steps-body{
	  	padding-top: 9px;
	  	padding-bottom: 9px;	
	  }	  
	  
	   body > div.container > div > div.steps > div > div.col-6.px-1.h-100 > div.steps-body.text-center{
	  	padding-top: 9px;
	  	padding-bottom: 9px;	  	
	  }
	  
	   /* 영화 선택부분 div 조정 */
	  .movie-select {
	  	padding-top: 9px;
	  	padding-left: 9px;	    
	    padding-right: 9px;	 
	    padding-bottom: 9px;	   
	  }	  
	  
	  /* 날짜 선택부분 div 조정 */
	  .calendar{	  	
	  	padding-top: 5px;
    	padding-left: 9px;	  
    	padding-right: 9px;	 	
    	padding-bottom: 9px;	
	  }	
	  
	  
	  
	  	  
	  a.ticketing  {
		    display: block;
	    	white-space: nowrap;
	    	text-overflow: ellipsis;
	    	overflow: hidden;
	    	vertical-align: middle;
	   }
	   
	   .list-group-item.cgv {
		    display: block;
	    	white-space: nowrap;
	    	text-overflow: ellipsis;
	    	overflow: hidden;
	    	vertical-align: middle;
	   }
	   
	   .list-group-item.lotte {
		    display: block;
	    	white-space: nowrap;
	    	text-overflow: ellipsis;
	    	overflow: hidden;
	    	vertical-align: middle;
	   }
	 
	   .list-group-item.megaBox {
		    display: block;
	    	white-space: nowrap;
	    	text-overflow: ellipsis;
	    	overflow: hidden;
	    	vertical-align: middle;
	   }
	   	 
	  .btn-right {
	  	background position : 0 -220px;
	  }
	  
	  .btn-right.on{
	    background position : -150px -220px;
	  }
	  
	  /*롯데시네마 극장 리스트 */
	  div.steps-body > div > div > div:nth-child(2) > div.theater-list.lotte > ul {
	  	margin-left : 50px;
	  }
	  
	  
	  li.off {	  	
	  	pointer-events   : none;
	  	opacity : 0.3;
	  }
	  
	  
	  .list-group{
	    cursor: pointer;
	    line-height: 33px;
	  }	  
	  
	  div.movie-list.text-md-left > ul > li{
	  	padding-left: 10px;
	  }	  	
	  
		body > div.container > div > div.steps > div > div.col-2.px-0.mb-0.h-100 > div.steps-body.text-center {
		    padding-top: 12px;
		    padding-bottom: 9px;
		}	  
  

	  
	   /* 자주가는 극장 font-size */
	   div > span.font-weight-bold > kbd {
	    	font-size: inherit;	   
	   }
	   
	   /* 자주가는 극장 마우스 손 모양 표시 */
	   .likeTheater > kbd {
		    font-size: inherit;
		    cursor: pointer;
	   }
	   
	   /* 자주가는 극장 정렬 */
	   div.steps-body > div > div > div:nth-child(1) > div {
	    	margin-left: 9px;
	   }
	   
	   div.steps-body > div > div > div:nth-child(3) > div {
	   		margin-left: 9px;
	   }	   	   
	   
	   div.steps-body.text-center > div > ul > li {	   		
		    padding-right: 0px;
		    padding-left: 0px;	   		
	   }
	   
	   div.steps-body > div > div > hr.my-3 {
	   	    margin-top: -1rem!important;
	   }
	   
	   div.steps-body.text-center > div > div > hr {
	       	margin-top: 24px;
	   }
	  
	   /* (영화 선택) 스크롤바 CSS  */
	   div.steps > div > div.col-3.px-0.h-100 > div.steps-body > div > div.movie-list.text-md-left > ul	{
	   		height: 524px;
	   		overflow: auto;
	   }  
	   
	  div.steps > div > div.col-3.px-0.h-100 > div.steps-body > div > div.movie-list.text-md-left > ul::-webkit-scrollbar {
	    width: 7px;
	  }
	  div.steps > div > div.col-3.px-0.h-100 > div.steps-body > div > div.movie-list.text-md-left > ul::-webkit-scrollbar-thumb {
	    background-color: #2f3542;
	    border-radius: 10px;
	  }
	  div.steps > div > div.col-3.px-0.h-100 > div.steps-body > div > div.movie-list.text-md-left > ul::-webkit-scrollbar-track {
	    background-color: grey;
	    border-radius: 10px;
	    box-shadow: inset 0px 0px 5px white;
	  }	  
	  
	  
	  /* 2020-02-14 조조, 심야*/
	  span.timeMorning {
	  	    background: url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/icon/icon_morning_night.png) no-repeat left;
    		background-position: 14px 2px;
		    padding-right: 33px; 
		    border-left-width: 0px;
		    padding-left: 33px;
	  }
	  
	  span.timeNight {
	 		background: url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/icon/icon_morning_night.png) no-repeat left;
   			background-position: 19px -19px;
		    padding-right: 33px;
		    border-left-width: 0px;
		    padding-left: 33px;
	  } 
	  
	  ul.theaterList {
	  		overflow : auto;
	  		height : 393px;
	  }
	  
	  ul.theaterList::-webkit-scrollbar {
	  		width: 7px;
	  }
	  
	  ul.theaterList::-webkit-scrollbar-thumb {
	    background-color: #2f3542;
	    border-radius: 10px;	  
	  }
	  
	  ul.theaterList::-webkit-scrollbar-track {
	    background-color: grey;
	    border-radius: 10px;
	    box-shadow: inset 0px 0px 5px white;	  
	  }
	  
	  div.theater-list > ul > li.list-group-item {
	  	overflow-x: hidden;
	  	padding : 15px 20px 40px 20px;
	  }
	  
	  div.franchise-list.cgv > ul > li.cgv > img {
		position: absolute;
		top: -12px;
		left: 16px;
	  }	
	  	  
	  div.franchise-list.lotte > ul > li.lotte > img {
	    position: absolute;
	    top: -11px;
	    left: 11px;
	  }
	  
	  div.franchise-list.megaBox > ul > li.megaBox > img {
	    position: absolute;
	    top: 3px;
	    left: 11px;
	  }
	  
	  div.remainingSeat > div > div > ul > li {
	  	padding-top : 0px;
	  	padding-bottom : 0px;
	  }
	  
	  div.remainingSeat > div > div > ul {
	  	overflow : auto;
	  	height : 336px;
	  }
	  
	  div.remainingSeat > div > div > ul::-webkit-scrollbar {
	  	width: 7px;
	  }
	  
	  div.remainingSeat > div > div > ul::-webkit-scrollbar-thumb {
	    background-color: #2f3542;
	    border-radius: 10px;	  	
	  }
	  
	  div.remainingSeat > div > div > ul::-webkit-scrollbar-track {
	    background-color: grey;
	    border-radius: 10px;
	    box-shadow: inset 0px 0px 5px white;	  	
	  }
	  
	  div.steps-body > div > div > div:nth-child(6) > div.theater-list.lotte.col-4 > ul::-webkit-scrollbar {
	  	width: 7px;
	  }
	  
	  /* 남은 좌석 수 색깔 */
	  div.remainingSeat > div > div > ul > li > span.seatcount {
	  	color : #45c245;
	  }
	  
	  /* 클릭했을 시 색 변화 */
	  .list-group-item.active {
	  	background-color : #5c5c5c !important; 
	  	border : 1px solid #5c5c5c !important;
	  }
	  .list-group-item.active a span {
	  	color : white
	  }
	  
	  body > div.container > div > div.steps > div > div.col-6.px-1.h-100 > div.steps-body > div > div > div.row.mx-0 > div.franchise-list.lotte.col-4.mx-0 > ul > li{
	  	background-color : white !important; 
	  	border : 1px solid #5c5c5c !important;
	  }
	  
	  body > div.container > div > div.steps > div > div.col-6.px-1.h-100 > div.steps-body > div > div > div.row.mx-0 > div.franchise-list.cgv.col-4.mx-0 > ul > li {
	  	background-color : white !important; 
	  	border : 1px solid #5c5c5c !important;
	  }
	  
	  body > div.container > div > div.steps > div > div.col-6.px-1.h-100 > div.steps-body > div > div > div.row.mx-0 > div.franchise-list.megaBox.col-4.mx-0 > ul > li {
	  	background-color : white !important; 
	  	border : 1px solid #5c5c5c !important;
	  }
	  body > div.container > div > div.steps > div > div.col-1.pl-0.pr-1.h-100 > div.steps-body.text-center > div > ul > li.month > div > span.month{
		display: block;
	    margin-top: -6px;
	    text-align: center;
	    color: #666;
	    font-size: 30px;
	    font-family: Verdana;
	    font-weight: bold;
	    line-height: 30px;
	 }
	 
	div.resetSelection {
		cursor: pointer;
		background-image: url('http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/top_buttons.png');
		background-repeat: no-repeat;
		background-position : 0 -120px;
		width: 113px;
	}
	 
	 

		/* 일반예매 or 극장별 비교예매 전환 */	
		.container {
			width:960px;
			margin:0 auto;
		}		
		.tab {
			list-style: none;
			margin: 0;
			padding: 0;
			overflow: hidden;
		}
		.tab li {
			float: left;
		}
		.tab li a {
			display: inline-block;
			color: #333;
			text-align: center;
			text-decoration: none;
			padding: 14px 16px;
			font-size: 17px;
			transition:0.3s;
		}
		.tabcontent {
			display: none;
			background-color:rgb(0,154,200);
			padding: 6px 12px;
			color:#fff;
		}
		ul.tab li.current{
			background-color: rgb(254, 229, 14);
			color: #222;
		}
		.tabcontent.current {
			display: block;
		}	 
	 
	 
	 
	 
</style>

<script>
$(function(){
	$($(".resetSelection")).on("click",function(){
		window.location.reload();
		 $(".loading").css("display", "block");
		 setTimeout(() => {
			 $(".loading").css("display", "none");
		}, 500);		
	});
	
  /* 영화 예매 버튼 통해서 들어오면 클릭*/
	$("div.steps-body > div > div.movie-list > ul > li").each(function(index, item){ 
		//console.log( $(item).attr('title') );
		//console.log('${movieName}');
		if($(item).attr('title')=='${movieName}'){
			$(item).trigger("click");
			break;
		}
	})
	
	/* 일반예매 or 극장별 비교예매 전환 */	
		$("a[href='#']:contains('일반예매')").on('click',function(){			
			$("body").load("/ticketing/addTicketing",function(){
				$('.dropdown-toggle').dropdown('toggle')
				$('.dropdown-toggle').dropdown('hide')				
			});
		})
	
		$("a[href='#']:contains('극장별 비교예매')").on('click',function(){			
			$("body").load("/ticketing/addCompareTicketing",function(){
				$('.dropdown-toggle').dropdown('toggle')
				$('.dropdown-toggle').dropdown('hide')				
			});
		})

});

</script>
</head>

<body>

<jsp:include page="/layout/header.jsp"></jsp:include>	
	
   <div class="container">

      <!-- 비교 예매 -->
      <div class="addTicketing">
        <!-- 타이틀 -->
     <div class="row mb-2" style="height: 53px;">
        <div style="z-index: 2;">
	   		<ul class="tab">
				<li class="current" data-tab="tab1"><a href="#">일반예매</a></li>
				<li data-tab="tab2"><a href="/ticketing/addCompareTicketing">극장별 비교예매</a></li>
			</ul>
		</div>
     	<div class="col-12 navi" style="z-index: 1; margin-left: 15px; width: 330px !important; bottom: 32px;">
     		<div class="resetSelection" style="clear:both; float:right; height:30px"></div>
     	</div>
     </div>
     
        <!-- 메인 컨텐츠  -->

        <div class="steps">
          <!-- 영화 선택-->
          <div class="row">
            <div class="col-3 px-0 h-100">
              <div class="steps-header">
                <p class="text-white text-center bg-dark mb-0">영화</p>
              </div>
              <div class="steps-body">
                <div class="movie-select h-auto">
                  <div class="movie-list text-md-left">
                  	<ul class="list-group">
	                  	<c:forEach var="i" items="${movieList}">
	                      <li class="list-group-item py-2" title="${i.movieName}">
	                      
	                       <c:if test= "${ i.rating == '전체'}">	
	                        	<a href="#" class="ticketing" >
	                        		<span class="icon rating-all">&nbsp;</span>
	                        		<span class="text">${i.movieName}</span>
	                        	</a>
	                       </c:if>	                      
	                 
	                       <c:if test= "${ i.rating == '12세'}">	
	                        	<a href="#" class="ticketing" >
	                        		<span class="icon rating-12">&nbsp;</span>
	                        		<span class="text">${i.movieName}</span>
	                        	</a>
	                       </c:if>
	                       
	                       <c:if test= "${ i.rating == '15세'}">	
	                        	<a href="#" class="ticketing" >
	                        		<span class="icon rating-15">&nbsp;</span>
	                        		<span class="text">${i.movieName}</span>
	                        	</a>
	                       </c:if>
	                       
	                       <c:if test= "${ i.rating == '18세'}">	
	                        	<a href="#" class="ticketing" >
	                        		<span class="icon rating-18">&nbsp;</span>
	                        		<span class="text">${i.movieName}</span>
	                        	</a>
	                       </c:if>
	                       
	                      </li>
						</c:forEach>
					</ul>
                  </div><!-- end of movie-list  -->
                </div><!-- end of movie-select --> 
              </div><!-- end of steps-body -->
            </div><!-- end of col -->

            <!-- 극장 선택 -->
            <div class="col-6 px-1 h-100">
              <div class="steps-header">
                <p class="text-white text-center  bg-dark mb-0">프랜차이즈 & 극장</p>
              </div>
              <div class="steps-body">
                <div class="row">
                    <div class="col-12">
                    	<c:if test="${user.role eq 'user'}">
                    		<div class="row mb-3">
                    			<div class="col-12">	
		        					<span class="font-weight-bold"><kbd>자주가는 극장</kbd></span><br>
		        					<span class="font-weight-light text-sm-left" style='opacity : 0.4; line-height: 25px'>항목을 클릭하시면 자동선택됩니다.</span>
								</div>
							</div>
							<hr class="my-3">
							<div class="row mb-3">
								<div class="col-12">
					        		<span class="likeTheater"><kbd>${user.likeTheater1 }</kbd></span>&nbsp;
		
					        		<span class="likeTheater"><kbd>${user.likeTheater2 }</kbd></span>&nbsp;
		
					        		<span class="likeTheater"><kbd>${user.likeTheater3 }</kbd></span>
                    			</div>
                    		</div>
                    		<hr>
                    	</c:if>
                    		
                        <div class="row mx-0">
                          <div class="franchise-list cgv col-4 mx-0">
                           <ul class="list-group cgv">
                           		<li class="list-group-item cgv text-center"><span>CGV</span><img class="firstHeaderImage" src="../resources/image/logo/CGV.png" alt="" width="30" style="width: 97px; height: 73px; left: 34px;"></li>
						    </ul>
                          </div>
                          <div class="franchise-list lotte col-4 mx-0">
                            <ul class="list-group lotte">
                            		<li class="list-group-item lotte text-center"><span>롯데시네마</span><img class="firstHeaderImage" src="../resources/image/logo/LotteCinema.png" alt="" width="30" style="width: 103px; height: 77px; left: 25px;"></li>
                            </ul>
                          </div>
                          <div class="franchise-list megaBox col-4 mx-0">
                            <ul class="list-group megaBox">
                            		<li class="list-group-item megaBox text-center"><span>메가박스</span><img class="firstHeaderImage" src="../resources/image/logo/MegaBox.jpg" alt="" width="30" style="width: 88px; height: 52px; left: 34px;"></li>
                            </ul>
                          </div>                          
                        </div><!-- end of row -->
                        <div class="row" style="margin-left: 0px; margin-right: 0px;">
                          <div class="theater-list cgv col-4">
                            <ul class="list-group cgv theaterList">
                            </ul>
                          </div><!-- end of theater-list -->
                         <div class="theater-list lotte col-4" style="margin-left: 0px; margin-right: 0px;">
                            <ul class="list-group lotte theaterList ml-0">
                            </ul>
                          </div><!-- end of theater-list -->
                          <div class="theater-list megaBox col-4" style="margin-left: 0px; margin-right: 0px;">
                            <ul class="list-group megaBox theaterList">
                            </ul>
                          </div><!-- end of theater-list -->
                          </div><!-- end of row -->
                        </div><!-- end of col -->
                    </div><!-- end of row  -->
                    
 
                   </div><!-- end of steps-body -->
                  </div><!-- end of col -->
              
            <!-- 날짜 선택 -->
            <div class="col-1 pl-0 pr-1 h-100">
              <div class="steps-header">
                <p class="text-white text-center  bg-dark mb-0">날짜</p>
              </div>
              <div class="steps-body text-center">
                    <div class="calendar">
                      <ul class="list-group pl-0">
                      <c:forEach var="i" items="${yearMonthList }">
	                      <fmt:formatDate var="Year" value="${i }" pattern="yyyy"/>
	                      <fmt:formatDate var="Month" value="${i }" pattern="MM"/>
		                      <li class="month">
		                      	<div style="margin-bottom: 10px;">
		                      		<span class="year">${Year }</span>
		                      		<span class="month">${Month }</span>
		                      	</div>
		                      </li>	     
                      </c:forEach>              	
                      </ul>
                    </div><!-- end of calendar -->
              </div> <!-- end of steps-body -->
            </div> <!-- end of col -->

            <!-- 시간 선택 -->
            <div class="col-2 px-0 mb-0 h-100">
              <div class="steps-header">
                <p class="text-white text-center bg-dark mb-0">시간</p>
              </div>
              <div class="steps-body text-center">
                  <div class="row">
                   	 <div class="col-12" style="top: 0px;">
                          <div class="sortmenu">
                            <span class="morning">조조</span>
                            <span class="night">심야</span>
                          </div>
                          <hr>


                          <div class="remainingSeat">
                            	<div class="seat" style="margin-top: -14px;">
                            	                          		
                            	</div>
                          </div>
                          
                          <div class="placeholder" style="margin-top: 220px;">영화, 극장, 날짜를 <br><br>선택해주세요.</div>
           </div><!-- end of col -->
           </div><!-- end of row -->
          </div><!-- end of steps-body -->
          </div><!-- end of col -->
         </div><!-- end of steps -->
		</div><!-- end of row -->
	</div><!-- end of addTicketing -->
	</div><!-- end of container -->
	
<div class="loading" id="ticket_loading" style="display: none;">
	<div class="dimm"></div>
	<p class="loadWrap"><img src="http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/common/ajax-loader-w.gif" alt="로딩 애니메이션"></p>
</div>

        	
     	<form>
	     	<input type="hidden" name="movieName">
	     	<input type="hidden" name="franchise">
	     	<input type="hidden" name="theaterName">
	     	<input type="hidden" name="screenDate">
	     	<input type="hidden" name="screenTime">
     	</form>
        	
  <!-- 하단 진행 바  --> 
    <jsp:include page="/ticketing/progressBar.jsp" />	 
  <!-- 하단 진행 바  -->           	

<!-- 변수 모음 -->
<script>

var movieCheck="";
var franchiseCheck="";
var theaterCheck="";
var dateCheck="";
var screenArray = new Array();
var selectedFranchise;


//시간체크 & 최종 변수
var finalMovieName="";
var finalFranchise="";
var finalTheaterName="";
var finalYear="";
var finalScreenDate="";
var finalScreenTime="";
</script>


<!-- 함수 모음  -->
<script>
//날짜 포맷
function formatToDate(x){
		//console.log("formatToDate : "+x);
		 var returnArray = new Array();
		 var month="";

		 for(var i in x){
			 month=x[i].substr(5,6)
			 returnArray.push(month);
		 }
		 //클로저 활용 예제.. 안에 내부함수를 만들어서 함수 실행이 끝나도 로컬 변수 참조가능
		 
		 return function() {
			return returnArray;
		 }
}
//시간 포맷
function formatTime(time) {
	var d = new Date(time);
	var hr = d.getHours();
	var min = d.getMinutes();
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
	return result;
}



//1일,2일을 0을 붙여 출력
function formatDates(x){
	if(x<10){
		x = "0"+x;
	}
	
	return x;
}

 //프랜차이즈 선택 관련
function franchiseSelect(){
 $("div.franchise-list > ul > li.list-group-item").on("click",function(){
	 theaterCheck=""; // 2020-02-15 , 영화관 체크하고 나서 프랜차이즈 변경 시 극장명 유지 방지
	 $("div.franchise-list > ul > li.list-group-item").removeClass("active");
	 
	 $(this).addClass("active");
	 
	 // 좌석 선택 버튼 "빨간불" 해제하기!
     $(".btn-right").removeClass("on");
  	 $(".btn-right").css("background", "url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/tnb/tnb_buttons.png) no-repeat;")
	 
	 franchiseCheck=$.trim($(this).text());
	 selectedFranchise=$(this);
	 $("div.franchise-select > ul.list-group").children().first().text(franchiseCheck)
	 
	 
	 check();
 
	 
	 theaterSelect($(this));
	 

	 
 });
}

//극장 선택 관련
function theaterSelect(element){
 
	 $.ajax({
		  type: "POST",
		  url: "/ticketing/json/getTheaterList",
		  data: JSON.stringify({
			 	franchise : element.text(), 
		  }),
		  dataType : "json",
	      headers: { 
		        "Accept" : "application/json",
		        "Content-Type": "application/json"
	      },
	      success : function(result){
	    	  $("div.theater-list > ul").empty();
	    	  check();
	    	  if(element.text()=='CGV'){
		    	  for( var i in result){ 
		    		  //console.log(result[i].theaterName)
	   		    	  $("div.theater-list > ul.cgv").append("<li class='list-group-item cgv' title='"+result[i].theaterName+"'>"+result[i].theaterName+"</li>")
	   		    	  
		  		  }//end of for	   		    	  
		  		  
		  			  $("div.theater-list > ul > li.list-group-item.cgv").on("click",function(){

		  		  
			  		  $("div.theater-list > ul > li.list-group-item").removeClass("active");
			  		  $(this).addClass("active");
			  		  
			 	    	 //극장 선택 div 없애기 
			 	    	 $("#ticket_tnb > div > div.info.theater > div.placeholder").css("display","none");
			 	    	 //극장 선택 div 없앤 후 극장명 띄워주기!
			 	    	 $("#theater").css("display","block");
			 	         $("#date").css("display","block");
			 	         $("#screen").css("display","block");
			 	         $("#number").css("display","block");
			 	    	
		    			// 좌석 선택 버튼 "빨간불" 해제하기!
		    		    $(".btn-right").removeClass("on");
		    		  	$(".btn-right").css("background", "url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/tnb/tnb_buttons.png) no-repeat;")
		    		  	
				        // 상태바 "극장" 찍기! 
				        $("#theater").children().first().next().text($.trim($(this).text()));
		    		  	// 상태바 "극장" 타이틀 찍기!
		    		  	$("#theater").children().first().next().attr("title", $.trim($(this).text()));
		    		  	
		    			// 시간 선택 이벤트 해제시 "상영관" 텍스트 "제거"
		    			$("#screen").children().first().next().text("");
		    			
		    			// 시간 선택 이벤트 해제시 "상영시간" 텍스트만 "제거"
		    			var origin_date = $("#date").children().first().next().text();
		    			var update_date = origin_date.substring(0,13)
		    			$("#date").children().first().next().text(update_date)
	  		  			
			  		  theaterCheck = $.trim($(this).text())
	   			 	  check();
	
					  });//end of click    	
					  
   		      }else if(element.text()=='롯데시네마'){
		    	  for( var i in result){ 
		    		  //console.log(result[i].theaterName)
	   		    	  $("div.theater-list > ul.lotte").append("<li class='list-group-item lotte' title='"+result[i].theaterName+"'>"+result[i].theaterName+"</li>")
		    	  }//end of for 
		  			  $("div.theater-list > ul > li.list-group-item.lotte").on("click",function(){
		  		 
		  		  
			  		  $("div.theater-list > ul > li.list-group-item").removeClass("active");
			  		  $(this).addClass("active");
			  		 
			 	    	 //극장 선택 div 없애기 
			 	    	 $("#ticket_tnb > div > div.info.theater > div.placeholder").css("display","none");
			 	    	 //극장 선택 div 없앤 후 극장명 띄워주기!
			 	    	 $("#theater").css("display","block");
			 	         $("#date").css("display","block");
			 	         $("#screen").css("display","block");
			 	         $("#number").css("display","block");
			 	    	
		    			// 좌석 선택 버튼 "빨간불" 해제하기!
		    		    $(".btn-right").removeClass("on");
		    		  	$(".btn-right").css("background", "url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/tnb/tnb_buttons.png) no-repeat;")
		    		  	
				        // 상태바 "극장" 찍기! 
				        $("#theater").children().first().next().text($.trim($(this).text()));
		    		  	// 상태바 "극장" 타이틀 찍기!
		    		  	$("#theater").children().first().next().attr("title", $.trim($(this).text()));
		    		  	
		    			// 시간 선택 이벤트 해제시 "상영관" 텍스트 "제거"
		    			$("#screen").children().first().next().text("");
		    			
		    			// 시간 선택 이벤트 해제시 "상영시간" 텍스트만 "제거"
		    			var origin_date = $("#date").children().first().next().text();
		    			var update_date = origin_date.substring(0,13)
		    			$("#date").children().first().next().text(update_date)
	  		  
			  		  theaterCheck = $.trim($(this).text())
	   			 	  check();
	
				 	   });//end of click    	
					  
	     	 }else if(element.text()=='메가박스'){
		    	  for( var i in result){ 
		    		  //console.log(result[i].theaterName)
	   		    	  $("div.theater-list > ul.megaBox").append("<li class='list-group-item megaBox' title='"+result[i].theaterName+"'>"+result[i].theaterName+"</li>")
		    	  }//end of for
		  			  $("div.theater-list > ul > li.list-group-item.megaBox").on("click",function(){
		  		 
		  		  
			  		  $("div.theater-list > ul > li.list-group-item").removeClass("active");
			  		  $(this).addClass("active");
			  		  
			 	    	 //극장 선택 div 없애기 
			 	    	 $("#ticket_tnb > div > div.info.theater > div.placeholder").css("display","none");
			 	    	 //극장 선택 div 없앤 후 극장명 띄워주기!
			 	    	 $("#theater").css("display","block");
			 	         $("#date").css("display","block");
			 	         $("#screen").css("display","block");
			 	         $("#number").css("display","block");
			 	    	
		    			// 좌석 선택 버튼 "빨간불" 해제하기!
		    		    $(".btn-right").removeClass("on");
		    		  	$(".btn-right").css("background", "url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/tnb/tnb_buttons.png) no-repeat;")
		    		  	
				        // 상태바 "극장" 찍기! 
				        $("#theater").children().first().next().text($.trim($(this).text()));
		    		  	// 상태바 "극장" 타이틀 찍기!
		    		  	$("#theater").children().first().next().attr("title", $.trim($(this).text()));
		    		  	
		    			// 시간 선택 이벤트 해제시 "상영관" 텍스트 "제거"
		    			$("#screen").children().first().next().text("");
		    			
		    			// 시간 선택 이벤트 해제시 "상영시간" 텍스트만 "제거"
		    			var origin_date = $("#date").children().first().next().text();
		    			var update_date = origin_date.substring(0,13)
		    			$("#date").children().first().next().text(update_date)
	  		  
			  		  theaterCheck = $.trim($(this).text())
	   			 	  check();
	
				 	  });//end of click    	
	     	 }//end of else-if
	     	
			}//end of success
		}); //end of ajax	
} //end of function


// 선호 장르 클릭
$("span.likeTheater").click("on",function(){
	var franchise = $(this).text();
	$("div.franchise-list > ul").find("li:contains('"+franchise.split(" ")[0]+"')").trigger("click").promise().done(
		    function(){
		    	setTimeout(function(){
		    		 $("div.theater-list > ul > li.list-group-item").each(function(index, item){
		    			 //console.log(item.innerText)	//break 는 return false, continue는 return true
		    			 if(item.innerText==franchise){
		    				 $(item).trigger("click");
		    				 return false;
		    			 }
		    			 
		    		 })
		    	},100);
		    	}//end of function
		);//end of done
	

	
}); // end of eventHandler

</script>
<!-- 함수 모음  -->

<!-- 영화 선택 스크립트 -->  
<script>
movieClick();
//영화 제목 클릭
function movieClick(){
	$("div.movie-list > ul > li").not( "li.off" ).on("click",function(){
		 
		 $("div.movie-list > ul > li").removeClass("active");
		 
		 $(this).addClass("active");
		 
		 //영화 선택 div 없애기 
		 $("#ticket_tnb > div > div.info.movie > div.placeholder").css("display","none");
    	 //영화 선택 div 없앤 후 영화 제목 띄워주기!
    	 $("#movieTitle").css("display","block");
    	 $(".movie_poster > img").css("display","inline");
    	 
  		// 좌석 선택 버튼 "빨간불" 해제하기!
  	    $(".btn-right").removeClass("on");
  	  	$(".btn-right").css("background", "url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/tnb/tnb_buttons.png) no-repeat;")
		 
		 movieCheck = $.trim($(this).text());
		
		 check();
		 
    	 // 상태바 "영화제목" 찍기! 
    	 $("#movieTitle span").text($.trim($(this).text()));
    	 
  	  	// 상태바 "영화" 타이틀 찍기!
  	  	$("#movieTitle").children().first().attr("title", $.trim($(this).text()));
  	  	
		// 시간 선택 이벤트 해제시 "상영관" 텍스트 "제거"
		$("#screen").children().first().next().text("");
		
		// 시간 선택 이벤트 해제시 "상영시간" 텍스트만 "제거"
		var origin_date = $("#date").children().first().next().text();
		var update_date = origin_date.substring(0,13)
		$("#date").children().first().next().text(update_date)
		
    	console.log($.trim($(this).text()))
		$.getJSON( "/ticketing/json/getDateTimeByMovieName/"+$.trim($(this).text()), function( data ) {
			    $("#ticket_tnb > div > div.info.movie > span > img").attr("src",data.poster)
			    $("#movieRating > span").text(data.rating+" 관람가")
			    $("#movieRating > span").attr("title", data.rating+" 관람가")
			});
	});
}


</script>
<!-- 영화 선택 스크립트 -->
 
<!-- 프렌차이즈 선택 스크립트 -->
<script>

//프렌차이즈 클릭
franchiseSelect();

</script>
<!-- 프렌차이즈 선택 스크립트 -->

<!-- 날짜 선택 스크립트 -->
<script>
// 서버가 동작하는 순서 JAVA -> JSTL -> HTML -> JAVASCRIPT
//이기때문에 JSTL의 EL에서는 JAVASCRIPT접근이 불가하나, 반대는 가능 
//날짜 변수만 저장;
	 var week = ['일', '월', '화', '수', '목', '금', '토'];
	 
	var array = new Array();
	var original = new Array();
	 <c:forEach var ="i" items="${dateList}">
	 	array.push("${i.screenDate}");
	 </c:forEach>
	 original = array;
	 array = formatToDate(array);
	 array = array();
   	 var Elements = $("div.steps-body.text-center > div > ul > li.month");
	 //console.log(original)
   	 //console.log(array)
   	 for(var i=array.length-1; i>=0; i--){  		
   		 	//console.log(new Date(array[i]));
      	  var yoil="<li class='list-group-item py-2 date'>"
   	  		yoil+="<div>"
   	  		yoil+="<span class='day'>"+week[new Date(original[i]).getDay()]+"</span>&nbsp;"
   	  		yoil+="<span class='date'>"+array[i].substring(3,5)+"</span>"
   	  		yoil+="</div>"
   	  		yoil+="</li>"

   	  		Elements.each(function(index,value){
   	  			if( $(value).find("span.month").text()==array[i].substring(0,2)){
   	  				$(Elements[index]).after(yoil);
   	  			}//end of if
   	  			});//end of each
   	 }//end of for array
   	dayColorChange() // 2020-02-14
   	
 	$("div.steps-body.text-center > div.calendar > ul > li.list-group-item.date").on("click",function(){
		$("div.steps-body.text-center > div.calendar > ul > li.list-group-item.date").removeClass("active");
		
		$(this).addClass("active");
		finalYear=$($(this).prevAll("li.month")[0]).children().children().first().text()
		date=$.trim($(this).children().children().first().next().text())//일 
		Month=$($(this).prevAll("li.month")[0]).children().children("span.month").text()//월
		
	   	 //극장 선택 div 없애기 
	   	 $("#ticket_tnb > div > div.info.theater > div.placeholder").css("display","none");
		 //극장 선택 div 없앤 후 날짜(일시) 띄워주기!
	   	 $("#date").css("display","block");
	     $("#theater").css("display","block");
	     $("#screen").css("display","block");
	     $("#number").css("display","block");
	     
			// 좌석 선택 버튼 "빨간불" 해제하기!
		    $(".btn-right").removeClass("on");
		  	$(".btn-right").css("background", "url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/tnb/tnb_buttons.png) no-repeat;")
		  	
			// 상태바 "날짜(일시)" 찍기! 
/* 			yearrr = $("div > ul > li.month > div > span.year").text()
			monthhh = $("div > ul > li.month > div > span.month").text()
			dateee = $("div > ul > li.list-group-item.py-2.date.active > div > span.date").text() */
			dayyy = $("div > ul > li.list-group-item.py-2.date.active > div > span.day").text() 
			
			$("#date").children().first().next().text(finalYear+"."+Month+"."+date+"("+dayyy+")");
			// 상태바 "날짜(일시)" 타이틀 찍기!
			$("#date").children().first().next().attr("title", finalYear+"."+Month+"."+date+"("+dayyy+")");	  
			
			// 시간 선택 이벤트 해제시 "상영관" 텍스트 "제거"
			$("#screen").children().first().next().text("");
		
		dateCheck=Month+"-"+date; //02-05
		
		check();
	});
 	
 	
 	//2020-02-14 요일 색깔 바꾸기
 	function dayColorChange(){
	 	$("div.steps-body > div > ul > li > div > span.day").each(function(index, item){ 
	 		
	 			if(item.innerText=='토'){
	 				$(item).css('color','blue')
	 				$(item).next().css('color','blue')
	 			}
	 			
	 			if(item.innerText=='일'){
	 				$(item).css('color','red')
	 				$(item).next().css('color','red')
	 			}
	 		
	 	})
 	}

 	
</script>
<!-- 날짜 선택 스크립트 -->

<!-- 시간 선택 스크립트 -->
<script>
//시간 선택
function TimeSelect(){
	    $("div:nth-child(1) > div.remainingSeat > div > div > ul > li.time").on("click",function(){
	  	  $("div > div.remainingSeat > div > div > ul > li.time").removeClass("active");
	  	  $(this).addClass("active")
  	  
	  	  finalMovieName=movieCheck;
	  	  finalFranchise=franchiseCheck;
	  	  finalTheaterName=theaterCheck;
	  	  finalScreenDate=finalYear+"-"+dateCheck;
	  	  finalScreenTime=$(this).text().substr(0,5);    
	  	  
	  	  // 좌석 선택 버튼 "빨간불" 들어오게!
	  	  $(".btn-right").addClass("on");
	  	  $(".btn-right").css("background", "url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/tnb/tnb_buttons.png) no-repeat;")
 	  
 	  	  // 상태바 "날짜(일시) 의 시간" 찍기!
    	  timeee = $("div > div > ul > li.list-group-item.time.active > span:nth-child(1)").text()
    	  $("#date").children().first().next().text(finalYear+"."+Month+"."+date+"("+dayyy+")"+" "+timeee);
		  // 상태바 "날짜(일시)" 타이틀 찍기!
		  $("#date").children().first().next().attr("title", finalYear+"."+Month+"."+date+"("+dayyy+")"+" "+timeee);	  
		  
		  
	      //극장 선택 div 없앤 후 상영관 띄워주기!
	      $("#screen").css("display","block");			  
    	  // 상태바 "상영관" 찍기!
    	  screennn = $("div > div > ul > li.list-group-item.time.active").parent().prev().text()
    	  screennn = screennn.substring(0,screennn.length-9);
    	  $("#screen").children().first().next().text(screennn);	    	
		  // 상태바 "상영관" 타이틀 찍기!
		  $("#screen").children().first().next().attr("title", screennn);	  
  	  
		 $("input[name='movieName']").val(finalMovieName);
		 $("input[name='franchise']").val(finalFranchise);
		 $("input[name='theaterName']").val(finalTheaterName);
		 $("input[name='screenDate']").val(finalScreenDate);
		 $("input[name='screenTime']").val(finalScreenTime);	 
		 
	   	  // "극장명" 변경
	   	  $("#theater").children().first().next().text(finalTheaterName);
  	   
  	  console.log("선택완료")
  	  console.log("영화 제목 :"+finalMovieName)
  	  console.log("프렌차이즈 : "+finalFranchise)
  	  console.log("극장명 : "+finalTheaterName)
  	  console.log("날짜는 : "+finalScreenDate)
  	  console.log("시간은 : "+finalScreenTime)
  	  //console.log("요일은 : "+$("div > ul > li.list-group-item.py-2.date.active > div > span.day").text())
  	  
    });
}
</script>

<!-- 시간 선택 스크립트 -->
 
 
<!-- 종합 체크 스크립트 -->
<script>
function check(){
	
	 var movieName =$("div.movie-list > ul > li").hasClass("active")
	 var franchise =$("div.franchise-list > ul > li").hasClass("active");
	 var theaterName = $("div.theater-list > ul > li").hasClass("active");
	 var screenTime = $("div.calendar > ul > li").hasClass("active");
	 var func;
	 
	 //(영화정렬)
	 try{
	 	func =getMovieList(franchiseCheck,theaterCheck,dateCheck);
		 func.then(function (data) {
			  // resolve()의 결과 값이 여기로 전달됨
			  var searchArray = new Array();
			  
			  for(var j in data){
				  searchArray.push(data[j].movieName);
			  }
				
			    
			  var movieArray =document.querySelectorAll("div.movie-list > ul > li");
			  //for(var i in movieArray){ var i in을 하면 native code도 가져온다 뭐지 ㅡㅡ; 원인파악불가
			  $(movieArray).removeClass("off")
			  for(var i=0; i<movieArray.length; i++){
				  if(searchArray.indexOf($(movieArray[i]).attr("title"))==-1){
					 $(movieArray[i]).addClass("off")
				  }
			  }
			  
			  var array = new Array();
			  //Nodelist이므로 sort적용이 안되므로, Array로 바꿔준다.
			  array = document.querySelectorAll("div.steps-body > div > div.movie-list > ul > li");
			  
			  
			  var newArray = Array.prototype.slice.call(array,0);

			  newArray =newArray.sort(function(a,b){
			      
			      return a.classList.contains("off") - b.classList.contains("off");
			  });
			  //console.log(newArray);
			  
			  $("div.steps-body > div > div.movie-list > ul").empty();
			  for(var i=0; i<newArray.length; i++){
				  $("div.steps-body > div > div.movie-list > ul").append(newArray[i])
			  }
			  movieClick();
			  
			  //$("div.movie-list > ul > li").trigger("click"); //
			  
		});
	 }catch(e){
		 console.log("영화 정렬 조건이 없습니다")
	 }
	 
	 //(프랜차이즈 정렬)
	 try{
	 	func =getFranchiseList(movieCheck,dateCheck);
		 func.then(function (data) {
			  // resolve()의 결과 값이 여기로 전달됨
			  var searchArray = new Array();	
			  
			  for(var j in data){
				  searchArray.push(data[j].franchise);
			  }			
			  //console.log(searchArray);
			  var franchiseArray =document.querySelectorAll("div.franchise-list > ul > li");
			  //console.log(franchiseArray[0].innerText);
			  $(franchiseArray).removeClass("off")
			  for(var i=0; i<franchiseArray.length; i++){
				  if(searchArray.indexOf(franchiseArray[i].innerText)==-1){
					 $(franchiseArray[i]).addClass("off")
				  }//end of if
			  }//end of for		
			  

			  
		 })//end of then
	 }catch(e){
		 console.log("프렌차이즈 정렬 조건이 없습니다")
	 }
	 
	 //(극장 정렬)

	 try{
		 func=getTheaterList(movieCheck,franchiseCheck,dateCheck);
		 func.then(function(data){
			  // resolve()의 결과 값이 여기로 전달됨
			  var searchArray = new Array();	
			  
			  for(var j in data){
				  searchArray.push(data[j].theaterName);
			  }
			  var theaterArray =document.querySelectorAll("div.theater-list > ul > li");
			  $(theaterArray).removeClass("off")
			  for(var i=0; i<theaterArray.length; i++){
				  if(searchArray.indexOf(theaterArray[i].innerText)==-1){
					 $(theaterArray[i]).addClass("off")
				  }//end of if
			  }//end of for
			  
			  
			  var array = new Array();
			  //Nodelist이므로 sort적용이 안되므로, Array로 바꿔준다.
			  array = document.querySelectorAll("div.theater-list > ul > li");
			  
			  
			  var newArray = Array.prototype.slice.call(array,0);

			  newArray =newArray.sort(function(a,b){
			      
			      return a.classList.contains("off") - b.classList.contains("off");
			  });
			  //console.log(newArray);
			  $("div.theater-list > ul").empty();
			 
			  for(var i=0; i<newArray.length; i++){
				  if(selectedFranchise.text()=='CGV'){
				  	  $("div.theater-list > ul.cgv").append(newArray[i]) 				  	  
				  }else if(selectedFranchise.text()=='롯데시네마'){
					  $("div.theater-list > ul.lotte").append(newArray[i]) 					  
				  }else if(selectedFranchise.text()=='메가박스'){
					  $("div.theater-list > ul.megaBox").append(newArray[i])						  
				  }
			  }//end of for
			  
			  if(selectedFranchise.text()=='CGV'){
	  			  $("div.theater-list > ul > li.list-group-item.cgv").on("click",function(){

			  		  
			  		  $("div.theater-list > ul > li.list-group-item").removeClass("active");
			  		  $(this).addClass("active");
	  		  			
			  		  theaterCheck = $.trim($(this).text())
	   			 	  check();
			  		  
			 	    	 //극장 선택 div 없애기 
			 	    	 $("#ticket_tnb > div > div.info.theater > div.placeholder").css("display","none");
			 	    	 //극장 선택 div 없앤 후 극장명 띄워주기!
			 	    	 $("#theater").css("display","block");
			 	         $("#date").css("display","block");
			 	         $("#screen").css("display","block");
			 	         $("#number").css("display","block");
			 	    	
		    			// 좌석 선택 버튼 "빨간불" 해제하기!
		    		    $(".btn-right").removeClass("on");
		    		  	$(".btn-right").css("background", "url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/tnb/tnb_buttons.png) no-repeat;")
		    		  	
				        // 상태바 "극장" 찍기! 
				        $("#theater").children().first().next().text($.trim($(this).text()));
		    		  	// 상태바 "극장" 타이틀 찍기!
		    		  	$("#theater").children().first().next().attr("title", $.trim($(this).text()));
		    		  	
		    			// 시간 선택 이벤트 해제시 "상영관" 텍스트 "제거"
		    			$("#screen").children().first().next().text("");
		    			
		    			// 시간 선택 이벤트 해제시 "상영시간" 텍스트만 "제거"
		    			var origin_date = $("#date").children().first().next().text();
		    			var update_date = origin_date.substring(0,13)
		    			$("#date").children().first().next().text(update_date)
	
					  });//end of click
			  }else if(selectedFranchise.text()=='롯데시네마'){
	  			  $("div.theater-list > ul > li.list-group-item.lotte").on("click",function(){

			  		  
			  		  $("div.theater-list > ul > li.list-group-item").removeClass("active");
			  		  $(this).addClass("active");
	  		  			
			  		  theaterCheck = $.trim($(this).text())
	   			 	  check();
			  		  
			 	    	 //극장 선택 div 없애기 
			 	    	 $("#ticket_tnb > div > div.info.theater > div.placeholder").css("display","none");
			 	    	 //극장 선택 div 없앤 후 극장명 띄워주기!
			 	    	 $("#theater").css("display","block");
			 	         $("#date").css("display","block");
			 	         $("#screen").css("display","block");
			 	         $("#number").css("display","block");
			 	    	
		    			// 좌석 선택 버튼 "빨간불" 해제하기!
		    		    $(".btn-right").removeClass("on");
		    		  	$(".btn-right").css("background", "url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/tnb/tnb_buttons.png) no-repeat;")
		    		  	
				        // 상태바 "극장" 찍기! 
				        $("#theater").children().first().next().text($.trim($(this).text()));
		    		  	// 상태바 "극장" 타이틀 찍기!
		    		  	$("#theater").children().first().next().attr("title", $.trim($(this).text()));
		    		  	
		    			// 시간 선택 이벤트 해제시 "상영관" 텍스트 "제거"
		    			$("#screen").children().first().next().text("");
		    			
		    			// 시간 선택 이벤트 해제시 "상영시간" 텍스트만 "제거"
		    			var origin_date = $("#date").children().first().next().text();
		    			var update_date = origin_date.substring(0,13)
		    			$("#date").children().first().next().text(update_date)
	
					  });//end of click
			  }else if(selectedFranchise.text()=='메가박스'){
	  			  $("div.theater-list > ul > li.list-group-item.megaBox").on("click",function(){

			  		  
			  		  $("div.theater-list > ul > li.list-group-item").removeClass("active");
			  		  $(this).addClass("active");
	  		  			
			  		  theaterCheck = $.trim($(this).text())
	   			 	  check();
			  		  
			 	    	 //극장 선택 div 없애기 
			 	    	 $("#ticket_tnb > div > div.info.theater > div.placeholder").css("display","none");
			 	    	 //극장 선택 div 없앤 후 극장명 띄워주기!
			 	    	 $("#theater").css("display","block");
			 	         $("#date").css("display","block");
			 	         $("#screen").css("display","block");
			 	         $("#number").css("display","block");
			 	    	
		    			// 좌석 선택 버튼 "빨간불" 해제하기!
		    		    $(".btn-right").removeClass("on");
		    		  	$(".btn-right").css("background", "url(http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/tnb/tnb_buttons.png) no-repeat;")
		    		  	
				        // 상태바 "극장" 찍기! 
				        $("#theater").children().first().next().text($.trim($(this).text()));
		    		  	// 상태바 "극장" 타이틀 찍기!
		    		  	$("#theater").children().first().next().attr("title", $.trim($(this).text()));
		    		  	
		    			// 시간 선택 이벤트 해제시 "상영관" 텍스트 "제거"
		    			$("#screen").children().first().next().text("");
		    			
		    			// 시간 선택 이벤트 해제시 "상영시간" 텍스트만 "제거"
		    			var origin_date = $("#date").children().first().next().text();
		    			var update_date = origin_date.substring(0,13)
		    			$("#date").children().first().next().text(update_date)
	
					  });//end of click 
			  }
			  
			  
		 })//end of then
	 }catch(e){
		 console.log("극장 정렬조건이 없습니다")
	 }
	 
	 //(시간 정렬)
	 try{
		 func=getDateList(movieCheck,franchiseCheck,theaterCheck);
		 func.then(function(data){
			  // resolve()의 결과 값이 여기로 전달됨
			  var searchArray = new Array();	
			  
			  for(var j in data){
				  //console.log(new Date(data[j].screenDate).getDate())
				  searchArray.push(new Date(data[j].screenDate).getDate());
			  }
			  
			  var timeArray =document.querySelectorAll("div.steps-body.text-center > div > ul > li > div > span.date");
			  
			  $(timeArray).parent().parent().removeClass("off")
			  for(var i=0; i<timeArray.length; i++){
				  if(searchArray.indexOf(parseInt(timeArray[i].innerText))==-1){
					 $(timeArray[i]).parent().parent().addClass("off")
				  }//end of if
			  }//end of for
			  
			  
			  
		 })//end of then	 
	 }catch(e){
		console.log("날짜 정렬조건이 없습니다")
	 }
	 
	 
	 
	 //모두 선택됐다면..
	 if( movieName==true && franchise==true && theaterName==true && screenTime == true){
		 $("div.steps-body.text-center > div > div > div.placeholder").css("display", "none");
   	 $.ajax({
   		  type: "POST",
   		  url: "/ticketing/json/getTimeList",
   		  data: JSON.stringify({
   			  	movieName : movieCheck,
   			 	franchise : franchiseCheck,
   			 	theaterName : theaterCheck,
   			 	screenDate : dateCheck,
   		  }),
   		  dataType : "json",
		      headers: { 
   		        "Accept" : "application/json",
   		        "Content-Type": "application/json"
		      },
		      success : function(result,status){
		    	  
		    	  screenArray= [];//빈 배열 할당
		    	  $("div > div.remainingSeat > div").empty()
		    	  for( var i in result){
		    		  if(screenArray.indexOf(result[i].screenName)==-1){
		    			  screenArray.push(result[i].screenName);
		    		  }
		    	  }
		    	  //1관 .. 2관 Element 추가 
		    	  for( var i in screenArray){
		    		  var str ="<div><div style='padding-bottom: 5px;'><span class='screen'>"+$.trim(screenArray[i])+" (총 130석)</span></div><ul class=list-group></ul></div>"
		    		  $("div > div.remainingSeat > div").append(str);
		    	  }
		    	  
		    	  
		    	  var Elements =$("div > div.remainingSeat > div > div > ul.list-group");
		    	  
		    	  // 남은 좌석 수 및 시간추가
		    	  for( var i=0; i<result.length; i++){ 
		    		  var str="<li class='list-group-item time'><span>"+formatTime(result[i].screenTime)+"</span>";
		    		  	  str+="<br><span class='seatcount'>"+result[i].remainingSeat+"석</span></li>";  
		    		  	
		    		  	  
   		   	  		for(var j=0; j<Elements.length; j++){
      		   	   			 if($.trim(result[i].screenName)==$.trim($(Elements[j]).prev().text().substring(0,$(Elements[j]).prev().text().length-9))){
      		   	   				$(Elements[j]).append(str);
      		   	   		 	}//end of second if
		    			  }//end of second for
		     	   }//end of for
		     		
		     	   
		     	   //2020-02-14
		     	   $("div.remainingSeat > div > div > ul > li > span:nth-child(1)").each(function(index, item){ 
		     		   //조조라면..
		     		   if(parseInt(item.innerText.substring(0,2))<11){
		     			   $(item).addClass('timeMorning')
		     		   }
		     		   
		     		   if(parseInt(item.innerText.substring(0,2))>=23){
		     			   $(item).addClass('timeNight')
		     		   }
		     			   
		     		   //심야라면...	   
		     	   })
		     	   

		     
		     		
		     	TimeSelect(); // <-- 추가된 시간에 이벤트
		     	
					 $(".loading").css("display", "block");
					 setTimeout(() => {
						 $(".loading").css("display", "none");
					}, 500);
		     	
		      }//end of success
		      
   		}); //end of ajax    		 
		 
	 }else{
		 console.log("체크 실패")
	 }
	 
}

//좌석선택 단계로 넘어가기
function addSeatSelect(){
	 
	// 실제 유효성 체크
	 var movieNam =$("div.movie-list > ul > li").hasClass("active")
	 var franchis =$("div.franchise-list > ul > li").hasClass("active");
	 var theaterNam = $("div.theater-list > ul > li").hasClass("active");
	 var screenDat = $("div.calendar > ul > li").hasClass("active");
	 var screenTim = $("div.remainingSeat > div > div > ul > li").hasClass("active");
	 
	 //모두 선택안됐다면...
	 if( movieNam !=true && franchis!=true && theaterNam!=true && screenDat != true && screenTim != true){
		 alert("영화를 선택해 주세요.")
		 return;   		 
	 }

	 if( movieNam !=true){
		 alert("영화를 선택해 주세요.")
		 return;   		 
	 }
	 
	 if( franchis !=true){
		 alert("프랜차이즈를 선택해 주세요.")
		 return;   		 
	 }    	 
	 
	 if( theaterNam !=true){
		 alert("극장을 선택해 주세요.")
		 return;   		 
	 } 
	 
	 if( screenDat !=true){
		 alert("날짜를 선택해 주세요.")
		 return;   		 
	 }    	 
	 
	 if( screenTim !=true){
		 alert("시간을 선택해 주세요.")
		 return;   		 
	 }    	 
	 
	 $("form").attr("method" , "POST").attr("action" , "/ticketing/addSeatSelect").submit();
}

</script> 
<!-- 종합 체크 스크립트 --> 

<!-- ajax 모음 -->
<script>
function getMovieList(franchiseCheck,theaterCheck,dateCheck){
	var datas;
	//프랜차이즈만 클릭했을 경우,
	if(franchiseCheck.length!=0 && theaterCheck.length==0 && dateCheck.length==0){
		datas = JSON.stringify({
			 	franchise : franchiseCheck,		  
		 		 })
		 		 $("div.steps-body.text-center > div > div > div.placeholder").css("display", "block");			 		 
	}else if(franchiseCheck.length!=0 && theaterCheck.length!=0 && dateCheck.length==0){ //프랜차이즈, 극장 클릭했을 경우,
		datas = JSON.stringify({
			franchise : franchiseCheck,	
			theaterName : theaterCheck,	  
		 		 })
	}else if(franchiseCheck.length==0 && theaterCheck.length==0 && dateCheck.length!=0){ //날짜만 클릭했을 경우,
		datas = JSON.stringify({
			screenDate : dateCheck,  
		 		 })
	}else if(franchiseCheck.length!=0 && theaterCheck.length==0 && dateCheck.length!=0){ //프렌차이즈, 날짜만 클릭했을 경우,
		datas = JSON.stringify({
			franchise : franchiseCheck,
			screenDate : dateCheck,  
		 		 })		 	
	}else if(franchiseCheck.length!=0 && theaterCheck.length!=0 && dateCheck.length!=0){//프렌차이즈,극장,날짜 모두 클릭했을 경우,
		datas = JSON.stringify({
			franchise : franchiseCheck,
			theaterName : theaterCheck,
			screenDate : dateCheck,  
		 		 })
		 		 $("div.steps-body.text-center > div > div > div.placeholder").css("display", "block");		
	}else if(franchiseCheck.length==0 && theaterCheck.length==0 && dateCheck.length==0){
		return null;
	}
	
	return new Promise(function (resolve, reject) {
			 $.ajax({
		  		  type: "POST",
		  		  url: "/ticketing/json/getMovieList",
		  		  data: datas,
		  		  dataType : "json",
				      headers: { 
		  		        "Accept" : "application/json",
		  		        "Content-Type": "application/json"
				      },
				      success : function(result,status){
					      // 데이터를 받으면 resolve() 호출
					      resolve(result);
							 $(".loading").css("display", "block");
							 setTimeout(() => {
								 $(".loading").css("display", "none");
							}, 500);
				      }//end of success
			 });//end of ajax
			})//end of promise
}//end of function	

function getFranchiseList(movieCheck,dateCheck){
	var datas;
	//영화만 클릭했을 경우,
	if(movieCheck.length!=0 && dateCheck.length==0){
		datas = JSON.stringify({
			  	movieName : movieCheck,
		 		 })
				 		 
	}else if(movieCheck.length!=0 && dateCheck.length!=0){ //영화, 날짜 클릭했을 경우,
		datas = JSON.stringify({
		  	movieName : movieCheck,	
			screenDate : dateCheck,  
		 		 })
	}else if(movieCheck.length==0 && dateCheck.length!=0){ //날짜만 클릭했을 경우,
		datas = JSON.stringify({
			screenDate : dateCheck,  
		 		 })
	}else if(movieCheck.length==0 && dateCheck.length==0){
		return null;
	}
	
	return new Promise(function (resolve, reject) {

	 $.ajax({
 		  type: "POST",
 		  url: "/ticketing/json/getFranchiseList",
 		  data: datas,
 		  dataType : "json",
		      headers: { 
 		        "Accept" : "application/json",
 		        "Content-Type": "application/json"
		      },
		      success : function(result,status){
			      // 데이터를 받으면 resolve() 호출
			      resolve(result);		 
					 $(".loading").css("display", "block");
					 setTimeout(() => {
						 $(".loading").css("display", "none");
					}, 500);
		      }
	 });//end of ajax
	})//end of Promise
}//end of getFranchiseList()

function getTheaterList(movieCheck,franchiseCheck,dateCheck){
	var datas;
	//영화, 프렌차이즈 클릭했을 경우,
	if(movieCheck.length!=0 && franchiseCheck.length!=0 && dateCheck.length==0){
		datas = JSON.stringify({
			  	movieName : movieCheck,
				franchise : franchiseCheck,			  	
		 		 }) 
	//프렌차이즈, 날짜 클릭했을경우		 		 
	}else if(movieCheck.length==0 && franchiseCheck.length!=0 && dateCheck.length!=0){ 
		datas = JSON.stringify({
			franchise : franchiseCheck,
			screenDate : dateCheck,  
		 		 })
	 //영화제목,프렌차이즈, 날짜 클릭했을경우,		 		 
	}else if(movieCheck.length!=0 && franchiseCheck.length!=0 && dateCheck.length!=0){
		datas = JSON.stringify({
		  	movieName : movieCheck,	
			franchise : franchiseCheck,		  	
		  	screenDate : dateCheck,  
		 		 })
	}else{
		return null;
	}	
	
	return new Promise(function (resolve, reject) {
	 $.ajax({
		  type: "POST",
		  url: "/ticketing/json/getTheaterList",
		  data: datas,
		  dataType : "json",
		      headers: { 
		        "Accept" : "application/json",
		        "Content-Type": "application/json"
		      },
		      success : function(result,status){;
			      // 데이터를 받으면 resolve() 호출
			      resolve(result);	
			      
					 $(".loading").css("display", "block");
					 setTimeout(() => {
						 $(".loading").css("display", "none");
					}, 500);
		    	  
		      }//end of success
	 });//end of ajax
	})//end of Promise
}//end of getTheaterList()

function getDateList(movieCheck,franchiseCheck,theaterCheck){
/* 	console.log(movieCheck)
	console.log(franchiseCheck)
	console.log(theaterCheck)	 */
	var datas;
	//영화만 클릭했을 경우 ,
	if(movieCheck.length!=0 && franchiseCheck.length==0 && theaterCheck.length==0){
		console.log("날짜정렬- 영화만 클릭했을 경우-1")
		datas = JSON.stringify({
			  	movieName : movieCheck,		  	
		 		 })
	//프랜차이즈만 클릭했을 경우 ,
	}else if(movieCheck.length==0 && franchiseCheck.length!=0 && theaterCheck.length==0){
		console.log("날짜정렬- 프랜차이즈만 클릭했을 경우-2")
		datas = JSON.stringify({
				franchise : franchiseCheck,			  	
		 		 })	
	//프랜차이즈, 극장만 클릭했을 경우 ,
	}else if(movieCheck.length==0 && franchiseCheck.length!=0 && theaterCheck.length!=0){
		console.log("날짜정렬- 프랜차이즈, 극장만 클릭했을 경우-3")
		datas = JSON.stringify({
				franchise : franchiseCheck,	
				theaterName : theaterCheck,				
		 		 })				 		 
    //영화, 프렌차이즈만 클릭했을 경우,		 		 
	}else if(movieCheck.length!=0 && franchiseCheck.length!=0 && theaterCheck.length==0){ 
		console.log("날짜정렬- 영화, 프랜차이즈만 클릭했을 경우-4")
		datas = JSON.stringify({
		  	movieName : movieCheck,	
		  	franchise : franchiseCheck,
		 		 })
    //영화, 프렌차이즈,극장 모두 클릭했을 경우,	 		 
	}else if(movieCheck.length!=0 && franchiseCheck.length!=0 && theaterCheck.length!=0){ //영화제목,프렌차이즈, 날짜 클릭했을경우,
		console.log("날짜정렬- 모두 클릭했을 경우-5")
		datas = JSON.stringify({
		  	movieName : movieCheck,	
			franchise : franchiseCheck,	
			theaterName : theaterCheck,  
		 		 })
		 		 console.log("작동3")
	}else{
		console.log("작동4")
		return null;
	}	
	
	return new Promise(function (resolve, reject) {
		 $.ajax({
			  type: "POST",
			  url: "/ticketing/json/getDateList",
			  data: datas,
			  dataType : "json",
			      headers: { 
			        "Accept" : "application/json",
			        "Content-Type": "application/json"
			      },
			      success : function(result,status){
				      // 데이터를 받으면 resolve() 호출
				      resolve(result);			      		
						 $(".loading").css("display", "block");
						 setTimeout(() => {
							 $(".loading").css("display", "none");
						}, 500);
			      }//end of success
		 });//end of ajax
	})//end of Promise
}//end of getDateList()
</script>

<!-- Header Start /////////////////////////////////////-->
<jsp:include page="/layout/footer.jsp" />
<!-- Header End /////////////////////////////////////-->	

</body>
</html>