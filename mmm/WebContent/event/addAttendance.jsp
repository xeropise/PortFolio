<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<link href="/resources/image/logo/logo.png" rel="shortcut icon" type="image/x-icon">
	<title>mmm</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>


<!-- fontawesome-->
<script src="https://kit.fontawesome.com/35102316d7.js" crossorigin="anonymous"></script>

<!-- FullCalendar -->
<link rel="stylesheet" href="../resources/css/daygrid.css">
<link rel="stylesheet" href="../resources/css/fullcalendar.css">
<link rel="stylesheet" href="../resources/css/timegrid.css">
<script src='../resources/javascript/fullcalendar.js'></script>
<script src='../resources/javascript/daygrid.js'></script>
<script src='../resources/javascript/timegrid.js'></script>
<script src='../resources/javascript/interaction.js'></script>

<!-- 	SweetAlert2 CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>

	
	
<script type="text/javascript">


document.addEventListener('DOMContentLoaded', function() {
	  var weekList = ['일','월','화','수','목','금','토']; 
	  var calendarEl = document.getElementById('calendar');
	  
	  var calendar = new FullCalendar.Calendar(calendarEl, {
	    plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
	    dateClick: function(info){
	    	  
	              },
	    timeZone: 'UTC',
	    select: function(info) {
	       
	       var check = moment(info.start).format('YYYY-MM-DD');
	       var today = moment().format('YYYY-MM-DD');
	       
	       if(check < today){
	    	   //previous date
	    	   //sweet alert 처리
	    		Swal.fire({
					text: '오늘 날짜로만 출석체크가 가능합니다.',
					icon: 'error',
					confirmButtonText: "확인"
				});
	       }else if(check == today){
	    	   //right date
	    	   console.log('날짜ok')
	    	   addAttendance();
	       }else{
				//future date
				//sweet alert 처리
	    		Swal.fire({
					text: '오늘 날짜로만 출석체크가 가능합니다.',
					icon: 'error',
					confirmButtonText: "확인"
				});
	       }
	    },
	    defaultView: 'dayGridMonth',
	    selectable: true,
	    defaultDate: new Date(),
	    header: {
	      left: '',
	      center: '',
	      right: 'title'
	    },
	     titleFormat : function(date) { // title 설정
	    	  return date.date.year +"년 "+(date.date.month +1)+ "월"; 
	    	    },

   	 displayEventTime:false,
	  eventSources: 
		  [{
			  events: function(start, callback) {
				  
			      $.ajax({
			        url: "/event/json/getAttendanceRecord",
			     	type :"get",			
					dataType : "json",
					contentType: 'application/json',
					
			          success : function(doc) {
			              callback(doc);
			              $('.fc-title').html('<i class="far fa-smile-wink"></i>');
			              $('.fc-event').css('font-size', '55px');
			              $('.fc-title').css('color', '#f1c40f');
 			              console.log(doc);
			        
			          }//end of success
			      
			      });//end of ajax
			      
			     
			  },
			  
		  }] //end of eventSources 
		  
	  });
	 
	  calendar.render();
	  
	});


function addAttendance(){

	var userNo = ${user.userNo};
	
	var datas = JSON.stringify({
		userNo : new String(userNo),
		pointStatus : "S1",
		partPoint : "10"
	});
	
	console.log(datas);
	
	ajaxPromise("/event/json/addAttendance", datas).then(
  	
	(result)=> {
		if(result ==0){
			
			Swal.fire({
				text: '출석체크 완료! 10P 적립',
				icon: 'success',
				confirmButtonText: "확인"
			}).then((confirm)=>{
				self.location="/event/addAttendance";
			})
			
			
		}else{
			
			Swal.fire({
				text: '이미 하셨습니다.',
				icon: 'error',
				confirmButtonText: "확인"
			});
		}
	
	}//end of arrow function
   );//end of then
}

function ajaxPromise(url, datas) {
	return new Promise(function (resolve, reject) {
		
		$.ajax({
			type: "POST",
			url: url,				
			data: datas,
			dataType : "json",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json",
			},
			success : function(result, status) {
				//데이터를 받으면 resolve()호출
				
				resolve(result);
				console.log(status)
			}//end of success
		
		})//end of ajax
		
		
	}) //end of Promise
	
}//end of function - ajaxPromise


///////////////////////////////////////////////
 
$(function(){
	
	
	
})





</script>

<style type="text/css">

 	.fc-content{ 
 		text-align: center; 
 		height: 80px;
	}  
	
	.fc-event{
		border: none;
		padding:0;
		margin:0;
	}


 	#calendar > div.fc-view-container > div > table > thead > tr > td > div > table > thead > tr{ 
 	    background-color: white;
 	} 

    .fc-event-container > a { 
 		background-color: #ffffff !important;  
 	    font-size:8pt;
    	font-family: 'Noto Sans KR', sans-serif;
    }  


	.fc-widget-header{
    	background-color: #ecf0f1;
    	font-size: 15px;
    	color: #34495e;
	} 
	
	
	th.ui-widget-header {
  	    font-size:8pt;
    	font-family: 'Noto Sans KR', sans-serif;
	}
		


 	#calendar > div.fc-view-container > div > table > tbody > tr > td > div > div > div > div.fc-content-skeleton > table > thead > tr  {
 	 	color: #a4a9b0;  
	 }   



	 #calendar{
 	 	max-width: 900px;
  		margin: 0 auto;
	 }
	
	p.lbtxt{	
		letter-spacing: -0.05em !important;
		margin: 0;
		padding: 0;
		padding-bottom: 17px;
		line-height: 19px;
		font-size: 10x;
		color: #666;
	}
	
	
	#calendar > div.fc-toolbar.fc-header-toolbar > div.fc-right > h2{
		font-size: 28px;
		font-weight: bolder;
		color: #34495e;
	}		

</style>

</head>
<body>
<jsp:include page="/layout/header.jsp"></jsp:include>

<div class="container">

	<br>
		<div class="page-header" style="margin-left:50px; margin-top:50px;">
	      <span style="font-size:30px; font-weight:bold;"> 매일매일 출첵이벤트</span>
<p class="lbtxt">뭅뭅뭅 ! 출첵하고 10포인트 받자 ! </p>
	    </div>
		<br>	
<!-- <h4><i class="fas fa-calendar-check"></i>&nbsp;매일매일 출첵 이벤트</h4> -->
<!-- <hr> -->
<!-- <br/> -->
 <input type="hidden" name="userNo" value="${user.userId}">
<div id="calendar">

</div>
</div>

<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>